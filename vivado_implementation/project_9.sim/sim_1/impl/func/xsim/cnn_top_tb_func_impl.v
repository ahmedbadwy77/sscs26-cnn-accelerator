// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Wed Sep 23 21:10:36 2026
// Host        : IC_EDA running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /mnt/hgfs/Digital_Shared_Folder/Best_design_v2_compare/LAST_VERISON/project_9/project_9.sim/sim_1/impl/func/xsim/cnn_top_tb_func_impl.v
// Design      : cnn_top
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module cnn_controller
   (data_valid_OBUF,
    Q,
    \FSM_sequential_current_state_reg[0]_0 ,
    cnn_en_IBUF,
    kernel_rd_en_IBUF,
    rst_IBUF,
    clk_IBUF_BUFG);
  output data_valid_OBUF;
  output [1:0]Q;
  input \FSM_sequential_current_state_reg[0]_0 ;
  input cnn_en_IBUF;
  input kernel_rd_en_IBUF;
  input rst_IBUF;
  input clk_IBUF_BUFG;

  wire \FSM_sequential_current_state[0]_i_1_n_0 ;
  wire \FSM_sequential_current_state[0]_i_2_n_0 ;
  wire \FSM_sequential_current_state[0]_i_4_n_0 ;
  wire \FSM_sequential_current_state[1]_i_1_n_0 ;
  wire \FSM_sequential_current_state[1]_i_2_n_0 ;
  wire \FSM_sequential_current_state_reg[0]_0 ;
  wire [1:0]Q;
  wire clk_IBUF_BUFG;
  wire cnn_en_IBUF;
  wire [6:0]compute_counter;
  wire \compute_counter[4]_i_2_n_0 ;
  wire \compute_counter[6]_i_2_n_0 ;
  wire \compute_counter_reg_n_0_[0] ;
  wire \compute_counter_reg_n_0_[1] ;
  wire \compute_counter_reg_n_0_[2] ;
  wire \compute_counter_reg_n_0_[3] ;
  wire \compute_counter_reg_n_0_[4] ;
  wire \compute_counter_reg_n_0_[5] ;
  wire \compute_counter_reg_n_0_[6] ;
  wire data_valid_OBUF;
  wire flush_counter;
  wire \flush_counter[0]_i_1_n_0 ;
  wire \flush_counter[1]_i_1_n_0 ;
  wire \flush_counter[2]_i_1_n_0 ;
  wire \flush_counter[3]_i_2_n_0 ;
  wire \flush_counter_reg_n_0_[0] ;
  wire \flush_counter_reg_n_0_[1] ;
  wire \flush_counter_reg_n_0_[2] ;
  wire \flush_counter_reg_n_0_[3] ;
  wire kernel_rd_en_IBUF;
  wire rst_IBUF;

  LUT6 #(
    .INIT(64'hEEEEEEEEEEE0EEEE)) 
    \FSM_sequential_current_state[0]_i_1 
       (.I0(\FSM_sequential_current_state[0]_i_2_n_0 ),
        .I1(\FSM_sequential_current_state_reg[0]_0 ),
        .I2(\FSM_sequential_current_state[0]_i_4_n_0 ),
        .I3(\compute_counter_reg_n_0_[3] ),
        .I4(\compute_counter_reg_n_0_[0] ),
        .I5(\compute_counter_reg_n_0_[5] ),
        .O(\FSM_sequential_current_state[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB0A)) 
    \FSM_sequential_current_state[0]_i_2 
       (.I0(Q[1]),
        .I1(kernel_rd_en_IBUF),
        .I2(cnn_en_IBUF),
        .I3(Q[0]),
        .O(\FSM_sequential_current_state[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFF7FF)) 
    \FSM_sequential_current_state[0]_i_4 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(\compute_counter_reg_n_0_[1] ),
        .I3(\compute_counter_reg_n_0_[6] ),
        .I4(\compute_counter_reg_n_0_[2] ),
        .I5(\compute_counter_reg_n_0_[4] ),
        .O(\FSM_sequential_current_state[0]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \FSM_sequential_current_state[1]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(cnn_en_IBUF),
        .O(\FSM_sequential_current_state[1]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_sequential_current_state[1]_i_2 
       (.I0(rst_IBUF),
        .O(\FSM_sequential_current_state[1]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "COMPUTING:11,VALID:10,KREAD:00,IDLE:01" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_sequential_current_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_current_state[0]_i_1_n_0 ),
        .PRE(\FSM_sequential_current_state[1]_i_2_n_0 ),
        .Q(Q[0]));
  (* FSM_ENCODED_STATES = "COMPUTING:11,VALID:10,KREAD:00,IDLE:01" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_current_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\FSM_sequential_current_state[1]_i_2_n_0 ),
        .D(\FSM_sequential_current_state[1]_i_1_n_0 ),
        .Q(Q[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \compute_counter[0]_i_1 
       (.I0(\compute_counter_reg_n_0_[0] ),
        .I1(Q[0]),
        .I2(Q[1]),
        .O(compute_counter[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h2800)) 
    \compute_counter[1]_i_1 
       (.I0(Q[1]),
        .I1(\compute_counter_reg_n_0_[0] ),
        .I2(\compute_counter_reg_n_0_[1] ),
        .I3(Q[0]),
        .O(compute_counter[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h08808080)) 
    \compute_counter[2]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(\compute_counter_reg_n_0_[2] ),
        .I3(\compute_counter_reg_n_0_[1] ),
        .I4(\compute_counter_reg_n_0_[0] ),
        .O(compute_counter[2]));
  LUT6 #(
    .INIT(64'h0880808080808080)) 
    \compute_counter[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(\compute_counter_reg_n_0_[3] ),
        .I3(\compute_counter_reg_n_0_[2] ),
        .I4(\compute_counter_reg_n_0_[0] ),
        .I5(\compute_counter_reg_n_0_[1] ),
        .O(compute_counter[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h8008)) 
    \compute_counter[4]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(\compute_counter_reg_n_0_[4] ),
        .I3(\compute_counter[4]_i_2_n_0 ),
        .O(compute_counter[4]));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \compute_counter[4]_i_2 
       (.I0(\compute_counter_reg_n_0_[2] ),
        .I1(\compute_counter_reg_n_0_[0] ),
        .I2(\compute_counter_reg_n_0_[1] ),
        .I3(\compute_counter_reg_n_0_[3] ),
        .O(\compute_counter[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0880)) 
    \compute_counter[5]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(\compute_counter_reg_n_0_[5] ),
        .I3(\compute_counter[6]_i_2_n_0 ),
        .O(compute_counter[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h28880000)) 
    \compute_counter[6]_i_1 
       (.I0(Q[1]),
        .I1(\compute_counter_reg_n_0_[6] ),
        .I2(\compute_counter_reg_n_0_[5] ),
        .I3(\compute_counter[6]_i_2_n_0 ),
        .I4(Q[0]),
        .O(compute_counter[6]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \compute_counter[6]_i_2 
       (.I0(\compute_counter_reg_n_0_[4] ),
        .I1(\compute_counter_reg_n_0_[3] ),
        .I2(\compute_counter_reg_n_0_[1] ),
        .I3(\compute_counter_reg_n_0_[0] ),
        .I4(\compute_counter_reg_n_0_[2] ),
        .O(\compute_counter[6]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \compute_counter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\FSM_sequential_current_state[1]_i_2_n_0 ),
        .D(compute_counter[0]),
        .Q(\compute_counter_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \compute_counter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\FSM_sequential_current_state[1]_i_2_n_0 ),
        .D(compute_counter[1]),
        .Q(\compute_counter_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \compute_counter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\FSM_sequential_current_state[1]_i_2_n_0 ),
        .D(compute_counter[2]),
        .Q(\compute_counter_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \compute_counter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\FSM_sequential_current_state[1]_i_2_n_0 ),
        .D(compute_counter[3]),
        .Q(\compute_counter_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \compute_counter_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\FSM_sequential_current_state[1]_i_2_n_0 ),
        .D(compute_counter[4]),
        .Q(\compute_counter_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \compute_counter_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\FSM_sequential_current_state[1]_i_2_n_0 ),
        .D(compute_counter[5]),
        .Q(\compute_counter_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \compute_counter_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\FSM_sequential_current_state[1]_i_2_n_0 ),
        .D(compute_counter[6]),
        .Q(\compute_counter_reg_n_0_[6] ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    data_valid_OBUF_inst_i_1
       (.I0(Q[1]),
        .I1(\flush_counter_reg_n_0_[1] ),
        .I2(\flush_counter_reg_n_0_[0] ),
        .I3(\flush_counter_reg_n_0_[3] ),
        .I4(\flush_counter_reg_n_0_[2] ),
        .I5(Q[0]),
        .O(data_valid_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \flush_counter[0]_i_1 
       (.I0(Q[0]),
        .I1(\flush_counter_reg_n_0_[0] ),
        .O(\flush_counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h14)) 
    \flush_counter[1]_i_1 
       (.I0(Q[0]),
        .I1(\flush_counter_reg_n_0_[1] ),
        .I2(\flush_counter_reg_n_0_[0] ),
        .O(\flush_counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h1540)) 
    \flush_counter[2]_i_1 
       (.I0(Q[0]),
        .I1(\flush_counter_reg_n_0_[0] ),
        .I2(\flush_counter_reg_n_0_[1] ),
        .I3(\flush_counter_reg_n_0_[2] ),
        .O(\flush_counter[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAA2AAA)) 
    \flush_counter[3]_i_1 
       (.I0(Q[1]),
        .I1(\flush_counter_reg_n_0_[1] ),
        .I2(\flush_counter_reg_n_0_[0] ),
        .I3(\flush_counter_reg_n_0_[3] ),
        .I4(\flush_counter_reg_n_0_[2] ),
        .I5(Q[0]),
        .O(flush_counter));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h15554000)) 
    \flush_counter[3]_i_2 
       (.I0(Q[0]),
        .I1(\flush_counter_reg_n_0_[1] ),
        .I2(\flush_counter_reg_n_0_[0] ),
        .I3(\flush_counter_reg_n_0_[2] ),
        .I4(\flush_counter_reg_n_0_[3] ),
        .O(\flush_counter[3]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \flush_counter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(flush_counter),
        .CLR(\FSM_sequential_current_state[1]_i_2_n_0 ),
        .D(\flush_counter[0]_i_1_n_0 ),
        .Q(\flush_counter_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \flush_counter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(flush_counter),
        .CLR(\FSM_sequential_current_state[1]_i_2_n_0 ),
        .D(\flush_counter[1]_i_1_n_0 ),
        .Q(\flush_counter_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \flush_counter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(flush_counter),
        .CLR(\FSM_sequential_current_state[1]_i_2_n_0 ),
        .D(\flush_counter[2]_i_1_n_0 ),
        .Q(\flush_counter_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \flush_counter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(flush_counter),
        .CLR(\FSM_sequential_current_state[1]_i_2_n_0 ),
        .D(\flush_counter[3]_i_2_n_0 ),
        .Q(\flush_counter_reg_n_0_[3] ));
endmodule

(* ECO_CHECKSUM = "7b8acfda" *) (* IMG_WIDTH = "32" *) (* KERNEL_BUS_WIDTH = "72" *) 
(* N = "3" *) (* NUM_KERNELS = "1" *) (* OUTPUT_WIDTH = "20" *) 
(* PIXEL_BITS = "8" *) (* RELU_EN = "1" *) (* TOTAL_TAPS = "9" *) 
(* WINDOW_BUS_WIDTH = "72" *) 
(* NotValidForBitStream *)
module cnn_top
   (clk,
    rst,
    kernel_rd_en,
    cnn_en,
    in_pixel,
    data_valid,
    out_pixel);
  input clk;
  input rst;
  input kernel_rd_en;
  input cnn_en;
  input [7:0]in_pixel;
  output data_valid;
  output [19:0]out_pixel;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire cnn_en;
  wire cnn_en_IBUF;
  wire [1:0]current_state;
  wire data_valid;
  wire data_valid_OBUF;
  wire [7:0]\delayed_window_pixels_reg[3][1] ;
  wire [7:0]\delayed_window_pixels_reg[6][4] ;
  wire [7:0]\delayed_window_pixels_reg[9][7] ;
  wire [7:0]in_pixel;
  wire [7:0]in_pixel_IBUF;
  wire [7:0]\kernel_coefficients_reg[2] ;
  wire [7:0]\kernel_coefficients_reg[3] ;
  wire [7:0]\kernel_coefficients_reg[4] ;
  wire [7:0]\kernel_coefficients_reg[5] ;
  wire [7:0]\kernel_coefficients_reg[6] ;
  wire [7:0]\kernel_coefficients_reg[7] ;
  wire [7:0]\kernel_coefficients_reg[8] ;
  wire kernel_memory_inst_n_0;
  wire kernel_memory_inst_n_1;
  wire kernel_rd_en;
  wire kernel_rd_en_IBUF;
  wire [19:0]out_pixel;
  wire [18:0]out_pixel_OBUF;
  wire rst;
  wire rst_IBUF;

  (* PHYS_OPT_MODIFIED = "CLOCK_OPT" *) 
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF cnn_en_IBUF_inst
       (.I(cnn_en),
        .O(cnn_en_IBUF));
  cnn_controller controller_inst
       (.\FSM_sequential_current_state_reg[0]_0 (kernel_memory_inst_n_1),
        .Q(current_state),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .cnn_en_IBUF(cnn_en_IBUF),
        .data_valid_OBUF(data_valid_OBUF),
        .kernel_rd_en_IBUF(kernel_rd_en_IBUF),
        .rst_IBUF(rst_IBUF));
  OBUF data_valid_OBUF_inst
       (.I(data_valid_OBUF),
        .O(data_valid));
  IBUF \in_pixel_IBUF[0]_inst 
       (.I(in_pixel[0]),
        .O(in_pixel_IBUF[0]));
  IBUF \in_pixel_IBUF[1]_inst 
       (.I(in_pixel[1]),
        .O(in_pixel_IBUF[1]));
  IBUF \in_pixel_IBUF[2]_inst 
       (.I(in_pixel[2]),
        .O(in_pixel_IBUF[2]));
  IBUF \in_pixel_IBUF[3]_inst 
       (.I(in_pixel[3]),
        .O(in_pixel_IBUF[3]));
  IBUF \in_pixel_IBUF[4]_inst 
       (.I(in_pixel[4]),
        .O(in_pixel_IBUF[4]));
  IBUF \in_pixel_IBUF[5]_inst 
       (.I(in_pixel[5]),
        .O(in_pixel_IBUF[5]));
  IBUF \in_pixel_IBUF[6]_inst 
       (.I(in_pixel[6]),
        .O(in_pixel_IBUF[6]));
  IBUF \in_pixel_IBUF[7]_inst 
       (.I(in_pixel[7]),
        .O(in_pixel_IBUF[7]));
  kernel_coeff_memory kernel_memory_inst
       (.B(in_pixel_IBUF),
        .Q(current_state),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\kernel_coefficients_reg[2][7]_0 (\kernel_coefficients_reg[2] ),
        .\kernel_coefficients_reg[3][7]_0 (\kernel_coefficients_reg[3] ),
        .\kernel_coefficients_reg[4][7]_0 (\kernel_coefficients_reg[4] ),
        .\kernel_coefficients_reg[5][7]_0 (\kernel_coefficients_reg[5] ),
        .\kernel_coefficients_reg[6][7]_0 (\kernel_coefficients_reg[6] ),
        .\kernel_coefficients_reg[7][7]_0 (\kernel_coefficients_reg[7] ),
        .\kernel_coefficients_reg[8][7]_0 (\kernel_coefficients_reg[8] ),
        .\kernel_counter_reg[1]_0 (kernel_memory_inst_n_0),
        .\kernel_counter_reg[3]_0 (kernel_memory_inst_n_1),
        .kernel_rd_en_IBUF(kernel_rd_en_IBUF));
  tree_nxn \kernel_pipeline[0].mac_pipeline_inst 
       (.A(\delayed_window_pixels_reg[3][1] ),
        .B(in_pixel_IBUF),
        .\accumulation_stage_reg[1]_0 (\kernel_coefficients_reg[2] ),
        .\accumulation_stage_reg[2]_0 (\kernel_coefficients_reg[3] ),
        .\accumulation_stage_reg[3]_0 (\kernel_coefficients_reg[4] ),
        .\accumulation_stage_reg[4]_0 (\kernel_coefficients_reg[5] ),
        .\accumulation_stage_reg[4]_1 (\delayed_window_pixels_reg[6][4] ),
        .\accumulation_stage_reg[5]_0 (\kernel_coefficients_reg[6] ),
        .\accumulation_stage_reg[6]_0 (\kernel_coefficients_reg[7] ),
        .\accumulation_stage_reg[7]_0 (\kernel_coefficients_reg[8] ),
        .\accumulation_stage_reg[7]_1 (\delayed_window_pixels_reg[9][7] ),
        .\accumulation_stage_reg[8]_0 (kernel_memory_inst_n_0),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .cnn_en_IBUF(cnn_en_IBUF),
        .data_valid_OBUF(data_valid_OBUF),
        .out_pixel_OBUF(out_pixel_OBUF));
  IBUF kernel_rd_en_IBUF_inst
       (.I(kernel_rd_en),
        .O(kernel_rd_en_IBUF));
  OBUF \out_pixel_OBUF[0]_inst 
       (.I(out_pixel_OBUF[0]),
        .O(out_pixel[0]));
  OBUF \out_pixel_OBUF[10]_inst 
       (.I(out_pixel_OBUF[10]),
        .O(out_pixel[10]));
  OBUF \out_pixel_OBUF[11]_inst 
       (.I(out_pixel_OBUF[11]),
        .O(out_pixel[11]));
  OBUF \out_pixel_OBUF[12]_inst 
       (.I(out_pixel_OBUF[12]),
        .O(out_pixel[12]));
  OBUF \out_pixel_OBUF[13]_inst 
       (.I(out_pixel_OBUF[13]),
        .O(out_pixel[13]));
  OBUF \out_pixel_OBUF[14]_inst 
       (.I(out_pixel_OBUF[14]),
        .O(out_pixel[14]));
  OBUF \out_pixel_OBUF[15]_inst 
       (.I(out_pixel_OBUF[15]),
        .O(out_pixel[15]));
  OBUF \out_pixel_OBUF[16]_inst 
       (.I(out_pixel_OBUF[16]),
        .O(out_pixel[16]));
  OBUF \out_pixel_OBUF[17]_inst 
       (.I(out_pixel_OBUF[17]),
        .O(out_pixel[17]));
  OBUF \out_pixel_OBUF[18]_inst 
       (.I(out_pixel_OBUF[18]),
        .O(out_pixel[18]));
  OBUF \out_pixel_OBUF[19]_inst 
       (.I(1'b0),
        .O(out_pixel[19]));
  OBUF \out_pixel_OBUF[1]_inst 
       (.I(out_pixel_OBUF[1]),
        .O(out_pixel[1]));
  OBUF \out_pixel_OBUF[2]_inst 
       (.I(out_pixel_OBUF[2]),
        .O(out_pixel[2]));
  OBUF \out_pixel_OBUF[3]_inst 
       (.I(out_pixel_OBUF[3]),
        .O(out_pixel[3]));
  OBUF \out_pixel_OBUF[4]_inst 
       (.I(out_pixel_OBUF[4]),
        .O(out_pixel[4]));
  OBUF \out_pixel_OBUF[5]_inst 
       (.I(out_pixel_OBUF[5]),
        .O(out_pixel[5]));
  OBUF \out_pixel_OBUF[6]_inst 
       (.I(out_pixel_OBUF[6]),
        .O(out_pixel[6]));
  OBUF \out_pixel_OBUF[7]_inst 
       (.I(out_pixel_OBUF[7]),
        .O(out_pixel[7]));
  OBUF \out_pixel_OBUF[8]_inst 
       (.I(out_pixel_OBUF[8]),
        .O(out_pixel[8]));
  OBUF \out_pixel_OBUF[9]_inst 
       (.I(out_pixel_OBUF[9]),
        .O(out_pixel[9]));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  window_nxn window_generator_inst
       (.A(\delayed_window_pixels_reg[3][1] ),
        .B(in_pixel_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .cnn_en_IBUF(cnn_en_IBUF),
        .\pixel_delay_reg[1][7] (\delayed_window_pixels_reg[6][4] ),
        .\pixel_delay_reg[4][7] (\delayed_window_pixels_reg[9][7] ));
endmodule

module kernel_coeff_memory
   (\kernel_counter_reg[1]_0 ,
    \kernel_counter_reg[3]_0 ,
    \kernel_coefficients_reg[8][7]_0 ,
    \kernel_coefficients_reg[7][7]_0 ,
    \kernel_coefficients_reg[6][7]_0 ,
    \kernel_coefficients_reg[5][7]_0 ,
    \kernel_coefficients_reg[4][7]_0 ,
    \kernel_coefficients_reg[3][7]_0 ,
    \kernel_coefficients_reg[2][7]_0 ,
    kernel_rd_en_IBUF,
    Q,
    B,
    clk_IBUF_BUFG);
  output \kernel_counter_reg[1]_0 ;
  output \kernel_counter_reg[3]_0 ;
  output [7:0]\kernel_coefficients_reg[8][7]_0 ;
  output [7:0]\kernel_coefficients_reg[7][7]_0 ;
  output [7:0]\kernel_coefficients_reg[6][7]_0 ;
  output [7:0]\kernel_coefficients_reg[5][7]_0 ;
  output [7:0]\kernel_coefficients_reg[4][7]_0 ;
  output [7:0]\kernel_coefficients_reg[3][7]_0 ;
  output [7:0]\kernel_coefficients_reg[2][7]_0 ;
  input kernel_rd_en_IBUF;
  input [1:0]Q;
  input [7:0]B;
  input clk_IBUF_BUFG;

  wire [7:0]B;
  wire [1:0]Q;
  wire clk_IBUF_BUFG;
  wire [7:0]\kernel_coefficients_reg[2][7]_0 ;
  wire [7:0]\kernel_coefficients_reg[3][7]_0 ;
  wire [7:0]\kernel_coefficients_reg[4][7]_0 ;
  wire [7:0]\kernel_coefficients_reg[5][7]_0 ;
  wire [7:0]\kernel_coefficients_reg[6][7]_0 ;
  wire [7:0]\kernel_coefficients_reg[7][7]_0 ;
  wire [7:0]\kernel_coefficients_reg[8][7]_0 ;
  wire kernel_counter;
  wire [3:0]kernel_counter_reg;
  wire \kernel_counter_reg[1]_0 ;
  wire \kernel_counter_reg[3]_0 ;
  wire kernel_rd_en_IBUF;
  wire [3:0]p_0_in;

  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \FSM_sequential_current_state[0]_i_3 
       (.I0(kernel_counter_reg[3]),
        .I1(kernel_counter_reg[0]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(kernel_counter_reg[1]),
        .I5(kernel_counter_reg[2]),
        .O(\kernel_counter_reg[3]_0 ));
  LUT5 #(
    .INIT(32'h0010F0F0)) 
    \kernel_coefficients[8][7]_i_1 
       (.I0(kernel_counter_reg[1]),
        .I1(kernel_counter_reg[2]),
        .I2(kernel_rd_en_IBUF),
        .I3(kernel_counter_reg[0]),
        .I4(kernel_counter_reg[3]),
        .O(\kernel_counter_reg[1]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[2][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[3][7]_0 [0]),
        .Q(\kernel_coefficients_reg[2][7]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[2][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[3][7]_0 [1]),
        .Q(\kernel_coefficients_reg[2][7]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[2][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[3][7]_0 [2]),
        .Q(\kernel_coefficients_reg[2][7]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[2][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[3][7]_0 [3]),
        .Q(\kernel_coefficients_reg[2][7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[2][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[3][7]_0 [4]),
        .Q(\kernel_coefficients_reg[2][7]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[2][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[3][7]_0 [5]),
        .Q(\kernel_coefficients_reg[2][7]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[2][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[3][7]_0 [6]),
        .Q(\kernel_coefficients_reg[2][7]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[2][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[3][7]_0 [7]),
        .Q(\kernel_coefficients_reg[2][7]_0 [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[3][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[4][7]_0 [0]),
        .Q(\kernel_coefficients_reg[3][7]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[3][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[4][7]_0 [1]),
        .Q(\kernel_coefficients_reg[3][7]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[3][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[4][7]_0 [2]),
        .Q(\kernel_coefficients_reg[3][7]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[3][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[4][7]_0 [3]),
        .Q(\kernel_coefficients_reg[3][7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[3][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[4][7]_0 [4]),
        .Q(\kernel_coefficients_reg[3][7]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[3][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[4][7]_0 [5]),
        .Q(\kernel_coefficients_reg[3][7]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[3][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[4][7]_0 [6]),
        .Q(\kernel_coefficients_reg[3][7]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[3][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[4][7]_0 [7]),
        .Q(\kernel_coefficients_reg[3][7]_0 [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[4][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[5][7]_0 [0]),
        .Q(\kernel_coefficients_reg[4][7]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[4][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[5][7]_0 [1]),
        .Q(\kernel_coefficients_reg[4][7]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[4][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[5][7]_0 [2]),
        .Q(\kernel_coefficients_reg[4][7]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[4][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[5][7]_0 [3]),
        .Q(\kernel_coefficients_reg[4][7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[4][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[5][7]_0 [4]),
        .Q(\kernel_coefficients_reg[4][7]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[4][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[5][7]_0 [5]),
        .Q(\kernel_coefficients_reg[4][7]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[4][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[5][7]_0 [6]),
        .Q(\kernel_coefficients_reg[4][7]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[4][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[5][7]_0 [7]),
        .Q(\kernel_coefficients_reg[4][7]_0 [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[5][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[6][7]_0 [0]),
        .Q(\kernel_coefficients_reg[5][7]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[5][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[6][7]_0 [1]),
        .Q(\kernel_coefficients_reg[5][7]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[5][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[6][7]_0 [2]),
        .Q(\kernel_coefficients_reg[5][7]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[5][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[6][7]_0 [3]),
        .Q(\kernel_coefficients_reg[5][7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[5][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[6][7]_0 [4]),
        .Q(\kernel_coefficients_reg[5][7]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[5][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[6][7]_0 [5]),
        .Q(\kernel_coefficients_reg[5][7]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[5][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[6][7]_0 [6]),
        .Q(\kernel_coefficients_reg[5][7]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[5][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[6][7]_0 [7]),
        .Q(\kernel_coefficients_reg[5][7]_0 [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[6][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[7][7]_0 [0]),
        .Q(\kernel_coefficients_reg[6][7]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[6][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[7][7]_0 [1]),
        .Q(\kernel_coefficients_reg[6][7]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[6][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[7][7]_0 [2]),
        .Q(\kernel_coefficients_reg[6][7]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[6][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[7][7]_0 [3]),
        .Q(\kernel_coefficients_reg[6][7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[6][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[7][7]_0 [4]),
        .Q(\kernel_coefficients_reg[6][7]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[6][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[7][7]_0 [5]),
        .Q(\kernel_coefficients_reg[6][7]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[6][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[7][7]_0 [6]),
        .Q(\kernel_coefficients_reg[6][7]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[6][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[7][7]_0 [7]),
        .Q(\kernel_coefficients_reg[6][7]_0 [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[7][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[8][7]_0 [0]),
        .Q(\kernel_coefficients_reg[7][7]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[7][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[8][7]_0 [1]),
        .Q(\kernel_coefficients_reg[7][7]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[7][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[8][7]_0 [2]),
        .Q(\kernel_coefficients_reg[7][7]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[7][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[8][7]_0 [3]),
        .Q(\kernel_coefficients_reg[7][7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[7][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[8][7]_0 [4]),
        .Q(\kernel_coefficients_reg[7][7]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[7][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[8][7]_0 [5]),
        .Q(\kernel_coefficients_reg[7][7]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[7][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[8][7]_0 [6]),
        .Q(\kernel_coefficients_reg[7][7]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[7][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(\kernel_coefficients_reg[8][7]_0 [7]),
        .Q(\kernel_coefficients_reg[7][7]_0 [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[8][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(B[0]),
        .Q(\kernel_coefficients_reg[8][7]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[8][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(B[1]),
        .Q(\kernel_coefficients_reg[8][7]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[8][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(B[2]),
        .Q(\kernel_coefficients_reg[8][7]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[8][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(B[3]),
        .Q(\kernel_coefficients_reg[8][7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[8][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(B[4]),
        .Q(\kernel_coefficients_reg[8][7]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[8][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(B[5]),
        .Q(\kernel_coefficients_reg[8][7]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[8][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(B[6]),
        .Q(\kernel_coefficients_reg[8][7]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_coefficients_reg[8][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(B[7]),
        .Q(\kernel_coefficients_reg[8][7]_0 [7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \kernel_counter[0]_i_1 
       (.I0(kernel_counter_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \kernel_counter[1]_i_1 
       (.I0(kernel_counter_reg[0]),
        .I1(kernel_counter_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \kernel_counter[2]_i_1 
       (.I0(kernel_counter_reg[2]),
        .I1(kernel_counter_reg[1]),
        .I2(kernel_counter_reg[0]),
        .O(p_0_in[2]));
  LUT1 #(
    .INIT(2'h1)) 
    \kernel_counter[3]_i_1 
       (.I0(kernel_rd_en_IBUF),
        .O(kernel_counter));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \kernel_counter[3]_i_2 
       (.I0(kernel_counter_reg[3]),
        .I1(kernel_counter_reg[0]),
        .I2(kernel_counter_reg[1]),
        .I3(kernel_counter_reg[2]),
        .O(p_0_in[3]));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_counter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(p_0_in[0]),
        .Q(kernel_counter_reg[0]),
        .R(kernel_counter));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_counter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(p_0_in[1]),
        .Q(kernel_counter_reg[1]),
        .R(kernel_counter));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_counter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(p_0_in[2]),
        .Q(kernel_counter_reg[2]),
        .R(kernel_counter));
  FDRE #(
    .INIT(1'b0)) 
    \kernel_counter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\kernel_counter_reg[1]_0 ),
        .D(p_0_in[3]),
        .Q(kernel_counter_reg[3]),
        .R(kernel_counter));
endmodule

module line_buffer
   (\pixel_delay_reg[4][7]_0 ,
    cnn_en_IBUF,
    B,
    clk_IBUF_BUFG);
  output [7:0]\pixel_delay_reg[4][7]_0 ;
  input cnn_en_IBUF;
  input [7:0]B;
  input clk_IBUF_BUFG;

  wire [7:0]B;
  wire clk_IBUF_BUFG;
  wire cnn_en_IBUF;
  wire \pixel_delay_reg[3][0]_srl7_n_0 ;
  wire \pixel_delay_reg[3][1]_srl7_n_0 ;
  wire \pixel_delay_reg[3][2]_srl7_n_0 ;
  wire \pixel_delay_reg[3][3]_srl7_n_0 ;
  wire \pixel_delay_reg[3][4]_srl7_n_0 ;
  wire \pixel_delay_reg[3][5]_srl7_n_0 ;
  wire \pixel_delay_reg[3][6]_srl7_n_0 ;
  wire \pixel_delay_reg[3][7]_srl7_n_0 ;
  wire [7:0]\pixel_delay_reg[4][7]_0 ;

  (* srl_bus_name = "\window_generator_inst/genblk1[1].line_buffer_inst/pixel_delay_reg[3] " *) 
  (* srl_name = "\window_generator_inst/genblk1[1].line_buffer_inst/pixel_delay_reg[3][0]_srl7 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \pixel_delay_reg[3][0]_srl7 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(B[0]),
        .Q(\pixel_delay_reg[3][0]_srl7_n_0 ));
  (* srl_bus_name = "\window_generator_inst/genblk1[1].line_buffer_inst/pixel_delay_reg[3] " *) 
  (* srl_name = "\window_generator_inst/genblk1[1].line_buffer_inst/pixel_delay_reg[3][1]_srl7 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \pixel_delay_reg[3][1]_srl7 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(B[1]),
        .Q(\pixel_delay_reg[3][1]_srl7_n_0 ));
  (* srl_bus_name = "\window_generator_inst/genblk1[1].line_buffer_inst/pixel_delay_reg[3] " *) 
  (* srl_name = "\window_generator_inst/genblk1[1].line_buffer_inst/pixel_delay_reg[3][2]_srl7 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \pixel_delay_reg[3][2]_srl7 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(B[2]),
        .Q(\pixel_delay_reg[3][2]_srl7_n_0 ));
  (* srl_bus_name = "\window_generator_inst/genblk1[1].line_buffer_inst/pixel_delay_reg[3] " *) 
  (* srl_name = "\window_generator_inst/genblk1[1].line_buffer_inst/pixel_delay_reg[3][3]_srl7 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \pixel_delay_reg[3][3]_srl7 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(B[3]),
        .Q(\pixel_delay_reg[3][3]_srl7_n_0 ));
  (* srl_bus_name = "\window_generator_inst/genblk1[1].line_buffer_inst/pixel_delay_reg[3] " *) 
  (* srl_name = "\window_generator_inst/genblk1[1].line_buffer_inst/pixel_delay_reg[3][4]_srl7 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \pixel_delay_reg[3][4]_srl7 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(B[4]),
        .Q(\pixel_delay_reg[3][4]_srl7_n_0 ));
  (* srl_bus_name = "\window_generator_inst/genblk1[1].line_buffer_inst/pixel_delay_reg[3] " *) 
  (* srl_name = "\window_generator_inst/genblk1[1].line_buffer_inst/pixel_delay_reg[3][5]_srl7 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \pixel_delay_reg[3][5]_srl7 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(B[5]),
        .Q(\pixel_delay_reg[3][5]_srl7_n_0 ));
  (* srl_bus_name = "\window_generator_inst/genblk1[1].line_buffer_inst/pixel_delay_reg[3] " *) 
  (* srl_name = "\window_generator_inst/genblk1[1].line_buffer_inst/pixel_delay_reg[3][6]_srl7 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \pixel_delay_reg[3][6]_srl7 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(B[6]),
        .Q(\pixel_delay_reg[3][6]_srl7_n_0 ));
  (* srl_bus_name = "\window_generator_inst/genblk1[1].line_buffer_inst/pixel_delay_reg[3] " *) 
  (* srl_name = "\window_generator_inst/genblk1[1].line_buffer_inst/pixel_delay_reg[3][7]_srl7 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \pixel_delay_reg[3][7]_srl7 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(B[7]),
        .Q(\pixel_delay_reg[3][7]_srl7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pixel_delay_reg[4][0] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\pixel_delay_reg[3][0]_srl7_n_0 ),
        .Q(\pixel_delay_reg[4][7]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixel_delay_reg[4][1] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\pixel_delay_reg[3][1]_srl7_n_0 ),
        .Q(\pixel_delay_reg[4][7]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixel_delay_reg[4][2] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\pixel_delay_reg[3][2]_srl7_n_0 ),
        .Q(\pixel_delay_reg[4][7]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixel_delay_reg[4][3] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\pixel_delay_reg[3][3]_srl7_n_0 ),
        .Q(\pixel_delay_reg[4][7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixel_delay_reg[4][4] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\pixel_delay_reg[3][4]_srl7_n_0 ),
        .Q(\pixel_delay_reg[4][7]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixel_delay_reg[4][5] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\pixel_delay_reg[3][5]_srl7_n_0 ),
        .Q(\pixel_delay_reg[4][7]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixel_delay_reg[4][6] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\pixel_delay_reg[3][6]_srl7_n_0 ),
        .Q(\pixel_delay_reg[4][7]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixel_delay_reg[4][7] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\pixel_delay_reg[3][7]_srl7_n_0 ),
        .Q(\pixel_delay_reg[4][7]_0 [7]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "line_buffer" *) 
module line_buffer_0
   (\pixel_delay_reg[1][7]_0 ,
    cnn_en_IBUF,
    \pixel_delay_reg[1][7]_1 ,
    clk_IBUF_BUFG);
  output [7:0]\pixel_delay_reg[1][7]_0 ;
  input cnn_en_IBUF;
  input [7:0]\pixel_delay_reg[1][7]_1 ;
  input clk_IBUF_BUFG;

  wire clk_IBUF_BUFG;
  wire cnn_en_IBUF;
  wire \pixel_delay_reg[0][0]_srl28_n_0 ;
  wire \pixel_delay_reg[0][1]_srl28_n_0 ;
  wire \pixel_delay_reg[0][2]_srl28_n_0 ;
  wire \pixel_delay_reg[0][3]_srl28_n_0 ;
  wire \pixel_delay_reg[0][4]_srl28_n_0 ;
  wire \pixel_delay_reg[0][5]_srl28_n_0 ;
  wire \pixel_delay_reg[0][6]_srl28_n_0 ;
  wire \pixel_delay_reg[0][7]_srl28_n_0 ;
  wire [7:0]\pixel_delay_reg[1][7]_0 ;
  wire [7:0]\pixel_delay_reg[1][7]_1 ;
  wire \NLW_pixel_delay_reg[0][0]_srl28_Q31_UNCONNECTED ;
  wire \NLW_pixel_delay_reg[0][1]_srl28_Q31_UNCONNECTED ;
  wire \NLW_pixel_delay_reg[0][2]_srl28_Q31_UNCONNECTED ;
  wire \NLW_pixel_delay_reg[0][3]_srl28_Q31_UNCONNECTED ;
  wire \NLW_pixel_delay_reg[0][4]_srl28_Q31_UNCONNECTED ;
  wire \NLW_pixel_delay_reg[0][5]_srl28_Q31_UNCONNECTED ;
  wire \NLW_pixel_delay_reg[0][6]_srl28_Q31_UNCONNECTED ;
  wire \NLW_pixel_delay_reg[0][7]_srl28_Q31_UNCONNECTED ;

  (* srl_bus_name = "\window_generator_inst/genblk1[2].line_buffer_inst/pixel_delay_reg[0] " *) 
  (* srl_name = "\window_generator_inst/genblk1[2].line_buffer_inst/pixel_delay_reg[0][0]_srl28 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \pixel_delay_reg[0][0]_srl28 
       (.A({1'b1,1'b1,1'b0,1'b1,1'b1}),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(\pixel_delay_reg[1][7]_1 [0]),
        .Q(\pixel_delay_reg[0][0]_srl28_n_0 ),
        .Q31(\NLW_pixel_delay_reg[0][0]_srl28_Q31_UNCONNECTED ));
  (* srl_bus_name = "\window_generator_inst/genblk1[2].line_buffer_inst/pixel_delay_reg[0] " *) 
  (* srl_name = "\window_generator_inst/genblk1[2].line_buffer_inst/pixel_delay_reg[0][1]_srl28 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \pixel_delay_reg[0][1]_srl28 
       (.A({1'b1,1'b1,1'b0,1'b1,1'b1}),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(\pixel_delay_reg[1][7]_1 [1]),
        .Q(\pixel_delay_reg[0][1]_srl28_n_0 ),
        .Q31(\NLW_pixel_delay_reg[0][1]_srl28_Q31_UNCONNECTED ));
  (* srl_bus_name = "\window_generator_inst/genblk1[2].line_buffer_inst/pixel_delay_reg[0] " *) 
  (* srl_name = "\window_generator_inst/genblk1[2].line_buffer_inst/pixel_delay_reg[0][2]_srl28 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \pixel_delay_reg[0][2]_srl28 
       (.A({1'b1,1'b1,1'b0,1'b1,1'b1}),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(\pixel_delay_reg[1][7]_1 [2]),
        .Q(\pixel_delay_reg[0][2]_srl28_n_0 ),
        .Q31(\NLW_pixel_delay_reg[0][2]_srl28_Q31_UNCONNECTED ));
  (* srl_bus_name = "\window_generator_inst/genblk1[2].line_buffer_inst/pixel_delay_reg[0] " *) 
  (* srl_name = "\window_generator_inst/genblk1[2].line_buffer_inst/pixel_delay_reg[0][3]_srl28 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \pixel_delay_reg[0][3]_srl28 
       (.A({1'b1,1'b1,1'b0,1'b1,1'b1}),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(\pixel_delay_reg[1][7]_1 [3]),
        .Q(\pixel_delay_reg[0][3]_srl28_n_0 ),
        .Q31(\NLW_pixel_delay_reg[0][3]_srl28_Q31_UNCONNECTED ));
  (* srl_bus_name = "\window_generator_inst/genblk1[2].line_buffer_inst/pixel_delay_reg[0] " *) 
  (* srl_name = "\window_generator_inst/genblk1[2].line_buffer_inst/pixel_delay_reg[0][4]_srl28 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \pixel_delay_reg[0][4]_srl28 
       (.A({1'b1,1'b1,1'b0,1'b1,1'b1}),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(\pixel_delay_reg[1][7]_1 [4]),
        .Q(\pixel_delay_reg[0][4]_srl28_n_0 ),
        .Q31(\NLW_pixel_delay_reg[0][4]_srl28_Q31_UNCONNECTED ));
  (* srl_bus_name = "\window_generator_inst/genblk1[2].line_buffer_inst/pixel_delay_reg[0] " *) 
  (* srl_name = "\window_generator_inst/genblk1[2].line_buffer_inst/pixel_delay_reg[0][5]_srl28 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \pixel_delay_reg[0][5]_srl28 
       (.A({1'b1,1'b1,1'b0,1'b1,1'b1}),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(\pixel_delay_reg[1][7]_1 [5]),
        .Q(\pixel_delay_reg[0][5]_srl28_n_0 ),
        .Q31(\NLW_pixel_delay_reg[0][5]_srl28_Q31_UNCONNECTED ));
  (* srl_bus_name = "\window_generator_inst/genblk1[2].line_buffer_inst/pixel_delay_reg[0] " *) 
  (* srl_name = "\window_generator_inst/genblk1[2].line_buffer_inst/pixel_delay_reg[0][6]_srl28 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \pixel_delay_reg[0][6]_srl28 
       (.A({1'b1,1'b1,1'b0,1'b1,1'b1}),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(\pixel_delay_reg[1][7]_1 [6]),
        .Q(\pixel_delay_reg[0][6]_srl28_n_0 ),
        .Q31(\NLW_pixel_delay_reg[0][6]_srl28_Q31_UNCONNECTED ));
  (* srl_bus_name = "\window_generator_inst/genblk1[2].line_buffer_inst/pixel_delay_reg[0] " *) 
  (* srl_name = "\window_generator_inst/genblk1[2].line_buffer_inst/pixel_delay_reg[0][7]_srl28 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \pixel_delay_reg[0][7]_srl28 
       (.A({1'b1,1'b1,1'b0,1'b1,1'b1}),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(\pixel_delay_reg[1][7]_1 [7]),
        .Q(\pixel_delay_reg[0][7]_srl28_n_0 ),
        .Q31(\NLW_pixel_delay_reg[0][7]_srl28_Q31_UNCONNECTED ));
  FDRE #(
    .INIT(1'b0)) 
    \pixel_delay_reg[1][0] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\pixel_delay_reg[0][0]_srl28_n_0 ),
        .Q(\pixel_delay_reg[1][7]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixel_delay_reg[1][1] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\pixel_delay_reg[0][1]_srl28_n_0 ),
        .Q(\pixel_delay_reg[1][7]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixel_delay_reg[1][2] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\pixel_delay_reg[0][2]_srl28_n_0 ),
        .Q(\pixel_delay_reg[1][7]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixel_delay_reg[1][3] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\pixel_delay_reg[0][3]_srl28_n_0 ),
        .Q(\pixel_delay_reg[1][7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixel_delay_reg[1][4] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\pixel_delay_reg[0][4]_srl28_n_0 ),
        .Q(\pixel_delay_reg[1][7]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixel_delay_reg[1][5] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\pixel_delay_reg[0][5]_srl28_n_0 ),
        .Q(\pixel_delay_reg[1][7]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixel_delay_reg[1][6] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\pixel_delay_reg[0][6]_srl28_n_0 ),
        .Q(\pixel_delay_reg[1][7]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixel_delay_reg[1][7] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\pixel_delay_reg[0][7]_srl28_n_0 ),
        .Q(\pixel_delay_reg[1][7]_0 [7]),
        .R(1'b0));
endmodule

module tree_nxn
   (out_pixel_OBUF,
    cnn_en_IBUF,
    \accumulation_stage_reg[8]_0 ,
    clk_IBUF_BUFG,
    \accumulation_stage_reg[1]_0 ,
    A,
    \accumulation_stage_reg[2]_0 ,
    \accumulation_stage_reg[3]_0 ,
    \accumulation_stage_reg[4]_0 ,
    \accumulation_stage_reg[4]_1 ,
    \accumulation_stage_reg[5]_0 ,
    \accumulation_stage_reg[6]_0 ,
    \accumulation_stage_reg[7]_0 ,
    \accumulation_stage_reg[7]_1 ,
    B,
    data_valid_OBUF);
  output [18:0]out_pixel_OBUF;
  input cnn_en_IBUF;
  input \accumulation_stage_reg[8]_0 ;
  input clk_IBUF_BUFG;
  input [7:0]\accumulation_stage_reg[1]_0 ;
  input [7:0]A;
  input [7:0]\accumulation_stage_reg[2]_0 ;
  input [7:0]\accumulation_stage_reg[3]_0 ;
  input [7:0]\accumulation_stage_reg[4]_0 ;
  input [7:0]\accumulation_stage_reg[4]_1 ;
  input [7:0]\accumulation_stage_reg[5]_0 ;
  input [7:0]\accumulation_stage_reg[6]_0 ;
  input [7:0]\accumulation_stage_reg[7]_0 ;
  input [7:0]\accumulation_stage_reg[7]_1 ;
  input [7:0]B;
  input data_valid_OBUF;

  wire [7:0]A;
  wire [7:0]B;
  wire [7:0]\accumulation_stage_reg[1]_0 ;
  wire [7:0]\accumulation_stage_reg[2]_0 ;
  wire [7:0]\accumulation_stage_reg[3]_0 ;
  wire [7:0]\accumulation_stage_reg[4]_0 ;
  wire [7:0]\accumulation_stage_reg[4]_1 ;
  wire [7:0]\accumulation_stage_reg[5]_0 ;
  wire [7:0]\accumulation_stage_reg[6]_0 ;
  wire [7:0]\accumulation_stage_reg[7]_0 ;
  wire [7:0]\accumulation_stage_reg[7]_1 ;
  wire \accumulation_stage_reg[8]_0 ;
  wire \accumulation_stage_reg_n_100_[9] ;
  wire \accumulation_stage_reg_n_101_[9] ;
  wire \accumulation_stage_reg_n_102_[9] ;
  wire \accumulation_stage_reg_n_103_[9] ;
  wire \accumulation_stage_reg_n_104_[9] ;
  wire \accumulation_stage_reg_n_105_[9] ;
  wire \accumulation_stage_reg_n_106_[1] ;
  wire \accumulation_stage_reg_n_106_[2] ;
  wire \accumulation_stage_reg_n_106_[3] ;
  wire \accumulation_stage_reg_n_106_[4] ;
  wire \accumulation_stage_reg_n_106_[5] ;
  wire \accumulation_stage_reg_n_106_[6] ;
  wire \accumulation_stage_reg_n_106_[7] ;
  wire \accumulation_stage_reg_n_106_[8] ;
  wire \accumulation_stage_reg_n_107_[1] ;
  wire \accumulation_stage_reg_n_107_[2] ;
  wire \accumulation_stage_reg_n_107_[3] ;
  wire \accumulation_stage_reg_n_107_[4] ;
  wire \accumulation_stage_reg_n_107_[5] ;
  wire \accumulation_stage_reg_n_107_[6] ;
  wire \accumulation_stage_reg_n_107_[7] ;
  wire \accumulation_stage_reg_n_107_[8] ;
  wire \accumulation_stage_reg_n_108_[1] ;
  wire \accumulation_stage_reg_n_108_[2] ;
  wire \accumulation_stage_reg_n_108_[3] ;
  wire \accumulation_stage_reg_n_108_[4] ;
  wire \accumulation_stage_reg_n_108_[5] ;
  wire \accumulation_stage_reg_n_108_[6] ;
  wire \accumulation_stage_reg_n_108_[7] ;
  wire \accumulation_stage_reg_n_108_[8] ;
  wire \accumulation_stage_reg_n_109_[1] ;
  wire \accumulation_stage_reg_n_109_[2] ;
  wire \accumulation_stage_reg_n_109_[3] ;
  wire \accumulation_stage_reg_n_109_[4] ;
  wire \accumulation_stage_reg_n_109_[5] ;
  wire \accumulation_stage_reg_n_109_[6] ;
  wire \accumulation_stage_reg_n_109_[7] ;
  wire \accumulation_stage_reg_n_109_[8] ;
  wire \accumulation_stage_reg_n_110_[1] ;
  wire \accumulation_stage_reg_n_110_[2] ;
  wire \accumulation_stage_reg_n_110_[3] ;
  wire \accumulation_stage_reg_n_110_[4] ;
  wire \accumulation_stage_reg_n_110_[5] ;
  wire \accumulation_stage_reg_n_110_[6] ;
  wire \accumulation_stage_reg_n_110_[7] ;
  wire \accumulation_stage_reg_n_110_[8] ;
  wire \accumulation_stage_reg_n_111_[1] ;
  wire \accumulation_stage_reg_n_111_[2] ;
  wire \accumulation_stage_reg_n_111_[3] ;
  wire \accumulation_stage_reg_n_111_[4] ;
  wire \accumulation_stage_reg_n_111_[5] ;
  wire \accumulation_stage_reg_n_111_[6] ;
  wire \accumulation_stage_reg_n_111_[7] ;
  wire \accumulation_stage_reg_n_111_[8] ;
  wire \accumulation_stage_reg_n_112_[1] ;
  wire \accumulation_stage_reg_n_112_[2] ;
  wire \accumulation_stage_reg_n_112_[3] ;
  wire \accumulation_stage_reg_n_112_[4] ;
  wire \accumulation_stage_reg_n_112_[5] ;
  wire \accumulation_stage_reg_n_112_[6] ;
  wire \accumulation_stage_reg_n_112_[7] ;
  wire \accumulation_stage_reg_n_112_[8] ;
  wire \accumulation_stage_reg_n_113_[1] ;
  wire \accumulation_stage_reg_n_113_[2] ;
  wire \accumulation_stage_reg_n_113_[3] ;
  wire \accumulation_stage_reg_n_113_[4] ;
  wire \accumulation_stage_reg_n_113_[5] ;
  wire \accumulation_stage_reg_n_113_[6] ;
  wire \accumulation_stage_reg_n_113_[7] ;
  wire \accumulation_stage_reg_n_113_[8] ;
  wire \accumulation_stage_reg_n_114_[1] ;
  wire \accumulation_stage_reg_n_114_[2] ;
  wire \accumulation_stage_reg_n_114_[3] ;
  wire \accumulation_stage_reg_n_114_[4] ;
  wire \accumulation_stage_reg_n_114_[5] ;
  wire \accumulation_stage_reg_n_114_[6] ;
  wire \accumulation_stage_reg_n_114_[7] ;
  wire \accumulation_stage_reg_n_114_[8] ;
  wire \accumulation_stage_reg_n_115_[1] ;
  wire \accumulation_stage_reg_n_115_[2] ;
  wire \accumulation_stage_reg_n_115_[3] ;
  wire \accumulation_stage_reg_n_115_[4] ;
  wire \accumulation_stage_reg_n_115_[5] ;
  wire \accumulation_stage_reg_n_115_[6] ;
  wire \accumulation_stage_reg_n_115_[7] ;
  wire \accumulation_stage_reg_n_115_[8] ;
  wire \accumulation_stage_reg_n_116_[1] ;
  wire \accumulation_stage_reg_n_116_[2] ;
  wire \accumulation_stage_reg_n_116_[3] ;
  wire \accumulation_stage_reg_n_116_[4] ;
  wire \accumulation_stage_reg_n_116_[5] ;
  wire \accumulation_stage_reg_n_116_[6] ;
  wire \accumulation_stage_reg_n_116_[7] ;
  wire \accumulation_stage_reg_n_116_[8] ;
  wire \accumulation_stage_reg_n_117_[1] ;
  wire \accumulation_stage_reg_n_117_[2] ;
  wire \accumulation_stage_reg_n_117_[3] ;
  wire \accumulation_stage_reg_n_117_[4] ;
  wire \accumulation_stage_reg_n_117_[5] ;
  wire \accumulation_stage_reg_n_117_[6] ;
  wire \accumulation_stage_reg_n_117_[7] ;
  wire \accumulation_stage_reg_n_117_[8] ;
  wire \accumulation_stage_reg_n_118_[1] ;
  wire \accumulation_stage_reg_n_118_[2] ;
  wire \accumulation_stage_reg_n_118_[3] ;
  wire \accumulation_stage_reg_n_118_[4] ;
  wire \accumulation_stage_reg_n_118_[5] ;
  wire \accumulation_stage_reg_n_118_[6] ;
  wire \accumulation_stage_reg_n_118_[7] ;
  wire \accumulation_stage_reg_n_118_[8] ;
  wire \accumulation_stage_reg_n_119_[1] ;
  wire \accumulation_stage_reg_n_119_[2] ;
  wire \accumulation_stage_reg_n_119_[3] ;
  wire \accumulation_stage_reg_n_119_[4] ;
  wire \accumulation_stage_reg_n_119_[5] ;
  wire \accumulation_stage_reg_n_119_[6] ;
  wire \accumulation_stage_reg_n_119_[7] ;
  wire \accumulation_stage_reg_n_119_[8] ;
  wire \accumulation_stage_reg_n_120_[1] ;
  wire \accumulation_stage_reg_n_120_[2] ;
  wire \accumulation_stage_reg_n_120_[3] ;
  wire \accumulation_stage_reg_n_120_[4] ;
  wire \accumulation_stage_reg_n_120_[5] ;
  wire \accumulation_stage_reg_n_120_[6] ;
  wire \accumulation_stage_reg_n_120_[7] ;
  wire \accumulation_stage_reg_n_120_[8] ;
  wire \accumulation_stage_reg_n_121_[1] ;
  wire \accumulation_stage_reg_n_121_[2] ;
  wire \accumulation_stage_reg_n_121_[3] ;
  wire \accumulation_stage_reg_n_121_[4] ;
  wire \accumulation_stage_reg_n_121_[5] ;
  wire \accumulation_stage_reg_n_121_[6] ;
  wire \accumulation_stage_reg_n_121_[7] ;
  wire \accumulation_stage_reg_n_121_[8] ;
  wire \accumulation_stage_reg_n_122_[1] ;
  wire \accumulation_stage_reg_n_122_[2] ;
  wire \accumulation_stage_reg_n_122_[3] ;
  wire \accumulation_stage_reg_n_122_[4] ;
  wire \accumulation_stage_reg_n_122_[5] ;
  wire \accumulation_stage_reg_n_122_[6] ;
  wire \accumulation_stage_reg_n_122_[7] ;
  wire \accumulation_stage_reg_n_122_[8] ;
  wire \accumulation_stage_reg_n_123_[1] ;
  wire \accumulation_stage_reg_n_123_[2] ;
  wire \accumulation_stage_reg_n_123_[3] ;
  wire \accumulation_stage_reg_n_123_[4] ;
  wire \accumulation_stage_reg_n_123_[5] ;
  wire \accumulation_stage_reg_n_123_[6] ;
  wire \accumulation_stage_reg_n_123_[7] ;
  wire \accumulation_stage_reg_n_123_[8] ;
  wire \accumulation_stage_reg_n_124_[1] ;
  wire \accumulation_stage_reg_n_124_[2] ;
  wire \accumulation_stage_reg_n_124_[3] ;
  wire \accumulation_stage_reg_n_124_[4] ;
  wire \accumulation_stage_reg_n_124_[5] ;
  wire \accumulation_stage_reg_n_124_[6] ;
  wire \accumulation_stage_reg_n_124_[7] ;
  wire \accumulation_stage_reg_n_124_[8] ;
  wire \accumulation_stage_reg_n_125_[1] ;
  wire \accumulation_stage_reg_n_125_[2] ;
  wire \accumulation_stage_reg_n_125_[3] ;
  wire \accumulation_stage_reg_n_125_[4] ;
  wire \accumulation_stage_reg_n_125_[5] ;
  wire \accumulation_stage_reg_n_125_[6] ;
  wire \accumulation_stage_reg_n_125_[7] ;
  wire \accumulation_stage_reg_n_125_[8] ;
  wire \accumulation_stage_reg_n_126_[1] ;
  wire \accumulation_stage_reg_n_126_[2] ;
  wire \accumulation_stage_reg_n_126_[3] ;
  wire \accumulation_stage_reg_n_126_[4] ;
  wire \accumulation_stage_reg_n_126_[5] ;
  wire \accumulation_stage_reg_n_126_[6] ;
  wire \accumulation_stage_reg_n_126_[7] ;
  wire \accumulation_stage_reg_n_126_[8] ;
  wire \accumulation_stage_reg_n_127_[1] ;
  wire \accumulation_stage_reg_n_127_[2] ;
  wire \accumulation_stage_reg_n_127_[3] ;
  wire \accumulation_stage_reg_n_127_[4] ;
  wire \accumulation_stage_reg_n_127_[5] ;
  wire \accumulation_stage_reg_n_127_[6] ;
  wire \accumulation_stage_reg_n_127_[7] ;
  wire \accumulation_stage_reg_n_127_[8] ;
  wire \accumulation_stage_reg_n_128_[1] ;
  wire \accumulation_stage_reg_n_128_[2] ;
  wire \accumulation_stage_reg_n_128_[3] ;
  wire \accumulation_stage_reg_n_128_[4] ;
  wire \accumulation_stage_reg_n_128_[5] ;
  wire \accumulation_stage_reg_n_128_[6] ;
  wire \accumulation_stage_reg_n_128_[7] ;
  wire \accumulation_stage_reg_n_128_[8] ;
  wire \accumulation_stage_reg_n_129_[1] ;
  wire \accumulation_stage_reg_n_129_[2] ;
  wire \accumulation_stage_reg_n_129_[3] ;
  wire \accumulation_stage_reg_n_129_[4] ;
  wire \accumulation_stage_reg_n_129_[5] ;
  wire \accumulation_stage_reg_n_129_[6] ;
  wire \accumulation_stage_reg_n_129_[7] ;
  wire \accumulation_stage_reg_n_129_[8] ;
  wire \accumulation_stage_reg_n_130_[1] ;
  wire \accumulation_stage_reg_n_130_[2] ;
  wire \accumulation_stage_reg_n_130_[3] ;
  wire \accumulation_stage_reg_n_130_[4] ;
  wire \accumulation_stage_reg_n_130_[5] ;
  wire \accumulation_stage_reg_n_130_[6] ;
  wire \accumulation_stage_reg_n_130_[7] ;
  wire \accumulation_stage_reg_n_130_[8] ;
  wire \accumulation_stage_reg_n_131_[1] ;
  wire \accumulation_stage_reg_n_131_[2] ;
  wire \accumulation_stage_reg_n_131_[3] ;
  wire \accumulation_stage_reg_n_131_[4] ;
  wire \accumulation_stage_reg_n_131_[5] ;
  wire \accumulation_stage_reg_n_131_[6] ;
  wire \accumulation_stage_reg_n_131_[7] ;
  wire \accumulation_stage_reg_n_131_[8] ;
  wire \accumulation_stage_reg_n_132_[1] ;
  wire \accumulation_stage_reg_n_132_[2] ;
  wire \accumulation_stage_reg_n_132_[3] ;
  wire \accumulation_stage_reg_n_132_[4] ;
  wire \accumulation_stage_reg_n_132_[5] ;
  wire \accumulation_stage_reg_n_132_[6] ;
  wire \accumulation_stage_reg_n_132_[7] ;
  wire \accumulation_stage_reg_n_132_[8] ;
  wire \accumulation_stage_reg_n_133_[1] ;
  wire \accumulation_stage_reg_n_133_[2] ;
  wire \accumulation_stage_reg_n_133_[3] ;
  wire \accumulation_stage_reg_n_133_[4] ;
  wire \accumulation_stage_reg_n_133_[5] ;
  wire \accumulation_stage_reg_n_133_[6] ;
  wire \accumulation_stage_reg_n_133_[7] ;
  wire \accumulation_stage_reg_n_133_[8] ;
  wire \accumulation_stage_reg_n_134_[1] ;
  wire \accumulation_stage_reg_n_134_[2] ;
  wire \accumulation_stage_reg_n_134_[3] ;
  wire \accumulation_stage_reg_n_134_[4] ;
  wire \accumulation_stage_reg_n_134_[5] ;
  wire \accumulation_stage_reg_n_134_[6] ;
  wire \accumulation_stage_reg_n_134_[7] ;
  wire \accumulation_stage_reg_n_134_[8] ;
  wire \accumulation_stage_reg_n_135_[1] ;
  wire \accumulation_stage_reg_n_135_[2] ;
  wire \accumulation_stage_reg_n_135_[3] ;
  wire \accumulation_stage_reg_n_135_[4] ;
  wire \accumulation_stage_reg_n_135_[5] ;
  wire \accumulation_stage_reg_n_135_[6] ;
  wire \accumulation_stage_reg_n_135_[7] ;
  wire \accumulation_stage_reg_n_135_[8] ;
  wire \accumulation_stage_reg_n_136_[1] ;
  wire \accumulation_stage_reg_n_136_[2] ;
  wire \accumulation_stage_reg_n_136_[3] ;
  wire \accumulation_stage_reg_n_136_[4] ;
  wire \accumulation_stage_reg_n_136_[5] ;
  wire \accumulation_stage_reg_n_136_[6] ;
  wire \accumulation_stage_reg_n_136_[7] ;
  wire \accumulation_stage_reg_n_136_[8] ;
  wire \accumulation_stage_reg_n_137_[1] ;
  wire \accumulation_stage_reg_n_137_[2] ;
  wire \accumulation_stage_reg_n_137_[3] ;
  wire \accumulation_stage_reg_n_137_[4] ;
  wire \accumulation_stage_reg_n_137_[5] ;
  wire \accumulation_stage_reg_n_137_[6] ;
  wire \accumulation_stage_reg_n_137_[7] ;
  wire \accumulation_stage_reg_n_137_[8] ;
  wire \accumulation_stage_reg_n_138_[1] ;
  wire \accumulation_stage_reg_n_138_[2] ;
  wire \accumulation_stage_reg_n_138_[3] ;
  wire \accumulation_stage_reg_n_138_[4] ;
  wire \accumulation_stage_reg_n_138_[5] ;
  wire \accumulation_stage_reg_n_138_[6] ;
  wire \accumulation_stage_reg_n_138_[7] ;
  wire \accumulation_stage_reg_n_138_[8] ;
  wire \accumulation_stage_reg_n_139_[1] ;
  wire \accumulation_stage_reg_n_139_[2] ;
  wire \accumulation_stage_reg_n_139_[3] ;
  wire \accumulation_stage_reg_n_139_[4] ;
  wire \accumulation_stage_reg_n_139_[5] ;
  wire \accumulation_stage_reg_n_139_[6] ;
  wire \accumulation_stage_reg_n_139_[7] ;
  wire \accumulation_stage_reg_n_139_[8] ;
  wire \accumulation_stage_reg_n_140_[1] ;
  wire \accumulation_stage_reg_n_140_[2] ;
  wire \accumulation_stage_reg_n_140_[3] ;
  wire \accumulation_stage_reg_n_140_[4] ;
  wire \accumulation_stage_reg_n_140_[5] ;
  wire \accumulation_stage_reg_n_140_[6] ;
  wire \accumulation_stage_reg_n_140_[7] ;
  wire \accumulation_stage_reg_n_140_[8] ;
  wire \accumulation_stage_reg_n_141_[1] ;
  wire \accumulation_stage_reg_n_141_[2] ;
  wire \accumulation_stage_reg_n_141_[3] ;
  wire \accumulation_stage_reg_n_141_[4] ;
  wire \accumulation_stage_reg_n_141_[5] ;
  wire \accumulation_stage_reg_n_141_[6] ;
  wire \accumulation_stage_reg_n_141_[7] ;
  wire \accumulation_stage_reg_n_141_[8] ;
  wire \accumulation_stage_reg_n_142_[1] ;
  wire \accumulation_stage_reg_n_142_[2] ;
  wire \accumulation_stage_reg_n_142_[3] ;
  wire \accumulation_stage_reg_n_142_[4] ;
  wire \accumulation_stage_reg_n_142_[5] ;
  wire \accumulation_stage_reg_n_142_[6] ;
  wire \accumulation_stage_reg_n_142_[7] ;
  wire \accumulation_stage_reg_n_142_[8] ;
  wire \accumulation_stage_reg_n_143_[1] ;
  wire \accumulation_stage_reg_n_143_[2] ;
  wire \accumulation_stage_reg_n_143_[3] ;
  wire \accumulation_stage_reg_n_143_[4] ;
  wire \accumulation_stage_reg_n_143_[5] ;
  wire \accumulation_stage_reg_n_143_[6] ;
  wire \accumulation_stage_reg_n_143_[7] ;
  wire \accumulation_stage_reg_n_143_[8] ;
  wire \accumulation_stage_reg_n_144_[1] ;
  wire \accumulation_stage_reg_n_144_[2] ;
  wire \accumulation_stage_reg_n_144_[3] ;
  wire \accumulation_stage_reg_n_144_[4] ;
  wire \accumulation_stage_reg_n_144_[5] ;
  wire \accumulation_stage_reg_n_144_[6] ;
  wire \accumulation_stage_reg_n_144_[7] ;
  wire \accumulation_stage_reg_n_144_[8] ;
  wire \accumulation_stage_reg_n_145_[1] ;
  wire \accumulation_stage_reg_n_145_[2] ;
  wire \accumulation_stage_reg_n_145_[3] ;
  wire \accumulation_stage_reg_n_145_[4] ;
  wire \accumulation_stage_reg_n_145_[5] ;
  wire \accumulation_stage_reg_n_145_[6] ;
  wire \accumulation_stage_reg_n_145_[7] ;
  wire \accumulation_stage_reg_n_145_[8] ;
  wire \accumulation_stage_reg_n_146_[1] ;
  wire \accumulation_stage_reg_n_146_[2] ;
  wire \accumulation_stage_reg_n_146_[3] ;
  wire \accumulation_stage_reg_n_146_[4] ;
  wire \accumulation_stage_reg_n_146_[5] ;
  wire \accumulation_stage_reg_n_146_[6] ;
  wire \accumulation_stage_reg_n_146_[7] ;
  wire \accumulation_stage_reg_n_146_[8] ;
  wire \accumulation_stage_reg_n_147_[1] ;
  wire \accumulation_stage_reg_n_147_[2] ;
  wire \accumulation_stage_reg_n_147_[3] ;
  wire \accumulation_stage_reg_n_147_[4] ;
  wire \accumulation_stage_reg_n_147_[5] ;
  wire \accumulation_stage_reg_n_147_[6] ;
  wire \accumulation_stage_reg_n_147_[7] ;
  wire \accumulation_stage_reg_n_147_[8] ;
  wire \accumulation_stage_reg_n_148_[1] ;
  wire \accumulation_stage_reg_n_148_[2] ;
  wire \accumulation_stage_reg_n_148_[3] ;
  wire \accumulation_stage_reg_n_148_[4] ;
  wire \accumulation_stage_reg_n_148_[5] ;
  wire \accumulation_stage_reg_n_148_[6] ;
  wire \accumulation_stage_reg_n_148_[7] ;
  wire \accumulation_stage_reg_n_148_[8] ;
  wire \accumulation_stage_reg_n_149_[1] ;
  wire \accumulation_stage_reg_n_149_[2] ;
  wire \accumulation_stage_reg_n_149_[3] ;
  wire \accumulation_stage_reg_n_149_[4] ;
  wire \accumulation_stage_reg_n_149_[5] ;
  wire \accumulation_stage_reg_n_149_[6] ;
  wire \accumulation_stage_reg_n_149_[7] ;
  wire \accumulation_stage_reg_n_149_[8] ;
  wire \accumulation_stage_reg_n_150_[1] ;
  wire \accumulation_stage_reg_n_150_[2] ;
  wire \accumulation_stage_reg_n_150_[3] ;
  wire \accumulation_stage_reg_n_150_[4] ;
  wire \accumulation_stage_reg_n_150_[5] ;
  wire \accumulation_stage_reg_n_150_[6] ;
  wire \accumulation_stage_reg_n_150_[7] ;
  wire \accumulation_stage_reg_n_150_[8] ;
  wire \accumulation_stage_reg_n_151_[1] ;
  wire \accumulation_stage_reg_n_151_[2] ;
  wire \accumulation_stage_reg_n_151_[3] ;
  wire \accumulation_stage_reg_n_151_[4] ;
  wire \accumulation_stage_reg_n_151_[5] ;
  wire \accumulation_stage_reg_n_151_[6] ;
  wire \accumulation_stage_reg_n_151_[7] ;
  wire \accumulation_stage_reg_n_151_[8] ;
  wire \accumulation_stage_reg_n_152_[1] ;
  wire \accumulation_stage_reg_n_152_[2] ;
  wire \accumulation_stage_reg_n_152_[3] ;
  wire \accumulation_stage_reg_n_152_[4] ;
  wire \accumulation_stage_reg_n_152_[5] ;
  wire \accumulation_stage_reg_n_152_[6] ;
  wire \accumulation_stage_reg_n_152_[7] ;
  wire \accumulation_stage_reg_n_152_[8] ;
  wire \accumulation_stage_reg_n_153_[1] ;
  wire \accumulation_stage_reg_n_153_[2] ;
  wire \accumulation_stage_reg_n_153_[3] ;
  wire \accumulation_stage_reg_n_153_[4] ;
  wire \accumulation_stage_reg_n_153_[5] ;
  wire \accumulation_stage_reg_n_153_[6] ;
  wire \accumulation_stage_reg_n_153_[7] ;
  wire \accumulation_stage_reg_n_153_[8] ;
  wire \accumulation_stage_reg_n_86_[9] ;
  wire \accumulation_stage_reg_n_87_[9] ;
  wire \accumulation_stage_reg_n_88_[9] ;
  wire \accumulation_stage_reg_n_89_[9] ;
  wire \accumulation_stage_reg_n_90_[9] ;
  wire \accumulation_stage_reg_n_91_[9] ;
  wire \accumulation_stage_reg_n_92_[9] ;
  wire \accumulation_stage_reg_n_93_[9] ;
  wire \accumulation_stage_reg_n_94_[9] ;
  wire \accumulation_stage_reg_n_95_[9] ;
  wire \accumulation_stage_reg_n_96_[9] ;
  wire \accumulation_stage_reg_n_97_[9] ;
  wire \accumulation_stage_reg_n_98_[9] ;
  wire \accumulation_stage_reg_n_99_[9] ;
  wire clk_IBUF_BUFG;
  wire cnn_en_IBUF;
  wire data_valid_OBUF;
  wire [18:0]out_pixel_OBUF;
  wire \NLW_accumulation_stage_reg[1]_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[1]_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[1]_OVERFLOW_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[1]_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[1]_PATTERNDETECT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[1]_UNDERFLOW_UNCONNECTED ;
  wire [29:0]\NLW_accumulation_stage_reg[1]_ACOUT_UNCONNECTED ;
  wire [17:0]\NLW_accumulation_stage_reg[1]_BCOUT_UNCONNECTED ;
  wire [3:0]\NLW_accumulation_stage_reg[1]_CARRYOUT_UNCONNECTED ;
  wire [47:0]\NLW_accumulation_stage_reg[1]_P_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[2]_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[2]_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[2]_OVERFLOW_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[2]_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[2]_PATTERNDETECT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[2]_UNDERFLOW_UNCONNECTED ;
  wire [29:0]\NLW_accumulation_stage_reg[2]_ACOUT_UNCONNECTED ;
  wire [17:0]\NLW_accumulation_stage_reg[2]_BCOUT_UNCONNECTED ;
  wire [3:0]\NLW_accumulation_stage_reg[2]_CARRYOUT_UNCONNECTED ;
  wire [47:0]\NLW_accumulation_stage_reg[2]_P_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[3]_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[3]_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[3]_OVERFLOW_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[3]_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[3]_PATTERNDETECT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[3]_UNDERFLOW_UNCONNECTED ;
  wire [29:0]\NLW_accumulation_stage_reg[3]_ACOUT_UNCONNECTED ;
  wire [17:0]\NLW_accumulation_stage_reg[3]_BCOUT_UNCONNECTED ;
  wire [3:0]\NLW_accumulation_stage_reg[3]_CARRYOUT_UNCONNECTED ;
  wire [47:0]\NLW_accumulation_stage_reg[3]_P_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[4]_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[4]_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[4]_OVERFLOW_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[4]_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[4]_PATTERNDETECT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[4]_UNDERFLOW_UNCONNECTED ;
  wire [29:0]\NLW_accumulation_stage_reg[4]_ACOUT_UNCONNECTED ;
  wire [17:0]\NLW_accumulation_stage_reg[4]_BCOUT_UNCONNECTED ;
  wire [3:0]\NLW_accumulation_stage_reg[4]_CARRYOUT_UNCONNECTED ;
  wire [47:0]\NLW_accumulation_stage_reg[4]_P_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[5]_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[5]_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[5]_OVERFLOW_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[5]_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[5]_PATTERNDETECT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[5]_UNDERFLOW_UNCONNECTED ;
  wire [29:0]\NLW_accumulation_stage_reg[5]_ACOUT_UNCONNECTED ;
  wire [17:0]\NLW_accumulation_stage_reg[5]_BCOUT_UNCONNECTED ;
  wire [3:0]\NLW_accumulation_stage_reg[5]_CARRYOUT_UNCONNECTED ;
  wire [47:0]\NLW_accumulation_stage_reg[5]_P_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[6]_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[6]_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[6]_OVERFLOW_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[6]_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[6]_PATTERNDETECT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[6]_UNDERFLOW_UNCONNECTED ;
  wire [29:0]\NLW_accumulation_stage_reg[6]_ACOUT_UNCONNECTED ;
  wire [17:0]\NLW_accumulation_stage_reg[6]_BCOUT_UNCONNECTED ;
  wire [3:0]\NLW_accumulation_stage_reg[6]_CARRYOUT_UNCONNECTED ;
  wire [47:0]\NLW_accumulation_stage_reg[6]_P_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[7]_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[7]_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[7]_OVERFLOW_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[7]_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[7]_PATTERNDETECT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[7]_UNDERFLOW_UNCONNECTED ;
  wire [29:0]\NLW_accumulation_stage_reg[7]_ACOUT_UNCONNECTED ;
  wire [17:0]\NLW_accumulation_stage_reg[7]_BCOUT_UNCONNECTED ;
  wire [3:0]\NLW_accumulation_stage_reg[7]_CARRYOUT_UNCONNECTED ;
  wire [47:0]\NLW_accumulation_stage_reg[7]_P_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[8]_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[8]_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[8]_OVERFLOW_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[8]_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[8]_PATTERNDETECT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[8]_UNDERFLOW_UNCONNECTED ;
  wire [29:0]\NLW_accumulation_stage_reg[8]_ACOUT_UNCONNECTED ;
  wire [17:0]\NLW_accumulation_stage_reg[8]_BCOUT_UNCONNECTED ;
  wire [3:0]\NLW_accumulation_stage_reg[8]_CARRYOUT_UNCONNECTED ;
  wire [47:0]\NLW_accumulation_stage_reg[8]_P_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[9]_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[9]_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[9]_OVERFLOW_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[9]_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[9]_PATTERNDETECT_UNCONNECTED ;
  wire \NLW_accumulation_stage_reg[9]_UNDERFLOW_UNCONNECTED ;
  wire [29:0]\NLW_accumulation_stage_reg[9]_ACOUT_UNCONNECTED ;
  wire [17:0]\NLW_accumulation_stage_reg[9]_BCOUT_UNCONNECTED ;
  wire [3:0]\NLW_accumulation_stage_reg[9]_CARRYOUT_UNCONNECTED ;
  wire [47:20]\NLW_accumulation_stage_reg[9]_P_UNCONNECTED ;
  wire [47:0]\NLW_accumulation_stage_reg[9]_PCOUT_UNCONNECTED ;

  DSP48E1 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    \accumulation_stage_reg[1] 
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,A}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(\NLW_accumulation_stage_reg[1]_ACOUT_UNCONNECTED [29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({\accumulation_stage_reg[1]_0 [7],\accumulation_stage_reg[1]_0 [7],\accumulation_stage_reg[1]_0 [7],\accumulation_stage_reg[1]_0 [7],\accumulation_stage_reg[1]_0 [7],\accumulation_stage_reg[1]_0 [7],\accumulation_stage_reg[1]_0 [7],\accumulation_stage_reg[1]_0 [7],\accumulation_stage_reg[1]_0 [7],\accumulation_stage_reg[1]_0 [7],\accumulation_stage_reg[1]_0 }),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(\NLW_accumulation_stage_reg[1]_BCOUT_UNCONNECTED [17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(\NLW_accumulation_stage_reg[1]_CARRYCASCOUT_UNCONNECTED ),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(\NLW_accumulation_stage_reg[1]_CARRYOUT_UNCONNECTED [3:0]),
        .CEA1(cnn_en_IBUF),
        .CEA2(cnn_en_IBUF),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(\accumulation_stage_reg[8]_0 ),
        .CEB2(\accumulation_stage_reg[8]_0 ),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(cnn_en_IBUF),
        .CEP(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(\NLW_accumulation_stage_reg[1]_MULTSIGNOUT_UNCONNECTED ),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(\NLW_accumulation_stage_reg[1]_OVERFLOW_UNCONNECTED ),
        .P(\NLW_accumulation_stage_reg[1]_P_UNCONNECTED [47:0]),
        .PATTERNBDETECT(\NLW_accumulation_stage_reg[1]_PATTERNBDETECT_UNCONNECTED ),
        .PATTERNDETECT(\NLW_accumulation_stage_reg[1]_PATTERNDETECT_UNCONNECTED ),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({\accumulation_stage_reg_n_106_[1] ,\accumulation_stage_reg_n_107_[1] ,\accumulation_stage_reg_n_108_[1] ,\accumulation_stage_reg_n_109_[1] ,\accumulation_stage_reg_n_110_[1] ,\accumulation_stage_reg_n_111_[1] ,\accumulation_stage_reg_n_112_[1] ,\accumulation_stage_reg_n_113_[1] ,\accumulation_stage_reg_n_114_[1] ,\accumulation_stage_reg_n_115_[1] ,\accumulation_stage_reg_n_116_[1] ,\accumulation_stage_reg_n_117_[1] ,\accumulation_stage_reg_n_118_[1] ,\accumulation_stage_reg_n_119_[1] ,\accumulation_stage_reg_n_120_[1] ,\accumulation_stage_reg_n_121_[1] ,\accumulation_stage_reg_n_122_[1] ,\accumulation_stage_reg_n_123_[1] ,\accumulation_stage_reg_n_124_[1] ,\accumulation_stage_reg_n_125_[1] ,\accumulation_stage_reg_n_126_[1] ,\accumulation_stage_reg_n_127_[1] ,\accumulation_stage_reg_n_128_[1] ,\accumulation_stage_reg_n_129_[1] ,\accumulation_stage_reg_n_130_[1] ,\accumulation_stage_reg_n_131_[1] ,\accumulation_stage_reg_n_132_[1] ,\accumulation_stage_reg_n_133_[1] ,\accumulation_stage_reg_n_134_[1] ,\accumulation_stage_reg_n_135_[1] ,\accumulation_stage_reg_n_136_[1] ,\accumulation_stage_reg_n_137_[1] ,\accumulation_stage_reg_n_138_[1] ,\accumulation_stage_reg_n_139_[1] ,\accumulation_stage_reg_n_140_[1] ,\accumulation_stage_reg_n_141_[1] ,\accumulation_stage_reg_n_142_[1] ,\accumulation_stage_reg_n_143_[1] ,\accumulation_stage_reg_n_144_[1] ,\accumulation_stage_reg_n_145_[1] ,\accumulation_stage_reg_n_146_[1] ,\accumulation_stage_reg_n_147_[1] ,\accumulation_stage_reg_n_148_[1] ,\accumulation_stage_reg_n_149_[1] ,\accumulation_stage_reg_n_150_[1] ,\accumulation_stage_reg_n_151_[1] ,\accumulation_stage_reg_n_152_[1] ,\accumulation_stage_reg_n_153_[1] }),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(\NLW_accumulation_stage_reg[1]_UNDERFLOW_UNCONNECTED ));
  DSP48E1 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    \accumulation_stage_reg[2] 
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,A}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(\NLW_accumulation_stage_reg[2]_ACOUT_UNCONNECTED [29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({\accumulation_stage_reg[2]_0 [7],\accumulation_stage_reg[2]_0 [7],\accumulation_stage_reg[2]_0 [7],\accumulation_stage_reg[2]_0 [7],\accumulation_stage_reg[2]_0 [7],\accumulation_stage_reg[2]_0 [7],\accumulation_stage_reg[2]_0 [7],\accumulation_stage_reg[2]_0 [7],\accumulation_stage_reg[2]_0 [7],\accumulation_stage_reg[2]_0 [7],\accumulation_stage_reg[2]_0 }),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(\NLW_accumulation_stage_reg[2]_BCOUT_UNCONNECTED [17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(\NLW_accumulation_stage_reg[2]_CARRYCASCOUT_UNCONNECTED ),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(\NLW_accumulation_stage_reg[2]_CARRYOUT_UNCONNECTED [3:0]),
        .CEA1(cnn_en_IBUF),
        .CEA2(cnn_en_IBUF),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(\accumulation_stage_reg[8]_0 ),
        .CEB2(\accumulation_stage_reg[8]_0 ),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(cnn_en_IBUF),
        .CEP(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(\NLW_accumulation_stage_reg[2]_MULTSIGNOUT_UNCONNECTED ),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(\NLW_accumulation_stage_reg[2]_OVERFLOW_UNCONNECTED ),
        .P(\NLW_accumulation_stage_reg[2]_P_UNCONNECTED [47:0]),
        .PATTERNBDETECT(\NLW_accumulation_stage_reg[2]_PATTERNBDETECT_UNCONNECTED ),
        .PATTERNDETECT(\NLW_accumulation_stage_reg[2]_PATTERNDETECT_UNCONNECTED ),
        .PCIN({\accumulation_stage_reg_n_106_[1] ,\accumulation_stage_reg_n_107_[1] ,\accumulation_stage_reg_n_108_[1] ,\accumulation_stage_reg_n_109_[1] ,\accumulation_stage_reg_n_110_[1] ,\accumulation_stage_reg_n_111_[1] ,\accumulation_stage_reg_n_112_[1] ,\accumulation_stage_reg_n_113_[1] ,\accumulation_stage_reg_n_114_[1] ,\accumulation_stage_reg_n_115_[1] ,\accumulation_stage_reg_n_116_[1] ,\accumulation_stage_reg_n_117_[1] ,\accumulation_stage_reg_n_118_[1] ,\accumulation_stage_reg_n_119_[1] ,\accumulation_stage_reg_n_120_[1] ,\accumulation_stage_reg_n_121_[1] ,\accumulation_stage_reg_n_122_[1] ,\accumulation_stage_reg_n_123_[1] ,\accumulation_stage_reg_n_124_[1] ,\accumulation_stage_reg_n_125_[1] ,\accumulation_stage_reg_n_126_[1] ,\accumulation_stage_reg_n_127_[1] ,\accumulation_stage_reg_n_128_[1] ,\accumulation_stage_reg_n_129_[1] ,\accumulation_stage_reg_n_130_[1] ,\accumulation_stage_reg_n_131_[1] ,\accumulation_stage_reg_n_132_[1] ,\accumulation_stage_reg_n_133_[1] ,\accumulation_stage_reg_n_134_[1] ,\accumulation_stage_reg_n_135_[1] ,\accumulation_stage_reg_n_136_[1] ,\accumulation_stage_reg_n_137_[1] ,\accumulation_stage_reg_n_138_[1] ,\accumulation_stage_reg_n_139_[1] ,\accumulation_stage_reg_n_140_[1] ,\accumulation_stage_reg_n_141_[1] ,\accumulation_stage_reg_n_142_[1] ,\accumulation_stage_reg_n_143_[1] ,\accumulation_stage_reg_n_144_[1] ,\accumulation_stage_reg_n_145_[1] ,\accumulation_stage_reg_n_146_[1] ,\accumulation_stage_reg_n_147_[1] ,\accumulation_stage_reg_n_148_[1] ,\accumulation_stage_reg_n_149_[1] ,\accumulation_stage_reg_n_150_[1] ,\accumulation_stage_reg_n_151_[1] ,\accumulation_stage_reg_n_152_[1] ,\accumulation_stage_reg_n_153_[1] }),
        .PCOUT({\accumulation_stage_reg_n_106_[2] ,\accumulation_stage_reg_n_107_[2] ,\accumulation_stage_reg_n_108_[2] ,\accumulation_stage_reg_n_109_[2] ,\accumulation_stage_reg_n_110_[2] ,\accumulation_stage_reg_n_111_[2] ,\accumulation_stage_reg_n_112_[2] ,\accumulation_stage_reg_n_113_[2] ,\accumulation_stage_reg_n_114_[2] ,\accumulation_stage_reg_n_115_[2] ,\accumulation_stage_reg_n_116_[2] ,\accumulation_stage_reg_n_117_[2] ,\accumulation_stage_reg_n_118_[2] ,\accumulation_stage_reg_n_119_[2] ,\accumulation_stage_reg_n_120_[2] ,\accumulation_stage_reg_n_121_[2] ,\accumulation_stage_reg_n_122_[2] ,\accumulation_stage_reg_n_123_[2] ,\accumulation_stage_reg_n_124_[2] ,\accumulation_stage_reg_n_125_[2] ,\accumulation_stage_reg_n_126_[2] ,\accumulation_stage_reg_n_127_[2] ,\accumulation_stage_reg_n_128_[2] ,\accumulation_stage_reg_n_129_[2] ,\accumulation_stage_reg_n_130_[2] ,\accumulation_stage_reg_n_131_[2] ,\accumulation_stage_reg_n_132_[2] ,\accumulation_stage_reg_n_133_[2] ,\accumulation_stage_reg_n_134_[2] ,\accumulation_stage_reg_n_135_[2] ,\accumulation_stage_reg_n_136_[2] ,\accumulation_stage_reg_n_137_[2] ,\accumulation_stage_reg_n_138_[2] ,\accumulation_stage_reg_n_139_[2] ,\accumulation_stage_reg_n_140_[2] ,\accumulation_stage_reg_n_141_[2] ,\accumulation_stage_reg_n_142_[2] ,\accumulation_stage_reg_n_143_[2] ,\accumulation_stage_reg_n_144_[2] ,\accumulation_stage_reg_n_145_[2] ,\accumulation_stage_reg_n_146_[2] ,\accumulation_stage_reg_n_147_[2] ,\accumulation_stage_reg_n_148_[2] ,\accumulation_stage_reg_n_149_[2] ,\accumulation_stage_reg_n_150_[2] ,\accumulation_stage_reg_n_151_[2] ,\accumulation_stage_reg_n_152_[2] ,\accumulation_stage_reg_n_153_[2] }),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(\NLW_accumulation_stage_reg[2]_UNDERFLOW_UNCONNECTED ));
  DSP48E1 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    \accumulation_stage_reg[3] 
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,A}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(\NLW_accumulation_stage_reg[3]_ACOUT_UNCONNECTED [29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({\accumulation_stage_reg[3]_0 [7],\accumulation_stage_reg[3]_0 [7],\accumulation_stage_reg[3]_0 [7],\accumulation_stage_reg[3]_0 [7],\accumulation_stage_reg[3]_0 [7],\accumulation_stage_reg[3]_0 [7],\accumulation_stage_reg[3]_0 [7],\accumulation_stage_reg[3]_0 [7],\accumulation_stage_reg[3]_0 [7],\accumulation_stage_reg[3]_0 [7],\accumulation_stage_reg[3]_0 }),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(\NLW_accumulation_stage_reg[3]_BCOUT_UNCONNECTED [17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(\NLW_accumulation_stage_reg[3]_CARRYCASCOUT_UNCONNECTED ),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(\NLW_accumulation_stage_reg[3]_CARRYOUT_UNCONNECTED [3:0]),
        .CEA1(cnn_en_IBUF),
        .CEA2(cnn_en_IBUF),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(\accumulation_stage_reg[8]_0 ),
        .CEB2(\accumulation_stage_reg[8]_0 ),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(cnn_en_IBUF),
        .CEP(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(\NLW_accumulation_stage_reg[3]_MULTSIGNOUT_UNCONNECTED ),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(\NLW_accumulation_stage_reg[3]_OVERFLOW_UNCONNECTED ),
        .P(\NLW_accumulation_stage_reg[3]_P_UNCONNECTED [47:0]),
        .PATTERNBDETECT(\NLW_accumulation_stage_reg[3]_PATTERNBDETECT_UNCONNECTED ),
        .PATTERNDETECT(\NLW_accumulation_stage_reg[3]_PATTERNDETECT_UNCONNECTED ),
        .PCIN({\accumulation_stage_reg_n_106_[2] ,\accumulation_stage_reg_n_107_[2] ,\accumulation_stage_reg_n_108_[2] ,\accumulation_stage_reg_n_109_[2] ,\accumulation_stage_reg_n_110_[2] ,\accumulation_stage_reg_n_111_[2] ,\accumulation_stage_reg_n_112_[2] ,\accumulation_stage_reg_n_113_[2] ,\accumulation_stage_reg_n_114_[2] ,\accumulation_stage_reg_n_115_[2] ,\accumulation_stage_reg_n_116_[2] ,\accumulation_stage_reg_n_117_[2] ,\accumulation_stage_reg_n_118_[2] ,\accumulation_stage_reg_n_119_[2] ,\accumulation_stage_reg_n_120_[2] ,\accumulation_stage_reg_n_121_[2] ,\accumulation_stage_reg_n_122_[2] ,\accumulation_stage_reg_n_123_[2] ,\accumulation_stage_reg_n_124_[2] ,\accumulation_stage_reg_n_125_[2] ,\accumulation_stage_reg_n_126_[2] ,\accumulation_stage_reg_n_127_[2] ,\accumulation_stage_reg_n_128_[2] ,\accumulation_stage_reg_n_129_[2] ,\accumulation_stage_reg_n_130_[2] ,\accumulation_stage_reg_n_131_[2] ,\accumulation_stage_reg_n_132_[2] ,\accumulation_stage_reg_n_133_[2] ,\accumulation_stage_reg_n_134_[2] ,\accumulation_stage_reg_n_135_[2] ,\accumulation_stage_reg_n_136_[2] ,\accumulation_stage_reg_n_137_[2] ,\accumulation_stage_reg_n_138_[2] ,\accumulation_stage_reg_n_139_[2] ,\accumulation_stage_reg_n_140_[2] ,\accumulation_stage_reg_n_141_[2] ,\accumulation_stage_reg_n_142_[2] ,\accumulation_stage_reg_n_143_[2] ,\accumulation_stage_reg_n_144_[2] ,\accumulation_stage_reg_n_145_[2] ,\accumulation_stage_reg_n_146_[2] ,\accumulation_stage_reg_n_147_[2] ,\accumulation_stage_reg_n_148_[2] ,\accumulation_stage_reg_n_149_[2] ,\accumulation_stage_reg_n_150_[2] ,\accumulation_stage_reg_n_151_[2] ,\accumulation_stage_reg_n_152_[2] ,\accumulation_stage_reg_n_153_[2] }),
        .PCOUT({\accumulation_stage_reg_n_106_[3] ,\accumulation_stage_reg_n_107_[3] ,\accumulation_stage_reg_n_108_[3] ,\accumulation_stage_reg_n_109_[3] ,\accumulation_stage_reg_n_110_[3] ,\accumulation_stage_reg_n_111_[3] ,\accumulation_stage_reg_n_112_[3] ,\accumulation_stage_reg_n_113_[3] ,\accumulation_stage_reg_n_114_[3] ,\accumulation_stage_reg_n_115_[3] ,\accumulation_stage_reg_n_116_[3] ,\accumulation_stage_reg_n_117_[3] ,\accumulation_stage_reg_n_118_[3] ,\accumulation_stage_reg_n_119_[3] ,\accumulation_stage_reg_n_120_[3] ,\accumulation_stage_reg_n_121_[3] ,\accumulation_stage_reg_n_122_[3] ,\accumulation_stage_reg_n_123_[3] ,\accumulation_stage_reg_n_124_[3] ,\accumulation_stage_reg_n_125_[3] ,\accumulation_stage_reg_n_126_[3] ,\accumulation_stage_reg_n_127_[3] ,\accumulation_stage_reg_n_128_[3] ,\accumulation_stage_reg_n_129_[3] ,\accumulation_stage_reg_n_130_[3] ,\accumulation_stage_reg_n_131_[3] ,\accumulation_stage_reg_n_132_[3] ,\accumulation_stage_reg_n_133_[3] ,\accumulation_stage_reg_n_134_[3] ,\accumulation_stage_reg_n_135_[3] ,\accumulation_stage_reg_n_136_[3] ,\accumulation_stage_reg_n_137_[3] ,\accumulation_stage_reg_n_138_[3] ,\accumulation_stage_reg_n_139_[3] ,\accumulation_stage_reg_n_140_[3] ,\accumulation_stage_reg_n_141_[3] ,\accumulation_stage_reg_n_142_[3] ,\accumulation_stage_reg_n_143_[3] ,\accumulation_stage_reg_n_144_[3] ,\accumulation_stage_reg_n_145_[3] ,\accumulation_stage_reg_n_146_[3] ,\accumulation_stage_reg_n_147_[3] ,\accumulation_stage_reg_n_148_[3] ,\accumulation_stage_reg_n_149_[3] ,\accumulation_stage_reg_n_150_[3] ,\accumulation_stage_reg_n_151_[3] ,\accumulation_stage_reg_n_152_[3] ,\accumulation_stage_reg_n_153_[3] }),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(\NLW_accumulation_stage_reg[3]_UNDERFLOW_UNCONNECTED ));
  DSP48E1 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    \accumulation_stage_reg[4] 
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\accumulation_stage_reg[4]_1 }),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(\NLW_accumulation_stage_reg[4]_ACOUT_UNCONNECTED [29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({\accumulation_stage_reg[4]_0 [7],\accumulation_stage_reg[4]_0 [7],\accumulation_stage_reg[4]_0 [7],\accumulation_stage_reg[4]_0 [7],\accumulation_stage_reg[4]_0 [7],\accumulation_stage_reg[4]_0 [7],\accumulation_stage_reg[4]_0 [7],\accumulation_stage_reg[4]_0 [7],\accumulation_stage_reg[4]_0 [7],\accumulation_stage_reg[4]_0 [7],\accumulation_stage_reg[4]_0 }),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(\NLW_accumulation_stage_reg[4]_BCOUT_UNCONNECTED [17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(\NLW_accumulation_stage_reg[4]_CARRYCASCOUT_UNCONNECTED ),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(\NLW_accumulation_stage_reg[4]_CARRYOUT_UNCONNECTED [3:0]),
        .CEA1(cnn_en_IBUF),
        .CEA2(cnn_en_IBUF),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(\accumulation_stage_reg[8]_0 ),
        .CEB2(\accumulation_stage_reg[8]_0 ),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(cnn_en_IBUF),
        .CEP(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(\NLW_accumulation_stage_reg[4]_MULTSIGNOUT_UNCONNECTED ),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(\NLW_accumulation_stage_reg[4]_OVERFLOW_UNCONNECTED ),
        .P(\NLW_accumulation_stage_reg[4]_P_UNCONNECTED [47:0]),
        .PATTERNBDETECT(\NLW_accumulation_stage_reg[4]_PATTERNBDETECT_UNCONNECTED ),
        .PATTERNDETECT(\NLW_accumulation_stage_reg[4]_PATTERNDETECT_UNCONNECTED ),
        .PCIN({\accumulation_stage_reg_n_106_[3] ,\accumulation_stage_reg_n_107_[3] ,\accumulation_stage_reg_n_108_[3] ,\accumulation_stage_reg_n_109_[3] ,\accumulation_stage_reg_n_110_[3] ,\accumulation_stage_reg_n_111_[3] ,\accumulation_stage_reg_n_112_[3] ,\accumulation_stage_reg_n_113_[3] ,\accumulation_stage_reg_n_114_[3] ,\accumulation_stage_reg_n_115_[3] ,\accumulation_stage_reg_n_116_[3] ,\accumulation_stage_reg_n_117_[3] ,\accumulation_stage_reg_n_118_[3] ,\accumulation_stage_reg_n_119_[3] ,\accumulation_stage_reg_n_120_[3] ,\accumulation_stage_reg_n_121_[3] ,\accumulation_stage_reg_n_122_[3] ,\accumulation_stage_reg_n_123_[3] ,\accumulation_stage_reg_n_124_[3] ,\accumulation_stage_reg_n_125_[3] ,\accumulation_stage_reg_n_126_[3] ,\accumulation_stage_reg_n_127_[3] ,\accumulation_stage_reg_n_128_[3] ,\accumulation_stage_reg_n_129_[3] ,\accumulation_stage_reg_n_130_[3] ,\accumulation_stage_reg_n_131_[3] ,\accumulation_stage_reg_n_132_[3] ,\accumulation_stage_reg_n_133_[3] ,\accumulation_stage_reg_n_134_[3] ,\accumulation_stage_reg_n_135_[3] ,\accumulation_stage_reg_n_136_[3] ,\accumulation_stage_reg_n_137_[3] ,\accumulation_stage_reg_n_138_[3] ,\accumulation_stage_reg_n_139_[3] ,\accumulation_stage_reg_n_140_[3] ,\accumulation_stage_reg_n_141_[3] ,\accumulation_stage_reg_n_142_[3] ,\accumulation_stage_reg_n_143_[3] ,\accumulation_stage_reg_n_144_[3] ,\accumulation_stage_reg_n_145_[3] ,\accumulation_stage_reg_n_146_[3] ,\accumulation_stage_reg_n_147_[3] ,\accumulation_stage_reg_n_148_[3] ,\accumulation_stage_reg_n_149_[3] ,\accumulation_stage_reg_n_150_[3] ,\accumulation_stage_reg_n_151_[3] ,\accumulation_stage_reg_n_152_[3] ,\accumulation_stage_reg_n_153_[3] }),
        .PCOUT({\accumulation_stage_reg_n_106_[4] ,\accumulation_stage_reg_n_107_[4] ,\accumulation_stage_reg_n_108_[4] ,\accumulation_stage_reg_n_109_[4] ,\accumulation_stage_reg_n_110_[4] ,\accumulation_stage_reg_n_111_[4] ,\accumulation_stage_reg_n_112_[4] ,\accumulation_stage_reg_n_113_[4] ,\accumulation_stage_reg_n_114_[4] ,\accumulation_stage_reg_n_115_[4] ,\accumulation_stage_reg_n_116_[4] ,\accumulation_stage_reg_n_117_[4] ,\accumulation_stage_reg_n_118_[4] ,\accumulation_stage_reg_n_119_[4] ,\accumulation_stage_reg_n_120_[4] ,\accumulation_stage_reg_n_121_[4] ,\accumulation_stage_reg_n_122_[4] ,\accumulation_stage_reg_n_123_[4] ,\accumulation_stage_reg_n_124_[4] ,\accumulation_stage_reg_n_125_[4] ,\accumulation_stage_reg_n_126_[4] ,\accumulation_stage_reg_n_127_[4] ,\accumulation_stage_reg_n_128_[4] ,\accumulation_stage_reg_n_129_[4] ,\accumulation_stage_reg_n_130_[4] ,\accumulation_stage_reg_n_131_[4] ,\accumulation_stage_reg_n_132_[4] ,\accumulation_stage_reg_n_133_[4] ,\accumulation_stage_reg_n_134_[4] ,\accumulation_stage_reg_n_135_[4] ,\accumulation_stage_reg_n_136_[4] ,\accumulation_stage_reg_n_137_[4] ,\accumulation_stage_reg_n_138_[4] ,\accumulation_stage_reg_n_139_[4] ,\accumulation_stage_reg_n_140_[4] ,\accumulation_stage_reg_n_141_[4] ,\accumulation_stage_reg_n_142_[4] ,\accumulation_stage_reg_n_143_[4] ,\accumulation_stage_reg_n_144_[4] ,\accumulation_stage_reg_n_145_[4] ,\accumulation_stage_reg_n_146_[4] ,\accumulation_stage_reg_n_147_[4] ,\accumulation_stage_reg_n_148_[4] ,\accumulation_stage_reg_n_149_[4] ,\accumulation_stage_reg_n_150_[4] ,\accumulation_stage_reg_n_151_[4] ,\accumulation_stage_reg_n_152_[4] ,\accumulation_stage_reg_n_153_[4] }),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(\NLW_accumulation_stage_reg[4]_UNDERFLOW_UNCONNECTED ));
  DSP48E1 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    \accumulation_stage_reg[5] 
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\accumulation_stage_reg[4]_1 }),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(\NLW_accumulation_stage_reg[5]_ACOUT_UNCONNECTED [29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({\accumulation_stage_reg[5]_0 [7],\accumulation_stage_reg[5]_0 [7],\accumulation_stage_reg[5]_0 [7],\accumulation_stage_reg[5]_0 [7],\accumulation_stage_reg[5]_0 [7],\accumulation_stage_reg[5]_0 [7],\accumulation_stage_reg[5]_0 [7],\accumulation_stage_reg[5]_0 [7],\accumulation_stage_reg[5]_0 [7],\accumulation_stage_reg[5]_0 [7],\accumulation_stage_reg[5]_0 }),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(\NLW_accumulation_stage_reg[5]_BCOUT_UNCONNECTED [17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(\NLW_accumulation_stage_reg[5]_CARRYCASCOUT_UNCONNECTED ),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(\NLW_accumulation_stage_reg[5]_CARRYOUT_UNCONNECTED [3:0]),
        .CEA1(cnn_en_IBUF),
        .CEA2(cnn_en_IBUF),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(\accumulation_stage_reg[8]_0 ),
        .CEB2(\accumulation_stage_reg[8]_0 ),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(cnn_en_IBUF),
        .CEP(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(\NLW_accumulation_stage_reg[5]_MULTSIGNOUT_UNCONNECTED ),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(\NLW_accumulation_stage_reg[5]_OVERFLOW_UNCONNECTED ),
        .P(\NLW_accumulation_stage_reg[5]_P_UNCONNECTED [47:0]),
        .PATTERNBDETECT(\NLW_accumulation_stage_reg[5]_PATTERNBDETECT_UNCONNECTED ),
        .PATTERNDETECT(\NLW_accumulation_stage_reg[5]_PATTERNDETECT_UNCONNECTED ),
        .PCIN({\accumulation_stage_reg_n_106_[4] ,\accumulation_stage_reg_n_107_[4] ,\accumulation_stage_reg_n_108_[4] ,\accumulation_stage_reg_n_109_[4] ,\accumulation_stage_reg_n_110_[4] ,\accumulation_stage_reg_n_111_[4] ,\accumulation_stage_reg_n_112_[4] ,\accumulation_stage_reg_n_113_[4] ,\accumulation_stage_reg_n_114_[4] ,\accumulation_stage_reg_n_115_[4] ,\accumulation_stage_reg_n_116_[4] ,\accumulation_stage_reg_n_117_[4] ,\accumulation_stage_reg_n_118_[4] ,\accumulation_stage_reg_n_119_[4] ,\accumulation_stage_reg_n_120_[4] ,\accumulation_stage_reg_n_121_[4] ,\accumulation_stage_reg_n_122_[4] ,\accumulation_stage_reg_n_123_[4] ,\accumulation_stage_reg_n_124_[4] ,\accumulation_stage_reg_n_125_[4] ,\accumulation_stage_reg_n_126_[4] ,\accumulation_stage_reg_n_127_[4] ,\accumulation_stage_reg_n_128_[4] ,\accumulation_stage_reg_n_129_[4] ,\accumulation_stage_reg_n_130_[4] ,\accumulation_stage_reg_n_131_[4] ,\accumulation_stage_reg_n_132_[4] ,\accumulation_stage_reg_n_133_[4] ,\accumulation_stage_reg_n_134_[4] ,\accumulation_stage_reg_n_135_[4] ,\accumulation_stage_reg_n_136_[4] ,\accumulation_stage_reg_n_137_[4] ,\accumulation_stage_reg_n_138_[4] ,\accumulation_stage_reg_n_139_[4] ,\accumulation_stage_reg_n_140_[4] ,\accumulation_stage_reg_n_141_[4] ,\accumulation_stage_reg_n_142_[4] ,\accumulation_stage_reg_n_143_[4] ,\accumulation_stage_reg_n_144_[4] ,\accumulation_stage_reg_n_145_[4] ,\accumulation_stage_reg_n_146_[4] ,\accumulation_stage_reg_n_147_[4] ,\accumulation_stage_reg_n_148_[4] ,\accumulation_stage_reg_n_149_[4] ,\accumulation_stage_reg_n_150_[4] ,\accumulation_stage_reg_n_151_[4] ,\accumulation_stage_reg_n_152_[4] ,\accumulation_stage_reg_n_153_[4] }),
        .PCOUT({\accumulation_stage_reg_n_106_[5] ,\accumulation_stage_reg_n_107_[5] ,\accumulation_stage_reg_n_108_[5] ,\accumulation_stage_reg_n_109_[5] ,\accumulation_stage_reg_n_110_[5] ,\accumulation_stage_reg_n_111_[5] ,\accumulation_stage_reg_n_112_[5] ,\accumulation_stage_reg_n_113_[5] ,\accumulation_stage_reg_n_114_[5] ,\accumulation_stage_reg_n_115_[5] ,\accumulation_stage_reg_n_116_[5] ,\accumulation_stage_reg_n_117_[5] ,\accumulation_stage_reg_n_118_[5] ,\accumulation_stage_reg_n_119_[5] ,\accumulation_stage_reg_n_120_[5] ,\accumulation_stage_reg_n_121_[5] ,\accumulation_stage_reg_n_122_[5] ,\accumulation_stage_reg_n_123_[5] ,\accumulation_stage_reg_n_124_[5] ,\accumulation_stage_reg_n_125_[5] ,\accumulation_stage_reg_n_126_[5] ,\accumulation_stage_reg_n_127_[5] ,\accumulation_stage_reg_n_128_[5] ,\accumulation_stage_reg_n_129_[5] ,\accumulation_stage_reg_n_130_[5] ,\accumulation_stage_reg_n_131_[5] ,\accumulation_stage_reg_n_132_[5] ,\accumulation_stage_reg_n_133_[5] ,\accumulation_stage_reg_n_134_[5] ,\accumulation_stage_reg_n_135_[5] ,\accumulation_stage_reg_n_136_[5] ,\accumulation_stage_reg_n_137_[5] ,\accumulation_stage_reg_n_138_[5] ,\accumulation_stage_reg_n_139_[5] ,\accumulation_stage_reg_n_140_[5] ,\accumulation_stage_reg_n_141_[5] ,\accumulation_stage_reg_n_142_[5] ,\accumulation_stage_reg_n_143_[5] ,\accumulation_stage_reg_n_144_[5] ,\accumulation_stage_reg_n_145_[5] ,\accumulation_stage_reg_n_146_[5] ,\accumulation_stage_reg_n_147_[5] ,\accumulation_stage_reg_n_148_[5] ,\accumulation_stage_reg_n_149_[5] ,\accumulation_stage_reg_n_150_[5] ,\accumulation_stage_reg_n_151_[5] ,\accumulation_stage_reg_n_152_[5] ,\accumulation_stage_reg_n_153_[5] }),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(\NLW_accumulation_stage_reg[5]_UNDERFLOW_UNCONNECTED ));
  DSP48E1 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    \accumulation_stage_reg[6] 
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\accumulation_stage_reg[4]_1 }),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(\NLW_accumulation_stage_reg[6]_ACOUT_UNCONNECTED [29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({\accumulation_stage_reg[6]_0 [7],\accumulation_stage_reg[6]_0 [7],\accumulation_stage_reg[6]_0 [7],\accumulation_stage_reg[6]_0 [7],\accumulation_stage_reg[6]_0 [7],\accumulation_stage_reg[6]_0 [7],\accumulation_stage_reg[6]_0 [7],\accumulation_stage_reg[6]_0 [7],\accumulation_stage_reg[6]_0 [7],\accumulation_stage_reg[6]_0 [7],\accumulation_stage_reg[6]_0 }),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(\NLW_accumulation_stage_reg[6]_BCOUT_UNCONNECTED [17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(\NLW_accumulation_stage_reg[6]_CARRYCASCOUT_UNCONNECTED ),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(\NLW_accumulation_stage_reg[6]_CARRYOUT_UNCONNECTED [3:0]),
        .CEA1(cnn_en_IBUF),
        .CEA2(cnn_en_IBUF),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(\accumulation_stage_reg[8]_0 ),
        .CEB2(\accumulation_stage_reg[8]_0 ),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(cnn_en_IBUF),
        .CEP(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(\NLW_accumulation_stage_reg[6]_MULTSIGNOUT_UNCONNECTED ),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(\NLW_accumulation_stage_reg[6]_OVERFLOW_UNCONNECTED ),
        .P(\NLW_accumulation_stage_reg[6]_P_UNCONNECTED [47:0]),
        .PATTERNBDETECT(\NLW_accumulation_stage_reg[6]_PATTERNBDETECT_UNCONNECTED ),
        .PATTERNDETECT(\NLW_accumulation_stage_reg[6]_PATTERNDETECT_UNCONNECTED ),
        .PCIN({\accumulation_stage_reg_n_106_[5] ,\accumulation_stage_reg_n_107_[5] ,\accumulation_stage_reg_n_108_[5] ,\accumulation_stage_reg_n_109_[5] ,\accumulation_stage_reg_n_110_[5] ,\accumulation_stage_reg_n_111_[5] ,\accumulation_stage_reg_n_112_[5] ,\accumulation_stage_reg_n_113_[5] ,\accumulation_stage_reg_n_114_[5] ,\accumulation_stage_reg_n_115_[5] ,\accumulation_stage_reg_n_116_[5] ,\accumulation_stage_reg_n_117_[5] ,\accumulation_stage_reg_n_118_[5] ,\accumulation_stage_reg_n_119_[5] ,\accumulation_stage_reg_n_120_[5] ,\accumulation_stage_reg_n_121_[5] ,\accumulation_stage_reg_n_122_[5] ,\accumulation_stage_reg_n_123_[5] ,\accumulation_stage_reg_n_124_[5] ,\accumulation_stage_reg_n_125_[5] ,\accumulation_stage_reg_n_126_[5] ,\accumulation_stage_reg_n_127_[5] ,\accumulation_stage_reg_n_128_[5] ,\accumulation_stage_reg_n_129_[5] ,\accumulation_stage_reg_n_130_[5] ,\accumulation_stage_reg_n_131_[5] ,\accumulation_stage_reg_n_132_[5] ,\accumulation_stage_reg_n_133_[5] ,\accumulation_stage_reg_n_134_[5] ,\accumulation_stage_reg_n_135_[5] ,\accumulation_stage_reg_n_136_[5] ,\accumulation_stage_reg_n_137_[5] ,\accumulation_stage_reg_n_138_[5] ,\accumulation_stage_reg_n_139_[5] ,\accumulation_stage_reg_n_140_[5] ,\accumulation_stage_reg_n_141_[5] ,\accumulation_stage_reg_n_142_[5] ,\accumulation_stage_reg_n_143_[5] ,\accumulation_stage_reg_n_144_[5] ,\accumulation_stage_reg_n_145_[5] ,\accumulation_stage_reg_n_146_[5] ,\accumulation_stage_reg_n_147_[5] ,\accumulation_stage_reg_n_148_[5] ,\accumulation_stage_reg_n_149_[5] ,\accumulation_stage_reg_n_150_[5] ,\accumulation_stage_reg_n_151_[5] ,\accumulation_stage_reg_n_152_[5] ,\accumulation_stage_reg_n_153_[5] }),
        .PCOUT({\accumulation_stage_reg_n_106_[6] ,\accumulation_stage_reg_n_107_[6] ,\accumulation_stage_reg_n_108_[6] ,\accumulation_stage_reg_n_109_[6] ,\accumulation_stage_reg_n_110_[6] ,\accumulation_stage_reg_n_111_[6] ,\accumulation_stage_reg_n_112_[6] ,\accumulation_stage_reg_n_113_[6] ,\accumulation_stage_reg_n_114_[6] ,\accumulation_stage_reg_n_115_[6] ,\accumulation_stage_reg_n_116_[6] ,\accumulation_stage_reg_n_117_[6] ,\accumulation_stage_reg_n_118_[6] ,\accumulation_stage_reg_n_119_[6] ,\accumulation_stage_reg_n_120_[6] ,\accumulation_stage_reg_n_121_[6] ,\accumulation_stage_reg_n_122_[6] ,\accumulation_stage_reg_n_123_[6] ,\accumulation_stage_reg_n_124_[6] ,\accumulation_stage_reg_n_125_[6] ,\accumulation_stage_reg_n_126_[6] ,\accumulation_stage_reg_n_127_[6] ,\accumulation_stage_reg_n_128_[6] ,\accumulation_stage_reg_n_129_[6] ,\accumulation_stage_reg_n_130_[6] ,\accumulation_stage_reg_n_131_[6] ,\accumulation_stage_reg_n_132_[6] ,\accumulation_stage_reg_n_133_[6] ,\accumulation_stage_reg_n_134_[6] ,\accumulation_stage_reg_n_135_[6] ,\accumulation_stage_reg_n_136_[6] ,\accumulation_stage_reg_n_137_[6] ,\accumulation_stage_reg_n_138_[6] ,\accumulation_stage_reg_n_139_[6] ,\accumulation_stage_reg_n_140_[6] ,\accumulation_stage_reg_n_141_[6] ,\accumulation_stage_reg_n_142_[6] ,\accumulation_stage_reg_n_143_[6] ,\accumulation_stage_reg_n_144_[6] ,\accumulation_stage_reg_n_145_[6] ,\accumulation_stage_reg_n_146_[6] ,\accumulation_stage_reg_n_147_[6] ,\accumulation_stage_reg_n_148_[6] ,\accumulation_stage_reg_n_149_[6] ,\accumulation_stage_reg_n_150_[6] ,\accumulation_stage_reg_n_151_[6] ,\accumulation_stage_reg_n_152_[6] ,\accumulation_stage_reg_n_153_[6] }),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(\NLW_accumulation_stage_reg[6]_UNDERFLOW_UNCONNECTED ));
  DSP48E1 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    \accumulation_stage_reg[7] 
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\accumulation_stage_reg[7]_1 }),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(\NLW_accumulation_stage_reg[7]_ACOUT_UNCONNECTED [29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({\accumulation_stage_reg[7]_0 [7],\accumulation_stage_reg[7]_0 [7],\accumulation_stage_reg[7]_0 [7],\accumulation_stage_reg[7]_0 [7],\accumulation_stage_reg[7]_0 [7],\accumulation_stage_reg[7]_0 [7],\accumulation_stage_reg[7]_0 [7],\accumulation_stage_reg[7]_0 [7],\accumulation_stage_reg[7]_0 [7],\accumulation_stage_reg[7]_0 [7],\accumulation_stage_reg[7]_0 }),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(\NLW_accumulation_stage_reg[7]_BCOUT_UNCONNECTED [17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(\NLW_accumulation_stage_reg[7]_CARRYCASCOUT_UNCONNECTED ),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(\NLW_accumulation_stage_reg[7]_CARRYOUT_UNCONNECTED [3:0]),
        .CEA1(cnn_en_IBUF),
        .CEA2(cnn_en_IBUF),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(\accumulation_stage_reg[8]_0 ),
        .CEB2(\accumulation_stage_reg[8]_0 ),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(cnn_en_IBUF),
        .CEP(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(\NLW_accumulation_stage_reg[7]_MULTSIGNOUT_UNCONNECTED ),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(\NLW_accumulation_stage_reg[7]_OVERFLOW_UNCONNECTED ),
        .P(\NLW_accumulation_stage_reg[7]_P_UNCONNECTED [47:0]),
        .PATTERNBDETECT(\NLW_accumulation_stage_reg[7]_PATTERNBDETECT_UNCONNECTED ),
        .PATTERNDETECT(\NLW_accumulation_stage_reg[7]_PATTERNDETECT_UNCONNECTED ),
        .PCIN({\accumulation_stage_reg_n_106_[6] ,\accumulation_stage_reg_n_107_[6] ,\accumulation_stage_reg_n_108_[6] ,\accumulation_stage_reg_n_109_[6] ,\accumulation_stage_reg_n_110_[6] ,\accumulation_stage_reg_n_111_[6] ,\accumulation_stage_reg_n_112_[6] ,\accumulation_stage_reg_n_113_[6] ,\accumulation_stage_reg_n_114_[6] ,\accumulation_stage_reg_n_115_[6] ,\accumulation_stage_reg_n_116_[6] ,\accumulation_stage_reg_n_117_[6] ,\accumulation_stage_reg_n_118_[6] ,\accumulation_stage_reg_n_119_[6] ,\accumulation_stage_reg_n_120_[6] ,\accumulation_stage_reg_n_121_[6] ,\accumulation_stage_reg_n_122_[6] ,\accumulation_stage_reg_n_123_[6] ,\accumulation_stage_reg_n_124_[6] ,\accumulation_stage_reg_n_125_[6] ,\accumulation_stage_reg_n_126_[6] ,\accumulation_stage_reg_n_127_[6] ,\accumulation_stage_reg_n_128_[6] ,\accumulation_stage_reg_n_129_[6] ,\accumulation_stage_reg_n_130_[6] ,\accumulation_stage_reg_n_131_[6] ,\accumulation_stage_reg_n_132_[6] ,\accumulation_stage_reg_n_133_[6] ,\accumulation_stage_reg_n_134_[6] ,\accumulation_stage_reg_n_135_[6] ,\accumulation_stage_reg_n_136_[6] ,\accumulation_stage_reg_n_137_[6] ,\accumulation_stage_reg_n_138_[6] ,\accumulation_stage_reg_n_139_[6] ,\accumulation_stage_reg_n_140_[6] ,\accumulation_stage_reg_n_141_[6] ,\accumulation_stage_reg_n_142_[6] ,\accumulation_stage_reg_n_143_[6] ,\accumulation_stage_reg_n_144_[6] ,\accumulation_stage_reg_n_145_[6] ,\accumulation_stage_reg_n_146_[6] ,\accumulation_stage_reg_n_147_[6] ,\accumulation_stage_reg_n_148_[6] ,\accumulation_stage_reg_n_149_[6] ,\accumulation_stage_reg_n_150_[6] ,\accumulation_stage_reg_n_151_[6] ,\accumulation_stage_reg_n_152_[6] ,\accumulation_stage_reg_n_153_[6] }),
        .PCOUT({\accumulation_stage_reg_n_106_[7] ,\accumulation_stage_reg_n_107_[7] ,\accumulation_stage_reg_n_108_[7] ,\accumulation_stage_reg_n_109_[7] ,\accumulation_stage_reg_n_110_[7] ,\accumulation_stage_reg_n_111_[7] ,\accumulation_stage_reg_n_112_[7] ,\accumulation_stage_reg_n_113_[7] ,\accumulation_stage_reg_n_114_[7] ,\accumulation_stage_reg_n_115_[7] ,\accumulation_stage_reg_n_116_[7] ,\accumulation_stage_reg_n_117_[7] ,\accumulation_stage_reg_n_118_[7] ,\accumulation_stage_reg_n_119_[7] ,\accumulation_stage_reg_n_120_[7] ,\accumulation_stage_reg_n_121_[7] ,\accumulation_stage_reg_n_122_[7] ,\accumulation_stage_reg_n_123_[7] ,\accumulation_stage_reg_n_124_[7] ,\accumulation_stage_reg_n_125_[7] ,\accumulation_stage_reg_n_126_[7] ,\accumulation_stage_reg_n_127_[7] ,\accumulation_stage_reg_n_128_[7] ,\accumulation_stage_reg_n_129_[7] ,\accumulation_stage_reg_n_130_[7] ,\accumulation_stage_reg_n_131_[7] ,\accumulation_stage_reg_n_132_[7] ,\accumulation_stage_reg_n_133_[7] ,\accumulation_stage_reg_n_134_[7] ,\accumulation_stage_reg_n_135_[7] ,\accumulation_stage_reg_n_136_[7] ,\accumulation_stage_reg_n_137_[7] ,\accumulation_stage_reg_n_138_[7] ,\accumulation_stage_reg_n_139_[7] ,\accumulation_stage_reg_n_140_[7] ,\accumulation_stage_reg_n_141_[7] ,\accumulation_stage_reg_n_142_[7] ,\accumulation_stage_reg_n_143_[7] ,\accumulation_stage_reg_n_144_[7] ,\accumulation_stage_reg_n_145_[7] ,\accumulation_stage_reg_n_146_[7] ,\accumulation_stage_reg_n_147_[7] ,\accumulation_stage_reg_n_148_[7] ,\accumulation_stage_reg_n_149_[7] ,\accumulation_stage_reg_n_150_[7] ,\accumulation_stage_reg_n_151_[7] ,\accumulation_stage_reg_n_152_[7] ,\accumulation_stage_reg_n_153_[7] }),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(\NLW_accumulation_stage_reg[7]_UNDERFLOW_UNCONNECTED ));
  DSP48E1 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    \accumulation_stage_reg[8] 
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\accumulation_stage_reg[7]_1 }),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(\NLW_accumulation_stage_reg[8]_ACOUT_UNCONNECTED [29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({B[7],B[7],B[7],B[7],B[7],B[7],B[7],B[7],B[7],B[7],B}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(\NLW_accumulation_stage_reg[8]_BCOUT_UNCONNECTED [17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(\NLW_accumulation_stage_reg[8]_CARRYCASCOUT_UNCONNECTED ),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(\NLW_accumulation_stage_reg[8]_CARRYOUT_UNCONNECTED [3:0]),
        .CEA1(cnn_en_IBUF),
        .CEA2(cnn_en_IBUF),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(\accumulation_stage_reg[8]_0 ),
        .CEB2(\accumulation_stage_reg[8]_0 ),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(cnn_en_IBUF),
        .CEP(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(\NLW_accumulation_stage_reg[8]_MULTSIGNOUT_UNCONNECTED ),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(\NLW_accumulation_stage_reg[8]_OVERFLOW_UNCONNECTED ),
        .P(\NLW_accumulation_stage_reg[8]_P_UNCONNECTED [47:0]),
        .PATTERNBDETECT(\NLW_accumulation_stage_reg[8]_PATTERNBDETECT_UNCONNECTED ),
        .PATTERNDETECT(\NLW_accumulation_stage_reg[8]_PATTERNDETECT_UNCONNECTED ),
        .PCIN({\accumulation_stage_reg_n_106_[7] ,\accumulation_stage_reg_n_107_[7] ,\accumulation_stage_reg_n_108_[7] ,\accumulation_stage_reg_n_109_[7] ,\accumulation_stage_reg_n_110_[7] ,\accumulation_stage_reg_n_111_[7] ,\accumulation_stage_reg_n_112_[7] ,\accumulation_stage_reg_n_113_[7] ,\accumulation_stage_reg_n_114_[7] ,\accumulation_stage_reg_n_115_[7] ,\accumulation_stage_reg_n_116_[7] ,\accumulation_stage_reg_n_117_[7] ,\accumulation_stage_reg_n_118_[7] ,\accumulation_stage_reg_n_119_[7] ,\accumulation_stage_reg_n_120_[7] ,\accumulation_stage_reg_n_121_[7] ,\accumulation_stage_reg_n_122_[7] ,\accumulation_stage_reg_n_123_[7] ,\accumulation_stage_reg_n_124_[7] ,\accumulation_stage_reg_n_125_[7] ,\accumulation_stage_reg_n_126_[7] ,\accumulation_stage_reg_n_127_[7] ,\accumulation_stage_reg_n_128_[7] ,\accumulation_stage_reg_n_129_[7] ,\accumulation_stage_reg_n_130_[7] ,\accumulation_stage_reg_n_131_[7] ,\accumulation_stage_reg_n_132_[7] ,\accumulation_stage_reg_n_133_[7] ,\accumulation_stage_reg_n_134_[7] ,\accumulation_stage_reg_n_135_[7] ,\accumulation_stage_reg_n_136_[7] ,\accumulation_stage_reg_n_137_[7] ,\accumulation_stage_reg_n_138_[7] ,\accumulation_stage_reg_n_139_[7] ,\accumulation_stage_reg_n_140_[7] ,\accumulation_stage_reg_n_141_[7] ,\accumulation_stage_reg_n_142_[7] ,\accumulation_stage_reg_n_143_[7] ,\accumulation_stage_reg_n_144_[7] ,\accumulation_stage_reg_n_145_[7] ,\accumulation_stage_reg_n_146_[7] ,\accumulation_stage_reg_n_147_[7] ,\accumulation_stage_reg_n_148_[7] ,\accumulation_stage_reg_n_149_[7] ,\accumulation_stage_reg_n_150_[7] ,\accumulation_stage_reg_n_151_[7] ,\accumulation_stage_reg_n_152_[7] ,\accumulation_stage_reg_n_153_[7] }),
        .PCOUT({\accumulation_stage_reg_n_106_[8] ,\accumulation_stage_reg_n_107_[8] ,\accumulation_stage_reg_n_108_[8] ,\accumulation_stage_reg_n_109_[8] ,\accumulation_stage_reg_n_110_[8] ,\accumulation_stage_reg_n_111_[8] ,\accumulation_stage_reg_n_112_[8] ,\accumulation_stage_reg_n_113_[8] ,\accumulation_stage_reg_n_114_[8] ,\accumulation_stage_reg_n_115_[8] ,\accumulation_stage_reg_n_116_[8] ,\accumulation_stage_reg_n_117_[8] ,\accumulation_stage_reg_n_118_[8] ,\accumulation_stage_reg_n_119_[8] ,\accumulation_stage_reg_n_120_[8] ,\accumulation_stage_reg_n_121_[8] ,\accumulation_stage_reg_n_122_[8] ,\accumulation_stage_reg_n_123_[8] ,\accumulation_stage_reg_n_124_[8] ,\accumulation_stage_reg_n_125_[8] ,\accumulation_stage_reg_n_126_[8] ,\accumulation_stage_reg_n_127_[8] ,\accumulation_stage_reg_n_128_[8] ,\accumulation_stage_reg_n_129_[8] ,\accumulation_stage_reg_n_130_[8] ,\accumulation_stage_reg_n_131_[8] ,\accumulation_stage_reg_n_132_[8] ,\accumulation_stage_reg_n_133_[8] ,\accumulation_stage_reg_n_134_[8] ,\accumulation_stage_reg_n_135_[8] ,\accumulation_stage_reg_n_136_[8] ,\accumulation_stage_reg_n_137_[8] ,\accumulation_stage_reg_n_138_[8] ,\accumulation_stage_reg_n_139_[8] ,\accumulation_stage_reg_n_140_[8] ,\accumulation_stage_reg_n_141_[8] ,\accumulation_stage_reg_n_142_[8] ,\accumulation_stage_reg_n_143_[8] ,\accumulation_stage_reg_n_144_[8] ,\accumulation_stage_reg_n_145_[8] ,\accumulation_stage_reg_n_146_[8] ,\accumulation_stage_reg_n_147_[8] ,\accumulation_stage_reg_n_148_[8] ,\accumulation_stage_reg_n_149_[8] ,\accumulation_stage_reg_n_150_[8] ,\accumulation_stage_reg_n_151_[8] ,\accumulation_stage_reg_n_152_[8] ,\accumulation_stage_reg_n_153_[8] }),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(\NLW_accumulation_stage_reg[8]_UNDERFLOW_UNCONNECTED ));
  DSP48E1 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    \accumulation_stage_reg[9] 
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\accumulation_stage_reg[7]_1 }),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(\NLW_accumulation_stage_reg[9]_ACOUT_UNCONNECTED [29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({B[7],B[7],B[7],B[7],B[7],B[7],B[7],B[7],B[7],B[7],B}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(\NLW_accumulation_stage_reg[9]_BCOUT_UNCONNECTED [17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(\NLW_accumulation_stage_reg[9]_CARRYCASCOUT_UNCONNECTED ),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(\NLW_accumulation_stage_reg[9]_CARRYOUT_UNCONNECTED [3:0]),
        .CEA1(cnn_en_IBUF),
        .CEA2(cnn_en_IBUF),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(\accumulation_stage_reg[8]_0 ),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(cnn_en_IBUF),
        .CEP(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(\NLW_accumulation_stage_reg[9]_MULTSIGNOUT_UNCONNECTED ),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(\NLW_accumulation_stage_reg[9]_OVERFLOW_UNCONNECTED ),
        .P({\NLW_accumulation_stage_reg[9]_P_UNCONNECTED [47:20],\accumulation_stage_reg_n_86_[9] ,\accumulation_stage_reg_n_87_[9] ,\accumulation_stage_reg_n_88_[9] ,\accumulation_stage_reg_n_89_[9] ,\accumulation_stage_reg_n_90_[9] ,\accumulation_stage_reg_n_91_[9] ,\accumulation_stage_reg_n_92_[9] ,\accumulation_stage_reg_n_93_[9] ,\accumulation_stage_reg_n_94_[9] ,\accumulation_stage_reg_n_95_[9] ,\accumulation_stage_reg_n_96_[9] ,\accumulation_stage_reg_n_97_[9] ,\accumulation_stage_reg_n_98_[9] ,\accumulation_stage_reg_n_99_[9] ,\accumulation_stage_reg_n_100_[9] ,\accumulation_stage_reg_n_101_[9] ,\accumulation_stage_reg_n_102_[9] ,\accumulation_stage_reg_n_103_[9] ,\accumulation_stage_reg_n_104_[9] ,\accumulation_stage_reg_n_105_[9] }),
        .PATTERNBDETECT(\NLW_accumulation_stage_reg[9]_PATTERNBDETECT_UNCONNECTED ),
        .PATTERNDETECT(\NLW_accumulation_stage_reg[9]_PATTERNDETECT_UNCONNECTED ),
        .PCIN({\accumulation_stage_reg_n_106_[8] ,\accumulation_stage_reg_n_107_[8] ,\accumulation_stage_reg_n_108_[8] ,\accumulation_stage_reg_n_109_[8] ,\accumulation_stage_reg_n_110_[8] ,\accumulation_stage_reg_n_111_[8] ,\accumulation_stage_reg_n_112_[8] ,\accumulation_stage_reg_n_113_[8] ,\accumulation_stage_reg_n_114_[8] ,\accumulation_stage_reg_n_115_[8] ,\accumulation_stage_reg_n_116_[8] ,\accumulation_stage_reg_n_117_[8] ,\accumulation_stage_reg_n_118_[8] ,\accumulation_stage_reg_n_119_[8] ,\accumulation_stage_reg_n_120_[8] ,\accumulation_stage_reg_n_121_[8] ,\accumulation_stage_reg_n_122_[8] ,\accumulation_stage_reg_n_123_[8] ,\accumulation_stage_reg_n_124_[8] ,\accumulation_stage_reg_n_125_[8] ,\accumulation_stage_reg_n_126_[8] ,\accumulation_stage_reg_n_127_[8] ,\accumulation_stage_reg_n_128_[8] ,\accumulation_stage_reg_n_129_[8] ,\accumulation_stage_reg_n_130_[8] ,\accumulation_stage_reg_n_131_[8] ,\accumulation_stage_reg_n_132_[8] ,\accumulation_stage_reg_n_133_[8] ,\accumulation_stage_reg_n_134_[8] ,\accumulation_stage_reg_n_135_[8] ,\accumulation_stage_reg_n_136_[8] ,\accumulation_stage_reg_n_137_[8] ,\accumulation_stage_reg_n_138_[8] ,\accumulation_stage_reg_n_139_[8] ,\accumulation_stage_reg_n_140_[8] ,\accumulation_stage_reg_n_141_[8] ,\accumulation_stage_reg_n_142_[8] ,\accumulation_stage_reg_n_143_[8] ,\accumulation_stage_reg_n_144_[8] ,\accumulation_stage_reg_n_145_[8] ,\accumulation_stage_reg_n_146_[8] ,\accumulation_stage_reg_n_147_[8] ,\accumulation_stage_reg_n_148_[8] ,\accumulation_stage_reg_n_149_[8] ,\accumulation_stage_reg_n_150_[8] ,\accumulation_stage_reg_n_151_[8] ,\accumulation_stage_reg_n_152_[8] ,\accumulation_stage_reg_n_153_[8] }),
        .PCOUT(\NLW_accumulation_stage_reg[9]_PCOUT_UNCONNECTED [47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(\NLW_accumulation_stage_reg[9]_UNDERFLOW_UNCONNECTED ));
  LUT3 #(
    .INIT(8'h08)) 
    \out_pixel_OBUF[0]_inst_i_1 
       (.I0(\accumulation_stage_reg_n_105_[9] ),
        .I1(data_valid_OBUF),
        .I2(\accumulation_stage_reg_n_86_[9] ),
        .O(out_pixel_OBUF[0]));
  LUT3 #(
    .INIT(8'h08)) 
    \out_pixel_OBUF[10]_inst_i_1 
       (.I0(\accumulation_stage_reg_n_95_[9] ),
        .I1(data_valid_OBUF),
        .I2(\accumulation_stage_reg_n_86_[9] ),
        .O(out_pixel_OBUF[10]));
  LUT3 #(
    .INIT(8'h08)) 
    \out_pixel_OBUF[11]_inst_i_1 
       (.I0(\accumulation_stage_reg_n_94_[9] ),
        .I1(data_valid_OBUF),
        .I2(\accumulation_stage_reg_n_86_[9] ),
        .O(out_pixel_OBUF[11]));
  LUT3 #(
    .INIT(8'h08)) 
    \out_pixel_OBUF[12]_inst_i_1 
       (.I0(\accumulation_stage_reg_n_93_[9] ),
        .I1(data_valid_OBUF),
        .I2(\accumulation_stage_reg_n_86_[9] ),
        .O(out_pixel_OBUF[12]));
  LUT3 #(
    .INIT(8'h08)) 
    \out_pixel_OBUF[13]_inst_i_1 
       (.I0(\accumulation_stage_reg_n_92_[9] ),
        .I1(data_valid_OBUF),
        .I2(\accumulation_stage_reg_n_86_[9] ),
        .O(out_pixel_OBUF[13]));
  LUT3 #(
    .INIT(8'h08)) 
    \out_pixel_OBUF[14]_inst_i_1 
       (.I0(\accumulation_stage_reg_n_91_[9] ),
        .I1(data_valid_OBUF),
        .I2(\accumulation_stage_reg_n_86_[9] ),
        .O(out_pixel_OBUF[14]));
  LUT3 #(
    .INIT(8'h08)) 
    \out_pixel_OBUF[15]_inst_i_1 
       (.I0(\accumulation_stage_reg_n_90_[9] ),
        .I1(data_valid_OBUF),
        .I2(\accumulation_stage_reg_n_86_[9] ),
        .O(out_pixel_OBUF[15]));
  LUT3 #(
    .INIT(8'h08)) 
    \out_pixel_OBUF[16]_inst_i_1 
       (.I0(\accumulation_stage_reg_n_89_[9] ),
        .I1(data_valid_OBUF),
        .I2(\accumulation_stage_reg_n_86_[9] ),
        .O(out_pixel_OBUF[16]));
  LUT3 #(
    .INIT(8'h08)) 
    \out_pixel_OBUF[17]_inst_i_1 
       (.I0(\accumulation_stage_reg_n_88_[9] ),
        .I1(data_valid_OBUF),
        .I2(\accumulation_stage_reg_n_86_[9] ),
        .O(out_pixel_OBUF[17]));
  LUT3 #(
    .INIT(8'h08)) 
    \out_pixel_OBUF[18]_inst_i_1 
       (.I0(\accumulation_stage_reg_n_87_[9] ),
        .I1(data_valid_OBUF),
        .I2(\accumulation_stage_reg_n_86_[9] ),
        .O(out_pixel_OBUF[18]));
  LUT3 #(
    .INIT(8'h08)) 
    \out_pixel_OBUF[1]_inst_i_1 
       (.I0(\accumulation_stage_reg_n_104_[9] ),
        .I1(data_valid_OBUF),
        .I2(\accumulation_stage_reg_n_86_[9] ),
        .O(out_pixel_OBUF[1]));
  LUT3 #(
    .INIT(8'h08)) 
    \out_pixel_OBUF[2]_inst_i_1 
       (.I0(\accumulation_stage_reg_n_103_[9] ),
        .I1(data_valid_OBUF),
        .I2(\accumulation_stage_reg_n_86_[9] ),
        .O(out_pixel_OBUF[2]));
  LUT3 #(
    .INIT(8'h08)) 
    \out_pixel_OBUF[3]_inst_i_1 
       (.I0(\accumulation_stage_reg_n_102_[9] ),
        .I1(data_valid_OBUF),
        .I2(\accumulation_stage_reg_n_86_[9] ),
        .O(out_pixel_OBUF[3]));
  LUT3 #(
    .INIT(8'h08)) 
    \out_pixel_OBUF[4]_inst_i_1 
       (.I0(\accumulation_stage_reg_n_101_[9] ),
        .I1(data_valid_OBUF),
        .I2(\accumulation_stage_reg_n_86_[9] ),
        .O(out_pixel_OBUF[4]));
  LUT3 #(
    .INIT(8'h08)) 
    \out_pixel_OBUF[5]_inst_i_1 
       (.I0(\accumulation_stage_reg_n_100_[9] ),
        .I1(data_valid_OBUF),
        .I2(\accumulation_stage_reg_n_86_[9] ),
        .O(out_pixel_OBUF[5]));
  LUT3 #(
    .INIT(8'h08)) 
    \out_pixel_OBUF[6]_inst_i_1 
       (.I0(\accumulation_stage_reg_n_99_[9] ),
        .I1(data_valid_OBUF),
        .I2(\accumulation_stage_reg_n_86_[9] ),
        .O(out_pixel_OBUF[6]));
  LUT3 #(
    .INIT(8'h08)) 
    \out_pixel_OBUF[7]_inst_i_1 
       (.I0(\accumulation_stage_reg_n_98_[9] ),
        .I1(data_valid_OBUF),
        .I2(\accumulation_stage_reg_n_86_[9] ),
        .O(out_pixel_OBUF[7]));
  LUT3 #(
    .INIT(8'h08)) 
    \out_pixel_OBUF[8]_inst_i_1 
       (.I0(\accumulation_stage_reg_n_97_[9] ),
        .I1(data_valid_OBUF),
        .I2(\accumulation_stage_reg_n_86_[9] ),
        .O(out_pixel_OBUF[8]));
  LUT3 #(
    .INIT(8'h08)) 
    \out_pixel_OBUF[9]_inst_i_1 
       (.I0(\accumulation_stage_reg_n_96_[9] ),
        .I1(data_valid_OBUF),
        .I2(\accumulation_stage_reg_n_86_[9] ),
        .O(out_pixel_OBUF[9]));
endmodule

module window_nxn
   (\pixel_delay_reg[4][7] ,
    \pixel_delay_reg[1][7] ,
    A,
    cnn_en_IBUF,
    B,
    clk_IBUF_BUFG);
  output [7:0]\pixel_delay_reg[4][7] ;
  output [7:0]\pixel_delay_reg[1][7] ;
  output [7:0]A;
  input cnn_en_IBUF;
  input [7:0]B;
  input clk_IBUF_BUFG;

  wire [7:0]A;
  wire [7:0]B;
  wire clk_IBUF_BUFG;
  wire cnn_en_IBUF;
  wire [7:0]\pixel_delay_reg[1][7] ;
  wire [7:0]\pixel_delay_reg[4][7] ;
  wire \window_pixels_reg[8][0]_srl28_n_0 ;
  wire \window_pixels_reg[8][1]_srl28_n_0 ;
  wire \window_pixels_reg[8][2]_srl28_n_0 ;
  wire \window_pixels_reg[8][3]_srl28_n_0 ;
  wire \window_pixels_reg[8][4]_srl28_n_0 ;
  wire \window_pixels_reg[8][5]_srl28_n_0 ;
  wire \window_pixels_reg[8][6]_srl28_n_0 ;
  wire \window_pixels_reg[8][7]_srl28_n_0 ;
  wire \NLW_window_pixels_reg[8][0]_srl28_Q31_UNCONNECTED ;
  wire \NLW_window_pixels_reg[8][1]_srl28_Q31_UNCONNECTED ;
  wire \NLW_window_pixels_reg[8][2]_srl28_Q31_UNCONNECTED ;
  wire \NLW_window_pixels_reg[8][3]_srl28_Q31_UNCONNECTED ;
  wire \NLW_window_pixels_reg[8][4]_srl28_Q31_UNCONNECTED ;
  wire \NLW_window_pixels_reg[8][5]_srl28_Q31_UNCONNECTED ;
  wire \NLW_window_pixels_reg[8][6]_srl28_Q31_UNCONNECTED ;
  wire \NLW_window_pixels_reg[8][7]_srl28_Q31_UNCONNECTED ;

  line_buffer \genblk1[1].line_buffer_inst 
       (.B(B),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .cnn_en_IBUF(cnn_en_IBUF),
        .\pixel_delay_reg[4][7]_0 (\pixel_delay_reg[4][7] ));
  line_buffer_0 \genblk1[2].line_buffer_inst 
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .cnn_en_IBUF(cnn_en_IBUF),
        .\pixel_delay_reg[1][7]_0 (\pixel_delay_reg[1][7] ),
        .\pixel_delay_reg[1][7]_1 (\pixel_delay_reg[4][7] ));
  FDRE #(
    .INIT(1'b0)) 
    \window_pixels_reg[7][0] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\window_pixels_reg[8][0]_srl28_n_0 ),
        .Q(A[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \window_pixels_reg[7][1] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\window_pixels_reg[8][1]_srl28_n_0 ),
        .Q(A[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \window_pixels_reg[7][2] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\window_pixels_reg[8][2]_srl28_n_0 ),
        .Q(A[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \window_pixels_reg[7][3] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\window_pixels_reg[8][3]_srl28_n_0 ),
        .Q(A[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \window_pixels_reg[7][4] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\window_pixels_reg[8][4]_srl28_n_0 ),
        .Q(A[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \window_pixels_reg[7][5] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\window_pixels_reg[8][5]_srl28_n_0 ),
        .Q(A[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \window_pixels_reg[7][6] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\window_pixels_reg[8][6]_srl28_n_0 ),
        .Q(A[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \window_pixels_reg[7][7] 
       (.C(clk_IBUF_BUFG),
        .CE(cnn_en_IBUF),
        .D(\window_pixels_reg[8][7]_srl28_n_0 ),
        .Q(A[7]),
        .R(1'b0));
  (* srl_bus_name = "\window_generator_inst/window_pixels_reg[8] " *) 
  (* srl_name = "\window_generator_inst/window_pixels_reg[8][0]_srl28 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \window_pixels_reg[8][0]_srl28 
       (.A({1'b1,1'b1,1'b0,1'b1,1'b1}),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(\pixel_delay_reg[1][7] [0]),
        .Q(\window_pixels_reg[8][0]_srl28_n_0 ),
        .Q31(\NLW_window_pixels_reg[8][0]_srl28_Q31_UNCONNECTED ));
  (* srl_bus_name = "\window_generator_inst/window_pixels_reg[8] " *) 
  (* srl_name = "\window_generator_inst/window_pixels_reg[8][1]_srl28 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \window_pixels_reg[8][1]_srl28 
       (.A({1'b1,1'b1,1'b0,1'b1,1'b1}),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(\pixel_delay_reg[1][7] [1]),
        .Q(\window_pixels_reg[8][1]_srl28_n_0 ),
        .Q31(\NLW_window_pixels_reg[8][1]_srl28_Q31_UNCONNECTED ));
  (* srl_bus_name = "\window_generator_inst/window_pixels_reg[8] " *) 
  (* srl_name = "\window_generator_inst/window_pixels_reg[8][2]_srl28 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \window_pixels_reg[8][2]_srl28 
       (.A({1'b1,1'b1,1'b0,1'b1,1'b1}),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(\pixel_delay_reg[1][7] [2]),
        .Q(\window_pixels_reg[8][2]_srl28_n_0 ),
        .Q31(\NLW_window_pixels_reg[8][2]_srl28_Q31_UNCONNECTED ));
  (* srl_bus_name = "\window_generator_inst/window_pixels_reg[8] " *) 
  (* srl_name = "\window_generator_inst/window_pixels_reg[8][3]_srl28 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \window_pixels_reg[8][3]_srl28 
       (.A({1'b1,1'b1,1'b0,1'b1,1'b1}),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(\pixel_delay_reg[1][7] [3]),
        .Q(\window_pixels_reg[8][3]_srl28_n_0 ),
        .Q31(\NLW_window_pixels_reg[8][3]_srl28_Q31_UNCONNECTED ));
  (* srl_bus_name = "\window_generator_inst/window_pixels_reg[8] " *) 
  (* srl_name = "\window_generator_inst/window_pixels_reg[8][4]_srl28 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \window_pixels_reg[8][4]_srl28 
       (.A({1'b1,1'b1,1'b0,1'b1,1'b1}),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(\pixel_delay_reg[1][7] [4]),
        .Q(\window_pixels_reg[8][4]_srl28_n_0 ),
        .Q31(\NLW_window_pixels_reg[8][4]_srl28_Q31_UNCONNECTED ));
  (* srl_bus_name = "\window_generator_inst/window_pixels_reg[8] " *) 
  (* srl_name = "\window_generator_inst/window_pixels_reg[8][5]_srl28 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \window_pixels_reg[8][5]_srl28 
       (.A({1'b1,1'b1,1'b0,1'b1,1'b1}),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(\pixel_delay_reg[1][7] [5]),
        .Q(\window_pixels_reg[8][5]_srl28_n_0 ),
        .Q31(\NLW_window_pixels_reg[8][5]_srl28_Q31_UNCONNECTED ));
  (* srl_bus_name = "\window_generator_inst/window_pixels_reg[8] " *) 
  (* srl_name = "\window_generator_inst/window_pixels_reg[8][6]_srl28 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \window_pixels_reg[8][6]_srl28 
       (.A({1'b1,1'b1,1'b0,1'b1,1'b1}),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(\pixel_delay_reg[1][7] [6]),
        .Q(\window_pixels_reg[8][6]_srl28_n_0 ),
        .Q31(\NLW_window_pixels_reg[8][6]_srl28_Q31_UNCONNECTED ));
  (* srl_bus_name = "\window_generator_inst/window_pixels_reg[8] " *) 
  (* srl_name = "\window_generator_inst/window_pixels_reg[8][7]_srl28 " *) 
  SRLC32E #(
    .INIT(32'h00000000)) 
    \window_pixels_reg[8][7]_srl28 
       (.A({1'b1,1'b1,1'b0,1'b1,1'b1}),
        .CE(cnn_en_IBUF),
        .CLK(clk_IBUF_BUFG),
        .D(\pixel_delay_reg[1][7] [7]),
        .Q(\window_pixels_reg[8][7]_srl28_n_0 ),
        .Q31(\NLW_window_pixels_reg[8][7]_srl28_Q31_UNCONNECTED ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
