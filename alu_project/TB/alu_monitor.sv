class alu_monitor;

    virtual alu_if vif;

    function new(virtual alu_if vif);
        this.vif = vif;
    endfunction

    function void display();
        $display("MONITOR: A=%0d B=%0d opcode=%0d result=%0d",
                vif.A, vif.B, vif.opcode, vif.result);
    endfunction

endclass
