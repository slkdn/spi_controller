###################################################################

# Created by write_sdc on Fri Oct 16 00:49:27 2026

###################################################################
set sdc_version 2.1

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
set_load -pin_load 0.05 [get_ports {prdata[31]}]
set_load -pin_load 0.05 [get_ports {prdata[30]}]
set_load -pin_load 0.05 [get_ports {prdata[29]}]
set_load -pin_load 0.05 [get_ports {prdata[28]}]
set_load -pin_load 0.05 [get_ports {prdata[27]}]
set_load -pin_load 0.05 [get_ports {prdata[26]}]
set_load -pin_load 0.05 [get_ports {prdata[25]}]
set_load -pin_load 0.05 [get_ports {prdata[24]}]
set_load -pin_load 0.05 [get_ports {prdata[23]}]
set_load -pin_load 0.05 [get_ports {prdata[22]}]
set_load -pin_load 0.05 [get_ports {prdata[21]}]
set_load -pin_load 0.05 [get_ports {prdata[20]}]
set_load -pin_load 0.05 [get_ports {prdata[19]}]
set_load -pin_load 0.05 [get_ports {prdata[18]}]
set_load -pin_load 0.05 [get_ports {prdata[17]}]
set_load -pin_load 0.05 [get_ports {prdata[16]}]
set_load -pin_load 0.05 [get_ports {prdata[15]}]
set_load -pin_load 0.05 [get_ports {prdata[14]}]
set_load -pin_load 0.05 [get_ports {prdata[13]}]
set_load -pin_load 0.05 [get_ports {prdata[12]}]
set_load -pin_load 0.05 [get_ports {prdata[11]}]
set_load -pin_load 0.05 [get_ports {prdata[10]}]
set_load -pin_load 0.05 [get_ports {prdata[9]}]
set_load -pin_load 0.05 [get_ports {prdata[8]}]
set_load -pin_load 0.05 [get_ports {prdata[7]}]
set_load -pin_load 0.05 [get_ports {prdata[6]}]
set_load -pin_load 0.05 [get_ports {prdata[5]}]
set_load -pin_load 0.05 [get_ports {prdata[4]}]
set_load -pin_load 0.05 [get_ports {prdata[3]}]
set_load -pin_load 0.05 [get_ports {prdata[2]}]
set_load -pin_load 0.05 [get_ports {prdata[1]}]
set_load -pin_load 0.05 [get_ports {prdata[0]}]
set_load -pin_load 0.05 [get_ports pready]
set_load -pin_load 0.05 [get_ports pslverr]
set_load -pin_load 0.05 [get_ports spi_sclk_o]
set_load -pin_load 0.05 [get_ports spi_cs_n_o]
set_load -pin_load 0.05 [get_ports spi_mosi_o]
set_load -pin_load 0.05 [get_ports spi_miso_o]
set_load -pin_load 0.05 [get_ports spi_master_oe]
set_load -pin_load 0.05 [get_ports spi_miso_oe]
create_clock [get_ports pclk]  -period 10  -waveform {0 5}
set_clock_uncertainty 0.3  [get_clocks pclk]
set_clock_transition -max -rise 0.2 [get_clocks pclk]
set_clock_transition -max -fall 0.2 [get_clocks pclk]
set_clock_transition -min -rise 0.2 [get_clocks pclk]
set_clock_transition -min -fall 0.2 [get_clocks pclk]
create_generated_clock [get_ports spi_sclk_o]  -name spi_master_sclk  -source [get_ports pclk]  -edges {41 81 121}
set_input_delay -clock pclk  4  [get_ports psel]
set_input_delay -clock pclk  4  [get_ports penable]
set_input_delay -clock pclk  4  [get_ports pwrite]
set_input_delay -clock pclk  4  [get_ports {paddr[31]}]
set_input_delay -clock pclk  4  [get_ports {paddr[30]}]
set_input_delay -clock pclk  4  [get_ports {paddr[29]}]
set_input_delay -clock pclk  4  [get_ports {paddr[28]}]
set_input_delay -clock pclk  4  [get_ports {paddr[27]}]
set_input_delay -clock pclk  4  [get_ports {paddr[26]}]
set_input_delay -clock pclk  4  [get_ports {paddr[25]}]
set_input_delay -clock pclk  4  [get_ports {paddr[24]}]
set_input_delay -clock pclk  4  [get_ports {paddr[23]}]
set_input_delay -clock pclk  4  [get_ports {paddr[22]}]
set_input_delay -clock pclk  4  [get_ports {paddr[21]}]
set_input_delay -clock pclk  4  [get_ports {paddr[20]}]
set_input_delay -clock pclk  4  [get_ports {paddr[19]}]
set_input_delay -clock pclk  4  [get_ports {paddr[18]}]
set_input_delay -clock pclk  4  [get_ports {paddr[17]}]
set_input_delay -clock pclk  4  [get_ports {paddr[16]}]
set_input_delay -clock pclk  4  [get_ports {paddr[15]}]
set_input_delay -clock pclk  4  [get_ports {paddr[14]}]
set_input_delay -clock pclk  4  [get_ports {paddr[13]}]
set_input_delay -clock pclk  4  [get_ports {paddr[12]}]
set_input_delay -clock pclk  4  [get_ports {paddr[11]}]
set_input_delay -clock pclk  4  [get_ports {paddr[10]}]
set_input_delay -clock pclk  4  [get_ports {paddr[9]}]
set_input_delay -clock pclk  4  [get_ports {paddr[8]}]
set_input_delay -clock pclk  4  [get_ports {paddr[7]}]
set_input_delay -clock pclk  4  [get_ports {paddr[6]}]
set_input_delay -clock pclk  4  [get_ports {paddr[5]}]
set_input_delay -clock pclk  4  [get_ports {paddr[4]}]
set_input_delay -clock pclk  4  [get_ports {paddr[3]}]
set_input_delay -clock pclk  4  [get_ports {paddr[2]}]
set_input_delay -clock pclk  4  [get_ports {paddr[1]}]
set_input_delay -clock pclk  4  [get_ports {paddr[0]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[31]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[30]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[29]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[28]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[27]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[26]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[25]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[24]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[23]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[22]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[21]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[20]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[19]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[18]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[17]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[16]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[15]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[14]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[13]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[12]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[11]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[10]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[9]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[8]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[7]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[6]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[5]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[4]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[3]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[2]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[1]}]
set_input_delay -clock pclk  4  [get_ports {pwdata[0]}]
set_input_delay -clock spi_master_sclk  -clock_fall  -max 100  [get_ports spi_miso_i]
set_input_delay -clock spi_master_sclk  -clock_fall  -min 0  [get_ports spi_miso_i]
set_output_delay -clock pclk  4  [get_ports spi_sclk_o]
set_output_delay -clock pclk  4  [get_ports {prdata[31]}]
set_output_delay -clock pclk  4  [get_ports {prdata[30]}]
set_output_delay -clock pclk  4  [get_ports {prdata[29]}]
set_output_delay -clock pclk  4  [get_ports {prdata[28]}]
set_output_delay -clock pclk  4  [get_ports {prdata[27]}]
set_output_delay -clock pclk  4  [get_ports {prdata[26]}]
set_output_delay -clock pclk  4  [get_ports {prdata[25]}]
set_output_delay -clock pclk  4  [get_ports {prdata[24]}]
set_output_delay -clock pclk  4  [get_ports {prdata[23]}]
set_output_delay -clock pclk  4  [get_ports {prdata[22]}]
set_output_delay -clock pclk  4  [get_ports {prdata[21]}]
set_output_delay -clock pclk  4  [get_ports {prdata[20]}]
set_output_delay -clock pclk  4  [get_ports {prdata[19]}]
set_output_delay -clock pclk  4  [get_ports {prdata[18]}]
set_output_delay -clock pclk  4  [get_ports {prdata[17]}]
set_output_delay -clock pclk  4  [get_ports {prdata[16]}]
set_output_delay -clock pclk  4  [get_ports {prdata[15]}]
set_output_delay -clock pclk  4  [get_ports {prdata[14]}]
set_output_delay -clock pclk  4  [get_ports {prdata[13]}]
set_output_delay -clock pclk  4  [get_ports {prdata[12]}]
set_output_delay -clock pclk  4  [get_ports {prdata[11]}]
set_output_delay -clock pclk  4  [get_ports {prdata[10]}]
set_output_delay -clock pclk  4  [get_ports {prdata[9]}]
set_output_delay -clock pclk  4  [get_ports {prdata[8]}]
set_output_delay -clock pclk  4  [get_ports {prdata[7]}]
set_output_delay -clock pclk  4  [get_ports {prdata[6]}]
set_output_delay -clock pclk  4  [get_ports {prdata[5]}]
set_output_delay -clock pclk  4  [get_ports {prdata[4]}]
set_output_delay -clock pclk  4  [get_ports {prdata[3]}]
set_output_delay -clock pclk  4  [get_ports {prdata[2]}]
set_output_delay -clock pclk  4  [get_ports {prdata[1]}]
set_output_delay -clock pclk  4  [get_ports {prdata[0]}]
set_output_delay -clock pclk  4  [get_ports pready]
set_output_delay -clock pclk  4  [get_ports pslverr]
set_output_delay -clock pclk  4  [get_ports spi_cs_n_o]
set_output_delay -clock pclk  4  [get_ports spi_mosi_o]
set_output_delay -clock pclk  4  [get_ports spi_miso_o]
set_output_delay -clock pclk  4  [get_ports spi_master_oe]
set_output_delay -clock pclk  4  [get_ports spi_miso_oe]
set_input_transition -max 0.2  [get_ports psel]
set_input_transition -min 0.2  [get_ports psel]
set_input_transition -max 0.2  [get_ports penable]
set_input_transition -min 0.2  [get_ports penable]
set_input_transition -max 0.2  [get_ports pwrite]
set_input_transition -min 0.2  [get_ports pwrite]
set_input_transition -max 0.2  [get_ports {paddr[31]}]
set_input_transition -min 0.2  [get_ports {paddr[31]}]
set_input_transition -max 0.2  [get_ports {paddr[30]}]
set_input_transition -min 0.2  [get_ports {paddr[30]}]
set_input_transition -max 0.2  [get_ports {paddr[29]}]
set_input_transition -min 0.2  [get_ports {paddr[29]}]
set_input_transition -max 0.2  [get_ports {paddr[28]}]
set_input_transition -min 0.2  [get_ports {paddr[28]}]
set_input_transition -max 0.2  [get_ports {paddr[27]}]
set_input_transition -min 0.2  [get_ports {paddr[27]}]
set_input_transition -max 0.2  [get_ports {paddr[26]}]
set_input_transition -min 0.2  [get_ports {paddr[26]}]
set_input_transition -max 0.2  [get_ports {paddr[25]}]
set_input_transition -min 0.2  [get_ports {paddr[25]}]
set_input_transition -max 0.2  [get_ports {paddr[24]}]
set_input_transition -min 0.2  [get_ports {paddr[24]}]
set_input_transition -max 0.2  [get_ports {paddr[23]}]
set_input_transition -min 0.2  [get_ports {paddr[23]}]
set_input_transition -max 0.2  [get_ports {paddr[22]}]
set_input_transition -min 0.2  [get_ports {paddr[22]}]
set_input_transition -max 0.2  [get_ports {paddr[21]}]
set_input_transition -min 0.2  [get_ports {paddr[21]}]
set_input_transition -max 0.2  [get_ports {paddr[20]}]
set_input_transition -min 0.2  [get_ports {paddr[20]}]
set_input_transition -max 0.2  [get_ports {paddr[19]}]
set_input_transition -min 0.2  [get_ports {paddr[19]}]
set_input_transition -max 0.2  [get_ports {paddr[18]}]
set_input_transition -min 0.2  [get_ports {paddr[18]}]
set_input_transition -max 0.2  [get_ports {paddr[17]}]
set_input_transition -min 0.2  [get_ports {paddr[17]}]
set_input_transition -max 0.2  [get_ports {paddr[16]}]
set_input_transition -min 0.2  [get_ports {paddr[16]}]
set_input_transition -max 0.2  [get_ports {paddr[15]}]
set_input_transition -min 0.2  [get_ports {paddr[15]}]
set_input_transition -max 0.2  [get_ports {paddr[14]}]
set_input_transition -min 0.2  [get_ports {paddr[14]}]
set_input_transition -max 0.2  [get_ports {paddr[13]}]
set_input_transition -min 0.2  [get_ports {paddr[13]}]
set_input_transition -max 0.2  [get_ports {paddr[12]}]
set_input_transition -min 0.2  [get_ports {paddr[12]}]
set_input_transition -max 0.2  [get_ports {paddr[11]}]
set_input_transition -min 0.2  [get_ports {paddr[11]}]
set_input_transition -max 0.2  [get_ports {paddr[10]}]
set_input_transition -min 0.2  [get_ports {paddr[10]}]
set_input_transition -max 0.2  [get_ports {paddr[9]}]
set_input_transition -min 0.2  [get_ports {paddr[9]}]
set_input_transition -max 0.2  [get_ports {paddr[8]}]
set_input_transition -min 0.2  [get_ports {paddr[8]}]
set_input_transition -max 0.2  [get_ports {paddr[7]}]
set_input_transition -min 0.2  [get_ports {paddr[7]}]
set_input_transition -max 0.2  [get_ports {paddr[6]}]
set_input_transition -min 0.2  [get_ports {paddr[6]}]
set_input_transition -max 0.2  [get_ports {paddr[5]}]
set_input_transition -min 0.2  [get_ports {paddr[5]}]
set_input_transition -max 0.2  [get_ports {paddr[4]}]
set_input_transition -min 0.2  [get_ports {paddr[4]}]
set_input_transition -max 0.2  [get_ports {paddr[3]}]
set_input_transition -min 0.2  [get_ports {paddr[3]}]
set_input_transition -max 0.2  [get_ports {paddr[2]}]
set_input_transition -min 0.2  [get_ports {paddr[2]}]
set_input_transition -max 0.2  [get_ports {paddr[1]}]
set_input_transition -min 0.2  [get_ports {paddr[1]}]
set_input_transition -max 0.2  [get_ports {paddr[0]}]
set_input_transition -min 0.2  [get_ports {paddr[0]}]
set_input_transition -max 0.2  [get_ports {pwdata[31]}]
set_input_transition -min 0.2  [get_ports {pwdata[31]}]
set_input_transition -max 0.2  [get_ports {pwdata[30]}]
set_input_transition -min 0.2  [get_ports {pwdata[30]}]
set_input_transition -max 0.2  [get_ports {pwdata[29]}]
set_input_transition -min 0.2  [get_ports {pwdata[29]}]
set_input_transition -max 0.2  [get_ports {pwdata[28]}]
set_input_transition -min 0.2  [get_ports {pwdata[28]}]
set_input_transition -max 0.2  [get_ports {pwdata[27]}]
set_input_transition -min 0.2  [get_ports {pwdata[27]}]
set_input_transition -max 0.2  [get_ports {pwdata[26]}]
set_input_transition -min 0.2  [get_ports {pwdata[26]}]
set_input_transition -max 0.2  [get_ports {pwdata[25]}]
set_input_transition -min 0.2  [get_ports {pwdata[25]}]
set_input_transition -max 0.2  [get_ports {pwdata[24]}]
set_input_transition -min 0.2  [get_ports {pwdata[24]}]
set_input_transition -max 0.2  [get_ports {pwdata[23]}]
set_input_transition -min 0.2  [get_ports {pwdata[23]}]
set_input_transition -max 0.2  [get_ports {pwdata[22]}]
set_input_transition -min 0.2  [get_ports {pwdata[22]}]
set_input_transition -max 0.2  [get_ports {pwdata[21]}]
set_input_transition -min 0.2  [get_ports {pwdata[21]}]
set_input_transition -max 0.2  [get_ports {pwdata[20]}]
set_input_transition -min 0.2  [get_ports {pwdata[20]}]
set_input_transition -max 0.2  [get_ports {pwdata[19]}]
set_input_transition -min 0.2  [get_ports {pwdata[19]}]
set_input_transition -max 0.2  [get_ports {pwdata[18]}]
set_input_transition -min 0.2  [get_ports {pwdata[18]}]
set_input_transition -max 0.2  [get_ports {pwdata[17]}]
set_input_transition -min 0.2  [get_ports {pwdata[17]}]
set_input_transition -max 0.2  [get_ports {pwdata[16]}]
set_input_transition -min 0.2  [get_ports {pwdata[16]}]
set_input_transition -max 0.2  [get_ports {pwdata[15]}]
set_input_transition -min 0.2  [get_ports {pwdata[15]}]
set_input_transition -max 0.2  [get_ports {pwdata[14]}]
set_input_transition -min 0.2  [get_ports {pwdata[14]}]
set_input_transition -max 0.2  [get_ports {pwdata[13]}]
set_input_transition -min 0.2  [get_ports {pwdata[13]}]
set_input_transition -max 0.2  [get_ports {pwdata[12]}]
set_input_transition -min 0.2  [get_ports {pwdata[12]}]
set_input_transition -max 0.2  [get_ports {pwdata[11]}]
set_input_transition -min 0.2  [get_ports {pwdata[11]}]
set_input_transition -max 0.2  [get_ports {pwdata[10]}]
set_input_transition -min 0.2  [get_ports {pwdata[10]}]
set_input_transition -max 0.2  [get_ports {pwdata[9]}]
set_input_transition -min 0.2  [get_ports {pwdata[9]}]
set_input_transition -max 0.2  [get_ports {pwdata[8]}]
set_input_transition -min 0.2  [get_ports {pwdata[8]}]
set_input_transition -max 0.2  [get_ports {pwdata[7]}]
set_input_transition -min 0.2  [get_ports {pwdata[7]}]
set_input_transition -max 0.2  [get_ports {pwdata[6]}]
set_input_transition -min 0.2  [get_ports {pwdata[6]}]
set_input_transition -max 0.2  [get_ports {pwdata[5]}]
set_input_transition -min 0.2  [get_ports {pwdata[5]}]
set_input_transition -max 0.2  [get_ports {pwdata[4]}]
set_input_transition -min 0.2  [get_ports {pwdata[4]}]
set_input_transition -max 0.2  [get_ports {pwdata[3]}]
set_input_transition -min 0.2  [get_ports {pwdata[3]}]
set_input_transition -max 0.2  [get_ports {pwdata[2]}]
set_input_transition -min 0.2  [get_ports {pwdata[2]}]
set_input_transition -max 0.2  [get_ports {pwdata[1]}]
set_input_transition -min 0.2  [get_ports {pwdata[1]}]
set_input_transition -max 0.2  [get_ports {pwdata[0]}]
set_input_transition -min 0.2  [get_ports {pwdata[0]}]
set_input_transition -max 0.2  [get_ports spi_sclk_i]
set_input_transition -min 0.2  [get_ports spi_sclk_i]
set_input_transition -max 0.2  [get_ports spi_cs_n_i]
set_input_transition -min 0.2  [get_ports spi_cs_n_i]
set_input_transition -max 0.2  [get_ports spi_mosi_i]
set_input_transition -min 0.2  [get_ports spi_mosi_i]
set_input_transition -max 0.2  [get_ports spi_miso_i]
set_input_transition -min 0.2  [get_ports spi_miso_i]
set_multicycle_path 20 -hold -from [get_ports spi_miso_i] -to [list [get_pins  \
u_spi_slave/miso_reg/D] [get_pins u_spi_slave/rx_valid_reg/D] [get_pins        \
{u_spi_slave/rx_data_reg[0]/D}] [get_pins {u_spi_slave/rx_data_reg[1]/D}]      \
[get_pins {u_spi_slave/rx_data_reg[2]/D}] [get_pins                            \
{u_spi_slave/rx_data_reg[3]/D}] [get_pins {u_spi_slave/rx_data_reg[4]/D}]      \
[get_pins {u_spi_slave/rx_data_reg[5]/D}] [get_pins                            \
{u_spi_slave/rx_data_reg[6]/D}] [get_pins {u_spi_slave/rx_data_reg[7]/D}]      \
[get_pins {u_spi_slave/rx_data_reg[8]/D}] [get_pins                            \
{u_spi_slave/rx_data_reg[9]/D}] [get_pins {u_spi_slave/rx_data_reg[10]/D}]     \
[get_pins {u_spi_slave/rx_data_reg[11]/D}] [get_pins                           \
{u_spi_slave/rx_data_reg[12]/D}] [get_pins {u_spi_slave/rx_data_reg[13]/D}]    \
[get_pins {u_spi_slave/rx_data_reg[14]/D}] [get_pins                           \
{u_spi_slave/rx_data_reg[15]/D}] [get_pins {u_spi_slave/bit_cnt_reg[0]/D}]     \
[get_pins {u_spi_slave/bit_cnt_reg[1]/D}] [get_pins                            \
{u_spi_slave/bit_cnt_reg[2]/D}] [get_pins {u_spi_slave/bit_cnt_reg[3]/D}]      \
[get_pins {u_spi_slave/tx_shift_reg_reg[0]/D}] [get_pins                       \
{u_spi_slave/tx_shift_reg_reg[1]/D}] [get_pins                                 \
{u_spi_slave/tx_shift_reg_reg[2]/D}] [get_pins                                 \
{u_spi_slave/tx_shift_reg_reg[3]/D}] [get_pins                                 \
{u_spi_slave/tx_shift_reg_reg[4]/D}] [get_pins                                 \
{u_spi_slave/tx_shift_reg_reg[5]/D}] [get_pins                                 \
{u_spi_slave/tx_shift_reg_reg[6]/D}] [get_pins                                 \
{u_spi_slave/tx_shift_reg_reg[7]/D}] [get_pins                                 \
{u_spi_slave/tx_shift_reg_reg[8]/D}] [get_pins                                 \
{u_spi_slave/tx_shift_reg_reg[9]/D}] [get_pins                                 \
{u_spi_slave/tx_shift_reg_reg[10]/D}] [get_pins                                \
{u_spi_slave/tx_shift_reg_reg[11]/D}] [get_pins                                \
{u_spi_slave/tx_shift_reg_reg[12]/D}] [get_pins                                \
{u_spi_slave/tx_shift_reg_reg[13]/D}] [get_pins                                \
{u_spi_slave/tx_shift_reg_reg[14]/D}] [get_pins                                \
{u_spi_slave/rx_shift_reg_reg[0]/D}] [get_pins                                 \
{u_spi_slave/rx_shift_reg_reg[1]/D}] [get_pins                                 \
{u_spi_slave/rx_shift_reg_reg[2]/D}] [get_pins                                 \
{u_spi_slave/rx_shift_reg_reg[3]/D}] [get_pins                                 \
{u_spi_slave/rx_shift_reg_reg[4]/D}] [get_pins                                 \
{u_spi_slave/rx_shift_reg_reg[5]/D}] [get_pins                                 \
{u_spi_slave/rx_shift_reg_reg[6]/D}] [get_pins                                 \
{u_spi_slave/rx_shift_reg_reg[7]/D}] [get_pins                                 \
{u_spi_slave/rx_shift_reg_reg[8]/D}] [get_pins                                 \
{u_spi_slave/rx_shift_reg_reg[9]/D}] [get_pins                                 \
{u_spi_slave/rx_shift_reg_reg[10]/D}] [get_pins                                \
{u_spi_slave/rx_shift_reg_reg[11]/D}] [get_pins                                \
{u_spi_slave/rx_shift_reg_reg[12]/D}] [get_pins                                \
{u_spi_slave/rx_shift_reg_reg[13]/D}] [get_pins                                \
{u_spi_slave/rx_shift_reg_reg[14]/D}] [get_pins u_spi_slave/miso_oe_reg/D]     \
[get_pins {u_spi_slave/cs_n_sync_reg[0]/D}] [get_pins                          \
{u_spi_slave/cs_n_sync_reg[1]/D}] [get_pins {u_spi_slave/cs_n_sync_reg[2]/D}]  \
[get_pins {u_spi_slave/sclk_sync_reg[0]/D}] [get_pins                          \
{u_spi_slave/sclk_sync_reg[1]/D}] [get_pins {u_spi_slave/sclk_sync_reg[2]/D}]  \
[get_pins {u_spi_slave/mosi_sync_reg[0]/D}] [get_pins                          \
{u_spi_slave/mosi_sync_reg[1]/D}] [get_pins u_spi_master/busy_reg/D] [get_pins \
{u_spi_master/rx_data_reg[0]/D}] [get_pins {u_spi_master/rx_data_reg[1]/D}]    \
[get_pins {u_spi_master/rx_data_reg[2]/D}] [get_pins                           \
{u_spi_master/rx_data_reg[3]/D}] [get_pins {u_spi_master/rx_data_reg[4]/D}]    \
[get_pins {u_spi_master/rx_data_reg[5]/D}] [get_pins                           \
{u_spi_master/rx_data_reg[6]/D}] [get_pins {u_spi_master/rx_data_reg[7]/D}]    \
[get_pins {u_spi_master/rx_data_reg[8]/D}] [get_pins                           \
{u_spi_master/rx_data_reg[9]/D}] [get_pins {u_spi_master/rx_data_reg[10]/D}]   \
[get_pins {u_spi_master/rx_data_reg[11]/D}] [get_pins                          \
{u_spi_master/rx_data_reg[12]/D}] [get_pins {u_spi_master/rx_data_reg[13]/D}]  \
[get_pins {u_spi_master/rx_data_reg[14]/D}] [get_pins                          \
{u_spi_master/rx_data_reg[15]/D}] [get_pins u_spi_master/cs_n_reg/D] [get_pins \
u_spi_master/mosi_reg/D] [get_pins {u_spi_master/cs_hold_cnt_reg[0]/D}]        \
[get_pins {u_spi_master/cs_hold_cnt_reg[1]/D}] [get_pins                       \
{u_spi_master/cs_hold_cnt_reg[2]/D}] [get_pins                                 \
{u_spi_master/cs_hold_cnt_reg[3]/D}] [get_pins                                 \
{u_spi_master/cs_hold_cnt_reg[4]/D}] [get_pins                                 \
u_spi_master/cs_hold_active_reg/D] [get_pins                                   \
{u_spi_master/active_clk_div_reg[0]/D}] [get_pins                              \
{u_spi_master/active_clk_div_reg[1]/D}] [get_pins                              \
{u_spi_master/active_clk_div_reg[2]/D}] [get_pins                              \
{u_spi_master/active_clk_div_reg[3]/D}] [get_pins                              \
{u_spi_master/active_clk_div_reg[4]/D}] [get_pins                              \
{u_spi_master/active_clk_div_reg[5]/D}] [get_pins                              \
{u_spi_master/active_clk_div_reg[6]/D}] [get_pins                              \
{u_spi_master/active_clk_div_reg[7]/D}] [get_pins                              \
u_spi_master/spi_clk_d_reg/D] [get_pins u_spi_master/spi_clk_en_reg/D]         \
[get_pins {u_spi_master/bit_cnt_reg[0]/D}] [get_pins                           \
{u_spi_master/bit_cnt_reg[1]/D}] [get_pins {u_spi_master/bit_cnt_reg[2]/D}]    \
[get_pins {u_spi_master/bit_cnt_reg[3]/D}] [get_pins                           \
{u_spi_master/rx_shift_reg_reg[0]/D}] [get_pins                                \
{u_spi_master/rx_shift_reg_reg[1]/D}] [get_pins                                \
{u_spi_master/rx_shift_reg_reg[2]/D}] [get_pins                                \
{u_spi_master/rx_shift_reg_reg[3]/D}] [get_pins                                \
{u_spi_master/rx_shift_reg_reg[4]/D}] [get_pins                                \
{u_spi_master/rx_shift_reg_reg[5]/D}] [get_pins                                \
{u_spi_master/rx_shift_reg_reg[6]/D}] [get_pins                                \
{u_spi_master/rx_shift_reg_reg[7]/D}] [get_pins                                \
{u_spi_master/rx_shift_reg_reg[8]/D}] [get_pins                                \
{u_spi_master/rx_shift_reg_reg[9]/D}] [get_pins                                \
{u_spi_master/rx_shift_reg_reg[10]/D}] [get_pins                               \
{u_spi_master/rx_shift_reg_reg[11]/D}] [get_pins                               \
{u_spi_master/rx_shift_reg_reg[12]/D}] [get_pins                               \
{u_spi_master/rx_shift_reg_reg[13]/D}] [get_pins                               \
{u_spi_master/rx_shift_reg_reg[14]/D}] [get_pins                               \
{u_spi_master/rx_shift_reg_reg[15]/D}] [get_pins                               \
{u_spi_master/tx_shift_reg_reg[0]/D}] [get_pins                                \
{u_spi_master/tx_shift_reg_reg[1]/D}] [get_pins                                \
{u_spi_master/tx_shift_reg_reg[2]/D}] [get_pins                                \
{u_spi_master/tx_shift_reg_reg[3]/D}] [get_pins                                \
{u_spi_master/tx_shift_reg_reg[4]/D}] [get_pins                                \
{u_spi_master/tx_shift_reg_reg[5]/D}] [get_pins                                \
{u_spi_master/tx_shift_reg_reg[6]/D}] [get_pins                                \
{u_spi_master/tx_shift_reg_reg[7]/D}] [get_pins                                \
{u_spi_master/tx_shift_reg_reg[8]/D}] [get_pins                                \
{u_spi_master/tx_shift_reg_reg[9]/D}] [get_pins                                \
{u_spi_master/tx_shift_reg_reg[10]/D}] [get_pins                               \
{u_spi_master/tx_shift_reg_reg[11]/D}] [get_pins                               \
{u_spi_master/tx_shift_reg_reg[12]/D}] [get_pins                               \
{u_spi_master/tx_shift_reg_reg[13]/D}] [get_pins                               \
{u_spi_master/tx_shift_reg_reg[14]/D}] [get_pins u_spi_master/done_reg/D]      \
[get_pins {u_spi_master/u_spi_clk_gen/div_cnt_reg[0]/D}] [get_pins             \
{u_spi_master/u_spi_clk_gen/div_cnt_reg[1]/D}] [get_pins                       \
{u_spi_master/u_spi_clk_gen/div_cnt_reg[2]/D}] [get_pins                       \
{u_spi_master/u_spi_clk_gen/div_cnt_reg[3]/D}] [get_pins                       \
{u_spi_master/u_spi_clk_gen/div_cnt_reg[4]/D}] [get_pins                       \
{u_spi_master/u_spi_clk_gen/div_cnt_reg[5]/D}] [get_pins                       \
{u_spi_master/u_spi_clk_gen/div_cnt_reg[6]/D}] [get_pins                       \
{u_spi_master/u_spi_clk_gen/div_cnt_reg[7]/D}] [get_pins                       \
u_spi_master/u_spi_clk_gen/spi_clk_reg/D] [get_pins                            \
{u_spi_regs/reg_tx_data_reg[0]/D}] [get_pins                                   \
{u_spi_regs/reg_tx_data_reg[1]/D}] [get_pins                                   \
{u_spi_regs/reg_tx_data_reg[2]/D}] [get_pins                                   \
{u_spi_regs/reg_tx_data_reg[3]/D}] [get_pins                                   \
{u_spi_regs/reg_tx_data_reg[4]/D}] [get_pins                                   \
{u_spi_regs/reg_tx_data_reg[5]/D}] [get_pins                                   \
{u_spi_regs/reg_tx_data_reg[6]/D}] [get_pins                                   \
{u_spi_regs/reg_tx_data_reg[7]/D}] [get_pins                                   \
{u_spi_regs/reg_tx_data_reg[8]/D}] [get_pins                                   \
{u_spi_regs/reg_tx_data_reg[9]/D}] [get_pins                                   \
{u_spi_regs/reg_tx_data_reg[10]/D}] [get_pins                                  \
{u_spi_regs/reg_tx_data_reg[11]/D}] [get_pins                                  \
{u_spi_regs/reg_tx_data_reg[12]/D}] [get_pins                                  \
{u_spi_regs/reg_tx_data_reg[13]/D}] [get_pins                                  \
{u_spi_regs/reg_tx_data_reg[14]/D}] [get_pins                                  \
{u_spi_regs/reg_tx_data_reg[15]/D}] [get_pins                                  \
{u_spi_regs/reg_clk_div_reg[0]/D}] [get_pins                                   \
{u_spi_regs/reg_clk_div_reg[1]/D}] [get_pins                                   \
{u_spi_regs/reg_clk_div_reg[2]/D}] [get_pins                                   \
{u_spi_regs/reg_clk_div_reg[3]/D}] [get_pins                                   \
{u_spi_regs/reg_clk_div_reg[4]/D}] [get_pins                                   \
{u_spi_regs/reg_clk_div_reg[5]/D}] [get_pins                                   \
{u_spi_regs/reg_clk_div_reg[6]/D}] [get_pins                                   \
{u_spi_regs/reg_clk_div_reg[7]/D}] [get_pins u_spi_regs/reg_master_en_reg/D]   \
[get_pins u_spi_regs/reg_start_reg/D]]
set_multicycle_path 21 -setup -from [get_ports spi_miso_i] -to [list [get_pins \
u_spi_slave/miso_reg/D] [get_pins u_spi_slave/rx_valid_reg/D] [get_pins        \
{u_spi_slave/rx_data_reg[0]/D}] [get_pins {u_spi_slave/rx_data_reg[1]/D}]      \
[get_pins {u_spi_slave/rx_data_reg[2]/D}] [get_pins                            \
{u_spi_slave/rx_data_reg[3]/D}] [get_pins {u_spi_slave/rx_data_reg[4]/D}]      \
[get_pins {u_spi_slave/rx_data_reg[5]/D}] [get_pins                            \
{u_spi_slave/rx_data_reg[6]/D}] [get_pins {u_spi_slave/rx_data_reg[7]/D}]      \
[get_pins {u_spi_slave/rx_data_reg[8]/D}] [get_pins                            \
{u_spi_slave/rx_data_reg[9]/D}] [get_pins {u_spi_slave/rx_data_reg[10]/D}]     \
[get_pins {u_spi_slave/rx_data_reg[11]/D}] [get_pins                           \
{u_spi_slave/rx_data_reg[12]/D}] [get_pins {u_spi_slave/rx_data_reg[13]/D}]    \
[get_pins {u_spi_slave/rx_data_reg[14]/D}] [get_pins                           \
{u_spi_slave/rx_data_reg[15]/D}] [get_pins {u_spi_slave/bit_cnt_reg[0]/D}]     \
[get_pins {u_spi_slave/bit_cnt_reg[1]/D}] [get_pins                            \
{u_spi_slave/bit_cnt_reg[2]/D}] [get_pins {u_spi_slave/bit_cnt_reg[3]/D}]      \
[get_pins {u_spi_slave/tx_shift_reg_reg[0]/D}] [get_pins                       \
{u_spi_slave/tx_shift_reg_reg[1]/D}] [get_pins                                 \
{u_spi_slave/tx_shift_reg_reg[2]/D}] [get_pins                                 \
{u_spi_slave/tx_shift_reg_reg[3]/D}] [get_pins                                 \
{u_spi_slave/tx_shift_reg_reg[4]/D}] [get_pins                                 \
{u_spi_slave/tx_shift_reg_reg[5]/D}] [get_pins                                 \
{u_spi_slave/tx_shift_reg_reg[6]/D}] [get_pins                                 \
{u_spi_slave/tx_shift_reg_reg[7]/D}] [get_pins                                 \
{u_spi_slave/tx_shift_reg_reg[8]/D}] [get_pins                                 \
{u_spi_slave/tx_shift_reg_reg[9]/D}] [get_pins                                 \
{u_spi_slave/tx_shift_reg_reg[10]/D}] [get_pins                                \
{u_spi_slave/tx_shift_reg_reg[11]/D}] [get_pins                                \
{u_spi_slave/tx_shift_reg_reg[12]/D}] [get_pins                                \
{u_spi_slave/tx_shift_reg_reg[13]/D}] [get_pins                                \
{u_spi_slave/tx_shift_reg_reg[14]/D}] [get_pins                                \
{u_spi_slave/rx_shift_reg_reg[0]/D}] [get_pins                                 \
{u_spi_slave/rx_shift_reg_reg[1]/D}] [get_pins                                 \
{u_spi_slave/rx_shift_reg_reg[2]/D}] [get_pins                                 \
{u_spi_slave/rx_shift_reg_reg[3]/D}] [get_pins                                 \
{u_spi_slave/rx_shift_reg_reg[4]/D}] [get_pins                                 \
{u_spi_slave/rx_shift_reg_reg[5]/D}] [get_pins                                 \
{u_spi_slave/rx_shift_reg_reg[6]/D}] [get_pins                                 \
{u_spi_slave/rx_shift_reg_reg[7]/D}] [get_pins                                 \
{u_spi_slave/rx_shift_reg_reg[8]/D}] [get_pins                                 \
{u_spi_slave/rx_shift_reg_reg[9]/D}] [get_pins                                 \
{u_spi_slave/rx_shift_reg_reg[10]/D}] [get_pins                                \
{u_spi_slave/rx_shift_reg_reg[11]/D}] [get_pins                                \
{u_spi_slave/rx_shift_reg_reg[12]/D}] [get_pins                                \
{u_spi_slave/rx_shift_reg_reg[13]/D}] [get_pins                                \
{u_spi_slave/rx_shift_reg_reg[14]/D}] [get_pins u_spi_slave/miso_oe_reg/D]     \
[get_pins {u_spi_slave/cs_n_sync_reg[0]/D}] [get_pins                          \
{u_spi_slave/cs_n_sync_reg[1]/D}] [get_pins {u_spi_slave/cs_n_sync_reg[2]/D}]  \
[get_pins {u_spi_slave/sclk_sync_reg[0]/D}] [get_pins                          \
{u_spi_slave/sclk_sync_reg[1]/D}] [get_pins {u_spi_slave/sclk_sync_reg[2]/D}]  \
[get_pins {u_spi_slave/mosi_sync_reg[0]/D}] [get_pins                          \
{u_spi_slave/mosi_sync_reg[1]/D}] [get_pins u_spi_master/busy_reg/D] [get_pins \
{u_spi_master/rx_data_reg[0]/D}] [get_pins {u_spi_master/rx_data_reg[1]/D}]    \
[get_pins {u_spi_master/rx_data_reg[2]/D}] [get_pins                           \
{u_spi_master/rx_data_reg[3]/D}] [get_pins {u_spi_master/rx_data_reg[4]/D}]    \
[get_pins {u_spi_master/rx_data_reg[5]/D}] [get_pins                           \
{u_spi_master/rx_data_reg[6]/D}] [get_pins {u_spi_master/rx_data_reg[7]/D}]    \
[get_pins {u_spi_master/rx_data_reg[8]/D}] [get_pins                           \
{u_spi_master/rx_data_reg[9]/D}] [get_pins {u_spi_master/rx_data_reg[10]/D}]   \
[get_pins {u_spi_master/rx_data_reg[11]/D}] [get_pins                          \
{u_spi_master/rx_data_reg[12]/D}] [get_pins {u_spi_master/rx_data_reg[13]/D}]  \
[get_pins {u_spi_master/rx_data_reg[14]/D}] [get_pins                          \
{u_spi_master/rx_data_reg[15]/D}] [get_pins u_spi_master/cs_n_reg/D] [get_pins \
u_spi_master/mosi_reg/D] [get_pins {u_spi_master/cs_hold_cnt_reg[0]/D}]        \
[get_pins {u_spi_master/cs_hold_cnt_reg[1]/D}] [get_pins                       \
{u_spi_master/cs_hold_cnt_reg[2]/D}] [get_pins                                 \
{u_spi_master/cs_hold_cnt_reg[3]/D}] [get_pins                                 \
{u_spi_master/cs_hold_cnt_reg[4]/D}] [get_pins                                 \
u_spi_master/cs_hold_active_reg/D] [get_pins                                   \
{u_spi_master/active_clk_div_reg[0]/D}] [get_pins                              \
{u_spi_master/active_clk_div_reg[1]/D}] [get_pins                              \
{u_spi_master/active_clk_div_reg[2]/D}] [get_pins                              \
{u_spi_master/active_clk_div_reg[3]/D}] [get_pins                              \
{u_spi_master/active_clk_div_reg[4]/D}] [get_pins                              \
{u_spi_master/active_clk_div_reg[5]/D}] [get_pins                              \
{u_spi_master/active_clk_div_reg[6]/D}] [get_pins                              \
{u_spi_master/active_clk_div_reg[7]/D}] [get_pins                              \
u_spi_master/spi_clk_d_reg/D] [get_pins u_spi_master/spi_clk_en_reg/D]         \
[get_pins {u_spi_master/bit_cnt_reg[0]/D}] [get_pins                           \
{u_spi_master/bit_cnt_reg[1]/D}] [get_pins {u_spi_master/bit_cnt_reg[2]/D}]    \
[get_pins {u_spi_master/bit_cnt_reg[3]/D}] [get_pins                           \
{u_spi_master/rx_shift_reg_reg[0]/D}] [get_pins                                \
{u_spi_master/rx_shift_reg_reg[1]/D}] [get_pins                                \
{u_spi_master/rx_shift_reg_reg[2]/D}] [get_pins                                \
{u_spi_master/rx_shift_reg_reg[3]/D}] [get_pins                                \
{u_spi_master/rx_shift_reg_reg[4]/D}] [get_pins                                \
{u_spi_master/rx_shift_reg_reg[5]/D}] [get_pins                                \
{u_spi_master/rx_shift_reg_reg[6]/D}] [get_pins                                \
{u_spi_master/rx_shift_reg_reg[7]/D}] [get_pins                                \
{u_spi_master/rx_shift_reg_reg[8]/D}] [get_pins                                \
{u_spi_master/rx_shift_reg_reg[9]/D}] [get_pins                                \
{u_spi_master/rx_shift_reg_reg[10]/D}] [get_pins                               \
{u_spi_master/rx_shift_reg_reg[11]/D}] [get_pins                               \
{u_spi_master/rx_shift_reg_reg[12]/D}] [get_pins                               \
{u_spi_master/rx_shift_reg_reg[13]/D}] [get_pins                               \
{u_spi_master/rx_shift_reg_reg[14]/D}] [get_pins                               \
{u_spi_master/rx_shift_reg_reg[15]/D}] [get_pins                               \
{u_spi_master/tx_shift_reg_reg[0]/D}] [get_pins                                \
{u_spi_master/tx_shift_reg_reg[1]/D}] [get_pins                                \
{u_spi_master/tx_shift_reg_reg[2]/D}] [get_pins                                \
{u_spi_master/tx_shift_reg_reg[3]/D}] [get_pins                                \
{u_spi_master/tx_shift_reg_reg[4]/D}] [get_pins                                \
{u_spi_master/tx_shift_reg_reg[5]/D}] [get_pins                                \
{u_spi_master/tx_shift_reg_reg[6]/D}] [get_pins                                \
{u_spi_master/tx_shift_reg_reg[7]/D}] [get_pins                                \
{u_spi_master/tx_shift_reg_reg[8]/D}] [get_pins                                \
{u_spi_master/tx_shift_reg_reg[9]/D}] [get_pins                                \
{u_spi_master/tx_shift_reg_reg[10]/D}] [get_pins                               \
{u_spi_master/tx_shift_reg_reg[11]/D}] [get_pins                               \
{u_spi_master/tx_shift_reg_reg[12]/D}] [get_pins                               \
{u_spi_master/tx_shift_reg_reg[13]/D}] [get_pins                               \
{u_spi_master/tx_shift_reg_reg[14]/D}] [get_pins u_spi_master/done_reg/D]      \
[get_pins {u_spi_master/u_spi_clk_gen/div_cnt_reg[0]/D}] [get_pins             \
{u_spi_master/u_spi_clk_gen/div_cnt_reg[1]/D}] [get_pins                       \
{u_spi_master/u_spi_clk_gen/div_cnt_reg[2]/D}] [get_pins                       \
{u_spi_master/u_spi_clk_gen/div_cnt_reg[3]/D}] [get_pins                       \
{u_spi_master/u_spi_clk_gen/div_cnt_reg[4]/D}] [get_pins                       \
{u_spi_master/u_spi_clk_gen/div_cnt_reg[5]/D}] [get_pins                       \
{u_spi_master/u_spi_clk_gen/div_cnt_reg[6]/D}] [get_pins                       \
{u_spi_master/u_spi_clk_gen/div_cnt_reg[7]/D}] [get_pins                       \
u_spi_master/u_spi_clk_gen/spi_clk_reg/D] [get_pins                            \
{u_spi_regs/reg_tx_data_reg[0]/D}] [get_pins                                   \
{u_spi_regs/reg_tx_data_reg[1]/D}] [get_pins                                   \
{u_spi_regs/reg_tx_data_reg[2]/D}] [get_pins                                   \
{u_spi_regs/reg_tx_data_reg[3]/D}] [get_pins                                   \
{u_spi_regs/reg_tx_data_reg[4]/D}] [get_pins                                   \
{u_spi_regs/reg_tx_data_reg[5]/D}] [get_pins                                   \
{u_spi_regs/reg_tx_data_reg[6]/D}] [get_pins                                   \
{u_spi_regs/reg_tx_data_reg[7]/D}] [get_pins                                   \
{u_spi_regs/reg_tx_data_reg[8]/D}] [get_pins                                   \
{u_spi_regs/reg_tx_data_reg[9]/D}] [get_pins                                   \
{u_spi_regs/reg_tx_data_reg[10]/D}] [get_pins                                  \
{u_spi_regs/reg_tx_data_reg[11]/D}] [get_pins                                  \
{u_spi_regs/reg_tx_data_reg[12]/D}] [get_pins                                  \
{u_spi_regs/reg_tx_data_reg[13]/D}] [get_pins                                  \
{u_spi_regs/reg_tx_data_reg[14]/D}] [get_pins                                  \
{u_spi_regs/reg_tx_data_reg[15]/D}] [get_pins                                  \
{u_spi_regs/reg_clk_div_reg[0]/D}] [get_pins                                   \
{u_spi_regs/reg_clk_div_reg[1]/D}] [get_pins                                   \
{u_spi_regs/reg_clk_div_reg[2]/D}] [get_pins                                   \
{u_spi_regs/reg_clk_div_reg[3]/D}] [get_pins                                   \
{u_spi_regs/reg_clk_div_reg[4]/D}] [get_pins                                   \
{u_spi_regs/reg_clk_div_reg[5]/D}] [get_pins                                   \
{u_spi_regs/reg_clk_div_reg[6]/D}] [get_pins                                   \
{u_spi_regs/reg_clk_div_reg[7]/D}] [get_pins u_spi_regs/reg_master_en_reg/D]   \
[get_pins u_spi_regs/reg_start_reg/D]]
set_false_path   -from [get_ports presetn]
set_false_path   -from [list [get_ports spi_sclk_i] [get_ports spi_cs_n_i] [get_ports          \
spi_mosi_i]]
