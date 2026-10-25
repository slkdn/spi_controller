`timescale 1ns/1ps

module spi_slave (
    input  logic       clk,
    input  logic       rst_n,

    // SPI 物理接口 (来自 Master)
    input  logic       sclk,
    input  logic       cs_n,
    input  logic       mosi,
    output logic       miso,
    output logic       miso_oe,     // MISO 输出使能 (用于控制顶层 Pad 的三态门)

    // 内部寄存器/数据接口
    input  logic [15:0] tx_data,    // 准备发送给 Master 的数据
    output logic [15:0] rx_data,    // 从 Master 接收到的完整数据
    output logic       rx_valid     // 接收完成脉冲 (高电平有效 1 个 clk)
);

    //============================================================
    // 1. 跨时钟域同步 (Synchronizers) & 边沿检测 (Edge Detectors)
    //============================================================
    logic [2:0] sclk_sync;
    logic [2:0] cs_n_sync;
    logic [1:0] mosi_sync;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sclk_sync <= 3'b000;
            cs_n_sync <= 3'b111; // cs_n 默认高电平
            mosi_sync <= 2'b00;
        end else begin
            sclk_sync <= {sclk_sync[1:0], sclk};
            cs_n_sync <= {cs_n_sync[1:0], cs_n};
            mosi_sync <= {mosi_sync[0], mosi};
        end
    end

    // 边沿检测
    logic sclk_rise;
    logic sclk_fall;
    logic cs_n_fall;

    assign sclk_rise = (sclk_sync[2:1] == 2'b01);
    assign sclk_fall = (sclk_sync[2:1] == 2'b10);
    assign cs_n_fall = (cs_n_sync[2:1] == 2'b10);

    //============================================================
    // 2. SPI Slave 状态与数据收发控制
    //============================================================
    logic [15:0] rx_shift_reg;
    logic [15:0] tx_shift_reg;
    logic [3:0] bit_cnt;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rx_shift_reg <= 16'h0000;
            tx_shift_reg <= 16'h0000;
            bit_cnt      <= 4'd0;
            rx_data      <= 16'h0000;
            rx_valid     <= 1'b0;
            miso         <= 1'b0;
            miso_oe      <= 1'b0;
        end else begin
            // 默认清除 valid 脉冲
            rx_valid <= 1'b0;

            if (cs_n_sync[1] == 1'b1) begin
                // CS_N 被拉高 (无效状态)，清空状态，释放 MISO
                bit_cnt <= 4'd0;
                miso_oe <= 1'b0; 
                miso    <= 1'b0;
            end else begin
                // CS_N 为低电平 (活动状态)，使能 MISO 输出
                miso_oe <= 1'b1;

                // 2.1 CS_N 下降沿：加载要发送的数据并准备最高位
                if (cs_n_fall) begin
                    tx_shift_reg <= tx_data;
                    miso         <= tx_data[15]; // 提前将最高位送到 MISO
                    bit_cnt      <= 4'd0;
                end
                else begin
                    // 2.2 SCLK 上升沿 (Mode 0 采样 MOSI)
                    if (sclk_rise) begin
                        rx_shift_reg <= {rx_shift_reg[14:0], mosi_sync[1]};
                        
                        // 收到第 16 个 bit 后输出完整数据并拉高有效信号
                        if (bit_cnt == 4'd15) begin
                            rx_data  <= {rx_shift_reg[14:0], mosi_sync[1]};
                            rx_valid <= 1'b1;
                        end
                    end
                    
                    // 2.3 SCLK 下降沿 (Mode 0 移位 MISO)
                    if (sclk_fall) begin
                        tx_shift_reg <= {tx_shift_reg[14:0], 1'b0};
                        miso         <= tx_shift_reg[14];
                        bit_cnt      <= bit_cnt + 1'b1;
                    end
                end
            end
        end
    end

endmodule
