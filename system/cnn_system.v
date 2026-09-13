module cnn_system #(parameter N = 3 , parameter IMG_WIDTH = 32 , parameter PIXEL_BITS = 8 , parameter RELU_EN = 0)(
    input clk , rst , start , kernel_we, image_we ,
    input [PIXEL_BITS-1:0] kernel_data , image_data,
    output busy , done , data_valid,
    output signed [(2 * PIXEL_BITS + $clog2(N * N))-1:0] output_data
);

localparam TOTAL_TAPS = N * N , OUTPUT_WIDTH = 2 * PIXEL_BITS + $clog2(TOTAL_TAPS) , TOTAL_PIXELS = IMG_WIDTH * IMG_WIDTH ,
            TOTAL_OUTPUTS = (IMG_WIDTH - N + 1) * (IMG_WIDTH - N + 1);

localparam IDLE = 3'd0 , KERNEL_STREAM = 3'd1 , KERNEL_GAP = 3'd2 , RUN = 3'd3 , DONE = 3'd4;

reg [2:0] state;
reg [PIXEL_BITS-1:0] kernel_memory [0:TOTAL_TAPS-1];
reg [PIXEL_BITS-1:0] image_memory [0:TOTAL_PIXELS-1];
reg [$clog2(TOTAL_TAPS)-1:0] kernel_write_count , kernel_stream_count;
reg [$clog2(TOTAL_PIXELS)-1:0] image_write_count , image_stream_count;
reg [$clog2(TOTAL_OUTPUTS+1)-1:0] output_count;
reg [5:0] output_phase;
reg kernel_loaded , image_loaded;
wire cnn_en , kernel_rd_en;

wire [PIXEL_BITS-1:0] cnn_input;
wire cnn_data_valid;
wire signed [OUTPUT_WIDTH-1:0] cnn_output;

assign busy = (state != IDLE) && (state != DONE);
assign done = (state == DONE);

assign data_valid = cnn_data_valid && (output_phase < IMG_WIDTH - N + 1) && (output_count < TOTAL_OUTPUTS);
assign output_data = cnn_output;

assign cnn_en = (state == RUN);
assign kernel_rd_en = (state == KERNEL_STREAM);

assign cnn_input = (state == KERNEL_STREAM) ? kernel_memory[kernel_stream_count] : (state == RUN) ? image_memory[image_stream_count] : 'b0;

cnn_top #(.N(N),.IMG_WIDTH(IMG_WIDTH),.PIXEL_BITS(PIXEL_BITS),.RELU_EN(RELU_EN)) cnn_core (
    .clk(clk),
    .rst(rst),
    .in_pixel(cnn_input),
    .cnn_en(cnn_en),
    .kernel_rd_en(kernel_rd_en),
    .data_valid(cnn_data_valid),
    .out_pixel(cnn_output)
);

always @(posedge clk or negedge rst) begin

    if (!rst) begin
        state <= IDLE;
        kernel_write_count <= 'b0;
        kernel_stream_count <= 'b0;
        image_write_count <= 'b0;
        image_stream_count <= 'b0;
        output_count <= 'b0;
        output_phase <= 'b0;
        kernel_loaded <= 1'b0;
        image_loaded <= 1'b0;
    end

    else begin
        case (state)

            IDLE: begin
                if (kernel_we) begin
                    kernel_memory[kernel_write_count] <= kernel_data;

                    if (kernel_write_count == TOTAL_TAPS - 1) begin
                        kernel_write_count <= 'b0;
                        kernel_loaded <= 1'b1;
                    end
                    else begin
                        kernel_write_count <= kernel_write_count + 1'b1;
                    end
                end

                if (image_we) begin
                    image_memory[image_write_count] <= image_data;

                    if (image_write_count == TOTAL_PIXELS - 1) begin
                        image_write_count <= 'b0;
                        image_loaded <= 1'b1;
                    end
                    else begin
                        image_write_count <= image_write_count + 1'b1;
                    end
                end

                if (start && kernel_loaded && image_loaded) begin
                    kernel_stream_count <= 'b0;
                    image_stream_count <= 'b0;
                    output_count <= 'b0;
                    output_phase <= 'b0;
                    state <= KERNEL_STREAM;
                end
            end

            KERNEL_STREAM: begin
                if (kernel_stream_count == TOTAL_TAPS - 1) begin
                    kernel_stream_count <= 'b0;
                    state <= KERNEL_GAP;
                end
                else begin
                    kernel_stream_count <= kernel_stream_count + 1'b1;
                end
            end

            KERNEL_GAP: begin
                image_stream_count <= 'b0;
                state <= RUN;
            end

            RUN: begin
                if (cnn_data_valid) begin
                    if (output_phase == IMG_WIDTH - 1)
                        output_phase <= 'b0;
                    else
                        output_phase <= output_phase + 1'b1;
                end

                if (data_valid) begin
                    output_count <= output_count + 1'b1;
                end

                if (image_stream_count == TOTAL_PIXELS - 1) begin
                    image_stream_count <= 'b0;
                end
                else begin
                    image_stream_count <= image_stream_count + 1'b1;
                end

                if (data_valid && (output_count == TOTAL_OUTPUTS - 1)) begin
                    state <= DONE;
                end
            end

            DONE: begin
                state <= IDLE;
            end

            default: begin
                state <= IDLE;
            end

        endcase
    end
end

endmodule
