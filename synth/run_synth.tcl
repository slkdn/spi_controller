# =========================================================================
# 文件名: run_synth.tcl
# 描  述: Design Compiler 逻辑综合自动化脚本 (Nangate 45nm)
# =========================================================================

# 1. 库路径与文件定义
set LIB_DIR        "/proj/project/workarea/user37/spi_controller/lib/NanGate45-Synopsys-Enablement/db"
set DB_FILE        "NangateOpenCellLibrary_typical.db"

set search_path    [list . ../rtl $LIB_DIR]
set target_library [list $DB_FILE]
set link_library   [list * $DB_FILE]

# 2. 读入 RTL 文件
set hdlin_enable_sverilog_syntax true

analyze -format sverilog { \
    spi_clk_gen.sv \
    spi_master.sv \
    spi_slave.sv \
    spi_regs.sv \
    spi_controller_core.sv \
    spi_controller.sv \
}

# Synthesize the pad-independent core. The generic spi_controller wrapper is
# retained for simulation; ASIC integration should use technology I/O pads.
elaborate spi_controller_core
current_design spi_controller_core

check_design

# 3. 施加时序约束
source ./spi_controller.sdc
check_timing

# 4. 执行综合优化
# Generate Formality guidance for this exact synthesis run. Re-run DC after
# adding this command so the SVF corresponds to the emitted netlist.
set_svf ../output/spi_controller_core.svf
compile_ultra -no_autoungroup

# 5. 输出结果与报告
file mkdir ../output
file mkdir ../reports

write -format verilog -hierarchy -output ../output/spi_controller_core_netlist.v
write_sdc ../output/spi_controller_core_synth.sdc

report_timing -delay max -max_paths 20 -path full > ../reports/timing.rpt
report_area   > ../reports/area.rpt
report_power  > ../reports/power.rpt

exit
