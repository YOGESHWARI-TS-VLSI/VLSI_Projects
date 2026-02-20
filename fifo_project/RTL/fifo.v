
module fifo #(parameter WIDTH=8, DEPTH=16)(
    input clk, rst, wr_en, rd_en,
    input [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out,
    output full, empty
);
    reg [WIDTH-1:0] mem [0:DEPTH-1];
    reg [3:0] rd_ptr, wr_ptr;

    assign full = (wr_ptr+1 == rd_ptr);
    assign empty = (rd_ptr == wr_ptr);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            rd_ptr <= 0;
            wr_ptr <= 0;
            data_out <= 0;
        end else begin
            if (wr_en && !full) mem[wr_ptr] <= data_in;
            if (rd_en && !empty) data_out <= mem[rd_ptr];
            if (wr_en && !full) wr_ptr <= wr_ptr + 1;
            if (rd_en && !empty) rd_ptr <= rd_ptr + 1;
        end
    end
endmodule

