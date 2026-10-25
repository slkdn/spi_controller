`timescale 1ns/1ps
module spi_master_tb;
    //============================================================
    // 1. Testbench signals
    //============================================================
    logic        clk;
    logic        rst_n;
    logic        start;
    logic [15:0] tx_data;
    logic [15:0] clk_div;
    logic        miso;
    logic        mosi;
    logic        sclk;
    logic        cs_n;
    logic [15:0] rx_data;
    logic        busy;
    logic        done;

    //============================================================
    // 2. DUT
    //============================================================
    spi_master #(
        .DIV_WIDTH(16)
    ) dut (
        .clk     (clk),
        .rst_n   (rst_n),
        .start   (start),
        .tx_data (tx_data),
        .clk_div (clk_div),
        .miso    (miso),
        .mosi    (mosi),
        .sclk    (sclk),
        .cs_n    (cs_n),
        .rx_data (rx_data),
        .busy    (busy),
        .done    (done)
    );

    //============================================================
    // 3. System clock
    //============================================================
    // 100 MHz
    initial begin
        clk = 1'b0;
        forever begin
            #5;
            clk = ~clk;
        end
    end

    //============================================================
    // 4. MISO stimulus
    //============================================================
    // Slave will return 16'h3CC3
    //
    // 3CC3 = 0011_1100_1100_0011
    //
    // SPI Mode 0:
    // Master samples MISO on rising edge.
    //
    // Therefore MISO must be prepared before each
    // SCLK rising edge.

    logic [15:0] slave_tx_data;
    integer     slave_bit_cnt;
    
    always @(negedge cs_n) begin
        slave_bit_cnt = 0;
        miso = slave_tx_data[15];
    end

    always @(posedge cs_n) begin
        slave_bit_cnt = 0;
        miso = 1'b0;
    end

    always @(negedge sclk) begin
        if (!cs_n) begin
            if (slave_bit_cnt < 15) begin
                slave_bit_cnt = slave_bit_cnt + 1;
                miso = slave_tx_data[15-slave_bit_cnt];
            end else begin
                miso = 1'b0;
            end
        end
    end

    task automatic run_transfer(
        input logic [15:0] master_word,
        input logic [15:0] slave_word,
        input logic [15:0] divider
    );
        integer wait_cycles;
        integer timeout_cycles;
        begin
            @(negedge clk);
            tx_data = master_word;
            slave_tx_data = slave_word;
            clk_div = divider;
            start = 1'b1;
            @(negedge clk);
            start = 1'b0;

            wait_cycles = 0;
            timeout_cycles = ((divider == 16'd0) ? 1 : divider) * 40 + 200;
            while (done !== 1'b1) begin
                @(posedge clk);
                #1;
                wait_cycles = wait_cycles + 1;
                if (wait_cycles >= timeout_cycles)
                    $fatal(1, "Timeout: DIV=%0d TX=%h", divider, master_word);
            end

            if (rx_data !== slave_word)
                $fatal(1, "RX mismatch: DIV=%0d expected=%h actual=%h",
                       divider, slave_word, rx_data);
            if (busy !== 1'b0 || cs_n !== 1'b1)
                $fatal(1, "Master did not return idle: DIV=%0d", divider);
            @(posedge clk);
            #1;
        end
    endtask

    //============================================================
    // 5. Main test
    //============================================================
    initial begin
        // Initial values
        rst_n   = 1'b0;
        start   = 1'b0;
        tx_data = 16'h0000;
        clk_div = 16'd4;
        slave_tx_data = 16'h0000;
        slave_bit_cnt = 0;
        miso = 1'b0;
        // Reset
        #20;
        rst_n = 1'b1;
        // Wait a little
        #20;

        // Exercise zero/one divider edge cases, a nominal divider, and
        // larger values that toggle more counter bits.
        run_transfer(16'hA55A, 16'h3CC3, 16'd4);
        run_transfer(16'h0000, 16'hFFFF, 16'd1);
        run_transfer(16'hFFFF, 16'h0000, 16'd0);
        run_transfer(16'h5555, 16'hAAAA, 16'd16);
        run_transfer(16'hAAAA, 16'h5555, 16'd255);

        $display("SPI MASTER TEST PASS: five transfers completed");
        $finish;
    end

    //============================================================
    // 6. FSDB
    //============================================================
    initial begin
`ifndef NO_FSDB
        $fsdbDumpfile("spi_master.fsdb");
        $fsdbDumpvars(0, spi_master_tb);
`endif
    end
endmodule
