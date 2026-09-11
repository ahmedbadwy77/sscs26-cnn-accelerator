# vivado -mode batch -source max_freq_sweep.tcl

set part xc7z020clg400-1

set sweep_dir [file dirname [file normalize [info script]]]
set project_dir [file dirname $sweep_dir]
set rtl_dir "$project_dir/rtl"

set csv_file "$sweep_dir/max_freq_results.csv"
set run_root "$sweep_dir/runs"

file mkdir $run_root

set configs {
    {3 32 0}
    {3 64 0}
    {5 32 0}
    {4 32 0}
    {7 32 0}
    {3 8 0}
    {3 32 1}
}

set kernel_counts {1 2 3}

# Fixed MAX-FREQ operating point
set max_freq_period 2.56
set max_freq_mhz 390.625

proc extract_first {text patterns} {
    foreach pattern $patterns {
        if {[regexp -nocase -- $pattern $text -> value]} {
            return $value
        }
    }

    return "NA"
}

proc get_file_text {filename} {
    if {![file exists $filename]} {
        return ""
    }

    set fp [open $filename r]
    set text [read $fp]
    close $fp

    return $text
}

proc parse_reports {run_dir target_period K fixed_fmax} {

    set util_file "$run_dir/utilization.rpt"
    set power_file "$run_dir/power.rpt"
    set timing_file "$run_dir/timing.rpt"
    set clocks_file "$run_dir/clocks.rpt"

    report_utilization -file $util_file
    report_power -file $power_file
    report_timing_summary -file $timing_file -delay_type max
    report_clocks -file $clocks_file

    set util_text [get_file_text $util_file]
    set power_text [get_file_text $power_file]
    set timing_text [get_file_text $timing_file]

    set dbg [open "$run_dir/report_extract_debug.txt" w]

    puts $dbg "============================================================"
    puts $dbg "TARGET PERIOD = $target_period ns"
    puts $dbg "FIXED FMAX    = $fixed_fmax MHz"
    puts $dbg "============================================================"

    puts $dbg ""
    puts $dbg "===== UTILIZATION REPORT ====="
    puts $dbg $util_text

    puts $dbg ""
    puts $dbg "===== POWER REPORT ====="
    puts $dbg $power_text

    puts $dbg ""
    puts $dbg "===== TIMING REPORT ====="
    puts $dbg $timing_text

    close $dbg

    # ----------------------------------------------------------
    # Resource extraction
    # ----------------------------------------------------------

    set lut [extract_first $util_text {
        {Slice LUTs\s+\|\s+([0-9]+)}
        {Slice LUTs[^0-9]*([0-9]+)}
    }]

    set ff [extract_first $util_text {
        {Slice Registers\s+\|\s+([0-9]+)}
        {Slice Registers[^0-9]*([0-9]+)}
    }]

    set dsp [extract_first $util_text {
        {DSPs\s+\|\s+([0-9]+)}
        {DSPs[^0-9]*([0-9]+)}
        {DSP48E1[^0-9]*([0-9]+)}
    }]

    set bram [extract_first $util_text {
        {Block RAM Tile\s+\|\s+([0-9]+)}
        {Block RAM Tile[^0-9]*([0-9]+)}
    }]

    # ----------------------------------------------------------
    # Power extraction
    # ----------------------------------------------------------

    set power [extract_first $power_text {
        {Total On-Chip Power\s*\(W\)\s*\|\s*([0-9.]+)}
        {Total On-Chip Power\s*\(W\)[^0-9]*([0-9.]+)}
    }]

    # ----------------------------------------------------------
    # WNS extraction
    # ----------------------------------------------------------

    set wns "NA"

    # Preferred method:
    # Extract WNS directly from the Design Timing Summary table.
    if {[regexp -nocase {
        Design Timing Summary.*?
        WNS\(ns\)[^\n]*\n
        [^\n]*\n
        [[:space:]]*([+\-]?[0-9]+(?:\.[0-9]+)?)
    } $timing_text -> wns_value]} {

        set wns $wns_value
    }

    # Fallback:
    # Extract the worst slack from Max Delay Paths.
    if {$wns eq "NA"} {

        if {[regexp -nocase {
            Slack\s+\(MET\)\s*:\s*([+\-]?[0-9]+(?:\.[0-9]+)?)\s*ns
        } $timing_text -> wns_value]} {

            set wns $wns_value
        }
    }

    # ----------------------------------------------------------
    # Fmax
    # ----------------------------------------------------------
    #
    # IMPORTANT:
    # Fmax is FIXED by the selected operating point.
    #
    # It is NOT calculated from WNS.
    #
    # 2.56 ns -> 390.625 MHz
    # ----------------------------------------------------------

    set fmax $fixed_fmax

    # ----------------------------------------------------------
    # FOM
    # ----------------------------------------------------------
    #
    # FOM = Throughput /
    #       [Power * (LUT + 50*DSP + 100*BRAM)]
    #
    # Throughput = K output pixels/cycle
    #
    # All results are evaluated at the fixed MAX-FREQ
    # operating point.
    # ----------------------------------------------------------

    set fom "NA"

    if {$power ne "NA" &&
        $lut ne "NA" &&
        $dsp ne "NA" &&
        $bram ne "NA"} {

        set denominator [expr {
            double($power) *
            (
                double($lut) +
                50.0 * double($dsp) +
                100.0 * double($bram)
            )
        }]

        if {$denominator > 0.0} {

            set fom [format "%.6f" \
                [expr {double($K) / $denominator}]]
        }
    }

    return [list $lut $ff $dsp $bram $power $wns $fmax $fom]
}

