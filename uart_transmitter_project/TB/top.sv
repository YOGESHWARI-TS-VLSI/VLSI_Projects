`timescale 1ns/1ps

`include "uart_if.sv"
`include "uart_driver.sv"
`include "uart_monitor.sv"
`include "uart_scoreboard.sv"
`include "uart_tx.v"

module top;

    uart_if vif();

    uart_tx #(.CLKS_PER_BIT(8)) dut (
        .clk(vif.clk),
        .rst(vif.rst),
        .tx_start(vif.tx_start),
        .data_in(vif.data_in),
        .tx(vif.tx),
        .tx_busy(vif.tx_busy)
    );

    uart_driver drv;
    uart_monitor mon;
    uart_scoreboard sb;

    // Clock generation
    initial vif.clk = 0;
    always #5 vif.clk = ~vif.clk;

    initial begin
        drv = new(vif);
        mon = new(vif);
        sb  = new();

        // Reset
        vif.rst = 1;
        vif.tx_start = 0;
        vif.data_in = 8'h00;
        #20 vif.rst = 0;

        // Send 5 random bytes
        repeat (5) begin
            drv.drive();
            #10;
            mon.display();
            sb.check(vif.data_in, vif.tx, vif.tx_busy);
            wait(vif.tx_busy == 0);
            #10;
        end

        $finish;
    end
endmodule
