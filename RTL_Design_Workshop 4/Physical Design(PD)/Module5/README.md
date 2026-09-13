#Module 5 — Final Steps for RTL2GDS Using TritonRoute and OpenSTA

*Overview*
This module covers the final stages of the RTL2GDS flow. It focuses on maze routing fundamentals, DRC principles, power distribution network implementation, routing configuration, and the key features and outputs of TritonRoute.

*Topics Covered*

*SKY130_D5_SK1 — Routing and Design Rule Check (DRC)*
- Fundamentals of maze routing and Lee's algorithm
- Cost-based pathfinding and back-tracing in grid routing
- Introduction to design rules and DRC verification

*SKY130_D5_SK2 — Power Distribution Network and Routing Flow*
- Lab implementation of power distribution network from straps to standard-cell rails
- Integration of PDN with placement
- Fundamentals of global and detailed routing
- Configuration of TritonRoute for routing execution

*SKY130_D5_SK3 — TritonRoute Features and Post-Route Flow*
- Feature 1: Adherence to pre-processed route guides
- Feature 2 & 3: Inter-guide connectivity and intra/inter-layer routing capability
- Methods for handling connectivity and routing topology
- Analysis of final output files after detailed routing

*Practical Focus*
The practicals cover maze routing concepts, DRC-clean vs DRC-violation cases, PDN and power rail planning, TritonRoute route guides, connectivity resolution, layer-aware routing, routing optimization, and verification of post-route deliverables.

*Key Takeaways*
- Lee's algorithm provides the foundation for shortest-path maze routing.
- DRC ensures manufacturability by enforcing spacing, width, and enclosure rules.
- A robust PDN is essential for IR drop minimization and power integrity.
- TritonRoute performs guide-driven, connectivity-aware routing across layers.
- Post-route files confirm timing, connectivity, and DRC closure.

*Tools Used*
Sky130 PDK, OpenROAD, TritonRoute, OpenSTA

 
