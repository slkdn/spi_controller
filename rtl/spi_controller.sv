`timescale 1ns/1ps

// Generic simulation/top-level wrapper. For ASIC implementation, replace
// these tri-state assignments with technology-specific bidirectional I/O
// pad cells and connect each pad's input, output, and output-enable signals
// to spi_controller_core.
module spi_controller (
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

    inout  wire         spi_sclk,
    inout  wire         spi_cs_n,
    inout  wire         spi_mosi,
    inout  wire         spi_miso
);

    logic spi_sclk_o;
    logic spi_cs_n_o;
    logic spi_mosi_o;
    logic spi_miso_o;
    logic spi_master_oe;
    logic spi_miso_oe;

    // Generic behavioral pad model: the external pin is released when OE=0.
    assign spi_sclk = spi_master_oe ? spi_sclk_o : 1'bz;
    assign spi_cs_n = spi_master_oe ? spi_cs_n_o : 1'bz;
    assign spi_mosi = spi_master_oe ? spi_mosi_o : 1'bz;
    assign spi_miso = spi_miso_oe ? spi_miso_o : 1'bz;

    spi_controller_core u_core (
        .pclk       (pclk),
        .presetn    (presetn),
        .psel       (psel),
        .penable    (penable),
        .pwrite     (pwrite),
        .paddr      (paddr),
        .pwdata     (pwdata),
        .prdata     (prdata),
        .pready     (pready),
        .pslverr    (pslverr),
        .spi_sclk_i (spi_sclk),
        .spi_cs_n_i (spi_cs_n),
        .spi_mosi_i (spi_mosi),
        .spi_miso_i (spi_miso),
        .spi_sclk_o (spi_sclk_o),
        .spi_cs_n_o (spi_cs_n_o),
        .spi_mosi_o (spi_mosi_o),
        .spi_miso_o (spi_miso_o),
        .spi_master_oe(spi_master_oe),
        .spi_miso_oe(spi_miso_oe)
    );

endmodule
