`timescale 1ns/1ps

module spi_regs (
    // APB Bus Interface
    input  logic        pclk,      // APB 时钟 (等同于系统 clk)
    input  logic        presetn,   // APB 复位 (低电平有效)
    input  logic        psel,      // APB 片选
    input  logic        penable,   // APB 使能
    input  logic        pwrite,    // APB 读写控制 (1: Write, 0: Read)
    input  logic [31:0] paddr,     // APB 地址 (字对齐)
    input  logic [31:0] pwdata,    // APB 写数据
    output logic [31:0] prdata,    // APB 读数据
    output logic        pready,    // APB 准备好信号
    output logic        pslverr,   // APB 错误信号

    // 控制信号输出 (发往底层 SPI Core)
    output logic        reg_start,
    output logic        reg_master_en,
    output logic [7:0]  reg_clk_div,
    output logic [15:0] reg_tx_data,

    // 状态信号输入 (来自底层 SPI Core)
    input  logic        core_busy,
    input  logic        master_done,
    input  logic [15:0] master_rx_data,
    input  logic        slave_rx_valid,
    input  logic [15:0] slave_rx_data
);

    // At pclk=100 MHz, DIV=20 limits SCLK to 2.5 MHz, leaving timing
    // margin against the selected 25LC256 reference device at 3.3 V.
    localparam logic [7:0] SPI_CLK_DIV_MIN = 8'd20;

    //============================================================
    // 1. APB 协议控制逻辑
    //============================================================
    // 握手信号：SPI 寄存器响应极快，无需等待，pready 始终拉高
    assign pready  = 1'b1;
    assign pslverr = 1'b0; // 简单设计中不产生总线错误

    // 读写使能条件
    logic apb_write_en;
    logic apb_read_en;
    
    // APB 在 psel 和 penable 都为高时执行有效传输
    // This peripheral occupies the low 256-byte address window. Reject
    // accesses outside that window instead of aliasing on paddr[7:0].
    assign apb_write_en = psel & penable & pwrite & (paddr[31:8] == 24'd0);
    assign apb_read_en  = psel & !pwrite; // 读操作在 Setup 阶段即可准备数据

    //============================================================
    // 2. 内部寄存器定义与写逻辑 (Write)
    //============================================================
    // 注意：reg_start 不在这里定义寄存器，它是一个脉冲信号
    always_ff @(posedge pclk or negedge presetn) begin
        if (!presetn) begin
            reg_master_en <= 1'b1; // 默认工作在主模式
            reg_clk_div   <= SPI_CLK_DIV_MIN; // 默认分频系数
            reg_tx_data   <= 16'd0;
            reg_start     <= 1'b0;
        end else begin
            // 默认清除 start 脉冲，实现 "自动清零" 特性
            reg_start <= 1'b0; 

            if (apb_write_en) begin
                case (paddr[7:0])
                    8'h00: begin // 写 SPI_CTRL
                        reg_start     <= pwdata[0];
                        reg_master_en <= pwdata[1];
                        reg_clk_div   <= (pwdata[15:8] < SPI_CLK_DIV_MIN)
                                       ? SPI_CLK_DIV_MIN
                                       : pwdata[15:8];
                    end
                    8'h08: begin // 写 SPI_TX_DATA
                        reg_tx_data   <= pwdata[15:0];
                    end
                    default: ; // 其他地址不响应写操作
                endcase
            end
        end
    end

    //============================================================
    // 3. 读逻辑 (Read)
    //============================================================
    always_comb begin
        prdata = 32'd0; // 默认返回 0
        if (apb_read_en) begin
            if (paddr[31:8] != 24'd0) begin
                prdata = 32'hDEADBEEF;
            end else begin
                case (paddr[7:0])
                    8'h00: begin // 读 SPI_CTRL
                        prdata[0]    = 1'b0; // start 位读回始终为 0
                        prdata[1]    = reg_master_en;
                        prdata[15:8] = reg_clk_div;
                    end
                    8'h04: begin // 读 SPI_STATUS
                        prdata[0] = core_busy;
                        prdata[1] = master_done;
                        prdata[2] = slave_rx_valid;
                    end
                    8'h08: begin // 读 SPI_TX_DATA
                        prdata[15:0] = reg_tx_data;
                    end
                    8'h0C: begin // 读 SPI_RX_DATA
                        // Pack both full-duplex 16-bit receive words in one APB word.
                        prdata[15:0]  = master_rx_data;
                        prdata[31:16] = slave_rx_data;
                    end
                    default: prdata = 32'hDEADBEEF; // 读非法地址时的测试值
                endcase
            end
        end
    end

endmodule
