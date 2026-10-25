`timescale 1ns/1ps

module spi_slave_tb;

    //============================================================
    // 1. 接口信号声明
    //============================================================
    logic       clk;
    logic       rst_n;

    // 模拟外部 Master 驱动的信号
    logic       sclk;
    logic       cs_n;
    logic       mosi;
    logic       miso;
    logic       miso_oe;

    // Slave 内部的交互信号
    logic [15:0] slave_tx_data;
    logic [15:0] slave_rx_data;
    logic       slave_rx_valid;

    //============================================================
    // 2. 实例化被测模块 (DUT)
    //============================================================
    spi_slave dut (
        .clk      (clk),
        .rst_n    (rst_n),
        
        .sclk     (sclk),
        .cs_n     (cs_n),
        .mosi     (mosi),
        .miso     (miso),
        .miso_oe  (miso_oe),
        
        .tx_data  (slave_tx_data),
        .rx_data  (slave_rx_data),
        .rx_valid (slave_rx_valid)
    );

    //============================================================
    // 3. 系统时钟生成 (内部时钟 100MHz)
    //============================================================
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk; // 周期 10ns
    end

    //============================================================
    // 4. 模拟 SPI Master 发送任务 (SPI Mode 0)
    //============================================================
    // 我们设定 SPI 时钟频率为 10MHz (周期 100ns，半周期 50ns)
    // 这个时钟相对于内部 100MHz 是一个“慢速异步”信号
    task spi_master_transfer(
        input  logic [15:0] m_tx_word,
        output logic [15:0] m_rx_word
    );
        integer i;
        begin
            // 拉低片选，开启传输
            cs_n = 1'b0;
            #50; // 等待半个 SPI 周期

            for (i = 15; i >= 0; i = i - 1) begin
                // Master 在下降沿 (或第一个上升沿前) 改变 MOSI
                mosi = m_tx_word[i];
                #50; // 维持半个周期，满足 Setup Time

                // SCLK 上升沿：Master 在此时采样 MISO
                sclk = 1'b1;
                m_rx_word[i] = miso;
                #50; // 维持半个周期，满足 Hold Time

                // SCLK 下降沿
                sclk = 1'b0;
            end
            
            #50; // 最后一个下降沿后等待一小段时间
            cs_n = 1'b1; // 结束传输，拉高片选
            mosi = 1'b0; // 释放数据线
        end
    endtask

    //============================================================
    // 5. 主测试流程
    //============================================================
    logic [15:0] master_read_data;
    logic [15:0] partial_word;
    integer valid_pulse_count;
    integer valid_count_before_abort;
    integer bit_index;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            valid_pulse_count <= 0;
        else if (slave_rx_valid)
            valid_pulse_count <= valid_pulse_count + 1;
    end

    initial begin
        // 信号初始化
        rst_n = 1'b0;
        sclk  = 1'b0;
        cs_n  = 1'b1;
        mosi  = 1'b0;
        slave_tx_data = 16'h0000;

        // 生成波形
`ifndef NO_FSDB
        $fsdbDumpfile("spi_slave.fsdb");
        $fsdbDumpvars(0, spi_slave_tb);
