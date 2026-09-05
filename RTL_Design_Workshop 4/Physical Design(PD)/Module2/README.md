## Module 2 – Floorplanning and Introduction to Library Cells

### Overview
Module 2 covers physical floorplanning concepts, core utilization and aspect ratio, placement strategy, standard cell library details, physical metal layers and basics of cell characterization.

### Topics Covered

#### 1. SKY130_D2_SK1 – Chip Floorplanning Considerations
Floorplanning is a key step in physical design where the overall structure and layout of the chip are defined before moving to detailed placement and routing.

This stage decides die size, core area, I/O placement and power planning.
#### 2. SKY_L1 – Utilization Factor and Aspect Ratio

Floorplanning is controlled by two key parameters:

**a) Utilization Factor:**
It defines how much of the core area is filled by standard cells. 
Higher utilization means less free space for routing, lower utilization gives more space but increases chip area.
Formula: `Utilization = (Area of standard cells) / (Core Area)`

**b) Aspect Ratio:**
It defines the shape of the chip core, calculated as `Aspect Ratio = Height / Width`.
- Aspect Ratio = 1 → Square chip
- Aspect Ratio > 1 → Tall and narrow chip  
- Aspect Ratio < 1 → Wide and short chip

Both parameters directly affect placement density, routability and overall die size. Proper selection is needed to achieve optimal area and performance.

#### 3. Cell Design and Characterization Flows

Standard cells are the basic building blocks of any digital design. For tools to use them, each cell must contain complete physical and electrical information.

#### 4. General Timing Characterization Parameters

Timing characterization is the process of capturing the timing behavior of a standard cell under different operating conditions.

Key parameters covered in this module are:

**a) Propagation Delay:** 
The time taken for a change at the input to reflect at the output. Measured as `Tpd` from 50% of input to 50% of output.

**b) Transition Time / Slew:** 
The time required for a signal to switch from low to high (rise time) or high to low (fall time). It affects both delay and power. Usually measured between 20% to 80% of VDD.

**c) Input Transition and Output Load Dependency:**
Delay of a cell is not fixed. It changes with:
- How fast the input is switching (input slew)
- How much load is connected at the output (output capacitance)

This is stored in 2D Lookup Tables (NLDM) inside `.lib` file.

**d) Timing Constraints (for sequential cells):**
- Setup time, Hold time, Recovery and Removal time

The practical session included analysis of `.lib` files, timing tables and visualization of cell views in Magic along with physical layer information.

These characterization parameters are critical for Static Timing Analysis (STA) to ensure the chip works correctly at the target frequency.

#### Practical Placement Work

Verified design name, top module and run files in OpenLANE flow. Checked floorplan and placement output directories and visualized placed cells in Magic.
#### Standard-Cell Placement

Placed standard cells inside the core area as per floorplan constraints and verified placement density and congestion in Magic layout.
#### Magic Placement View

Used Magic to view final placement, standard cell arrangement and power grid after placement run.
#### Synthesis Netlist

Verified synthesized netlist and correlated logical gates with placed standard cells in physical layout.
#### Physical Layers

Selected and examined individual mask layers (Metal, Diffusion, Poly) and verified layer connectivity and spacing in Magic.

**Cell Design and Characterization Flow provides:**

1.  **Physical Information:** Layout, pin locations, metal layers, boundary
2.  **Timing Information:** Delay, transition time, setup/hold for sequential cells
3.  **Power Information:** Leakage power and dynamic power
4.  **Logical Function:** Verilog model of the cell

This information is stored in library files like `.lib`, `.lef`, and `.gds` which are used by OpenLANE during synthesis, placement and routing.

The practical work showed how library files are linked to the design flow and how cell data is used in physical implementation.

### Module 2 Flow

Synthesis Netlist
      ↓
Floorplanning
      ↓
Utilization Factor
      ↓
Aspect Ratio
      ↓
Standard-Cell Placement
      ↓
Magic Physical View
      ↓
Physical / Mask Layers
      ↓
Library Cell Understanding
      ↓
Timing Characterization Concepts

**Practical work included:**
*   Visualization of floorplan in OpenLANE
*   Understanding core and die boundary
*   Analysis of utilization factor and aspect ratio
*   Floorplan view using Magic layout viewer

The practical screenshots document the floorplan initialization and layout views observed during the lab.

### Learning Outcome
After this module, understood:
*   Importance of floorplanning in PD flow
*   How utilization and aspect ratio impact chip area
*   Placement of pre-placed cells and decap cells
*   Standard cell library structure in Sky130
*   Physical layers and pin placement basics

### Conclusion
Module 2 provided a clear understanding of how chip floorplanning is performed and how library cells and physical layers play a role in building a robust layout. This forms the base for placement and CTS stages.
