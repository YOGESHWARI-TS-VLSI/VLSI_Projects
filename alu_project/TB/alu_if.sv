interface alu_if;

    logic [7:0] A;
    logic [7:0] B;
    logic [2:0] opcode;
    logic [7:0] result;
    logic zero;
    logic carry;

endinterface
