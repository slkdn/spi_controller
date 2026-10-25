# =========================================================================
# 文件名: spi_controller.sdc
# 描  述: APB-SPI 控制器时序约束文件 (面向 Nangate 45nm, 目标频率 100MHz)
# =========================================================================

# -------------------------------------------------------------------------
# 1. 定义主时钟 pclk (100MHz = 10ns 周期)
# -------------------------------------------------------------------------
create_clock -name pclk -period 10.0 [get_ports pclk]

# 设置时钟抖动与跳变时间 (非理想因素)
set_clock_uncertainty 0.3 [get_clocks pclk]
set_clock_transition  0.2 [get_clocks pclk]

# Reference master-mode SCLK: 25LC256 at 3.3 V supports up to 5 MHz.
# The RTL clamps clk_div to at least 20, so SCLK is at most 2.5 MHz
# (pclk / 40). This is the fastest supported clock and the setup corner.
# The SPI divider toggles SCLK every 20 pclk cycles at clk_div=20.
# Its first active edge is a rising edge after 20 cycles; model that phase so
# MOSI is checked against the following SPI sampling edge, not an artificial
# rising edge 10 ns after a pclk-launched MOSI transition.
create_generated_clock -name spi_master_sclk \
    -source [get_ports pclk] -edges {41 81 121} [get_ports spi_sclk_o]

# -------------------------------------------------------------------------
# 2. 设置输入延迟 (Input Delay)
# -------------------------------------------------------------------------
# 假设 APB 总线控制/数据信号在时钟周期的 40% (4ns) 时刻到达，留 6ns 内部运算。
# 只约束 APB 输入。SPI core 使用独立的 *_i / *_o / *_oe 端口；
# SPI MISO 按 25LC256、3.3 V 和 clk_div >= 20 的主模式参考约束。
set_input_delay 4.0 -clock pclk \
    [get_ports {psel penable pwrite paddr[*] pwdata[*]}]

# -------------------------------------------------------------------------
# 3. 设置输出延迟 (Output Delay) 与负载
# -------------------------------------------------------------------------
# 假设外部下游逻辑需要 4.0ns 的 Setup 时间
set_output_delay 4.0 -clock pclk \
    [get_ports {prdata[*] pready pslverr spi_sclk_o spi_cs_n_o spi_mosi_o \
                spi_miso_o spi_master_oe spi_miso_oe}]

# 25LC256 at 2.5V <= VCC < 4.5V: SI setup 20 ns. MOSI changes only at frame
# start and one pclk after each SCLK falling edge. Since SCLK is transaction-
# gated and can start at any pclk phase, a generated-clock output-delay check
# falsely treats the MOSI register as able to change on every pclk edge. Keep
# MOSI constrained to pclk above; verify the external 20 ns setup against the
# protocol waveform (at DIV=20 it has about 190 ns before the next SCLK rise).
# CS setup/hold is likewise enforced by the RTL start interval and hold counter.

# 25LC256 SO becomes valid no later than 100 ns after SCK falling edge.
# The board-delay allowance is currently 0 ns and must be updated for a real
# board. The controller samples MISO on pclk after detecting SCLK rising;
# at DIV=20 the corresponding sample is 21 pclk edges after SCLK falling.
set_input_delay -clock spi_master_sclk -clock_fall -max 100.0 \
    [get_ports spi_miso_i]
set_input_delay -clock spi_master_sclk -clock_fall -min 0.0 \
    [get_ports spi_miso_i]
set_multicycle_path 21 -setup -from [get_ports spi_miso_i] \
    -to [all_registers -data_pins]
set_multicycle_path 20 -hold -from [get_ports spi_miso_i] \
    -to [all_registers -data_pins]

# 设定输出引脚驱动负载电容 (0.05 pF 适合 45nm 标准单元扇出)
set_load 0.05 [all_outputs]

# 设定 APB 输入信号跳变过渡时间 (模拟外设驱动)
set_input_transition 0.2 \
    [get_ports {psel penable pwrite paddr[*] pwdata[*]}]

# SPI 输入端的过渡时间假设；此项不定义它们与 pclk 的时序关系。
set_input_transition 0.2 \
    [get_ports {spi_sclk_i spi_cs_n_i spi_mosi_i spi_miso_i}]

# -------------------------------------------------------------------------
# 4. 伪路径/伪时序控制 (False Path)
# -------------------------------------------------------------------------
# 异步复位信号不进行同步 Setup/Hold 校验
set_false_path -from [get_ports presetn]

# SPI slave-side pins are asynchronous inputs captured by the first stage of
# the slave synchronizers. Cut only paths launched at these external pins;
# paths between synchronizer stages remain timed by pclk.
set_false_path -from [get_ports {spi_sclk_i spi_cs_n_i spi_mosi_i}]

# -------------------------------------------------------------------------
# 5. SPI 端口时序
# 本约束用于 pad-independent core。主模式以最快支持的 SCLK 建模；
# 从模式 SPI 输入仍按异步输入处理。用于真实板级实现前，需加入实际板级
# 延迟，并按外部主机允许的 SCLK 速率验证从模式同步器。
