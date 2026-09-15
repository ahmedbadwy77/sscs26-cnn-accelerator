module line_buffer #(parameter DEPTH = 29 , parameter PIXEL_BITS = 8)(
    input clk , wr_en,
    input [PIXEL_BITS-1:0] in_pixel,
    output [PIXEL_BITS-1:0] out_pixel
);

reg [PIXEL_BITS-1:0] pixel_delay [0:DEPTH-1];
integer delay_index;

always @(posedge clk) begin
    if (wr_en) begin
        pixel_delay[0] <= in_pixel;

        for (delay_index = 1 ; delay_index < DEPTH ; delay_index = delay_index + 1)
            pixel_delay[delay_index] <= pixel_delay[delay_index-1];
    end
end

assign out_pixel = pixel_delay[DEPTH-1];

endmodule