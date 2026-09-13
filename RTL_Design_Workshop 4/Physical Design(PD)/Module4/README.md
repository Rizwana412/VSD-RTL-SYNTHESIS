#Module 4 — Pre-Layout Timing Analysis and Importance of Good Clock Tree

*Overview*
This module covers timing characterization, pre-layout STA using OpenSTA, clock tree implementation with TritonCTS, signal integrity challenges, and timing closure with propagated clocks.

*Topics Covered*
1 *SKY130_D4_SK1 — Timing Modeling using Delay Tables*
    - Methodology to convert grid data to track information
    - Procedure to generate Standard-Cell LEF from Magic layout
    - Overview of timing libraries and integration of a new cell (vsdinv) into the synthesis flow
    - Fundamentals of NLDM delay tables and their application in timing calculation

2.*SKY130_D4_SK2 — Timing Analysis with Ideal Clocks using OpenSTA*
    - Concept of setup timing and flip-flop setup requirements
    - Understanding clock jitter and clock uncertainty
    - Configuration of OpenSTA for post-synthesis timing checks
    - Synthesis optimization techniques to mitigate setup violations
    
3.*SKY130_D4_SK3 — Clock Tree Synthesis with TritonCTS & Signal Integrity*
    - Clock routing and buffering using H-Tree architecture
    - Crosstalk effects and clock shielding techniques
    - Execution of CTS flow using TritonCTS and post-CTS verification

- *SKY130_D4_SK4 — Timing Analysis with Real (Propagated) Clocks using OpenSTA*
    - Setup and hold analysis with real clocks
    - Running OpenSTA with accurate timing libs and CTS results
    - Studying the impact of CTS buffer sizing on setup and hold slack

*Practical Focus*
Labs start from LIB/LEF generation and delay table concepts, link them to synthesis and ideal-clock STA, then move to CTS construction, SI-aware clock routing, and finally perform real-clock setup/hold analysis to achieve timing closure.

*Evidences*
SK1 - Timing Modelling:*
- Track info generated from grid, LEF exported from Magic, vsdinv cell added to lib, delay tables verified, synthesis done with vsdinv.

*SK2 - Ideal Clock STA:*
- OpenSTA configured, SDC with clock jitter/uncertainty, setup report generated, WNS improved after synthesis optimization.

*SK3 - CTS:*
- TritonCTS run using H-Tree, clock buffered and routed, shielding applied to avoid crosstalk, CTS verified.

*SK4 - Real Clock STA:*
- Propagated clock set, setup & hold analysis with real clocks, buffer size impact observed, final timing closed.

#Key Takeaways:

- NLDM timing libraries capture cell delays used for STA during implementation.
- OpenSTA enables pre-layout timing checks for both setup and hold conditions.
- Clock jitter and uncertainty must be modeled to ensure realistic timing margins.
- TritonCTS constructs the clock distribution using H-Tree topology with buffering and shielding to minimize skew and crosstalk.
- Post-CTS analysis with propagated (real) clocks reveals accurate setup and hold behavior.
- Proper sizing of CTS buffers directly impacts timing closure and skew control.