`endif

        // 释放复位
        #30;
        rst_n = 1'b1;
        #50;

        // SCLK activity while CS_N is inactive must not enable MISO or
        // produce a receive-valid pulse.
        sclk = 1'b1;
        #50;
        sclk = 1'b0;
        #50;
        sclk = 1'b1;
        #50;
        sclk = 1'b0;
        #30;
        if (miso_oe !== 1'b0 || slave_rx_valid !== 1'b0 || valid_pulse_count != 0)
            $fatal(1, "Slave responded while CS_N was inactive");

        //--------------------------------------------------------
        // Test 1: 发送并接收一次完整数据
        //--------------------------------------------------------
        $display("[%0t] ==== Starting Test 1 ====", $time);
        
        // 准备 16 位回复数据
        slave_tx_data = 16'h9A65;
        
        // Master 准备发送 16 位数据
        // 调用任务，启动时序
        spi_master_transfer(16'hC53A, master_read_data);

        // 等待几个系统时钟，让 Slave 把 rx_valid 脉冲打出来
        #30;

        // 校验结果
        // 1. 检查 Slave 是否收到了 Master 发的 C5
        if (slave_rx_data == 16'hC53A)
            $display("[%0t] PASS: Slave correctly received 16'hC53A from Master.", $time);
        else
            $fatal(1, "Slave rx_data is %h, expected 16'hC53A", slave_rx_data);

        // 2. 检查 Master 是否收到了 Slave 发的 9A
        if (master_read_data == 16'h9A65)
            $display("[%0t] PASS: Master correctly received 16'h9A65 from Slave.", $time);
        else
            $fatal(1, "Master read %h, expected 16'h9A65", master_read_data);
        if (valid_pulse_count != 1 || miso_oe !== 1'b0)
            $fatal(1, "First frame valid/OE check failed: count=%0d oe=%b",
                   valid_pulse_count, miso_oe);


        //--------------------------------------------------------
        // Test 2: 紧接着发送第二笔数据，测试连续传输
        //--------------------------------------------------------
        #100;
        $display("[%0t] ==== Starting Test 2 ====", $time);
        slave_tx_data = 16'h33CC;
        
        spi_master_transfer(16'hEE11, master_read_data);
        #30;

        if (slave_rx_data == 16'hEE11 && master_read_data == 16'h33CC)
            $display("[%0t] PASS: Test 2 successful.", $time);
        else
            $fatal(1, "Test 2 failed: slave RX=%h, master RX=%h", slave_rx_data, master_read_data);

        if (valid_pulse_count != 2 || miso_oe !== 1'b0)
            $fatal(1, "Second frame valid/OE check failed: count=%0d oe=%b",
                   valid_pulse_count, miso_oe);

        //--------------------------------------------------------
        // Test 3: Exercise complementary data patterns.
        //--------------------------------------------------------
        $display("[%0t] ==== Starting Test 3 ====" , $time);
        slave_tx_data = 16'hFFFF;
        spi_master_transfer(16'h0000, master_read_data);
        #30;
        if (slave_rx_data !== 16'h0000 || master_read_data !== 16'hFFFF)
            $fatal(1, "Test 3 data mismatch: slave RX=%h, master RX=%h",
                   slave_rx_data, master_read_data);

        slave_tx_data = 16'h0000;
        spi_master_transfer(16'hFFFF, master_read_data);
        #30;
        if (slave_rx_data !== 16'hFFFF || master_read_data !== 16'h0000)
            $fatal(1, "Test 4 data mismatch: slave RX=%h, master RX=%h",
                   slave_rx_data, master_read_data);
        if (valid_pulse_count != 4)
            $fatal(1, "Expected four valid pulses, got %0d", valid_pulse_count);

        //--------------------------------------------------------
        // Test 5: Abort a partial frame. It must not publish new RX data.
        //--------------------------------------------------------
        valid_count_before_abort = valid_pulse_count;
        partial_word = 16'hA500;
        cs_n = 1'b0;
        #50;
        for (bit_index = 15; bit_index >= 8; bit_index = bit_index - 1) begin
            mosi = partial_word[bit_index];
            #50;
            sclk = 1'b1;
            #50;
            sclk = 1'b0;
        end
        #50;
        cs_n = 1'b1;
        mosi = 1'b0;
        #50;
        if (slave_rx_valid !== 1'b0 || valid_pulse_count != valid_count_before_abort)
            $fatal(1, "Partial frame incorrectly produced RX valid");
        if (miso_oe !== 1'b0 || slave_rx_data !== 16'hFFFF)
            $fatal(1, "Slave failed to discard/release after partial frame");

        #200;
        $display("[%0t] ==== Simulation Finished ====", $time);
        $finish;
    end

endmodule
