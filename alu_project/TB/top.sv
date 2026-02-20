`timescale 1ns/1ps

`include "alu_if.sv"
`include "alu_driver.sv"
`include "alu_monitor.sv"
`include "alu_scoreboard.sv"

module top;

    alu_if vif();

    alu dut (
        .A(vif.A),
        .B(vif.B),
        .opcode(vif.opcode),
        .result(vif.result),
        .zero(vif.zero),
        .carry(vif.carry)
    );

    alu_driver drv;
    alu_monitor mon;
    alu_scoreboard sb;

    initial begin

        drv = new(vif);
        mon = new(vif);
        sb  = new();

        repeat(50) begin
            drv.drive();
            #10;
            mon.display();
            sb.check(vif.A, vif.B, vif.opcode, vif.result);
        end

        $finish;
    end

endmodule
