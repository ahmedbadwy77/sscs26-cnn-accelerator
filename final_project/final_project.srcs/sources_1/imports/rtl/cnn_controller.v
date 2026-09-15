module cnn_controller #(parameter N = 3 , parameter IMG_WIDTH = 32)(
    input clk , rst , cnn_en , kernel_rd_en , kernel_finish,
    output reg data_valid,
    output wire line_en
);

localparam FILL_CYCLES = (N - 1) * IMG_WIDTH + N - 1;
localparam COUNTER_WIDTH = $clog2(FILL_CYCLES + 2);

localparam IDLE = 2'd0 , COMPUTING = 2'd1 , KREAD = 2'd2 , VALID = 2'd3;

reg [1:0] current_state;
reg [COUNTER_WIDTH-1:0] compute_counter;

localparam TOTAL_TAPS = N * N , FLUSH_CYCLES = TOTAL_TAPS + 2 , FLUSH_COUNTER_WIDTH = $clog2(TOTAL_TAPS + 3);

reg [FLUSH_COUNTER_WIDTH-1:0] flush_counter;

always @(posedge clk or negedge rst) begin
    if (!rst)
        current_state <= IDLE;
    else begin
        case (current_state)

            IDLE:
                if (cnn_en)
                    current_state <= COMPUTING;
                else if (kernel_rd_en)
                    current_state <= KREAD;
                else
                    current_state <= IDLE;

            COMPUTING:
                if (compute_counter == FILL_CYCLES - 1)
                    current_state <= VALID;
                else
                    current_state <= COMPUTING;

            VALID:
                if (cnn_en)
                    current_state <= VALID;
                else
                    current_state <= IDLE;

            KREAD:
                if (kernel_finish)
                    current_state <= IDLE;
                else
                    current_state <= KREAD;

            default:
                current_state <= IDLE;

        endcase
    end
end

