# Physical Design Workshop – OpenLANE & Sky130

This repository contains the practical work completed during the Physical Design workshop using the open-source EDA flow and Sky130 technology.

The work is organized into two modules:

- Module 1: Inception of Open-Source EDA, OpenLANE and Sky130 PDK
- Module 2: Good Floorplan vs Bad Floorplan and Introduction to Library Cells

## Overall Physical Design FlowRTL Design
    ↓
Synthesis
    ↓
Floorplanning
    ↓
Power Planning
    ↓
Placement
    ↓
Clock Tree Synthesis
    ↓
Routing
    ↓
Physical Verification
    ↓
Final Design

# Module 1 – Introduction to Open-Source EDA, OpenLANE and Sky130 PDK

This module covers the basics of how digital designs are built, how software tools interact with hardware, and gives an overview of SoC implementation using OpenLANE with Sky130 technology.

### Concepts Explored
- Understanding computer to hardware communication
- SoC design methodology and OpenLANE framework
- Exploring open-source EDA tool chain
- Overview of OpenLANE flow and Sky130 PDK structure
- Distinguishing tool-dependent and technology-dependent files
- Design setup parameters like die size and clock constraints

### Lab Work
Screenshots in this module show OpenLANE environment, PDK related files, metal layer details, die area definition and clock configuration outputs.
# Module 2 – Floorplan, Placement and Standard Cell Library

This module is focused on understanding floorplanning, cell placement and basics of standard cell libraries along with physical design perspectives.

### Concepts Explored
- Floorplanning aspects for SKY130 – core area planning
- Effect of Utilization and Aspect Ratio on floorplan quality
- Standard cell design and its characterization process
- Key timing parameters for library characterization
- Visual analysis of floorplan and placement results
- Overview of Sky130 standard cells and interconnect layers

### Lab Work
This module includes screenshots of design name, floorplan view, Magic layout views for floorplan and placement, placement of standard cells, details of Sky130 library, views of selected metal layers and post-synthesis netlist.    


This workshop mainly focused on the initial phases of the PD flow, where we got hands-on experience with OpenLANE, Sky130 PDK, floorplan creation, placement analysis, standard cell study and layout views.

### Tools / Technologies Used
- OpenLANE flow
- Sky130 Process Design Kit
- Open-Source EDA toolchain
- Magic Layout Viewer
- Linux based working environment
- Sky130 Standard Cell Library

### Summary
Both modules gave practical insight into the starting part of physical design, beginning from open-source EDA setup and OpenLANE flow to floorplan, placement and library cell understanding. All attached screenshots capture the lab activities performed and serve as proof of practical implementation.

Module 3 — Design Library Cell Using Magic Layout and ngspice Characterization

Overview This module covers end-to-end standard cell design including CMOS inverter simulation using ngspice, understanding of the CMOS fabrication flow, creation of standard-cell layout in Magic using Sky130 technology, SPICE netlist extraction, and electrical characterization using Sky130 PDK model files.

Topics Covered 1.SKY130_D3_SK1 — Labs for CMOS inverter ngspice simulations, IO placer revision, SPICE deck creation, switching threshold Vm, static and dynamic simulation, lab steps to git clone design 2.SKY130_D3_SK2 — Inception of Layout – CMOS fabrication process including active regions, N-well/P-well, gate, LDD, source-drain, local interconnect and higher metal formation, Sky130 layers and LEF, standard-cell layout and SPICE netlist extraction 3.SKY130_D3_SK3 — Sky130 Tech File Labs including final SPICE deck using Sky130 tech, characterization using Sky130 models, Magic tool options and DRC rules, PDK download, loading tech-rules in Magic, fixing poly.9 error, poly resistor spacing, and DRC error analysis as geometrical constructs

Practical Focus Practicals include CMOS inverter SPICE modeling and simulation, Vm and transient analysis, layout creation covering fabrication layers, standard-cell design and netlist extraction, and inverter characterization with Sky130 technology files and Magic DRC corrections. #Implementation & Results* The practical work demonstrates SPICE deck creation and inverter simulation, analysis of switching characteristics and waveform, implementation of CMOS fabrication layers, standard-cell layout design with parasitic extraction, and characterization using Sky130 PDK models along with DRC validation in Magic. 


#Key Takeaways

CMOS inverter simulation and characterization is performed using ngspice.
Physical layout implementation is correlated with the underlying CMOS fabrication layers and process steps.
Magic tool is utilized for layout creation, inspection, and DRC verification.
Sky130 PDK technology and model files are integrated into the characterization flow.
Layout-to-SPICE extraction establishes connectivity between physical design and electrical representation.

