module uart_tx #(
    parameter CLKS_PER_BIT = 8
)(
    input clk,
    input rst,
    input tx_start,
    input [7:0] data_in,
    output reg tx,
    output reg tx_busy
);

    reg [3:0] bit_index;
    reg [3:0] clk_count;
    reg [9:0] tx_shift;
    reg sending;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tx <= 1'b1;
            tx_busy <= 0;
            bit_index <= 0;
            clk_count <= 0;
            sending <= 0;
        end
        else begin
            if (tx_start && !sending) begin
                sending <= 1;
                tx_busy <= 1;
                tx_shift <= {1'b1, data_in, 1'b0}; // stop + data + start
                bit_index <= 0;
                clk_count <= 0;
            end

            if (sending) begin
                if (clk_count < CLKS_PER_BIT-1)
                    clk_count <= clk_count + 1;
                else begin
                    clk_count <= 0;
                    tx <= tx_shift[bit_index];
                    bit_index <= bit_index + 1;

                    if (bit_index == 9) begin
                        sending <= 0;
                        tx_busy <= 0;
                        tx <= 1'b1;
                    end
                end
            end
        end
    end
endmodule
