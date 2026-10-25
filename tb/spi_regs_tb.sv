`timescale 1ns/1ps

module spi_regs_tb;

    //============================================================
    // 1. 信号声明
    //============================================================
    logic        pclk;
    logic        presetn;
    logic        psel;
    logic        penable;
    logic        pwrite;
    logic [31:0] paddr;
    logic [31:0] pwdata;
    logic [31:0] prdata;
    logic        pready;
    logic        pslverr;

    // DUT 控制输出
    logic        reg_start;
    logic        reg_master_en;
    logic [7:0]  reg_clk_div;
    logic [15:0] reg_tx_data;

    // DUT 状态输入 (模拟底层 SPI 核心反馈)
    logic        core_busy;
    logic        master_done;
    logic [15:0] master_rx_data;
    logic        slave_rx_valid;
    logic [15:0] slave_rx_data;

    //============================================================
    // 2. 实例化被测模块 (DUT)
    //============================================================
    spi_regs dut (
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

    //============================================================
    // 3. 时钟生成 (100MHz)
    //============================================================
    initial begin
        pclk = 1'b0;
        forever #5 pclk = ~pclk;
    end

    //============================================================
    // 4. APB 读写任务
    //============================================================
    task apb_write(input logic [31:0] addr, input logic [31:0] data);
        begin
            @(posedge pclk);
            psel   <= 1'b1;
            penable<= 1'b0;
            pwrite <= 1'b1;
            paddr  <= addr;
            pwdata <= data;

            @(posedge pclk);
            penable<= 1'b1;

            @(posedge pclk);
            psel   <= 1'b0;
            penable<= 1'b0;
            pwrite <= 1'b0;
        end
    endtask

    task apb_read(input logic [31:0] addr, output logic [31:0] data);
        begin
            @(posedge pclk);
            psel   <= 1'b1;
            penable<= 1'b0;
            pwrite <= 1'b0;
            paddr  <= addr;

            @(posedge pclk);
            penable<= 1'b1;

            #1; // 稍微拉开 1ns，确保采样到确定的组合逻辑数据
            data   = prdata;

            @(posedge pclk);
            psel   <= 1'b0;
            penable<= 1'b0;
        end
    endtask

    //============================================================
    // 5. 测试主流程
    //============================================================
    logic [31:0] read_val;

    initial begin
        // 初始化
        presetn = 1'b0;
        psel    = 1'b0;
        penable = 1'b0;
        pwrite  = 1'b0;
        paddr   = 32'd0;
        pwdata  = 32'd0;

        core_busy      = 1'b0;
        master_done    = 1'b0;
        master_rx_data = 16'h0000;
        slave_rx_valid = 1'b0;
        slave_rx_data  = 16'h0000;

`ifndef NO_FSDB
        $fsdbDumpfile("spi_regs.fsdb");
        $fsdbDumpvars(0, spi_regs_tb);