always @(posedge clk or negedge rst) begin
    if (!rst)
        compute_counter <= {COUNTER_WIDTH{1'b0}};
    else if (current_state == COMPUTING)
        compute_counter <= compute_counter + 1'b1;
    else
        compute_counter <= {COUNTER_WIDTH{1'b0}};
end

always @(posedge clk or negedge rst) begin
    if (!rst)
        flush_counter <= {FLUSH_COUNTER_WIDTH{1'b0}};
    else if (current_state == COMPUTING)
        flush_counter <= {FLUSH_COUNTER_WIDTH{1'b0}};
    else if (current_state == VALID && flush_counter != FLUSH_CYCLES)
        flush_counter <= flush_counter + 1'b1;
end

always @(*) begin
    data_valid = (current_state == VALID) && (flush_counter == FLUSH_CYCLES);
end

assign line_en = (current_state == COMPUTING) || (current_state == VALID);

endmodule



/*
module cnn_controller #(parameter N = 3 , parameter IMG_WIDTH = 32)(
    input clk , rst , cnn_en , kernel_rd_en , kernel_finish,
    output reg data_valid,
    output wire line_en
);

localparam FILL_CYCLES = (N - 1) * IMG_WIDTH + N - 1;
localparam COUNTER_WIDTH = $clog2(FILL_CYCLES + 2);

localparam IDLE = 2'd0 , COMPUTING = 2'd1 , KREAD = 2'd2 , VALID = 2'd3;

reg [1:0] current_state;
reg [COUNTER_WIDTH-1:0] compute_counter;

// CHANGED: Increased FLUSH_CYCLES by 1 to account for the new MREG pipeline stage
localparam TOTAL_TAPS = N * N , FLUSH_CYCLES = TOTAL_TAPS + 2 , FLUSH_COUNTER_WIDTH = $clog2(TOTAL_TAPS + 3);

reg [FLUSH_COUNTER_WIDTH-1:0] flush_counter;

always @(posedge clk or negedge rst) begin
    if (!rst)
        current_state <= IDLE;
    else begin
        case (current_state)

            IDLE:
                if (cnn_en)
                    current_state <= COMPUTING;
                else if (kernel_rd_en)
                    current_state <= KREAD;
                else
                    current_state <= IDLE;

            COMPUTING:
                if (compute_counter == FILL_CYCLES - 1)
                    current_state <= VALID;
                else
                    current_state <= COMPUTING;

            VALID:
                if (cnn_en)
                    current_state <= VALID;
                else
                    current_state <= IDLE;

            KREAD:
                if (kernel_finish)
                    current_state <= IDLE;
                else
                    current_state <= KREAD;

            default:
                current_state <= IDLE;

        endcase
    end
end

always @(posedge clk or negedge rst) begin
    if (!rst)
        compute_counter <= {COUNTER_WIDTH{1'b0}};
    else if (current_state == COMPUTING)
        compute_counter <= compute_counter + 1'b1;
    else
        compute_counter <= {COUNTER_WIDTH{1'b0}};
end

always @(posedge clk or negedge rst) begin
    if (!rst)
        flush_counter <= {FLUSH_COUNTER_WIDTH{1'b0}};
    else if (current_state == COMPUTING)
        flush_counter <= {FLUSH_COUNTER_WIDTH{1'b0}};
    else if (current_state == VALID && flush_counter != FLUSH_CYCLES)
        flush_counter <= flush_counter + 1'b1;
end

always @(*) begin
    data_valid = (current_state == VALID) && (flush_counter == FLUSH_CYCLES);
end

assign line_en = (current_state == COMPUTING) || (current_state == VALID);

endmodule
*/
/*

module cnn_controller #(parameter N = 3 , parameter IMG_WIDTH = 32)(
    input clk , rst , cnn_en , kernel_rd_en , kernel_finish,
    output reg data_valid,
    output wire line_en
);

localparam FILL_CYCLES = (N - 1) * IMG_WIDTH + N - 1;
localparam COUNTER_WIDTH = $clog2(FILL_CYCLES + 2);

localparam IDLE = 2'd0 , COMPUTING = 2'd1 , KREAD = 2'd2 , VALID = 2'd3;

reg [1:0] current_state;
reg [COUNTER_WIDTH-1:0] compute_counter;

localparam TOTAL_TAPS = N * N , FLUSH_CYCLES = TOTAL_TAPS + 1 , FLUSH_COUNTER_WIDTH = $clog2(TOTAL_TAPS + 2);

reg [FLUSH_COUNTER_WIDTH-1:0] flush_counter;

always @(posedge clk or negedge rst) begin
    if (!rst)
        current_state <= IDLE;
    else begin
        case (current_state)

            IDLE:
                if (cnn_en)
                    current_state <= COMPUTING;
                else if (kernel_rd_en)
                    current_state <= KREAD;
                else
                    current_state <= IDLE;

            COMPUTING:
                if (compute_counter == FILL_CYCLES - 1)
                    current_state <= VALID;
                else
                    current_state <= COMPUTING;

            VALID:
                if (cnn_en)
                    current_state <= VALID;
                else
                    current_state <= IDLE;

            KREAD:
                if (kernel_finish)
                    current_state <= IDLE;
                else
                    current_state <= KREAD;

            default:
                current_state <= IDLE;

        endcase
    end
end

always @(posedge clk or negedge rst) begin
    if (!rst)
        compute_counter <= {COUNTER_WIDTH{1'b0}};
    else if (current_state == COMPUTING)
        compute_counter <= compute_counter + 1'b1;
    else
        compute_counter <= {COUNTER_WIDTH{1'b0}};
end

always @(posedge clk or negedge rst) begin
    if (!rst)
        flush_counter <= {FLUSH_COUNTER_WIDTH{1'b0}};
    else if (current_state == COMPUTING)
        flush_counter <= {FLUSH_COUNTER_WIDTH{1'b0}};
    else if (current_state == VALID && flush_counter != FLUSH_CYCLES)
        flush_counter <= flush_counter + 1'b1;
end

always @(*) begin
    data_valid = (current_state == VALID) && (flush_counter == FLUSH_CYCLES);
end

assign line_en = (current_state == COMPUTING) || (current_state == VALID);

endmodule
*/