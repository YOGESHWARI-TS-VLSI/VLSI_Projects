# VLSI Projects — Yogeshwari T S

RTL design and functional verification projects developed in Verilog and SystemVerilog, simulated using ModelSim. Each project follows a structured RTL/TB/DOC folder layout with a dedicated verification environment.

## Projects

## 1. Synchronous FIFO

**Folder:** `fifo_project/`

A parameterised synchronous FIFO memory buffer designed in Verilog.

- **Parameters:** `WIDTH=8` (data width), `DEPTH=16` (buffer depth)
- **Architecture:** Circular buffer using a `reg` array with 4-bit read/write pointer pair
- **Status flags:** `full` and `empty` derived from pointer comparison; supports simultaneous read/write without collision
- **Reset:** Asynchronous active-high reset; pointers and output cleared on assertion
- **Testbench (`fifo_tb.v`):** Directed stimulus — writes 5 random values then reads them back; verifies FIFO ordering and flag transitions via ModelSim waveform analysis

**Key design decision:** Full condition is detected when `wr_ptr + 1 == rd_ptr`, deliberately sacrificing one storage slot to distinguish full from empty without an extra counter — a standard circular buffer trade-off.

## 2. 8-bit ALU with UVM-lite Verification

**Folder:** `alu_project/`

An 8-bit Arithmetic Logic Unit designed in Verilog and verified using a SystemVerilog UVM-lite environment with interface, driver, monitor, and scoreboard components.

**Supported operations (6 opcodes):**

| Opcode | Operation | Description |
|--------|-----------|-------------|
| `000`  | ADD       | `{carry, result} = A + B` |
| `001`  | SUB       | `{carry, result} = A - B` |
| `010`  | AND       | `result = A & B` |
| `011`  | OR        | `result = A \| B` |
| `100`  | XOR       | `result = A ^ B` |
| `101`  | SLT       | `result = (A < B) ? 1 : 0` |

**Output flags:** `carry` (updated on ADD/SUB), `zero` (asserted when `result == 0`)

**Verification environment:**
- `alu_if.sv` — SystemVerilog interface declaring all DUT signals
- `alu_driver.sv` — Drives randomised A, B, and opcode via `$urandom_range`
- `alu_monitor.sv` — Displays DUT inputs and outputs each cycle
- `alu_scoreboard.sv` — Computes expected result independently and compares against DUT output; prints PASS/ERROR per transaction
- `top.sv` — Instantiates DUT and all TB components; runs **50 randomised test transactions**

## 3. UART Transmitter with UVM-lite Verification

**Folder:** `uart_transmitter_project/`

A parameterised UART transmitter designed in Verilog using register-based shift logic, verified with a SystemVerilog UVM-lite testbench.

**Frame format:** `START (0) + 8 data bits (LSB first) + STOP (1)` — standard 8N1 UART

**Design details:**
- `CLKS_PER_BIT = 8` (configurable) controls baud timing; each bit held for 8 clock cycles
- 10-bit shift register `tx_shift` holds `{stop, data[7:0], start}` — entire frame loaded on transmission start
- `tx_busy` signal held high during transmission; `tx` line returns to idle-high after stop bit
- Asynchronous reset returns all registers and `tx` to idle state

**Verification environment:**
- `uart_if.sv` — Interface declaring `clk`, `rst`, `tx_start`, `data_in`, `tx`, `tx_busy`
- `uart_driver.sv` — Drives randomised 8-bit `data_in` and pulses `tx_start` for one clock cycle
- `uart_monitor.sv` — Displays `data_in`, `tx`, and `tx_busy` after each transmission
- `uart_scoreboard.sv` — Checks that `tx` returns to idle-high (`1`) when `tx_busy` deasserts
- `top.sv` — Resets DUT, transmits **5 random bytes**, waits for `tx_busy` to deassert between each, verifies idle line recovery


## Tools & Environment

- **Simulator:** ModelSim — Intel FPGA Edition 2020.1
- **RTL language:** Verilog (IEEE 1364-2001)
- **Testbench language:** SystemVerilog (IEEE 1800-2012)
- **Verification style:** Directed (FIFO) and UVM-lite with interface/driver/monitor/scoreboard (ALU, UART)

## Repository Structure

```
VLSI_Projects/
├── fifo_project/
│   ├── RTL/          fifo.v
│   ├── TB/           fifo_tb.v
│   └── DOC/          README.md, waveform_fifo.png
├── alu_project/
│   ├── RTL/          alu.v
│   ├── TB/           alu_if.sv  alu_driver.sv  alu_monitor.sv  alu_scoreboard.sv  top.sv
│   └── DOC/          README.md, waveform_alu_project.png
└── uart_transmitter_project/
    ├── RTL/          uart_tx.v
    ├── TB/           uart_if.sv  uart_driver.sv  uart_monitor.sv  uart_scoreboard.sv  top.sv
    └── DOC/          README.md, waveform_uart.png
```

---

**Yogeshwari T S — EEE Final Year (2022–2026), K. Ramakrishnan College of Engineering**
**Best Outgoing Student, EEE Department, Batch 2022–2026**