`endif

        #20;
        presetn = 1'b1;
        #20;

        //--------------------------------------------------------
        // Test 1: 读写 SPI_CTRL (0x00) 与 SPI_TX_DATA (0x08)
        //--------------------------------------------------------
        $display("[%0t] ==== Test 1: Config Registers Read/Write ====", $time);
        
        apb_write(32'h00, 32'h0000_0802);
        apb_write(32'h08, 32'h0000_BEEF);

        #1; // 避开非阻塞赋值的 Delta cycle 延迟
        // DIV=8 is below the hardware floor and is clamped to 20 by spi_regs.
        if (reg_clk_div == 8'd20 && reg_master_en == 1'b1 && reg_tx_data == 16'hBEEF)
            $display("[%0t] PASS: Registers write successfully. clk_div=%0d, tx_data=%h", $time, reg_clk_div, reg_tx_data);
        else
            $fatal(1, "Register write check failed!");

        // Exercise the programmed divider floor and upper range. The
        // peripheral clamps values below 20 and accepts 255 unchanged.
        apb_write(32'h00, 32'h0000_0000);
        if (reg_clk_div != 8'd20)
            $fatal(1, "Divider minimum clamp failed: got %0d", reg_clk_div);
        apb_write(32'h00, 32'h0000_FF02);
        if (reg_clk_div != 8'hFF)
            $fatal(1, "Maximum divider write failed: got %0d", reg_clk_div);
        apb_write(32'h00, 32'h0000_1402);
        if (reg_clk_div != 8'd20)
            $fatal(1, "Divider minimum boundary failed: got %0d", reg_clk_div);

        // Writes outside the implemented 256-byte window and writes to
        // unmapped in-window offsets must leave configuration unchanged.
        apb_write(32'h0000_0100, 32'h0000_0000);
        apb_write(32'h10, 32'h1234_5678);
        if (reg_master_en != 1'b1 || reg_clk_div != 8'd20 || reg_tx_data != 16'hBEEF)
            $fatal(1, "Invalid write modified a configuration register");

        // A setup phase alone must not update registers.
        @(posedge pclk);
        psel <= 1'b1; penable <= 1'b0; pwrite <= 1'b1;
        paddr <= 32'h08; pwdata <= 32'h0000_1111;
        @(posedge pclk);
        #1;
        if (reg_tx_data != 16'hBEEF)
            $fatal(1, "Setup-only APB phase performed a write");
        psel <= 1'b0; penable <= 1'b0; pwrite <= 1'b0;

        //--------------------------------------------------------
        // Test 2: 验证 reg_start 的自动脉冲特性 (Auto-clear)
        //--------------------------------------------------------
        #20;
        $display("[%0t] ==== Test 2: Verify Start Pulse Auto-Clear ====", $time);
        
        apb_write(32'h00, 32'h0000_0803); // bit[0] = 1

        #1;
        if (reg_start == 1'b1)
            $display("[%0t] PASS: reg_start pulse triggered high correctly.", $time);
        else
            $fatal(1, "reg_start failed to trigger high!");

        // 等待下一个时钟沿，验证自动清零
        @(posedge pclk);
        #1;
        if (reg_start == 1'b0)
            $display("[%0t] PASS: reg_start pulse auto-cleared correctly.", $time);
        else
            $fatal(1, "reg_start failed to auto-clear!");

        //--------------------------------------------------------
        // Test 3: 验证从 SPI Core 读取状态与接收数据
        //--------------------------------------------------------
        #20;
        $display("[%0t] ==== Test 3: Status & RX Data Readback ====", $time);
        
        core_busy      = 1'b1;
        master_rx_data = 16'h5555;
        slave_rx_data  = 16'h7777;
        slave_rx_valid = 1'b1;

        apb_read(32'h04, read_val);
        if (read_val[0] == 1'b1 && read_val[2] == 1'b1)
            $display("[%0t] PASS: Status readback correct (busy=1, slave_valid=1).", $time);
        else
            $fatal(1, "Status readback error %b", read_val);

        apb_read(32'h0C, read_val);
        if (read_val[15:0] == 16'h5555 && read_val[31:16] == 16'h7777)
            $display("[%0t] PASS: RX Data readback correct. Master_RX=%h, Slave_RX=%h", $time, read_val[15:0], read_val[31:16]);
        else
            $fatal(1, "RX Data readback error %h", read_val);

        // Read all status bits in their opposite state, including done.
        core_busy = 1'b0;
        master_done = 1'b1;
        slave_rx_valid = 1'b0;
        apb_read(32'h04, read_val);
        if (read_val[2:0] !== 3'b010)
            $fatal(1, "Status low-state readback error %b", read_val[2:0]);
        master_done = 1'b0;

        //--------------------------------------------------------
        // Test 4: 读非法地址测试
        //--------------------------------------------------------
        #20;
        $display("[%0t] ==== Test 4: Unmapped Address Read ====", $time);
        apb_read(32'hFC, read_val);
        if (read_val == 32'hDEADBEEF)
            $display("[%0t] PASS: Unmapped address returned DEADBEEF.", $time);
        else
            $fatal(1, "Expected DEADBEEF, got %h", read_val);

        // An address outside the peripheral window takes the dedicated
        // high-address error-data path.
        apb_read(32'h0000_0100, read_val);
        if (read_val !== 32'hDEAD_BEEF)
            $fatal(1, "Out-of-window read returned %h", read_val);

        // When no read is selected, the combinational bus returns zero.
        psel = 1'b0;
        pwrite = 1'b0;
        paddr = 32'h04;
        #1;
        if (prdata !== 32'h0000_0000)
            $fatal(1, "Unselected APB read returned %h", prdata);

        #100;
        $display("[%0t] ==== All Register Tests Finished ====", $time);
        $finish;
    end

endmodule
