# Module 3 — Constant-Driven Sequential Logic and Optimization

## Goal

Study how constants and coding choices affect the hardware inferred from RTL. The supplied reference images focus on constant-driven DFF examples, counter optimization, and checks of the synthesized result.

## Topics

- Constant assignments in sequential logic
- DFF inference
- Constant propagation
- Counter optimization
- RTL vs. synthesized structure
- Optimization checks

## 1. Constant-driven registers

The examples in `rtl/constant_dff_examples.v` show several registers whose next-state behavior is constrained by constants.

A register such as:

```verilog
always @(posedge clk)
    q <= 1'b0;
```

does not need the same data-path hardware as a normal DFF whose input can vary. Synthesis can recognize the constant behavior and simplify the implementation.

## 2. Counter optimization

`optimized_counter.v` provides a compact parameterized counter. The important lesson is that the RTL description is not necessarily the final gate structure.

During synthesis, constant widths, unused bits, and unreachable logic may be simplified.

## 3. What to inspect

The reference screenshots in `images/` are grouped around:

- DFF constant cases
- Counter optimization
- Optimization checks
- RTL/code snapshots
- Waveform results

Use them alongside the source examples to understand how a behavioral description can become smaller or structurally different after optimization.

## 4. Simulation

```bash
iverilog -o sim rtl/optimized_counter.v testbench/tb_optimized_counter.v
vvp sim
gtkwave tb_optimized_counter.vcd
```

## 5. Optimization mindset

When reviewing synthesized RTL, ask:

1. Is a register really storing changing information?
2. Are some bits permanently zero or one?
3. Can an arithmetic expression be reduced to wiring?
4. Are any branches unreachable?
5. Is logic duplicated unnecessarily?

## Takeaways

- RTL is an input to synthesis, not a literal gate-by-gate implementation.
- Constants can remove logic.
- Counters can be simplified when their range or behavior is constrained.
- Waveforms confirm function, while synthesis inspection explains hardware cost.
