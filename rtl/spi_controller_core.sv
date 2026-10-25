`timescale 1ns/1ps

// SPI controller core with separate pad input, output, and output-enable
// signals. This module contains no bidirectional ports or high-impedance
// assignments and can be integrated with technology-specific I/O cells.
module spi_controller_core (
    input  logic        pclk,
    input  logic        presetn,
    input  logic        psel,
    input  logic        penable,
    input  logic        pwrite,
    input  logic [31:0] paddr,
    input  logic [31:0] pwdata,
    output logic [31:0] prdata,
    output logic        pready,
    output logic        pslverr,

    input  logic        spi_sclk_i,
    input  logic        spi_cs_n_i,
    input  logic        spi_mosi_i,
    input  logic        spi_miso_i,

    output logic        spi_sclk_o,
    output logic        spi_cs_n_o,
    output logic        spi_mosi_o,
    output logic        spi_miso_o,
    output logic        spi_master_oe,
    output logic        spi_miso_oe
);

    logic       reg_start;
    logic       reg_master_en;
    logic [7:0] reg_clk_div;
    logic [15:0] reg_tx_data;

    logic       core_busy;
    logic       master_done;
    logic [15:0] master_rx_data;
    logic       slave_rx_valid;
    logic [15:0] slave_rx_data;

    logic       master_sclk;
    logic       master_cs_n;
    logic       master_mosi;
    logic       slave_miso;
    logic       slave_miso_oe;

    // In master mode, drive SCLK, CS_N, and MOSI. In slave mode, release
    // those pins and drive MISO only while the slave requests it.
    always_comb begin
        spi_sclk_o  = master_sclk;
        spi_cs_n_o  = master_cs_n;
        spi_mosi_o  = master_mosi;
        spi_miso_o  = slave_miso;

        spi_master_oe = reg_master_en;
        spi_miso_oe = !reg_master_en && slave_miso_oe;
    end

    spi_regs u_spi_regs (
        .pclk           (pclk),
        .presetn        (presetn),
        .psel           (psel),
        .penable        (penable),
        .pwrite         (pwrite),
        .paddr          (paddr),
        .pwdata         (pwdata),
        .prdata         (prdata),
        .pready         (pready),
        .pslverr        (pslverr),
        .reg_start      (reg_start),
        .reg_master_en  (reg_master_en),
        .reg_clk_div    (reg_clk_div),
        .reg_tx_data    (reg_tx_data),
        .core_busy      (core_busy),
        .master_done    (master_done),
        .master_rx_data (master_rx_data),
        .slave_rx_valid (slave_rx_valid),
        .slave_rx_data  (slave_rx_data)
    );

    spi_master #(
        .DIV_WIDTH(8)
    ) u_spi_master (
        .clk        (pclk),
        .rst_n      (presetn),
        .start      (reg_start && reg_master_en),
        .tx_data    (reg_tx_data),
        .clk_div    (reg_clk_div),
        .miso       (spi_miso_i),
        .mosi       (master_mosi),
        .sclk       (master_sclk),
        .cs_n       (master_cs_n),
        .rx_data    (master_rx_data),
        .busy       (core_busy),
        .done       (master_done)
    );

    spi_slave u_spi_slave (
        .clk        (pclk),
        .rst_n      (presetn),
        .sclk       (spi_sclk_i),
        .cs_n       (spi_cs_n_i),
        .mosi       (spi_mosi_i),
        .miso       (slave_miso),
        .miso_oe    (slave_miso_oe),
        .tx_data    (reg_tx_data),
        .rx_data    (slave_rx_data),
        .rx_valid   (slave_rx_valid)
    );

endmodule
