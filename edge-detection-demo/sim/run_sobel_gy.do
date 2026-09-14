# Sobel Gx regression (RELU=0) - 900 outputs checked against the Python golden file.
# Usage (from demo/sim):  vsim -c -do run_sobel_gx.do
transcript on

if {[file exists work]} {
    vdel -lib work -all
}
vlib work
vmap work work

vlog -work work +acc ../../rtl/cnn_controller.v
vlog -work work +acc ../../rtl/kernel_coeff_memory.v
vlog -work work +acc ../../rtl/line_buffer.v
vlog -work work +acc ../../rtl/window_nxn.v
vlog -work work +acc ../../rtl/tree_nxn.v
vlog -work work +acc ../../rtl/output_stage.v
vlog -work work +acc ../../rtl/cnn_top.v
vlog -work work +acc ../../system/cnn_system.v
vlog -work work +acc tb_sobel_demo.v

vsim -voptargs=+acc -gRELU_EN=0 work.tb_sobel_demo +kernel=kernel_gy.hex +expected=../expected/expected_sobel_gy.txt

add wave -divider "TOP LEVEL"
add wave sim:/tb_sobel_demo/clk
add wave sim:/tb_sobel_demo/rst
add wave sim:/tb_sobel_demo/start
add wave sim:/tb_sobel_demo/kernel_we
add wave sim:/tb_sobel_demo/kernel_data
add wave sim:/tb_sobel_demo/image_we
add wave sim:/tb_sobel_demo/image_data
add wave sim:/tb_sobel_demo/busy
add wave sim:/tb_sobel_demo/done
add wave sim:/tb_sobel_demo/data_valid
add wave sim:/tb_sobel_demo/output_data


add wave -divider "SYSTEM FSM"
add wave sim:/tb_sobel_demo/dut/state
add wave sim:/tb_sobel_demo/dut/kernel_loaded
add wave sim:/tb_sobel_demo/dut/image_loaded
add wave sim:/tb_sobel_demo/dut/cnn_en
add wave sim:/tb_sobel_demo/dut/kernel_rd_en

add wave -divider "CNN CONTROLLER"
add wave sim:/tb_sobel_demo/dut/cnn_core/controller_inst/current_state
add wave sim:/tb_sobel_demo/dut/cnn_core/controller_inst/compute_counter
add wave sim:/tb_sobel_demo/dut/cnn_core/controller_inst/flush_counter
add wave sim:/tb_sobel_demo/dut/cnn_core/controller_inst/kernel_finish
add wave sim:/tb_sobel_demo/dut/cnn_core/controller_inst/line_en

add wave -divider "KERNEL MEMORY"
add wave sim:/tb_sobel_demo/dut/cnn_core/kernel_memory_inst/kernels_flat
add wave sim:/tb_sobel_demo/dut/cnn_core/kernel_memory_inst/kernel_finish

add wave -divider "WINDOW GENERATOR"
add wave sim:/tb_sobel_demo/dut/cnn_core/window_generator_inst/window_flat

add wave -divider "MAC DATAPATH"
add wave sim:/tb_sobel_demo/dut/cnn_core/mac_results
add wave sim:/tb_sobel_demo/dut/cnn_core/kernel_pipeline[0]/mac_pipeline_inst/mac_out
add wave -r sim:/tb_sobel_demo/dut/cnn_core/kernel_pipeline[0]/mac_pipeline_inst/multiplication_result
add wave -r sim:/tb_sobel_demo/dut/cnn_core/kernel_pipeline[0]/mac_pipeline_inst/accumulation_stage


add wave -divider "OUTPUT"
add wave sim:/tb_sobel_demo/dut/cnn_core/kernel_pipeline[0]/output_stage_inst/output_pixel

run -all