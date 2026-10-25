# RTL-to-gate equivalence for spi_controller_core.
# Run with: fm_shell -file formal/run_formality.tcl

set ROOT [file normalize [file join [file dirname [info script]] ..]]
set RTL_DIR [file join $ROOT rtl]
set OUT_DIR [file join $ROOT output]
set DB_FILE [file join $ROOT lib NanGate45-Synopsys-Enablement db NangateOpenCellLibrary_typical.db]
set SVF_FILE [file join $OUT_DIR spi_controller_core.svf]
set NETLIST [file join $OUT_DIR spi_controller_core_netlist.v]

# Use DC's automated setup and optimization guidance when available.
set_app_var synopsys_auto_setup true
if {![file exists $SVF_FILE]} {
    error "SVF not found: $SVF_FILE. Re-run DC with set_svf before compile_ultra."
}
set_svf $SVF_FILE

read_db -technology_library $DB_FILE

# Reference: the same RTL hierarchy and top used by synth/run_synth.tcl.
read_sverilog -container r -libname WORK [list \
    [file join $RTL_DIR spi_clk_gen.sv] \
    [file join $RTL_DIR spi_master.sv] \
    [file join $RTL_DIR spi_slave.sv] \
    [file join $RTL_DIR spi_regs.sv] \
    [file join $RTL_DIR spi_controller_core.sv] \
]
set_top r:/WORK/spi_controller_core

# Implementation: mapped gate-level netlist.
read_verilog -container i -libname WORK -netlist $NETLIST
set_top i:/WORK/spi_controller_core

match
report_matched_points
report_unmatched_points
verify
report_failing_points
report_aborted_points
