`timescale 1ns/1ps

module spi_controller_tb;

    //============================================================
    // 1. 系统时钟与复位
    //============================================================
    logic pclk;
    logic presetn;

    //============================================================
    // 2. Master 端 APB 总线信号
    //============================================================
    logic        m_psel, m_penable, m_pwrite;
    logic [31:0] m_paddr, m_pwdata, m_prdata;
    logic        m_pready, m_pslverr;

    //============================================================
    // 3. Slave 端 APB 总线信号
    //============================================================
    logic        s_psel, s_penable, s_pwrite;
    logic [31:0] s_paddr, s_pwdata, s_prdata;
    logic        s_pready, s_pslverr;

    //============================================================
    // 4. SPI 物理线网 (Physical SPI Bus)
    //============================================================
    wire spi_sclk;
    wire spi_cs_n;
    wire spi_mosi;
    wire spi_miso;

    // 为三态物理线添加上拉电阻，防止未驱动时浮空为 X
    pullup(spi_cs_n);
    pullup(spi_sclk);

    //============================================================
    // 5. 例化 Master 节点与 Slave 节点
    //============================================================
    // Master 节点
    spi_controller u_master_top (
        .pclk       (pclk),
        .presetn    (presetn),
        .psel       (m_psel),
        .penable    (m_penable),
        .pwrite     (m_pwrite),
        .paddr      (m_paddr),
        .pwdata     (m_pwdata),
        .prdata     (m_prdata),
        .pready     (m_pready),
        .pslverr    (m_pslverr),

        .spi_sclk   (spi_sclk),
        .spi_cs_n   (spi_cs_n),
        .spi_mosi   (spi_mosi),
        .spi_miso   (spi_miso)
    );

    // Slave 节点
    spi_controller u_slave_top (
        .pclk       (pclk),
        .presetn    (presetn),
        .psel       (s_psel),
        .penable    (s_penable),
        .pwrite     (s_pwrite),
        .paddr      (s_paddr),
        .pwdata     (s_pwdata),
        .prdata     (s_prdata),
        .pready     (s_pready),
        .pslverr    (s_pslverr),

        .spi_sclk   (spi_sclk),
        .spi_cs_n   (spi_cs_n),
        .spi_mosi   (spi_mosi),
        .spi_miso   (spi_miso)
    );

    //============================================================
    // 6. 时钟生成 (100MHz)
    //============================================================
    initial begin
        pclk = 1'b0;
        forever #5 pclk = ~pclk;
    end

    //============================================================
    // 7. APB 读写 Task 封装
    //============================================================
    // Master APB 写
    task apb_master_write(input logic [31:0] addr, input logic [31:0] data);
        begin
            @(posedge pclk);
            m_psel <= 1'b1; m_penable <= 1'b0; m_pwrite <= 1'b1;
            m_paddr <= addr; m_pwdata <= data;
            @(posedge pclk);
            m_penable <= 1'b1;
            @(posedge pclk);
            m_psel <= 1'b0; m_penable <= 1'b0; m_pwrite <= 1'b0;
        end
    endtask

    // Master APB 读
    task apb_master_read(input logic [31:0] addr, output logic [31:0] data);
        begin
            @(posedge pclk);
            m_psel <= 1'b1; m_penable <= 1'b0; m_pwrite <= 1'b0;
            m_paddr <= addr;
            @(posedge pclk);
            m_penable <= 1'b1;
            #1;
            data = m_prdata;
            @(posedge pclk);
            m_psel <= 1'b0; m_penable <= 1'b0;
        end
    endtask

    // Slave APB 写
    task apb_slave_write(input logic [31:0] addr, input logic [31:0] data);
        begin
            @(posedge pclk);
            s_psel <= 1'b1; s_penable <= 1'b0; s_pwrite <= 1'b1;
            s_paddr <= addr; s_pwdata <= data;
            @(posedge pclk);
            s_penable <= 1'b1;
            @(posedge pclk);
            s_psel <= 1'b0; s_penable <= 1'b0; s_pwrite <= 1'b0;
        end
    endtask

    // Slave APB 读
    task apb_slave_read(input logic [31:0] addr, output logic [31:0] data);
        begin
            @(posedge pclk);
            s_psel <= 1'b1; s_penable <= 1'b0; s_pwrite <= 1'b0;
            s_paddr <= addr;
            @(posedge pclk);
            s_penable <= 1'b1;
            #1;
            data = s_prdata;
            @(posedge pclk);
            s_psel <= 1'b0; s_penable <= 1'b0;
        end
    endtask

    // Run a complete full-duplex frame with caller-selected data patterns.
    // The divider is set to its supported minimum (20), independent of the
    // earlier register boundary tests.
    task automatic spi_transfer_check(
        input logic [15:0] master_tx,
        input logic [15:0] slave_tx
    );
        logic [31:0] status_word;
        logic [31:0] master_rx_word;
        logic [31:0] slave_rx_word;
        integer wait_count;
        begin
            apb_slave_write(32'h08, {16'h0000, slave_tx});
            apb_master_write(32'h08, {16'h0000, master_tx});
            apb_master_write(32'h00, 32'h0000_1403);

            status_word = 32'h0000_0001;
            wait_count = 0;
            while (status_word[0]) begin
                #100;
                apb_master_read(32'h04, status_word);
                wait_count = wait_count + 1;
                if (status_word[0] && wait_count >= 100)
                    $fatal(1, "Timeout in pattern transfer m_tx=%h s_tx=%h",
                           master_tx, slave_tx);
            end

            #50;
            apb_master_read(32'h0C, master_rx_word);
            apb_slave_read(32'h0C, slave_rx_word);
            if (master_rx_word[15:0] !== slave_tx ||
                slave_rx_word[31:16] !== master_tx)
                $fatal(1, "Pattern transfer mismatch: m_tx=%h s_tx=%h m_rx=%h s_rx=%h",
                       master_tx, slave_tx, master_rx_word[15:0], slave_rx_word[31:16]);

            apb_master_write(32'h00, 32'h0000_1402);
        end
    endtask

    //============================================================
    // 8. 终极测试流程
    //============================================================
    logic [31:0] m_read_val, s_read_val;
    logic [15:0] coverage_pattern;
    integer poll_count;
    integer coverage_i;

    initial begin
        // 信号初始化
        presetn = 1'b0;
        m_psel = 0; m_penable = 0; m_pwrite = 0; m_paddr = 0; m_pwdata = 0;
        s_psel = 0; s_penable = 0; s_pwrite = 0; s_paddr = 0; s_pwdata = 0;

`ifndef NO_FSDB
        $fsdbDumpfile("spi_top.fsdb");
        $fsdbDumpvars(0, spi_controller_tb);
