# Module 2 — Sequential RTL, Constant Multiplication, and Hierarchy

## Goal

Extend the basic RTL flow into clocked logic and structural design. This module focuses on reset/set behavior, constant power-of-two multiplication, and the effect of hierarchy during synthesis.

## Topics

- D flip-flops
- Synchronous reset
- Asynchronous reset
- Asynchronous set
- Multiplication by powers of two
- Submodule instantiation
- Hierarchical vs. flattened synthesis

## 1. Flip-flop examples

Three examples are provided under `rtl/`:

- `dff_sync_reset.v` — reset is evaluated only at a rising clock edge.
- `dff_async_reset.v` — reset can change the state without waiting for the clock.
- `dff_async_set.v` — set can force the output high asynchronously.

The key distinction is the event control.

```verilog
// synchronous reset
always @(posedge clk)

// asynchronous reset
always @(posedge clk or posedge reset)
```

## 2. Constant multiplication

`mul_by_2.v` and `mul_by_8.v` demonstrate an important synthesis optimization.

For unsigned values:

```text
x × 2 = x << 1
x × 8 = x << 3
```

Therefore, a synthesizer can implement these operations mainly through wiring and zero extension instead of a general multiplier.

## 3. Hierarchical design

`hierarchical_logic.v` contains a top module built from two small submodules. Keeping meaningful boundaries can make a larger RTL project easier to understand and debug.

A flattened representation removes those module boundaries so the synthesis tool can optimize across the entire logic cone.

## 4. Simulation

Example commands:

```bash
iverilog -o sim rtl/dff_async_reset.v testbench/tb_dff_async_reset.v
vvp sim
gtkwave tb_dff_async_reset.vcd
```

Repeat the same pattern for the other examples.

## 5. Synthesis concept

For technology mapping, the generic flow can include:

```text
read_verilog → synth → dfflibmap → abc → write_verilog
```

The exact library path depends on the installed technology library.

## Takeaways

- Synchronous reset waits for the clock; asynchronous reset/set does not.
- Constant powers of two are especially cheap to implement.
- Hierarchy improves organization, while flattening can expose more optimization opportunities.
- Sequential RTL should always be checked carefully around clock and reset transitions.
