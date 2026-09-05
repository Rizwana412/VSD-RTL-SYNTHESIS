# Module 1 - Basics of Open-Source EDA, OpenLANE & Sky130

### Introduction
Module 1 gives the foundation of Physical Design flow by introducing open-source EDA mmktools, OpenLANE and Sky130 PDK.

It covers how digital hardware is represented, how SoC flow bridges RTL design to physical layout, and how open tools execute this flow.

### What I Learned

**1. Communicating with Computers**
Learnt how designers give instructions to EDA tools using commands, design files and libraries to convert RTL into physical implementation.

**2. SoC Design using OpenLANE**
Understood OpenLANE as an automated RTL2GDS flow which combines multiple PD stages like synthesis, floorplan, placement under one automated environment.

**3. Hands-on with Open-Source Tools**
Explored open-source tools practically and worked in Linux environment to run PD flow steps.

**4. Sky130 Technology PDK**
Studied Sky130 PDK which provides all process files, libs, tech files required to fabricate design on Sky130 node.

**5. Tool vs Technology Information**
Observed difference between tool-specific configs and technology-specific data and how both are important for successful PD flow.
# Module 1 - Basics of Open-Source EDA, OpenLANE & Sky130

### Introduction
Module 1 gives the foundation of Physical Design flow by introducing open-source EDA tools, OpenLANE and Sky130 PDK.

It covers how digital hardware is represented, how SoC flow bridges RTL design to physical layout, and how open tools execute this flow.

### What I Learned

**1. Communicating with Computers**
Learnt how designers give instructions to EDA tools using commands, design files and libraries to convert RTL into physical implementation.

**2. SoC Design using OpenLANE**
Understood OpenLANE as an automated RTL2GDS flow which combines multiple PD stages like synthesis, floorplan, placement under one automated environment.

**3. Hands-on with Open-Source Tools**
Explored open-source tools practically and worked in Linux environment to run PD flow steps.

**4. Sky130 Technology PDK**
Studied Sky130 PDK which provides all process files, libs, tech files required to fabricate design on Sky130 node.

**5. Tool vs Technology Information**
Observed difference between tool-specific configs and technology-specific data and how both are important for successful PD flow.

### Practical Parameters Studied

**1. Layer Information**
The workshop included detailed examination of physical design layers in Sky130 technology. We observed different metal layers, via layers and their purpose in routing. Lower metal layers (M1, M2) are used for internal cell connections and local routing, while higher metal layers (M3, M4, M5) are used for global routing, power distribution and clock networks. We also studied layer properties like thickness, pitch, spacing rules and how layer selection affects congestion and timing.

Screenshots show Magic view of selected metal layers and technology LEF information related to routing layers.

**2. Default Clock Period**
Studied `CLOCK_PERIOD` parameter in config.json/tcl. Observed default clock value and how it impacts synthesis, timing analysis and optimization. Learnt that clock period decides target frequency and tool tries to meet setup/hold constraints based on this value. Checked its effect on WNS/TNS reports.


**3. Clock Ratio and Percentage**
Examined clock-related percentages like clock uncertainty (skew + jitter margin), clock transition percentage and core utilization percentage. These control timing margins, CTS buffer insertion and placement density. Observed how adjusting these ratios impacts congestion, power and timing closure.


## Module 1 Flow

Open-Source EDA
      ↓
Linux Environment
      ↓
OpenLANE Framework
      ↓
Sky130 PDK
      ↓
Tool & Technology Data
      ↓
Design Parameters Study
      ↓
Physical Design Flow Introductionjavascript
### Learning Outcome

After completing Module 1, I gained practical understanding of:

*   Fundamentals of Open-Source EDA tools and their importance
*   Role of OpenLANE in automated RTL to GDSII SoC flow
*   Basics of Sky130 PDK and its libraries
*   Difference between tool-specific and technology-specific information
*   Physical layers and metal stack in Sky130
*   Chip-area and die-area concepts
*   Basic clock parameters like clock period, uncertainty and utilization

### Conclusion

Module 1 built the base platform required to move into actual physical design implementation. The practicals and screenshots attached document the complete setup of OpenLANE, Sky130 PDK, layer information and clock parameter study covered in this module.

This module created clarity on how open-source tools transform RTL designs into fabrication-ready layouts using Sky130 technology.


