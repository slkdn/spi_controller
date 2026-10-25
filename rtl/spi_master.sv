module spi_master #(
    parameter int DIV_WIDTH = 16
) (
    input  logic                 clk,
    input  logic                 rst_n,
    input  logic                 start,
    input  logic [15:0]          tx_data,
    input  logic [DIV_WIDTH-1:0] clk_div,
    input  logic                 miso,
    output logic                 mosi,
    output logic                 sclk,
    output logic                 cs_n,
    output logic [15:0]          rx_data,
    output logic                 busy,
    output logic                 done
);

    //============================================================
    // Internal signals
    //============================================================

    logic [15:0] tx_shift_reg;
    logic [15:0] rx_shift_reg;

    logic [3:0] bit_cnt;

    logic       spi_clk_en;
    logic       spi_clk_d;

    logic       spi_clk;
    logic [DIV_WIDTH-1:0] active_clk_div;
    logic       cs_hold_active;
    logic [4:0] cs_hold_cnt;

    //============================================================
    // SPI clock generator
    //============================================================

    spi_clk_gen #(
        .DIV_WIDTH(DIV_WIDTH)
    ) u_spi_clk_gen (
        .clk     (clk),
        .rst_n   (rst_n),
        .enable  (spi_clk_en),
        .clk_div (active_clk_div),
        .spi_clk (spi_clk)
    );

    assign sclk = spi_clk;

    //============================================================
    // SPI Master control
    //============================================================

    always_ff @(posedge clk) begin

        if (!rst_n) begin

            tx_shift_reg <= 16'h0000;
            rx_shift_reg <= 16'h0000;

            bit_cnt      <= 4'd0;

            spi_clk_en   <= 1'b0;
            spi_clk_d    <= 1'b0;
            active_clk_div <= {{(DIV_WIDTH-1){1'b0}}, 1'b1};
            cs_hold_active <= 1'b0;
            cs_hold_cnt    <= 5'd0;

            mosi         <= 1'b0;
            cs_n         <= 1'b1;

            rx_data      <= 16'h0000;

            busy         <= 1'b0;
            done         <= 1'b0;

        end
        else begin

            // 保存上一拍的 SPI clock
            spi_clk_d <= spi_clk;

            // done 默认只保持一个 clk 周期
            done <= 1'b0;

            // Keep CS_N asserted for at least 200 ns after the last SCLK
            // falling edge. At pclk=100 MHz this is 20 pclk cycles.
            if (cs_hold_active) begin
                if (cs_hold_cnt == 5'd19) begin
                    cs_hold_active <= 1'b0;
                    cs_hold_cnt    <= 5'd0;
                    cs_n           <= 1'b1;
                    busy           <= 1'b0;
                    done           <= 1'b1;
                end else begin
                    cs_hold_cnt <= cs_hold_cnt + 1'b1;
                end
            end

            //====================================================
            // IDLE
            //====================================================

            else if (!busy) begin
                spi_clk_en <= 1'b0;
                cs_n       <= 1'b1;
                mosi       <= 1'b0;

                if (start) begin
                 tx_shift_reg <= tx_data;
                 // Keep the SPI bit period stable for the whole frame even
                 // if software updates the configuration register mid-transfer.
                 active_clk_div <= clk_div;
                 cs_hold_active <= 1'b0;
                 cs_hold_cnt    <= 5'd0;
                 spi_clk_en   <= 1'b1;
                 mosi         <= tx_data[15]; // 确保 SCLK 第一个采样沿之前 mosi 就是正确的最高位
                 cs_n         <= 1'b0;
                 busy         <= 1'b1;
                 bit_cnt      <= 4'd0;
                end
            end

            //====================================================
            // BUSY
            //====================================================

            else begin

                //================================================
                // SPI rising edge
                // Mode 0: sample MISO
                //================================================

                if (!spi_clk_d && spi_clk) begin

                    rx_shift_reg <= {
                        rx_shift_reg[14:0],
                        miso
                    };
                end

                //================================================
                // SPI falling edge
                // Mode 0: change MOSI
                //================================================

                if (spi_clk_d && !spi_clk) begin
                    if (bit_cnt == 4'd15) begin
                        // 16 bits completed
                        // The final MISO bit was already captured on the
                        // preceding rising edge. Re-sampling here can capture
                        // a value changed by the slave on this falling edge.
                        rx_data <= rx_shift_reg;
                        spi_clk_en <= 1'b0;
                        // Stop the clock now, but defer CS_N release and
                        // completion until the device's CS hold time passes.
                        cs_hold_active <= 1'b1;
                        cs_hold_cnt    <= 5'd0;
                        mosi <= 1'b0;
                    end
                    else begin
                        // 准备下一个 bit
                        bit_cnt <= bit_cnt + 1'b1;
                        tx_shift_reg <= {
                            tx_shift_reg[14:0],
                            1'b0
                        };
                        mosi <= tx_shift_reg[14];
                    end
                end
            end
        end
    end

endmodule
