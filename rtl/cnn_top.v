module cnn_top #(parameter N = 3 , parameter IMG_WIDTH = 32 , parameter PIXEL_BITS = 8 , parameter RELU_EN = 1 , parameter NUM_KERNELS = 1)(
    input wire clk , rst, kernel_rd_en , cnn_en ,
    input wire [PIXEL_BITS-1:0] in_pixel,
    output wire data_valid,
    output wire signed [NUM_KERNELS*(2 * PIXEL_BITS + $clog2(N * N))-1:0] out_pixel
);

localparam TOTAL_TAPS = N * N;
localparam OUTPUT_WIDTH = 2 * PIXEL_BITS + $clog2(TOTAL_TAPS);
localparam KERNEL_BUS_WIDTH = NUM_KERNELS * TOTAL_TAPS * PIXEL_BITS;
localparam WINDOW_BUS_WIDTH = TOTAL_TAPS * PIXEL_BITS;

wire kernel_load_done , line_enable;
wire [WINDOW_BUS_WIDTH-1:0] pixel_window;
wire [KERNEL_BUS_WIDTH-1:0] kernel_coefficients;
wire signed [NUM_KERNELS*OUTPUT_WIDTH-1:0] mac_results;

cnn_controller #(.N(N),.IMG_WIDTH(IMG_WIDTH)) controller_inst (
    .clk(clk),
    .rst(rst),
    .cnn_en(cnn_en),
    .kernel_rd_en(kernel_rd_en),
    .kernel_finish(kernel_load_done),
    .data_valid(data_valid),
    .line_en(line_enable)
);

kernel_coeff_memory #(.N(N),.PIXEL_BITS(PIXEL_BITS),.NUM_KERNELS(NUM_KERNELS)) kernel_memory_inst (
    .clk(clk),
    .in_pixel(in_pixel),
    .rd_en(kernel_rd_en),
    .kernels_flat(kernel_coefficients),
    .kernel_finish(kernel_load_done)
);

window_nxn #(.N(N),.IMG_WIDTH(IMG_WIDTH),.PIXEL_BITS(PIXEL_BITS)) window_generator_inst (
    .clk(clk),
    .en(cnn_en),
    .px(in_pixel),
    .window_flat(pixel_window)
);

genvar kernel_number;

generate
    for (kernel_number = 0; kernel_number < NUM_KERNELS; kernel_number = kernel_number + 1) begin : kernel_pipeline

        tree_nxn #(.N(N),.PIXEL_BITS(PIXEL_BITS)) mac_pipeline_inst (
            .clk(clk),
            .en(cnn_en),
            .window_flat(pixel_window),
            .kernels_flat(kernel_coefficients[kernel_number*TOTAL_TAPS*PIXEL_BITS+: TOTAL_TAPS*PIXEL_BITS]),
            .mac_out(mac_results[kernel_number*OUTPUT_WIDTH+: OUTPUT_WIDTH])
        );

        output_stage #(.DATA_WIDTH(OUTPUT_WIDTH),.RELU_EN(RELU_EN)) output_stage_inst (
            .data_valid(data_valid),
            .mac_result(mac_results[kernel_number*OUTPUT_WIDTH +: OUTPUT_WIDTH]),
            .output_pixel(out_pixel[kernel_number*OUTPUT_WIDTH +: OUTPUT_WIDTH])
        );

    end
endgenerate

endmodule