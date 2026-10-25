`timescale 1ns/1ps
module spi_clk_gen_tb;
    logic clk;
    logic rst_n;
    logic enable;
    logic [15:0] clk_div;
    logic spi_clk;
    spi_clk_gen #(
        .DIV_WIDTH(16)
    ) dut (
        .clk     (clk),
        .rst_n   (rst_n),
        .enable  (enable),
        .clk_div (clk_div),
        .spi_clk (spi_clk)
    );

    task automatic check_toggle_interval(input integer cycles, input integer toggles);
        logic previous_clk;
        integer i;
        begin
            for (i = 0; i < toggles; i = i + 1) begin
                previous_clk = spi_clk;
                repeat (cycles) @(posedge clk);
                #1;
                if (spi_clk === previous_clk)
                    $fatal(1, "SPI clock failed to toggle after %0d cycles (DIV=%0d)",
                           cycles, clk_div);
            end
        end
    endtask


    // 100 MHz system clock
    initial begin
`ifndef NO_FSDB
        $fsdbDumpfile("spi_clk_gen.fsdb");
        $fsdbDumpvars(0, spi_clk_gen_tb);
`endif
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n  = 1'b0;
        enable = 1'b0;
        clk_div = 16'd4;

        // Reset initializes the output and counter.
        repeat (2) @(posedge clk);
        #1;
        if (spi_clk !== 1'b0)
            $fatal(1, "Clock output was not low during reset");

        // A divide value of four toggles once every four system-clock edges.
        @(negedge clk);
        rst_n = 1'b1;
        enable = 1'b1;
        check_toggle_interval(4, 4);

        // Disabling the generator forces a low output and clears its counter.
        @(negedge clk);
        enable = 1'b0;
        @(posedge clk);
        #1;
        if (spi_clk !== 1'b0)
            $fatal(1, "Clock output did not clear when disabled");

        // DIV=1 and DIV=0 both toggle on every system-clock edge.
        @(negedge clk);
        clk_div = 16'd1;
        enable = 1'b1;
        check_toggle_interval(1, 4);
        @(negedge clk);
        enable = 1'b0;
        @(posedge clk);
        #1;
        @(negedge clk);
        clk_div = 16'd0;
        enable = 1'b1;
        check_toggle_interval(1, 3);

        // Exercise the upper counter and divider bits as well. These longer
        // intervals ensure the wide counter is not only tested in its low bits.
        @(negedge clk);
        enable = 1'b0;
        @(posedge clk);
        #1;
        @(negedge clk);
        clk_div = 16'h7FFF;
        enable = 1'b1;
        check_toggle_interval(16'h7FFF, 1);

        @(negedge clk);
        enable = 1'b0;
        @(posedge clk);
        #1;
        @(negedge clk);
        clk_div = 16'h8001;
        enable = 1'b1;
        check_toggle_interval(16'h8001, 1);

        // Assert reset while the output is high to cover reset during activity.
        @(negedge clk);
        rst_n = 1'b0;
        @(posedge clk);
        #1;
        if (spi_clk !== 1'b0)
            $fatal(1, "Clock output did not clear on reset during activity");

        $finish;
    end
endmodule
