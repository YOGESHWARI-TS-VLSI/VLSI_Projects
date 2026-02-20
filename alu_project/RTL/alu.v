module alu (
    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] opcode,
    output reg [7:0] result,
    output reg zero,
    output reg carry
);

always @(*) begin
    carry = 0;
    case(opcode)
        3'b000: {carry, result} = A + B;       // ADD
        3'b001: {carry, result} = A - B;       // SUB
        3'b010: result = A & B;                // AND
        3'b011: result = A | B;                // OR
        3'b100: result = A ^ B;                // XOR
        3'b101: result = (A < B) ? 8'd1 : 8'd0; // SLT
        default: result = 8'd0;
    endcase

    zero = (result == 0);
end

endmodule
