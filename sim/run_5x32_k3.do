if {[file exists work]} {
    vdel -lib work -all
}
vlib work
vmap work work

vlog -work work +acc ../rtl/cnn_top.v
vlog -work work +acc ../rtl/cnn_controller.v
vlog -work work +acc ../rtl/kernel_coeff_memory.v
vlog -work work +acc ../rtl/line_buffer.v
vlog -work work +acc ../rtl/window_nxn.v
vlog -work work +acc ../rtl/tree_nxn.v
vlog -work work +acc ../rtl/output_stage.v
vlog -work work +acc ../tb/cnn_top_tb.sv

vsim -voptargs=+acc work.cnn_top_tb -gIMG_WIDTH=32 -gRELU_EN=0 -gN=5 -gNUM_KERNELS=3 -gPIXEL_BITS=8

# ============================================================
# TOP LEVEL
# ============================================================
add wave -divider "TOP LEVEL"
add wave sim:/cnn_top_tb/clk
add wave sim:/cnn_top_tb/rst
add wave sim:/cnn_top_tb/cnn_en
add wave sim:/cnn_top_tb/kernel_rd_en
add wave sim:/cnn_top_tb/data_valid
add wave sim:/cnn_top_tb/out_pixel

# ============================================================
# CNN CONTROLLER
# ============================================================
add wave -divider "CNN CONTROLLER"
add wave sim:/cnn_top_tb/dut/controller_inst/current_state
add wave sim:/cnn_top_tb/dut/controller_inst/compute_counter
add wave sim:/cnn_top_tb/dut/controller_inst/flush_counter
add wave sim:/cnn_top_tb/dut/controller_inst/kernel_finish
add wave sim:/cnn_top_tb/dut/controller_inst/line_en

# ============================================================
# KERNEL MEMORY
# ============================================================
add wave -divider "KERNEL MEMORY"
add wave sim:/cnn_top_tb/dut/kernel_memory_inst/kernels_flat
add wave sim:/cnn_top_tb/dut/kernel_memory_inst/kernel_finish

# ============================================================
# WINDOW GENERATOR
# ============================================================
add wave -divider "WINDOW GENERATOR"
add wave sim:/cnn_top_tb/dut/window_generator_inst/window_flat

# ============================================================
# MAC DATAPATH
# Only kernel 0 internals are shown; additional kernels are
# represented by the shared packed mac_results bus above.
# ============================================================
add wave -divider "MAC DATAPATH"
add wave sim:/cnn_top_tb/dut/mac_results
add wave sim:/cnn_top_tb/dut/kernel_pipeline[0]/mac_pipeline_inst/mac_out
add wave -r sim:/cnn_top_tb/dut/kernel_pipeline[0]/mac_pipeline_inst/multiplication_result
add wave -r sim:/cnn_top_tb/dut/kernel_pipeline[0]/mac_pipeline_inst/accumulation_stage

# ============================================================
# OUTPUT
# ============================================================
add wave -divider "OUTPUT"
add wave sim:/cnn_top_tb/dut/kernel_pipeline[0]/output_stage_inst/output_pixel

run -all
