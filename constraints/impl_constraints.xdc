set_property IOSTANDARD LVCMOS18 [get_ports *]
set_property SLEW SLOW [get_ports {out_pixel[*]}]
set_property DRIVE 4 [get_ports {out_pixel[*]}]

create_clock -period 2.155 -name sys_clk -waveform {0.000 1.0775} [get_ports clk]

# False Paths for Asynchronous/Unconstrained I/O
set_false_path -from [get_ports -filter {NAME != "clk" && DIRECTION == "IN"}]
set_false_path -to [all_outputs]

set_property PACKAGE_PIN T5 [get_ports {in_pixel[7]}]
set_property PACKAGE_PIN U5 [get_ports {in_pixel[6]}]
set_property PACKAGE_PIN Y12 [get_ports {in_pixel[5]}]
set_property PACKAGE_PIN Y13 [get_ports {in_pixel[4]}]
set_property PACKAGE_PIN V11 [get_ports {in_pixel[3]}]
set_property PACKAGE_PIN V10 [get_ports {in_pixel[2]}]
set_property PACKAGE_PIN V6 [get_ports {in_pixel[1]}]
set_property PACKAGE_PIN W6 [get_ports {in_pixel[0]}]
set_property PACKAGE_PIN U20 [get_ports {out_pixel[19]}]
set_property PACKAGE_PIN V20 [get_ports {out_pixel[18]}]
set_property PACKAGE_PIN W20 [get_ports {out_pixel[17]}]
set_property PACKAGE_PIN Y18 [get_ports {out_pixel[16]}]
set_property PACKAGE_PIN Y19 [get_ports {out_pixel[15]}]
set_property PACKAGE_PIN V16 [get_ports {out_pixel[14]}]
set_property PACKAGE_PIN W16 [get_ports {out_pixel[13]}]
set_property PACKAGE_PIN R16 [get_ports {out_pixel[12]}]
set_property PACKAGE_PIN R17 [get_ports {out_pixel[11]}]
set_property PACKAGE_PIN T17 [get_ports {out_pixel[10]}]
set_property PACKAGE_PIN R18 [get_ports {out_pixel[9]}]
set_property PACKAGE_PIN V17 [get_ports {out_pixel[8]}]
set_property PACKAGE_PIN V18 [get_ports {out_pixel[7]}]
set_property PACKAGE_PIN W18 [get_ports {out_pixel[6]}]
set_property PACKAGE_PIN W19 [get_ports {out_pixel[5]}]
set_property PACKAGE_PIN N17 [get_ports {out_pixel[4]}]
set_property PACKAGE_PIN P18 [get_ports {out_pixel[3]}]
set_property PACKAGE_PIN P15 [get_ports {out_pixel[2]}]
set_property PACKAGE_PIN P16 [get_ports {out_pixel[1]}]
set_property PACKAGE_PIN T19 [get_ports {out_pixel[0]}]
set_property PACKAGE_PIN U7 [get_ports clk]
set_property PACKAGE_PIN Y11 [get_ports cnn_en]
set_property PACKAGE_PIN U9 [get_ports data_valid]
set_property PACKAGE_PIN W11 [get_ports kernel_rd_en]
set_property PACKAGE_PIN U8 [get_ports rst]



reset_switching_activity -all 
set_load 5.000 [all_outputs]
set_property LOAD 5 [get_ports data_valid]
set_property LOAD 5 [get_ports {out_pixel[0]}]
set_property LOAD 5 [get_ports {out_pixel[10]}]
set_property LOAD 5 [get_ports {out_pixel[11]}]
set_property LOAD 5 [get_ports {out_pixel[12]}]
set_property LOAD 5 [get_ports {out_pixel[13]}]
set_property LOAD 5 [get_ports {out_pixel[14]}]
set_property LOAD 5 [get_ports {out_pixel[15]}]
set_property LOAD 5 [get_ports {out_pixel[16]}]
set_property LOAD 5 [get_ports {out_pixel[17]}]
set_property LOAD 5 [get_ports {out_pixel[18]}]
set_property LOAD 5 [get_ports {out_pixel[19]}]
set_property LOAD 5 [get_ports {out_pixel[1]}]
set_property LOAD 5 [get_ports {out_pixel[2]}]
set_property LOAD 5 [get_ports {out_pixel[3]}]
set_property LOAD 5 [get_ports {out_pixel[4]}]
set_property LOAD 5 [get_ports {out_pixel[5]}]
set_property LOAD 5 [get_ports {out_pixel[6]}]
set_property LOAD 5 [get_ports {out_pixel[7]}]
set_property LOAD 5 [get_ports {out_pixel[8]}]
set_property LOAD 5 [get_ports {out_pixel[9]}]
set_operating_conditions -voltage {vccint 0.950}
set_operating_conditions -voltage {vccaux 1.710}
set_operating_conditions -voltage {vcco33 3.000}
set_operating_conditions -voltage {vcco25 2.380}
set_operating_conditions -voltage {vcco15 1.430}
set_operating_conditions -voltage {vcco135 1.300}
set_operating_conditions -voltage {vcco12 1.140}
set_operating_conditions -voltage {vccaux_io 1.710}
set_operating_conditions -voltage {vccbram 0.950}
set_operating_conditions -voltage {mgtavcc 0.950}
set_operating_conditions -voltage {mgtavtt 1.140}
set_operating_conditions -voltage {mgtvccaux 1.710}
set_operating_conditions -voltage {vccpint 0.950}
set_operating_conditions -voltage {vccpaux 1.710}
set_operating_conditions -voltage {vccpll 1.710}
set_operating_conditions -voltage {vcco_ddr 1.140}
set_operating_conditions -voltage {vcco_mio0 1.710}
set_operating_conditions -voltage {vcco_mio1 1.710}
set_operating_conditions -voltage {vccadc 1.710}


# ---- 1) coefficient distribution path (quasi-static during compute) ---------
set_multicycle_path -setup -from [get_cells -hier -filter {NAME =~ *kernel_memory_inst/kernel_coefficients_reg*}] 4
set_multicycle_path -hold -from [get_cells -hier -filter {NAME =~ *kernel_memory_inst/kernel_coefficients_reg*}] 3

# ---- 2) kernel-load counter -> DSP clock-enable only -----------------------
set_multicycle_path -setup -from [get_cells -hier -filter {NAME =~ *kernel_memory_inst/kernel_counter_reg*}] -to [get_cells -hier -filter {REF_NAME == DSP48E1}] 4
set_multicycle_path -hold -from [get_cells -hier -filter {NAME =~ *kernel_memory_inst/kernel_counter_reg*}] -to [get_cells -hier -filter {REF_NAME == DSP48E1}] 3

# ---- end relaxation ---------------------------------------------------------