#Module 4 — Pre-Layout Timing Analysis and Importance of Good Clock Tree

Overview This module covers timing characterization, pre-layout STA using OpenSTA, clock tree implementation with TritonCTS, signal integrity challenges, and timing closure with propagated clocks.

Topics Covered 1 SKY130_D4_SK1 — Timing Modeling using Delay Tables - Methodology to convert grid data to track information - Procedure to generate Standard-Cell LEF from Magic layout - Overview of timing libraries and integration of a new cell (vsdinv) into the synthesis flow - Fundamentals of NLDM delay tables and their application in timing calculation

2.SKY130_D4_SK2 — Timing Analysis with Ideal Clocks using OpenSTA - Concept of setup timing and flip-flop setup requirements - Understanding clock jitter and clock uncertainty - Configuration of OpenSTA for post-synthesis timing checks - Synthesis optimization techniques to mitigate setup violations

3.SKY130_D4_SK3 — Clock Tree Synthesis with TritonCTS & Signal Integrity - Clock routing and buffering using H-Tree architecture - Crosstalk effects and clock shielding techniques - Execution of CTS flow using TritonCTS and post-CTS verification

SKY130_D4_SK4 — Timing Analysis with Real (Propagated) Clocks using OpenSTA
Setup and hold analysis with real clocks
Running OpenSTA with accurate timing libs and CTS results
Studying the impact of CTS buffer sizing on setup and hold slack
Practical Focus Labs start from LIB/LEF generation and delay table concepts, link them to synthesis and ideal-clock STA, then move to CTS construction, SI-aware clock routing, and finally perform real-clock setup/hold analysis to achieve timing closure.

Evidences SK1 - Timing Modelling:*

Track info generated from grid, LEF exported from Magic, vsdinv cell added to lib, delay tables verified, synthesis done with vsdinv.
SK2 - Ideal Clock STA:

OpenSTA configured, SDC with clock jitter/uncertainty, setup report generated, WNS improved after synthesis optimization.
SK3 - CTS:

TritonCTS run using H-Tree, clock buffered and routed, shielding applied to avoid crosstalk, CTS verified.
SK4 - Real Clock STA:

Propagated clock set, setup & hold analysis with real clocks, buffer size impact observed, final timing closed.
#Key Takeaways:

NLDM timing libraries capture cell delays used for STA during implementation.
OpenSTA enables pre-layout timing checks for both setup and hold conditions.
Clock jitter and uncertainty must be modeled to ensure realistic timing margins.
TritonCTS constructs the clock distribution using H-Tree topology with buffering and shielding to minimize skew and crosstalk.
Post-CTS analysis with propagated (real) clocks reveals accurate setup and hold behavior.
Proper sizing of CTS buffers directly impacts timing closure and skew control.

#Module 5 — Final Steps for RTL2GDS Using TritonRoute and OpenSTA

Overview This module covers the final stages of the RTL2GDS flow. It focuses on maze routing fundamentals, DRC principles, power distribution network implementation, routing configuration, and the key features and outputs of TritonRoute.

Topics Covered

SKY130_D5_SK1 — Routing and Design Rule Check (DRC)

Fundamentals of maze routing and Lee's algorithm
Cost-based pathfinding and back-tracing in grid routing
Introduction to design rules and DRC verification
SKY130_D5_SK2 — Power Distribution Network and Routing Flow

Lab implementation of power distribution network from straps to standard-cell rails
Integration of PDN with placement
Fundamentals of global and detailed routing
Configuration of TritonRoute for routing execution
SKY130_D5_SK3 — TritonRoute Features and Post-Route Flow

Feature 1: Adherence to pre-processed route guides
Feature 2 & 3: Inter-guide connectivity and intra/inter-layer routing capability
Methods for handling connectivity and routing topology
Analysis of final output files after detailed routing
Practical Focus The practicals cover maze routing concepts, DRC-clean vs DRC-violation cases, PDN and power rail planning, TritonRoute route guides, connectivity resolution, layer-aware routing, routing optimization, and verification of post-route deliverables.

Key Takeaways

Lee's algorithm provides the foundation for shortest-path maze routing.
DRC ensures manufacturability by enforcing spacing, width, and enclosure rules.
A robust PDN is essential for IR drop minimization and power integrity.
TritonRoute performs guide-driven, connectivity-aware routing across layers.
Post-route files confirm timing, connectivity, and DRC closure.
Tools Used Sky130 PDK, OpenROAD, TritonRoute, OpenSTA


