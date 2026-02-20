**8-bit ALU with UVM-lite Verification** 



**Overview**



This project implements an 8-bit Arithmetic Logic Unit (ALU) along with a UVM-lite verification environment in SystemVerilog.

The ALU performs common operations like ADD, SUB, AND, OR, XOR, SLT and outputs flags carry and zero.

The verification environment uses interface-driven drivers, monitors, and a scoreboard to validate functionality automatically.



**Features**



8-bit ALU supporting operations:

ADD (opcode 000)

SUB (opcode 001)

AND (opcode 010)

OR (opcode 011)

XOR (opcode 100)

SLT (opcode 101)

Outputs: result, zero flag, carry flag

Interface-based UVM-lite verification

alu\_driver – Generates random inputs

alu\_monitor – Displays signals

alu\_scoreboard – Checks expected results against DUT output

Testbench (top.sv) simulates 50 random operations



**Project Structure**

ALU-UVM-Lite/

│

├─ alu.v               # 8-bit ALU module

├─ alu\_if.sv           # ALU interface

├─ alu\_driver.sv       # Driver class for testbench

├─ alu\_monitor.sv      # Monitor class to display signals

├─ alu\_scoreboard.sv   # Scoreboard class to verify DUT results

├─ top.sv              # Top-level module connecting DUT and verification components

└─ README.md           # Project documentation



**Module Details - ALU (alu.v)**



module alu (

&nbsp;   input  \[7:0] A, B,

&nbsp;   input  \[2:0] opcode,

&nbsp;   output reg \[7:0] result,

&nbsp;   output reg zero,

&nbsp;   output reg carry

);



**Functionality:**



ADD and SUB update carry flag

AND, OR, XOR, SLT operations implemented

zero flag set when result == 0



**UVM-lite Verification**



Interface (alu\_if.sv) – Declares all ALU signals

Driver (alu\_driver.sv) – Randomly drives A, B, and opcode

Monitor (alu\_monitor.sv) – Displays DUT inputs/outputs for debug

Scoreboard (alu\_scoreboard.sv) – Checks DUT result against expected values



**Top Module (top.sv):**

Connects DUT with driver, monitor, and scoreboard; runs 50 random tests.



**Simulation**



Run top.sv using any SystemVerilog simulator (ModelSim, QuestaSim, VCS, Vivado)

Observe the console output to check PASS/FAIL results



**Sample Output:**



MONITOR: A=23 B=45 opcode=0 result=68

✅ PASS

❌ ERROR: Expected=12 Got=15



**Applications**



Core component in microprocessors

Data path and computation in FPGA designs

Verification practice for digital systems



👤 Author



Yogeshwari TS – EEE Final Year

