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

vlog -work work +acc cnn_system.v
vlog -work work +acc cnn_system_tb.v

vsim -voptargs=+acc -gN=3 -gIMG_WIDTH=32 -gPIXEL_BITS=8 -gRELU_EN=1 work.cnn_system_tb

add wave -divider "SYSTEM"
add wave sim:/cnn_system_tb/clk
add wave sim:/cnn_system_tb/rst
add wave sim:/cnn_system_tb/start
add wave sim:/cnn_system_tb/busy
add wave sim:/cnn_system_tb/done
add wave sim:/cnn_system_tb/data_valid
add wave sim:/cnn_system_tb/output_data

add wave -divider "SYSTEM CONTROLLER"
add wave sim:/cnn_system_tb/dut/state
add wave sim:/cnn_system_tb/dut/kernel_loaded
add wave sim:/cnn_system_tb/dut/image_loaded
add wave sim:/cnn_system_tb/dut/kernel_stream_count
add wave sim:/cnn_system_tb/dut/image_stream_count
add wave sim:/cnn_system_tb/dut/output_count

add wave -divider "CNN CORE CONTROLLER"
add wave sim:/cnn_system_tb/dut/cnn_core/controller_inst/current_state
add wave sim:/cnn_system_tb/dut/cnn_core/controller_inst/compute_counter
add wave sim:/cnn_system_tb/dut/cnn_core/controller_inst/flush_counter
add wave sim:/cnn_system_tb/dut/cnn_core/controller_inst/kernel_finish
add wave sim:/cnn_system_tb/dut/cnn_core/controller_inst/line_en

add wave -divider "CNN DATAPATH"
add wave sim:/cnn_system_tb/dut/cnn_core/window_generator_inst/window_flat
add wave sim:/cnn_system_tb/dut/cnn_core/kernel_pipeline\[0\]/mac_pipeline_inst/mac_out
add wave sim:/cnn_system_tb/dut/cnn_core/kernel_pipeline\[0\]/mac_pipeline_inst/multiplication_result
add wave sim:/cnn_system_tb/dut/cnn_core/kernel_pipeline\[0\]/mac_pipeline_inst/accumulation_stage
add wave sim:/cnn_system_tb/dut/cnn_core/kernel_memory_inst/kernels_flat

run -all
