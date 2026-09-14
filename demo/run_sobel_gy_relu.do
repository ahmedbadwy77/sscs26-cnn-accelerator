# Sobel Gy regression (RELU=1) - 900 outputs checked against the Python golden file.
# Usage:  vsim -c -do run_sobel_gy_relu.do      (or from the GUI:  do run_sobel_gy_relu.do)
transcript on

if {![file exists work]} { vlib work }
vmap work work

vlog -work work +acc ../rtl/cnn_controller.v
vlog -work work +acc ../rtl/kernel_coeff_memory.v
vlog -work work +acc ../rtl/line_buffer.v
vlog -work work +acc ../rtl/window_nxn.v
vlog -work work +acc ../rtl/tree_nxn.v
vlog -work work +acc ../rtl/output_stage.v
vlog -work work +acc ../rtl/cnn_top.v
vlog -work work +acc ../system/cnn_system.v
vlog -work work +acc tb_sobel_demo.v

vsim -voptargs=+acc -gRELU_EN=1 work.tb_sobel_demo +kernel=kernel_gy.hex +expected=expected_sobel_gy_relu.txt
run -all
