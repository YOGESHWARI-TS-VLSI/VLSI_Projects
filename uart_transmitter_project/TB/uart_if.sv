interface uart_if;
    logic clk;
    logic rst;
    logic tx_start;
    logic [7:0] data_in;
    logic tx;
    logic tx_busy;
endinterface
