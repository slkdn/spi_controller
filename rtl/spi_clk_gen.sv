`timescale 1ns/1ps

module spi_clk_gen #(
    parameter int DIV_WIDTH = 16
) (
    input  logic                 clk,
    input  logic                 rst_n,
    input  logic                 enable,
    input  logic [DIV_WIDTH-1:0] clk_div,
    output logic                 spi_clk
);

    logic [DIV_WIDTH-1:0] div_cnt;
    always_ff @(posedge clk) begin
        if (!rst_n) begin
            div_cnt <= '0;
            spi_clk <= 1'b0;
        end
        else if (!enable) begin
            div_cnt <= '0;
            spi_clk <= 1'b0;
        end
        // Treat a programmed zero as divide-by-one. Subtracting one from
        // zero would otherwise wrap and create an unexpectedly long period.
        else if ((clk_div == '0) || (div_cnt == clk_div - 1'b1)) begin
            div_cnt <= '0;
            spi_clk <= ~spi_clk;
        end
        else begin
            div_cnt <= div_cnt + 1'b1;
        end
    end

endmodule
