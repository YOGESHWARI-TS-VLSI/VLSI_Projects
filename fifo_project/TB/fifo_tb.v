module fifo_tb;
    reg clk = 0, rst;
    reg wr_en, rd_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full, empty;

    // Instantiate FIFO
    fifo uut (.clk(clk), .rst(rst), .wr_en(wr_en), .rd_en(rd_en), 
              .data_in(data_in), .data_out(data_out), .full(full), .empty(empty));

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        rst = 1; wr_en = 0; rd_en = 0; data_in = 0;
        #10 rst = 0;
        
        // Write 5 values
        wr_en = 1;
        repeat(5) begin
            data_in = $random;
            #10;
        end
        wr_en = 0;

        // Read 5 values
        rd_en = 1;
        repeat(5) #10;
        rd_en = 0;

        #20 $finish;
    end
endmodule