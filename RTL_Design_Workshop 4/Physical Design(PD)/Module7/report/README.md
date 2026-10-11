1.Synthesis Report :
What I did
I synthesized the VSDBabySoC RTL design using the OpenROAD flow.

Result
The synthesized database was generated and used for the next physical design stage.

In simple words
Synthesis converts RTL code into a gate-level circuit that can be physically implemented.

2.Floorplan Report:
What I did
I created the floorplan and defined the core area. The macro blocks were placed as part of the floorplanning process.

In simple words
Floorplanning decides the overall chip area and the location of large blocks before standard cells are placed.

3,Placement Report:
What I did
I performed standard-cell placement after floorplanning and inspected the placement in OpenROAD.

In simple words
Placement decides where the standard cells are physically located inside the chip.

4.CTS Report:
What I did
I performed and inspected the clock-tree synthesis stage.

In simple words
CTS builds a clock distribution network so that the clock can reach sequential cells with controlled delay and skew.

5.Routing Report:
What I did
I performed global and detailed routing and inspected the final routed database in OpenROAD.

The detailed routing output reported approximately:

Total wire length: 242703 um
Total vias: 50616
In simple words
Routing creates the physical metal and via connections between the placed cells and macros.


6.Post-route OpenSTA Report:
What I did
I checked timing after routing using OpenSTA.

Commands used:

report_wns
report_tns
report_checks -path_delay max
report_checks -path_delay min
Observed result
WNS max = 0.00
TNS max = 0.00
In simple words
WNS shows the worst timing margin and TNS shows the total negative timing slack. The recorded maximum values were 0.00.



