class uart_scoreboard;

    function void check(
        logic [7:0] data_in,
        logic tx,
        logic tx_busy
    );
        // Minimal check: tx goes low for start bit
        if (!tx_busy && tx !== 1'b1)
            $display("ERROR: tx line idle expected 1, got %b", tx);
        else
            $display("PASS for data_in=%0d", data_in);
    endfunction
endclass
