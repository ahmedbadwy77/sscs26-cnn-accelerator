module tree_nxn #(parameter N = 3 , parameter PIXEL_BITS = 8)(
    input wire clk , en,
    input wire [(N * N * PIXEL_BITS)-1:0] window_flat,
    input wire [(N * N * PIXEL_BITS)-1:0] kernels_flat,
    output wire signed [(2 * PIXEL_BITS + $clog2(N * N))-1:0] mac_out
);

localparam TOTAL_TAPS = N * N , PRODUCT_WIDTH = 2 * PIXEL_BITS + 1 , OUTPUT_WIDTH = 2 * PIXEL_BITS + $clog2(TOTAL_TAPS);

reg [PIXEL_BITS-1:0] delayed_window_pixels [1:TOTAL_TAPS][1:TOTAL_TAPS];
reg signed [PRODUCT_WIDTH-1:0] multiplication_result [1:TOTAL_TAPS];

(* use_dsp = "yes" *)
reg signed [OUTPUT_WIDTH-1:0] accumulation_stage [1:TOTAL_TAPS];

integer tap_index , delay_stage, mult_index;

always @(posedge clk) begin
    if (en) begin
        for (tap_index = 1; tap_index <= TOTAL_TAPS; tap_index = tap_index + 1) begin
            delayed_window_pixels[tap_index][1] <= window_flat[(tap_index-1)*PIXEL_BITS +: PIXEL_BITS];

            for (delay_stage = 2; delay_stage <= tap_index; delay_stage = delay_stage + 1)
                delayed_window_pixels[tap_index][delay_stage] <= delayed_window_pixels[tap_index][delay_stage-1];
        end
    end
end

always @(posedge clk) begin
    if (en) begin
        for (mult_index = 1; mult_index <= TOTAL_TAPS; mult_index = mult_index + 1) begin
            multiplication_result[mult_index] <=
                $signed({1'b0, delayed_window_pixels[mult_index][mult_index]}) *
                $signed(kernels_flat[(mult_index-1)*PIXEL_BITS +: PIXEL_BITS]);
        end
    end
end

always @(posedge clk) begin
    if (en) begin
        accumulation_stage[1] <= multiplication_result[1];
        for (tap_index = 2; tap_index <= TOTAL_TAPS; tap_index = tap_index + 1)
            accumulation_stage[tap_index] <= accumulation_stage[tap_index-1] + multiplication_result[tap_index];
    end
end

assign mac_out = accumulation_stage[TOTAL_TAPS];

endmodule