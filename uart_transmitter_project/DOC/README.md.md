**UART Transmitter – Verilog Implementation**

**Overview**



This project implements a UART (Universal Asynchronous Receiver Transmitter) Transmitter in Verilog and verifies it using a testbench in ModelSim.

The design serializes 8-bit parallel data into UART frame format:



**Start Bit (0) + 8 Data Bits (LSB First) + Stop Bit (1)**



**Features**



Parameterized baud control using CLKS\_PER\_BIT

8-bit data transmission

Start and Stop bit generation

Busy signal indication (tx\_busy)

Fully verified using ModelSim simulation

Clean FSM-based implementation



**Design Details**



UART Frame Format



Bit Type	Value

Idle	        1

Start Bit	0

Data Bits	8 bits (LSB first)

Stop Bit	1



**FSM States**



The transmitter uses a Finite State Machine (FSM):

IDLE

START

DATA

STOP



**Module Interface**



module uart\_tx #(parameter CLKS\_PER\_BIT = 8)(

&nbsp;   input clk,

&nbsp;   input rst,

&nbsp;   input tx\_start,

&nbsp;   input \[7:0] data\_in,

&nbsp;   output reg tx,

&nbsp;   output reg tx\_busy

);



**Simulation**



Tool Used

ModelSim – Intel FPGA Edition 2020.1



**Simulation Result**



During simulation:



tx remains HIGH in idle state

On tx\_start, transmission begins

Start bit = 0

8 data bits transmitted LSB first

Stop bit = 1

tx\_busy stays HIGH during transmission

Waveform confirms correct UART frame generation.



**How It Works**



In IDLE state, tx remains HIGH.

When tx\_start is asserted:

Data is latched

Start bit is transmitted

8 data bits are sent sequentially.

Stop bit is transmitted.

FSM returns to IDLE.



**Parameter Configuration**



To change baud rate timing:

**parameter CLKS\_PER\_BIT = 16;**

Increase value for slower baud rate simulation visibility.



**Concepts Used**



Finite State Machine (FSM)

Sequential logic design

UART protocol

Testbench-based verification

Digital communication fundamentals



**Learning Outcome**



This project demonstrates:

Serial communication design

RTL coding in Verilog

Simulation and waveform analysis

Debugging in ModelSim

Hardware protocol implementation



**Author**



Yogeshwari T S

VLSI / Digital Design Enthusiast





