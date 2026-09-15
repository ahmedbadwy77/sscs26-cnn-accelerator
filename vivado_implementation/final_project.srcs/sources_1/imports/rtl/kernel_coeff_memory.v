module kernel_coeff_memory #(parameter N = 3 , parameter PIXEL_BITS = 8 , parameter NUM_KERNELS = 1)(
    input clk ,  rd_en,
    input [PIXEL_BITS-1:0] in_pixel,
    output [NUM_KERNELS*N*N*PIXEL_BITS-1:0] kernels_flat,
    output kernel_finish
);

localparam TOTAL_KERNEL_VALUES = N * N , TOTAL_VALUES = NUM_KERNELS * TOTAL_KERNEL_VALUES , COUNTER_WIDTH = $clog2(TOTAL_VALUES + 1);

reg signed [PIXEL_BITS-1:0] kernel_coefficients [0:TOTAL_VALUES-1];
reg [COUNTER_WIDTH-1:0] kernel_counter;

integer kernel_index;

always @(posedge clk ) begin

if (rd_en && kernel_counter < TOTAL_VALUES) begin
        kernel_coefficients[TOTAL_VALUES-1] <= in_pixel;

        for (kernel_index = 0 ; kernel_index < TOTAL_VALUES-1 ; kernel_index = kernel_index + 1)
            kernel_coefficients[kernel_index] <= kernel_coefficients[kernel_index+1];

        kernel_counter <= kernel_counter + 1'b1;
    end
    else if (!rd_en) begin
        kernel_counter <= {COUNTER_WIDTH{1'b0}};
    end
end

assign kernel_finish = (kernel_counter == TOTAL_VALUES);

genvar output_kernel;
genvar output_index;

generate
    for (output_kernel = 0 ; output_kernel < NUM_KERNELS ; output_kernel = output_kernel + 1) begin

        for (output_index = 0 ; output_index < TOTAL_KERNEL_VALUES ; output_index = output_index + 1) begin

            assign kernels_flat[ output_kernel*TOTAL_KERNEL_VALUES*PIXEL_BITS + output_index*PIXEL_BITS +: PIXEL_BITS] 
									= kernel_coefficients[output_kernel*TOTAL_KERNEL_VALUES + output_index];

        end
    end
endgenerate

endmodule