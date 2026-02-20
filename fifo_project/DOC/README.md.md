**FIFO Verilog Project**



**Project Overview**



This project implements a synchronous FIFO (First-In-First-Out) memory buffer using Verilog HDL. The FIFO is designed for digital systems that require temporary storage of data with orderly read and write operations.



The FIFO supports parameterized data width and depth, making it flexible for various applications.



**Features**



* Parameterized data width and FIFO depth
* Supports write enable (wr\_en) and read enable (rd\_en) signals
* Detects full and empty FIFO conditions
* Synchronous design with clock (clk) and reset (rst)
* Testbench included for simulation



**Module Description**



**FIFO Module (fifo.v)**



module fifo #(parameter WIDTH=8, DEPTH=16)(

&nbsp;   input clk, rst, wr\_en, rd\_en,

&nbsp;   input \[WIDTH-1:0] data\_in,

&nbsp;   output reg \[WIDTH-1:0] data\_out,

&nbsp;   output full, empty

);



**Ports:**



clk : System clock

rst : Asynchronous reset

wr\_en : Write enable

rd\_en : Read enable

data\_in : Input data bus

data\_out : Output data bus

full : High when FIFO is full

empty : High when FIFO is empty



**Internal Implementation:**



FIFO memory implemented using a reg array

Read (rd\_ptr) and write (wr\_ptr) pointers track memory locations

Full and empty signals calculated using pointer comparison

Supports simultaneous read and write operations



**Testbench (fifo\_tb.v)**



Generates clock and reset signals

Writes 5 random values to the FIFO

Reads 5 values from the FIFO

Simulates FIFO behavior for verification



**Simulation**



Run the testbench using any Verilog simulator (e.g., ModelSim, Vivado, Icarus Verilog)

Observe the data\_out, full, and empty signals to verify correct FIFO operation



**Applications**

Buffering in digital communication systems

Temporary storage in microprocessors and FPGA designs

Handling asynchronous data streams



**Author**



Yogeshwari TS

EEE Final Year Student

