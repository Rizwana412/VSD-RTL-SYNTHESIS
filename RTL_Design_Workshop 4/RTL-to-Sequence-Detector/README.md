📎BABYSOC — COMPLETE RTL TO PHYSICAL DESIGN FLOW 

📎1. PROJECT OVERVIEW 
This repository documents the BabySoC digital design flow from RTL design and functional simulation through synthesis, post-synthesis Gate-Level Simulation (GLS), and preparation for Physical Design (PD).

The complete flow is:

Specification
    ↓
RTL Design (Verilog)
    ↓
Testbench
    ↓
Pre-Synthesis / RTL Simulation
    ↓
GTKWave Verification
    ↓
Logic Synthesis using Yosys
    ↓
Technology Mapping to SKY130 Standard Cells
    ↓
Gate-Level Netlist
    ↓
Post-Synthesis Gate-Level Simulation (GLS)
    ↓
GTKWave Verification
    ↓
PRE vs POST Functional Comparison
    ↓
Physical Design
    ↓
Floorplanning → Power Planning → Placement
    ↓
Clock Tree Synthesis (CTS)
    ↓
Routing
    ↓
STA / Physical Verification
    ↓
GDSII

📎2. What is RTL?
RTL (Register Transfer Level) describes the intended digital hardware behavior. Verilog HDL is used to describe registers, combinational logic, sequential logic, clocks, resets, inputs and outputs.

At RTL we describe what the circuit should do, not its final physical implementation.

Inputs
  ↓
RTL Logic
  ↓
Registers / Outputs

📎3. VERILOG HDL AND TESTBENCH 
The design is written using Verilog HDL.

A testbench provides the verification environment. It:

1.Generates the clock.
2.Applies reset.
3.Applies input/reference stimulus.
4.Instantiates the DUT (Design Under Test).
5.Observes outputs.
6.Generates a VCD waveform for analysis.
Conceptually:


             Testbench
          ┌───────────────┐
CLK ─────►│               │
RESET ───►│      DUT      │────► OUT
REF ─────►│    BabySoC    │────► RV_TO_DAC[9:0]
          └───────────────┘
The testbench is for verification and is not synthesized as hardware.

📎4. PRE-SYNTHESIS / RTL SIMULATION 
Before synthesis, the original RTL is simulated using Icarus Verilog.

RTL
 ↓
Icarus Verilog
 ↓
RTL Simulation
 ↓
pre_synth_sim.vcd
 ↓
GTKWave
>Files generated in this project include:

 pre_synth_sim.out
 pre_synth_sim.vcd
 >The VCD waveform is opened using:
     gtkwave pre_synth_sim.vcd
📎Important signals
CLK
REF
OUT
RV_TO_DAC[9:0]
 The pre-synthesis simulation acts as the functional reference for later verification.


📎5. WHY PRE-SYNTHESIS SIMULATION IS REQUIRED 
We first establish that the RTL behaves correctly.

The principle is:

Correct RTL
    ↓
Correct PRE Simulation
    ↓
Synthesis
    ↓
POST Simulation
If the RTL is not correct, synthesis cannot magically make the intended design correct.

📎6. GTKWave
GTKWave is used to view the VCD waveforms.

For BabySoC, important signals include:

•CLK
•REF
•OUT
•RV_TO_DAC[9:0]
The 10-bit RV_TO_DAC bus can be viewed as:

RV_TO_DAC[9]
RV_TO_DAC[8]
...
RV_TO_DAC[0]
The individual bits switch at different rates because they represent different binary weights.

📎7. LOGIC SYNTHESIS 
Synthesis converts RTL into a gate-level implementation.

Verilog RTL
    ↓
Yosys
    ↓
Logic Optimization
    ↓
Technology Mapping
    ↓
Gate-Level Netlist
The purpose is to transform behavioral RTL into actual standard-cell instances that can eventually be physically implemented.

📎8. YOSYS
Yosys is the open-source synthesis tool used in this flow.

A simplified synthesis process is:

Read RTL
   ↓
Elaborate
   ↓
Process RTL
   ↓
Optimize Logic
   ↓
Technology Mapping
   ↓
Write Netlist
The resulting netlist describes the design using gates and standard cells instead of high-level RTL constructs.

