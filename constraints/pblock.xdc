create_pblock pb_core
resize_pblock pb_core -add {SLICE_X82Y27:SLICE_X105Y62 DSP48_X0Y9:DSP48_X4Y25}

add_cells_to_pblock pb_core [get_cells -hier -filter {REF_NAME =~ "LUT*" || REF_NAME =~ "FD*" || REF_NAME =~ "SRL*" || REF_NAME =~ "MUXF*" || REF_NAME =~ "CARRY*" || REF_NAME =~ "DSP48E1"}]