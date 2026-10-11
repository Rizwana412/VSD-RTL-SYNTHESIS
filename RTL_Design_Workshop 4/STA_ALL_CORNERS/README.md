All-Corner Post-Route STA Analysis

## Overview
This module presents the Post-Route Static Timing Analysis (STA) performed across **16 PVT (Process-Voltage-Temperature) corners**.

The analysis is done on the final routed database using:
- SDC Timing Constraints
- Extracted Parasitics (SPEF)
- Corner-specific Liberty (.lib) Libraries

## Contents of This Folder
- `corner_summary.csv` - Summary of WNS/TNS for all corners
- `corners/` - Detailed setup/hold reports for each corner
- `graphs/` - WNS & TNS graphs for setup and hold
- `logs/` - Tool logs and Tcl scripts
- `STA_All_Corners_Report.pdf` - Full summary report

## Key Results
- Total Corners Analyzed: 16
- Setup Violations: 6 corners have negative WNS
- Hold Violations: 0 corners (All Passed)
- Worst Setup WNS: -30.72 ns at `ss_n40C_1v28` (Slow corner)
- Best Setup WNS: +8.01 ns at `ff_100C_1v95` (Fast corner)
- Worst Hold WNS: +0.19 ns at `ff_n40C_1v95`

## Interpretation
- **Negative Setup WNS** = Setup timing violation in that corner. Design needs optimization for slow corners.
- **Negative Hold WNS** = Hold violation. Here, 0 violations = Hold timing is clean.
- **TNS** = Total Negative Slack. Even if TNS is small, check WNS.

> Note: This is post-route analysis based on current constraints and libraries. Not final sign-off without full flow review.

## How to Reproduce
Main script: `logs/vsdbabysoc_all_corners_fixed.tcl`
Set env variables before running:
```bash
setenv DESIGN /path/to/routed/db
setenv LIBDIR /path/to/liberty
setenv OUT /path/to/output