📎9. SKY130 STANDARD-CELL LIBRARY 
THE DESIGN IS MAPPED TO THE SKY130 STANDARD-CELL ENVIRONMENT.

A standard-cell library provides predefined cells such as:

•AND / NAND
•OR / NOR
•INV
•MUX
•Buffers
•Flip-Flops
•Clock cells
Library information includes function, timing, area, capacitance and drive characteristics.

Different drive strengths allow synthesis to trade off:

Timing ↔ Area ↔ Power


📎10. GATE-LEVEL NETLIST 
After synthesis, the RTL becomes a gate-level netlist.

Example project files:

baby_soc_netlist.v
baby_soc_netlist3.v
The synthesized netlist contains instances of standard cells and their connections.

Conceptually:

RTL
 ↓
Logic Optimization
 ↓
Standard-Cell Mapping
 ↓
Gate-Level Netlist
The internal structure can be much larger and more complicated than the original RTL. That is normal.

📎11. What is GLS?
GLS means Gate-Level Simulation.

After synthesis, the synthesized netlist is simulated to verify that synthesis has preserved the intended functionality.

Synthesized Netlist
        +
Standard-Cell Models
        +
Testbench
        ↓
     Icarus
        ↓
Post-Synthesis GLS
        ↓
post_synth_sim.vcd


📎12. Why GLS is Important
Synthesis changes the implementation.

Therefore we verify:

For the same testbench stimulus, does the synthesized gate-level design produce the intended functional outputs?

We do not expect every internal signal to look identical because:

PRE = RTL representation
POST = Standard-cell gate representation
The important comparison is the functional behavior at relevant outputs.


📎13. POST-SYNTHESIS GLS
The post-synthesis simulation uses:

Testbench
+
Synthesized Netlist
+
SKY130 Gate/Cell Models
The resulting files include:

post_synth_sim.out
post_synth_sim.vcd
Open the waveform with:

gtkwave post_synth_sim.vcd
Important signals:

CLK
REF
OUT
RV_TO_DAC[9:0]

📎14. PRE vs POST COMPARISON 

Main rule
Same input stimulus
        ↓
PRE RTL
        VS
POST synthesized netlist
        ↓
Corresponding functional outputs
The output behavior should be functionally equivalent.


📎15. Why POST Waveform Looks More Complicated

The synthesized netlist contains many standard-cell instances.

GTKWave may therefore show internal names such as:

_3997_
_3998_
_3999_
...
This is expected.

The RTL contains high-level signals, while the synthesized netlist contains low-level implementation details.

Therefore the comparison should focus on the important functional signals rather than trying to make every internal signal identical.


📎16. USEFUL LINUX COMMANDS 
CHECK CURRENT DIRECTORY:
    pwd
List files:
    ls
Detailed listing:
   ls -lh
Enter the simulation directory:
  cd ~/BabySoC_Simulation
Go one directory back:
   cd ..
Find a file:
   find .. -name "primitives.v"
Find the BabySoC module:
   find .. -name "vsdbabysoc.v"
Search for a module:
   grep -n "module vsdbabysoc"         src/module/vsdbabysoc.v

📎17. CURRENT SIMULATION FILES
The working directory contains the major simulation and synthesis results:

BabySoC_Simulation/
│
├── baby_soc_netlist.v
├── baby_soc_netlist3.v
├── post_synth_sim.out
├── post_synth_sim.vcd
├── pre_synth_sim.out
├── pre_synth_sim.vcd
├── README.md
│
└── src/
    ├── module/
    ├── gls_model/
    └── include/
---# BabySoC --- Pre-Synthesis & Post-Synthesis Gate-Level Simulation

Overview
This section documents the verification of the BabySoC design before and after logic synthesis.

The objective is to verify that the synthesized gate-level implementation preserves the functional behavior of the original RTL design.

Simulation Flow
RTL Design
    │
    ├── Pre-Synthesis Simulation
    │       ↓
    │   pre_synth_sim.vcd
    │       ↓
    │     GTKWave
    │
    └── Yosys Synthesis
            ↓
      Gate-Level Netlist
            ↓
      Post-Synthesis GLS
            ↓
      post_synth_sim.vcd
            ↓
          GTKWave

