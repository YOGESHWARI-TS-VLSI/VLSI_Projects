class alu_driver;

    virtual alu_if vif;

    function new(virtual alu_if vif);
        this.vif = vif;
    endfunction

    task drive();
        vif.A = $urandom_range(0,255);
        vif.B = $urandom_range(0,255);
        vif.opcode = $urandom_range(0,5);
    endtask

endclass
