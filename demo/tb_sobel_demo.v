`timescale 1ns/1ps
module tb_sobel_demo;

parameter N = 3;
parameter IMG_WIDTH = 32;
parameter PIXEL_BITS = 8;
parameter RELU_EN = 0;

localparam TOTAL_TAPS = N * N;
localparam OUTPUT_WIDTH = 2 * PIXEL_BITS + $clog2(TOTAL_TAPS);
localparam OUTPUT_SIZE = IMG_WIDTH - N + 1;
localparam TOTAL_OUTPUTS = OUTPUT_SIZE * OUTPUT_SIZE;
localparam TOTAL_PIXELS = IMG_WIDTH * IMG_WIDTH;

reg clk;
reg rst;
reg start;
reg kernel_we;
reg image_we;
reg [PIXEL_BITS-1:0] kernel_data;
reg [PIXEL_BITS-1:0] image_data;

wire busy;
wire done;
wire data_valid;
wire signed [OUTPUT_WIDTH-1:0] output_data;

reg [7:0] sobel_kernel [0:TOTAL_TAPS-1];
reg [7:0] image_mem [0:TOTAL_PIXELS-1];

reg [8*64:1] kernel_file;
reg [8*64:1] expected_file;

integer fd_exp;
integer scan_code;
integer expected_value;
integer i;
integer errors;
integer outputs_seen;

cnn_system #(
    .N(N),
    .IMG_WIDTH(IMG_WIDTH),
    .PIXEL_BITS(PIXEL_BITS),
    .RELU_EN(RELU_EN)
) dut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .kernel_we(kernel_we),
    .kernel_data(kernel_data),
    .image_we(image_we),
    .image_data(image_data),
    .busy(busy),
    .done(done),
    .data_valid(data_valid),
    .output_data(output_data)
);

always #5 clk = ~clk;

initial begin
    clk = 0; rst = 0; start = 0; kernel_we = 0; image_we = 0;
    kernel_data = 0; image_data = 0; errors = 0; outputs_seen = 0;

    if (!$value$plusargs("kernel=%s", kernel_file)) begin
        $display("ERROR: +kernel=<hexfile> plusarg required");
        $finish;
    end
    if (!$value$plusargs("expected=%s", expected_file)) begin
        $display("ERROR: +expected=<file> plusarg required");
        $finish;
    end

    $readmemh(kernel_file, sobel_kernel);
    $readmemh("test_image_32x32.hex", image_mem);
    $display("DEBUG: kernel[0]=%0d kernel[4]=%0d kernel[8]=%0d", sobel_kernel[0], sobel_kernel[4], sobel_kernel[8]);
    $display("DEBUG: image preloaded from test_image_32x32.hex");
    fd_exp = $fopen(expected_file, "r");
    if (fd_exp == 0) begin
        $display("ERROR: cannot open expected file");
        $finish;
    end

    #20;
    rst = 1;

    // Stream the 9 Sobel coefficients into kernel memory (demo stream order).
    for (i = 0; i < TOTAL_TAPS; i = i + 1) begin
        @(negedge clk);
        kernel_we = 1;
        kernel_data = sobel_kernel[i];
    end
    @(negedge clk);
    kernel_we = 0;
    kernel_data = 0;

    // Stream the 32x32 test image into image memory.
    for (i = 0; i < TOTAL_PIXELS; i = i + 1) begin
        @(negedge clk);
        image_we = 1;
        image_data = image_mem[i];
    end
    @(negedge clk);
    image_we = 0;
    image_data = 0;
    $display("DEBUG: image[0]=%0d image[1]=%0d image[1023]=%0d", image_mem[0], image_mem[1], image_mem[1023]);

    // Start inference.
    @(negedge clk);
    start = 1;
    @(negedge clk);
    start = 0;

    wait (done);
    @(negedge clk);
    $display("DEBUG: dut kernel_flat[0]=%0d kernel_flat[8]=%0d, window[0]=%0d window[8]=%0d",
             dut.cnn_core.kernel_memory_inst.kernels_flat[7:0],
             dut.cnn_core.kernel_memory_inst.kernels_flat[71:64],
             dut.cnn_core.window_generator_inst.window_flat[7:0],
             dut.cnn_core.window_generator_inst.window_flat[71:64]);

    $display("");
    $display("======================================");
    $display("SOBEL EDGE-DETECTION SIMULATION");
    $display("RELU = %0d", RELU_EN);
    $display("VALID OUTPUTS = %0d (expected %0d)", outputs_seen, TOTAL_OUTPUTS);
    $display("MISMATCHES = %0d", errors);
    if ((outputs_seen == TOTAL_OUTPUTS) && (errors == 0))
        $display("SOBEL TEST PASSED");
    else
        $display("SOBEL TEST FAILED");
    $display("======================================");
    $finish;
end

// Capture + self-check every valid strobe against the Python golden file.
always @(posedge clk) begin
    if (data_valid) begin
        scan_code = $fscanf(fd_exp, "%d", expected_value);
        if (scan_code != 1) begin
            $display("ERROR: expected file exhausted at output %0d", outputs_seen);
            errors = errors + 1;
        end
        else if (output_data !== expected_value[OUTPUT_WIDTH-1:0]) begin
            errors = errors + 1;
            if (errors <= 10)
                $display("MISMATCH[%0d]: RTL = %0d, EXPECTED = %0d",
                         outputs_seen, output_data, expected_value);
        end
        outputs_seen = outputs_seen + 1;
    end
end

initial begin
    #2000000;
    $display("ERROR: TIMEOUT");
    $finish;
end

endmodule
