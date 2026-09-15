module output_stage #( parameter DATA_WIDTH = 20 , parameter RELU_EN = 1)(
    input data_valid,
    input signed [DATA_WIDTH-1:0] mac_result,
    output signed [DATA_WIDTH-1:0] output_pixel
);

wire signed [DATA_WIDTH-1:0] relu_out = (RELU_EN && mac_result[DATA_WIDTH-1]) ? {DATA_WIDTH{1'b0}} : mac_result;


assign output_pixel = data_valid ? relu_out : {DATA_WIDTH{1'b0}};

endmodule