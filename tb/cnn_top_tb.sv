`timescale 1ns/1ps

module cnn_top_tb;

parameter N = 3, IMG_WIDTH = 32, PIXEL_BITS = 8, RELU_EN = 1, NUM_KERNELS = 1;
localparam TOTAL_TAPS = N * N;
localparam OUTPUT_WIDTH = 2 * PIXEL_BITS + $clog2(TOTAL_TAPS);
localparam BURST_LENGTH_A = 1100, BURST_LENGTH_B = 600, BURST_LENGTH_C = 600, BURST_LENGTH_D = 600;
localparam FILL_CYCLES = (N - 1) * IMG_WIDTH + N - 1;
localparam EXTRA_PIPELINE_STAGES = 1;
localparam PIPELINE_LATENCY = TOTAL_TAPS + EXTRA_PIPELINE_STAGES;
localparam OUTPUTS_A = (BURST_LENGTH_A > FILL_CYCLES + PIPELINE_LATENCY) ? BURST_LENGTH_A - FILL_CYCLES - PIPELINE_LATENCY : 0,
           OUTPUTS_B = (BURST_LENGTH_B > FILL_CYCLES + PIPELINE_LATENCY) ? BURST_LENGTH_B - FILL_CYCLES - PIPELINE_LATENCY : 0,
           OUTPUTS_C = (BURST_LENGTH_C > FILL_CYCLES + PIPELINE_LATENCY) ? BURST_LENGTH_C - FILL_CYCLES - PIPELINE_LATENCY : 0,
           OUTPUTS_D = (BURST_LENGTH_D > FILL_CYCLES + PIPELINE_LATENCY) ? BURST_LENGTH_D - FILL_CYCLES - PIPELINE_LATENCY : 0;
localparam STROBE_TOTAL = OUTPUTS_A + OUTPUTS_B + OUTPUTS_C + OUTPUTS_D;
localparam TOTAL_EXPECTED_OUTPUTS = NUM_KERNELS * STROBE_TOTAL;

parameter real CLK_PERIOD = 5.0;   
localparam real T_DRV      = 0.050;
localparam real T_SMP      = 0.200;

reg clk, rst, cnn_en, kernel_rd_en, law_check_active, in_burst;
reg [PIXEL_BITS-1:0] in_pixel, lfsr_value, image_value;
reg [PIXEL_BITS-1:0] kernel_bytes [0:NUM_KERNELS*TOTAL_TAPS-1];

wire data_valid;
wire signed [NUM_KERNELS*OUTPUT_WIDTH-1:0] out_pixel;

integer array_index, kernel_number, burst_index, checked_outputs, output_mismatches, law_mismatches, x_count, burst_strobes, burst_checked, expected_strobes,
        python_file, python_status, python_expected_output, python_checked_outputs, python_mismatches, rtl_output_value, expected_image_value, law_pixel_count;


cnn_top #(.N(N),.IMG_WIDTH(IMG_WIDTH),.PIXEL_BITS(PIXEL_BITS),.RELU_EN(RELU_EN),.NUM_KERNELS(NUM_KERNELS)) dut (
    .clk(clk),
    .rst(rst),
    .in_pixel(in_pixel),
    .cnn_en(cnn_en),
    .kernel_rd_en(kernel_rd_en),
    .data_valid(data_valid),
    .out_pixel(out_pixel)
);

initial clk = 1'b0;
always #(CLK_PERIOD / 2.0) clk = ~clk;

task generate_delta_kernel(input integer kernel_number);
    begin
        for (array_index = 0; array_index < TOTAL_TAPS; array_index = array_index + 1)
            kernel_bytes[kernel_number*TOTAL_TAPS + array_index] = {PIXEL_BITS{1'b0}};

        kernel_bytes[kernel_number*TOTAL_TAPS + TOTAL_TAPS - 1] = {{(PIXEL_BITS-1){1'b0}}, 1'b1};
    end
endtask

task generate_lfsr_kernel(input integer kernel_number, input [PIXEL_BITS-1:0] seed);
    begin
        lfsr_value = seed;
        for (array_index = 0; array_index < TOTAL_TAPS; array_index = array_index + 1) begin
            kernel_bytes[kernel_number*TOTAL_TAPS + array_index] = lfsr_value;
            lfsr_value = {lfsr_value[PIXEL_BITS-2:0], lfsr_value[PIXEL_BITS-1] ^ lfsr_value[PIXEL_BITS-3] ^ lfsr_value[PIXEL_BITS-4] ^ lfsr_value[PIXEL_BITS-5]};
        end
    end
endtask

task generate_corner_kernel(input integer kernel_number);
    begin
        for (array_index = 0; array_index < TOTAL_TAPS; array_index = array_index + 1) begin
            if (array_index % 4 == 0)
                kernel_bytes[kernel_number*TOTAL_TAPS + array_index] = 8'h7F;
            else if (array_index % 4 == 1)
                kernel_bytes[kernel_number*TOTAL_TAPS + array_index] = 8'h80;
            else if (array_index % 4 == 2)
                kernel_bytes[kernel_number*TOTAL_TAPS + array_index] = 8'hFF;
            else
                kernel_bytes[kernel_number*TOTAL_TAPS + array_index] = 8'h00;
        end
    end
endtask

task prepare_kernels;
    begin
        generate_delta_kernel(0);

        if (NUM_KERNELS >= 2)
            generate_lfsr_kernel(1, 8'hB7);

        if (NUM_KERNELS >= 3)
            generate_corner_kernel(2);
    end
endtask

task reload_kernels;
    integer load_index;
    begin
        for (load_index = 0; load_index < NUM_KERNELS*TOTAL_TAPS; load_index = load_index + 1) begin
            @(posedge clk);
            #T_DRV;
            kernel_rd_en = 1'b1;
            in_pixel     = kernel_bytes[load_index];
        end

        @(posedge clk);
        #T_DRV;
        kernel_rd_en = 1'b0;
        in_pixel     = 8'd0;

        #15;
    end
endtask

task step_lfsr;
    begin
        lfsr_value = {lfsr_value[PIXEL_BITS-2:0], lfsr_value[PIXEL_BITS-1] ^ lfsr_value[PIXEL_BITS-3] ^ lfsr_value[PIXEL_BITS-4] ^ lfsr_value[PIXEL_BITS-5]};
    end
endtask

task run_cnn_burst(input integer burst_length, input integer input_mode);
    begin
        in_burst = 1'b1;
        burst_strobes = 0;
        burst_checked = 0;
        law_pixel_count = 0;
        law_check_active = (input_mode == 0);
        expected_strobes = (burst_length > FILL_CYCLES + PIPELINE_LATENCY) ? burst_length - FILL_CYCLES - PIPELINE_LATENCY : 0;

        // Drive first pixel with cnn_en
        @(posedge clk);
        #T_DRV;
        cnn_en = 1'b1;
        if (input_mode == 0)
            in_pixel = 1;
        else begin
            in_pixel = lfsr_value;
            step_lfsr;
        end

        // Stream remaining burst pixels
        for (burst_index = 2; burst_index <= burst_length; burst_index = burst_index + 1) begin
            @(posedge clk);
            #T_DRV;
            if (input_mode == 0)
                in_pixel = ((burst_index - 1) % 251) + 1;
            else begin
                in_pixel = lfsr_value;
                step_lfsr;
            end
        end

        // Hold cnn_en 1 cycle extra with dummy pixel so pixel #burst_length shifts into tap registers
        @(posedge clk);
        #T_DRV;
        in_pixel = 8'd0;

        // End burst feeding
        @(posedge clk);
        #T_DRV;
        cnn_en = 1'b0;

        // Allow pipeline to completely drain while keeping in_burst active
        repeat (FILL_CYCLES + PIPELINE_LATENCY + 5) begin
            @(posedge clk);
        end

        #T_DRV;
        in_burst = 1'b0;
        law_check_active = 1'b0;

        if (burst_strobes !== expected_strobes)
            $error("STROBE COUNT MISMATCH len=%0d got=%0d expected=%0d", burst_length, burst_strobes, expected_strobes);

        if (burst_checked !== expected_strobes*NUM_KERNELS)
            $error("CHECKED COUNT MISMATCH len=%0d got=%0d expected=%0d", burst_length, burst_checked, expected_strobes*NUM_KERNELS);

        #50;
    end
endtask

always @(posedge clk) begin
    #T_SMP;
    if (rst && cnn_en && kernel_rd_en)
        $error("PROTOCOL ERROR: cnn_en and kernel_rd_en overlap");

    if (!rst && (cnn_en || kernel_rd_en))
        $error("PROTOCOL ERROR: enables must be low during reset");
end

always @(posedge clk) begin
    #T_SMP;
    if (rst && data_valid === 1'b1) begin
        // Process only expected strobes for this burst, drop trailing dummy strobe
        if (in_burst && burst_strobes < expected_strobes) begin
            burst_strobes = burst_strobes + 1;

            for (kernel_number = 0; kernel_number < NUM_KERNELS; kernel_number = kernel_number + 1) begin
                if (^out_pixel[kernel_number*OUTPUT_WIDTH +: OUTPUT_WIDTH] === 1'bx) begin
                    x_count = x_count + 1;
                end
                else begin
                    rtl_output_value = $signed(out_pixel[kernel_number*OUTPUT_WIDTH +: OUTPUT_WIDTH]);
                    checked_outputs = checked_outputs + 1;
                    burst_checked = burst_checked + 1;

                    // Identity Law Check
                    if (NUM_KERNELS >= 1 && kernel_number == 0 && law_check_active && !RELU_EN && 
                        kernel_bytes[TOTAL_TAPS-1] == {{(PIXEL_BITS-1){1'b0}}, 1'b1} && 
                        kernel_bytes[0] == {PIXEL_BITS{1'b0}}) begin

                        law_pixel_count = law_pixel_count + 1;
                        expected_image_value = (((N-1)*IMG_WIDTH + (N-1) + law_pixel_count - 1) % 251) + 1;

                        if (rtl_output_value !== expected_image_value) begin
                            law_mismatches = law_mismatches + 1;
                            if (law_mismatches <= 5)
                                $display("LAW MISMATCH out#%0d t=%0t exp=%0d got=%0d", law_pixel_count, $time, expected_image_value, rtl_output_value);
                        end
                    end

                    // Python Golden File Comparison
                    if (python_file == 0) begin
                        $error("PYTHON GOLDEN ERROR: expected file is not open");
                    end
                    else begin
                        python_status = $fscanf(python_file, "%d\n", python_expected_output);

                        if (python_status != 1) begin
                            $error("PYTHON GOLDEN ERROR: no expected value for output #%0d kernel=%0d", python_checked_outputs + 1, kernel_number);
                        end
                        else begin
                            python_checked_outputs = python_checked_outputs + 1;

                            if (rtl_output_value !== python_expected_output) begin
                                python_mismatches = python_mismatches + 1;
                                if (python_mismatches <= 10)
                                    $display("PYTHON MISMATCH #%0d t=%0t kernel=%0d exp=%0d got=%0d", python_mismatches, $time, kernel_number, python_expected_output, rtl_output_value);
                            end
                            else if (python_checked_outputs <= 10) begin
                                $display("PYTHON CHECK #%0d: PASS kernel=%0d expected=%0d got=%0d", python_checked_outputs, kernel_number, python_expected_output, rtl_output_value);
                            end
                        end
                    end
                end
            end
        end
    end
end


initial begin
    if (N < 2)           $error("Illegal parameter: N must be >= 2");
    if (IMG_WIDTH <= N)  $error("Illegal parameter: IMG_WIDTH must be > N");
    if (NUM_KERNELS < 1) $error("Illegal parameter: NUM_KERNELS must be >= 1");
    if (NUM_KERNELS > 3) $error("This testbench supports NUM_KERNELS up to 3");

    checked_outputs = 0;
    output_mismatches = 0;
    law_mismatches = 0;
    x_count = 0;

    burst_strobes = 0;
    burst_checked = 0;
    law_pixel_count = 0;

    python_checked_outputs = 0;
    python_mismatches = 0;
    python_expected_output = 0;
    in_burst = 1'b0;

    python_file = $fopen(
        $sformatf("../expected_outputs/expected_out_%0dx%0d_relu%0d_k%0d.txt", N, IMG_WIDTH, RELU_EN, NUM_KERNELS),
        "r"
    );

    if (python_file == 0)
        $error("PYTHON GOLDEN ERROR: could not open expected_out vector file");
    else
        $display("PYTHON GOLDEN FILE: opened successfully");


    rst          = 1'b0;
    cnn_en       = 1'b0;
    kernel_rd_en = 1'b0;
    in_pixel     = 8'd0;

    #200;

    @(posedge clk);
    #T_DRV;
    rst = 1'b1;
    
    repeat (10) @(posedge clk);

    prepare_kernels;
    reload_kernels;

    $display("KERNELS LOADED. PAUSING TO START SAIF...");
    $stop;

    run_cnn_burst(BURST_LENGTH_A, 0);

    $display(">>> ACTIVE WINDOW FINISHED: STOPPING SAIF <<<");
    $stop;

    lfsr_value = 8'hB7;
    for (array_index = 0; array_index < TOTAL_TAPS ; array_index = array_index + 1)
        step_lfsr;

    run_cnn_burst(BURST_LENGTH_B, 1);
    run_cnn_burst(BURST_LENGTH_C, 1);
    run_cnn_burst(BURST_LENGTH_D, 1);

    if (python_file != 0)
        $fclose(python_file);

    $display("----------------------------------------");
    $display("PYTHON GOLDEN CHECK: checked=%0d expected=%0d mismatches=%0d", python_checked_outputs, TOTAL_EXPECTED_OUTPUTS, python_mismatches);

    if (output_mismatches == 0 && law_mismatches == 0 && x_count == 0 && checked_outputs == TOTAL_EXPECTED_OUTPUTS)
        $display("TB_RESULT: PASS N=%0d W=%0d RELU=%0d K=%0d checked=%0d x=%0d", N, IMG_WIDTH, RELU_EN, NUM_KERNELS, checked_outputs, x_count);
    else
        $display("TB_RESULT: FAIL N=%0d W=%0d RELU=%0d K=%0d checked=%0d expected=%0d mism=%0d law_mism=%0d x=%0d", N, IMG_WIDTH, RELU_EN, NUM_KERNELS, checked_outputs, TOTAL_EXPECTED_OUTPUTS, output_mismatches, law_mismatches, x_count);

    if (python_mismatches == 0 && python_checked_outputs == TOTAL_EXPECTED_OUTPUTS)
        $display("RTL vs PYTHON GOLDEN: PASS");
    else
        $display("RTL vs PYTHON GOLDEN: FAIL");

    $finish;
end

endmodule