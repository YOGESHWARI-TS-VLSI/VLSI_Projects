class uart_monitor;
    virtual uart_if vif;

    function new(virtual uart_if vif);
        this.vif = vif;
    endfunction

    function void display();
        $display("MONITOR: data_in=%0d tx=%b tx_busy=%b", 
                  vif.data_in, vif.tx, vif.tx_busy);
    endfunction
endclass
