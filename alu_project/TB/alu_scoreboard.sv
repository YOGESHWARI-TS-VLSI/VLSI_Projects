class alu_scoreboard;

    function void check(
        logic [7:0] A,
        logic [7:0] B,
        logic [2:0] opcode,
        logic [7:0] result
    );

        logic [7:0] expected;
        logic carry_temp;

        case(opcode)
            3'b000: {carry_temp, expected} = A + B;
            3'b001: {carry_temp, expected} = A - B;
            3'b010: expected = A & B;
            3'b011: expected = A | B;
            3'b100: expected = A ^ B;
            3'b101: expected = (A < B) ? 8'd1 : 8'd0;
            default: expected = 8'd0;
        endcase

        if(result !== expected)
            $display("ERROR: Expected=%0d Got=%0d", expected, result);
        else
            $display("PASS");
    endfunction

endclass
