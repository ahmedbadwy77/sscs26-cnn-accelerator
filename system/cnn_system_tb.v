`timescale 1ns/1ps

module cnn_system_tb;

parameter N = 3;
parameter IMG_WIDTH = 32;
parameter PIXEL_BITS = 8;
parameter RELU_EN = 0;

localparam TOTAL_TAPS = N * N;
localparam OUTPUT_WIDTH = 2 * PIXEL_BITS + $clog2(TOTAL_TAPS);
localparam OUTPUT_SIZE = IMG_WIDTH - N + 1;
localparam TOTAL_OUTPUTS = OUTPUT_SIZE * OUTPUT_SIZE;

reg clk;
reg rst;
reg start;

reg kernel_we;
reg [PIXEL_BITS-1:0] kernel_data;

reg image_we;
reg [PIXEL_BITS-1:0] image_data;

wire busy;
wire done;
wire data_valid;
wire signed [OUTPUT_WIDTH-1:0] output_data;

integer i;
integer row_index;
integer column_index;
integer tap_row;
integer tap_column;
integer output_count;
integer expected_value;
integer actual_value;
integer error_count;

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
    clk = 0;
    rst = 0;
    start = 0;
    kernel_we = 0;
    kernel_data = 0;
    image_we = 0;
    image_data = 0;
    output_count = 0;
    error_count = 0;

    #20;
    rst = 1;

    // Load an all-ones kernel.
    for (i = 0; i < TOTAL_TAPS; i = i + 1) begin
        @(negedge clk);
        kernel_we = 1;
        kernel_data = 1;
    end

    @(negedge clk);
    kernel_we = 0;
    kernel_data = 0;

    // Load the image as an 8-bit ramp. Values above 255 wrap naturally.
    for (i = 0; i < IMG_WIDTH * IMG_WIDTH; i = i + 1) begin
        @(negedge clk);
        image_we = 1;
        image_data = i[PIXEL_BITS-1:0];
    end

    @(negedge clk);
    image_we = 0;
    image_data = 0;

    // Start inference.
    @(negedge clk);
    start = 1;
    @(negedge clk);
    start = 0;

    wait(done);
    @(negedge clk);

    $display("");
    $display("======================================");
    $display("CNN SYSTEM SIMULATION");
    $display("N = %0d", N);
    $display("IMAGE = %0dx%0d", IMG_WIDTH, IMG_WIDTH);
    $display("RELU = %0d", RELU_EN);
    $display("VALID OUTPUTS = %0d", output_count);
    $display("EXPECTED OUTPUTS = %0d", TOTAL_OUTPUTS);
    $display("ERRORS = %0d", error_count);

    if ((output_count == TOTAL_OUTPUTS) && (error_count == 0))
        $display("SYSTEM TEST PASSED");
    else
        $display("SYSTEM TEST FAILED");

    $display("======================================");
    $display("");

    $finish;
end

always @(posedge clk) begin
    if (data_valid) begin
        row_index = output_count / OUTPUT_SIZE;
        column_index = output_count % OUTPUT_SIZE;

        expected_value = 0;

        for (tap_row = 0; tap_row < N; tap_row = tap_row + 1) begin
            for (tap_column = 0; tap_column < N; tap_column = tap_column + 1) begin
                expected_value = expected_value +
                    (((row_index + tap_row) * IMG_WIDTH + column_index + tap_column) & ((1 << PIXEL_BITS) - 1));
            end
        end

        if (RELU_EN && (expected_value < 0))
            expected_value = 0;

        actual_value = output_data;

        if (actual_value !== expected_value) begin
            error_count = error_count + 1;

            if (error_count <= 10)
                $display("ERROR[%0d]: EXPECTED = %0d, GOT = %0d", output_count, expected_value, actual_value);
        end

        if (output_count < 10)
            $display("OUTPUT[%0d] = %0d | EXPECTED = %0d", output_count, actual_value, expected_value);

        output_count = output_count + 1;
    end
end

initial begin
    #200000;
    $display("ERROR: TIMEOUT");
    $finish;
end

endmodule