`endif

        // 复位系统
        #50;
        presetn = 1'b1;
        #50;

        $display("--------------------------------------------------");
        $display("[%0t] Step 1: Configuring Master and Slave Regs", $time);
        $display("--------------------------------------------------");

        // Divider requests below the hardware minimum are clamped to 20.
        // Configure Slave mode with the minimum supported divider.
        apb_slave_write(32'h00, 32'h0000_0800);
        // 设置 Slave 准备回复给 Master 的 16 位数据
        apb_slave_write(32'h08, 32'h0000_A55A);

        // Configure Master mode with the minimum supported divider.
        apb_master_write(32'h00, 32'h0000_0802);
        // 设置 Master 准备发送给 Slave 的 16 位数据
        apb_master_write(32'h08, 32'h0000_3CC3);

        $display("--------------------------------------------------");
        $display("[%0t] Step 2: Triggering SPI Transfer via APB", $time);
        $display("--------------------------------------------------");

        // 3. 触发 Master 启动传输 (写 SPI_CTRL 的 bit[0] = 1)
        apb_master_write(32'h00, 32'h0000_0803);

        // 4. 轮询 Master 的 busy 状态，等待传输完成
        m_read_val = 32'h0001;
        poll_count = 0;
        while (m_read_val[0] == 1'b1) begin
            #100;
            apb_master_read(32'h04, m_read_val); // 读 SPI_STATUS
            poll_count = poll_count + 1;
            if ((m_read_val[0] == 1'b1) && (poll_count >= 100))
                $fatal(1, "Timeout waiting for SPI master busy to clear");
        end

        $display("[%0t] Master Transfer Completed!", $time);

        // 给额外 50ns 确保 Slave 端接收跨时钟同步及逻辑清尾完成
        #50;

        $display("--------------------------------------------------");
        $display("[%0t] Step 3: Checking Received Data via APB", $time);
        $display("--------------------------------------------------");

        // 5. 检查 Master 接收到的数据 (低 16 位，应来自 Slave)
        apb_master_read(32'h0C, m_read_val);
        $display("[%0t] Master RX Data Readback = 16'h%0h (Expected: 16'hA55A)", $time, m_read_val[15:0]);

        // 6. 检查 Slave 接收到的数据 (高 16 位，应来自 Master)
        apb_slave_read(32'h0C, s_read_val);
        $display("[%0t] Slave RX Data Readback  = 16'h%0h (Expected: 16'h3CC3)", $time, s_read_val[31:16]);

        // 7. 终极断言判断
        if ((m_read_val[15:0] == 16'hA55A) && (s_read_val[31:16] == 16'h3CC3)) begin
            $display("==================================================");
            $display("   SYSTEM TEST PASS: Full-Duplex SPI SUCCESS!     ");
            $display("==================================================");
        end else begin
            $display("==================================================");
            $display("   SYSTEM TEST FAIL: Data Mismatch Detected!      ");
            $display("==================================================");
            $fatal(1, "Full-duplex SPI data mismatch: master=%h slave=%h",
                   m_read_val[15:0], s_read_val[31:16]);
        end

        // Exercise the remaining APB register decode and error-data paths
        // while both controllers are idle. Keep START low so this coverage
        // traffic does not launch another SPI frame.
        apb_master_read(32'h00, m_read_val); // SPI_CTRL read mux
        if (m_read_val[15:8] != 8'd20 || m_read_val[1] != 1'b1 || m_read_val[0] != 1'b0)
            $fatal(1, "Master CTRL readback mismatch: %h", m_read_val);

        apb_master_read(32'h08, m_read_val); // SPI_TX_DATA read mux
        if (m_read_val[15:0] != 16'h3CC3)
            $fatal(1, "Master TX_DATA readback mismatch: %h", m_read_val);

        apb_master_read(32'h10, m_read_val); // Unmapped in-window read
        if (m_read_val != 32'hDEAD_BEEF)
            $fatal(1, "Unmapped read mismatch: %h", m_read_val);

        apb_master_read(32'h0000_0100, m_read_val); // Out-of-window read
        if (m_read_val != 32'hDEAD_BEEF)
            $fatal(1, "Out-of-window read mismatch: %h", m_read_val);

        apb_master_write(32'h10, 32'hFFFF_FFFF); // Unmapped write is ignored
        apb_master_write(32'h0000_0100, 32'hFFFF_FFFF); // High address ignored
        apb_master_read(32'h08, m_read_val);
        if (m_read_val[15:0] != 16'h3CC3)
            $fatal(1, "Invalid writes modified TX_DATA: %h", m_read_val);

        // Exercise distinct bit patterns to improve meaningful data-bus and
        // TX register toggle coverage; restore the original payload after.
        for (coverage_i = 0; coverage_i < 4; coverage_i = coverage_i + 1) begin
            case (coverage_i)
                0: coverage_pattern = 16'h0000;
                1: coverage_pattern = 16'hFFFF;
                2: coverage_pattern = 16'h5555;
                3: coverage_pattern = 16'hAAAA;
            endcase
            apb_master_write(32'h08, {16'h0000, coverage_pattern});
            apb_master_read(32'h08, m_read_val);
            if (m_read_val[15:0] !== coverage_pattern)
                $fatal(1, "TX pattern readback mismatch at pattern %0d: %h",
                       coverage_i, m_read_val[15:0]);
        end
        apb_master_write(32'h08, 32'h0000_3CC3);

        // Exercise both directions with data patterns that toggle every bit
        // and alternate adjacent bits in the SPI datapath.
        spi_transfer_check(16'h0000, 16'hFFFF);
        spi_transfer_check(16'hFFFF, 16'h0000);
        spi_transfer_check(16'h5555, 16'hAAAA);
        spi_transfer_check(16'hAAAA, 16'h5555);

        // Exercise divider minimum and maximum programming, then restore the
        // original setting without asserting START.
        apb_master_write(32'h00, 32'h0000_0002);
        apb_master_read(32'h00, m_read_val);
        if (m_read_val[15:8] != 8'd20)
            $fatal(1, "Divider minimum clamp mismatch: %h", m_read_val);
        apb_master_write(32'h00, 32'h0000_FF02);
        apb_master_read(32'h00, m_read_val);
        if (m_read_val[15:8] != 8'hFF)
            $fatal(1, "Divider maximum programming mismatch: %h", m_read_val);
        apb_master_write(32'h00, 32'h0000_1402);

        // A START write in slave mode must not activate the embedded master.
        // This covers the (reg_start=1, reg_master_en=0) control combination.
        apb_slave_write(32'h00, 32'h0000_0801);
        #20;
        apb_slave_read(32'h04, s_read_val);
        if (s_read_val[0] != 1'b0)
            $fatal(1, "Slave-mode START incorrectly activated master busy");
        apb_slave_write(32'h00, 32'h0000_0800);

        #200;
        $finish;
    end

endmodule