# --------------------------------------------------------------
# RTL files
# --------------------------------------------------------------

set rtl_files [list \
    "$rtl_dir/cnn_controller.v" \
    "$rtl_dir/kernel_coeff_memory.v" \
    "$rtl_dir/line_buffer.v" \
    "$rtl_dir/window_nxn.v" \
    "$rtl_dir/tree_nxn.v" \
    "$rtl_dir/output_stage.v" \
    "$rtl_dir/cnn_top.v"
]

# --------------------------------------------------------------
# CSV
# --------------------------------------------------------------

set csv [open $csv_file w]

puts $csv \
"Run,N,IMG_WIDTH,RELU_EN,NUM_KERNELS,TARGET_NS,MAX_FREQ_MHz,LUT,FF,DSP,BRAM,Power_W,WNS_ns,Fmax_MHz,FOM_MAX_FREQ"

flush $csv

# --------------------------------------------------------------
# Run count
# --------------------------------------------------------------

set run_count 0
set total_runs [expr {
    [llength $configs] * [llength $kernel_counts]
}]

puts "============================================================"
puts "CNN MAX-FREQ IMPLEMENTATION SWEEP"
puts "============================================================"
puts "Part            : $part"
puts "Target Period   : ${max_freq_period} ns"
puts "Fixed MAX FREQ  : ${max_freq_mhz} MHz"
puts "Total Runs      : $total_runs"
puts "============================================================"

# --------------------------------------------------------------
# Main sweep
# --------------------------------------------------------------

foreach cfg $configs {

    lassign $cfg N W R

    foreach K $kernel_counts {

        incr run_count

        set T $max_freq_period

        set run_name [format \
            "run_%02d_N%d_W%d_R%d_K%d_MAXFREQ" \
            $run_count $N $W $R $K]

        set run_dir "$run_root/$run_name"

        file mkdir $run_dir

        puts ""
        puts "------------------------------------------------------------"
        puts "RUN $run_count / $total_runs"
        puts "N=$N W=$W RELU=$R K=$K"
        puts "TARGET PERIOD=${T}ns"
        puts "MAX FREQ=${max_freq_mhz}MHz"
        puts "------------------------------------------------------------"

        # ------------------------------------------------------
        # Start clean
        # ------------------------------------------------------

        close_design -quiet

        # ------------------------------------------------------
        # Read RTL
        # ------------------------------------------------------

        read_verilog $rtl_files

        # ------------------------------------------------------
        # Synthesis
        # ------------------------------------------------------

        synth_design \
            -top cnn_top \
            -part $part \
            -generic "N=$N" \
            -generic "IMG_WIDTH=$W" \
            -generic "PIXEL_BITS=8" \
            -generic "RELU_EN=$R" \
            -generic "NUM_KERNELS=$K"

        # ------------------------------------------------------
        # Fixed MAX-FREQ clock
        # ------------------------------------------------------

        create_clock \
            -name sys_clk \
            -period $T \
            [get_ports clk]

        # ------------------------------------------------------
        # Save clock information
        # ------------------------------------------------------

        report_clocks \
            -file "$run_dir/clocks_pre_impl.rpt"

        # ------------------------------------------------------
        # Implementation
        # ------------------------------------------------------

        opt_design

        place_design

        phys_opt_design

        route_design

        # ------------------------------------------------------
        # Verify clock after implementation
        # ------------------------------------------------------

        report_clocks \
            -file "$run_dir/clocks.rpt"

        # ------------------------------------------------------
        # Extract reports
        # ------------------------------------------------------

        lassign [parse_reports \
            $run_dir \
            $T \
            $K \
            $max_freq_mhz] \
            lut ff dsp bram power wns fmax fom

        # ------------------------------------------------------
        # Print results
        # ------------------------------------------------------

        puts ""
        puts "RESULT:"
        puts "LUT        = $lut"
        puts "FF         = $ff"
        puts "DSP        = $dsp"
        puts "BRAM       = $bram"
        puts "Power      = ${power} W"
        puts "WNS        = ${wns} ns"
        puts "Fmax       = ${fmax} MHz"
        puts "FOM        = $fom"
        puts ""

        # ------------------------------------------------------
        # Save CSV
        # ------------------------------------------------------

        puts $csv \
            "$run_count,$N,$W,$R,$K,$T,$max_freq_mhz,$lut,$ff,$dsp,$bram,$power,$wns,$fmax,$fom"

        flush $csv

        close_design -quiet
    }
}

# --------------------------------------------------------------
# Finish
# --------------------------------------------------------------

close $csv

puts ""
puts "============================================================"
puts "SWEEP COMPLETED"
puts "============================================================"
puts "Completed Runs : $run_count / $total_runs"
puts "Target Period  : ${max_freq_period} ns"
puts "MAX FREQ       : ${max_freq_mhz} MHz"
puts "CSV            : $csv_file"
puts "============================================================"