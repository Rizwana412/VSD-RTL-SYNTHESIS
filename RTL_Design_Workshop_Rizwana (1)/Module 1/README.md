# Module 1 — RTL Foundations and the Basic Design Flow

## Goal

Build a simple 2:1 multiplexer and use it to understand the complete beginner RTL workflow: describe the hardware, verify it with a testbench, inspect the waveform, and introduce synthesis.

## Topics

- RTL and hardware description
- Design Under Test (DUT)
- Testbench structure
- 2:1 multiplexer
- Icarus Verilog simulation
- VCD waveform generation
- GTKWave inspection
- Yosys synthesis
- Liberty standard-cell libraries

## 1. Design example

The mux implements:

`y = sel ? i1 : i0`

When `sel` is `0`, the output follows `i0`. When `sel` is `1`, it follows `i1`.

### RTL

See `rtl/good_mux.v`.

### Verification

See `testbench/tb_good_mux.v`.

## 2. Simulation

From the module directory:

```bash
iverilog -o sim rtl/good_mux.v testbench/tb_good_mux.v
vvp sim
gtkwave tb_good_mux.vcd
```

The testbench deliberately changes both data inputs and the select signal so the two mux paths can be observed.

## 3. Synthesis idea

Yosys can convert the RTL description into a logic representation and, when a technology library is supplied, map it to available cells.

A typical flow is:

```text
RTL → Parse → Elaborate → Optimize → Technology mapping → Netlist
```

A Liberty `.lib` file supplies information about cells, pins and timing characteristics.

## 4. Design vs. verification

The RTL module describes hardware intended for synthesis. The testbench is verification-only code: it stimulates the DUT and checks or observes its behavior.

## 5. Reference images

The `images/` directory contains the visual material supplied with the reference workshop. These images are kept with this module so the concepts can be compared with the practical flow.

## Takeaways

- RTL describes intended hardware behavior.
- A testbench is separate from synthesizable RTL.
- Simulation checks behavior; synthesis transforms RTL into hardware-oriented logic.
- GTKWave is useful for understanding signal transitions.
- Yosys provides an accessible open-source synthesis flow.
