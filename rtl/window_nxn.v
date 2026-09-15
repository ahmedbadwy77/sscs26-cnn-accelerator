module window_nxn #(parameter N = 3 , parameter IMG_WIDTH = 32 , parameter PIXEL_BITS = 8)(
    input wire clk , en,
    input wire [PIXEL_BITS-1:0] px,
    output wire [(N * N * PIXEL_BITS)-1:0] window_flat
);

localparam WINDOW_WIDTH = N * N * PIXEL_BITS , LINE_BUFFER_DEPTH = IMG_WIDTH - N;

reg [PIXEL_BITS-1:0] window_pixels [0:N*N-1];
wire [PIXEL_BITS-1:0] line_buffer_output [1:N-1];

integer column_index , row_index;

always @(posedge clk) begin
    if (en) begin
        window_pixels[N-1] <= px;

        for (column_index = 0; column_index < N-1; column_index = column_index + 1)
            window_pixels[column_index] <= window_pixels[column_index+1];

        for (row_index = 1; row_index < N; row_index = row_index + 1) begin
            window_pixels[row_index*N+N-1] <= line_buffer_output[row_index];

            for (column_index = 0; column_index < N-1; column_index = column_index + 1)
                window_pixels[row_index*N+column_index] <= window_pixels[row_index*N+column_index+1];
        end
    end
end

genvar buffer_index;
generate
    for (buffer_index = 1; buffer_index < N; buffer_index = buffer_index + 1) begin

        line_buffer #(.DEPTH(LINE_BUFFER_DEPTH) , .PIXEL_BITS(PIXEL_BITS)) line_buffer_inst (
            .clk(clk) , .wr_en(en) , .in_pixel(window_pixels[(buffer_index-1)*N]) , .out_pixel(line_buffer_output[buffer_index]));
    end
endgenerate

genvar output_index;
generate
    for (output_index = 0; output_index < N*N; output_index = output_index + 1) begin
        assign window_flat[output_index*PIXEL_BITS +: PIXEL_BITS] = window_pixels[(N-1-(output_index/N))*N + (output_index%N)];
    end
endgenerate

endmodule