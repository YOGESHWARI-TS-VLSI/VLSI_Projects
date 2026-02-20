class uart_driver;
    virtual uart_if vif;

    function new(virtual uart_if vif);
        this.vif = vif;
    endfunction

    task drive();
        vif.data_in = $urandom_range(0,255);
        vif.tx_start = 1;
        @(posedge vif.clk);
        vif.tx_start = 0;
    endtask
endclass