📎18.KEY LEARNING 
This stage demonstrates:

RTL
 ↓
Simulation
 ↓
Synthesis
 ↓
Gate-Level Netlist
 ↓
Gate-Level Simulation
 ↓
Functional Verification
Successful GLS provides confidence that synthesis has preserved the intended functionality before proceeding to Physical Design.

📎19.From GLS to Physical Design
Once functional GLS verification is satisfactory, the synthesized netlist becomes the starting point for Physical Design.

Verified Gate-Level Netlist
          ↓
     Floorplanning
          ↓
     Power Planning
          ↓
       Placement
          ↓
          CTS
          ↓
       Routing
          ↓
          STA
          ↓
 Physical Verification
          ↓
         GDSII

📎20. FLOOR PLANNING 
Floor planning defines the physical organization of the chip.

It determines:

Die/core dimensions
Core utilization
I/O locations
Macro locations
Standard-cell placement region
Conceptually:

+---------------------------+
|            DIE            |
|                           |
| I/O                   I/O |
|                           |
|       CORE / CELLS        |
|                           |
|                           |
| I/O                   I/O |
+---------------------------+

📎21. POWER PLANNING 
The chip needs a reliable power and ground distribution network.

Conceptually:

VDD
 ↓
Power Ring
 ↓
Power Straps
 ↓
Standard Cells

VSS
 ↓
Ground Ring
 ↓
Ground Straps
 ↓
Standard Cells

📎22. PLACEMENT 
Placement determines the physical locations of standard cells.

The tool attempts to optimize:

Timing
Wirelength
Congestion
Area
Power
Conceptually:

Gate-Level Netlist
        ↓
Physical Cell Locations

📎23.Clock Tree Synthesis (CTS)
The clock must reach many sequential elements.

CTS builds a clock distribution network:

                 CLK
                  |
             Clock Tree
          /      |              FF       FF       FF
CTS controls important parameters such as:

•Clock skew
•Clock latency
•Clock transition
•Timing

📎24.ROUTING
Routing creates physical metal connections between placed cells.

Typical flow:

Global Routing
      ↓
Detailed Routing
The router connects all nets while following technology rules and attempting to control congestion and timing.

📎25.AREA, POWER AND TIMING 
Physical design is an optimization problem involving:

Power
Area
Timing
For example, using stronger cells may improve timing but can increase area and power.

Therefore the final implementation must balance all three.


📎26. PHYSICAL VERIFICATION 
After routing, physical verification checks whether the layout is correct and manufacturable.

Typical checks include:

•DRC — Design Rule Check
•LVS — Layout Versus Schematic
•Antenna checks
•Connectivity checks
•Timing checks

📎27.GDSII
GDSII is the final physical layout database.

The overall journey is:

RTL
 ↓
Simulation
 ↓
Synthesis
 ↓
Gate-Level Netlist
 ↓
Floorplan
 ↓
Power Plan
 ↓
Placement
 ↓
CTS
 ↓
Routing
 ↓
STA / Physical Verification
 ↓
GDSII

📎28. CURRENT PROJECT STATUS 
📎Completed
>RTL design understanding
>Testbench understanding
>Pre-synthesis simulation
>Pre-synthesis VCD generation
 >GTKWave analysis
 >Yosys synthesis
 >Gate-level netlist generation
 >SKY130 cell-model setup
 >Post-synthesis GLS
 >Post-synthesis VCD generation
 >Post-synthesis GTKWave inspection
📎Current Checkpoint
 •Final PRE vs POST waveform comparison
 •Add PRE waveform screenshot
 •Add POST waveform screenshot
 •Add side-by-side comparison screenshot
 •Record final GLS conclusion
📎Next Stage
 •Physical Design setup
 •Floorplanning
 •Power planning
 •Placement
 •CTS
 •Routing
 •STA
 •Physical verification
 •GDSII


📎29.CONCLUSION
This project demonstrates the complete transition from a behavioral RTL design to a synthesized gate-level implementation and then to functional verification through Gate-Level Simulation.

The key verification principle is:

For the same testbench stimulus, the synthesized implementation should preserve the intended functional behavior of the RTL.

After the PRE vs POST comparison is verified, the synthesized gate-level netlist can be taken forward into the Physical Design flow.









         

