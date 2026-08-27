# Module 5 — Case Statements, Generate Blocks, and Mux/Demux Structures

## Goal

Practice common RTL control constructs and learn how incomplete assignments or poorly specified branches can create unintended hardware.

## Topics

- `case`
- `if` / `else`
- Complete and incomplete combinational logic
- Mux using `case`
- Demux using `case`
- `generate` loops
- Parameterized structures
- Testbench comparison

## 1. Complete `case`

A complete combinational case statement gives every relevant selection condition a defined output.

Example:

```verilog
always @(*) begin
    case (sel)
        2'b00: y = a;
        2'b01: y = b;
        2'b10: y = c;
        2'b11: y = d;
        default: y = 1'b0;
    endcase
end
```

The `default` branch is a useful defensive choice when unknown or unexpected values must be handled.

## 2. Incomplete logic

The reference images show incomplete `case` and `if` examples. If an output is not assigned on every combinational path, synthesis may infer storage.

A safe pattern is to assign a default first, then override it in the branches.

## 3. Mux and demux

`case_mux.v` implements a 4:1 mux.

`case_demux.v` implements a 1:4 demux by clearing outputs first and then enabling the selected output.

## 4. Generate blocks

A `generate` loop is evaluated during elaboration and creates repeated hardware structures. It is useful when the same RTL pattern must be instantiated for multiple bits.

`generate_mux.v` and `generate_demux.v` demonstrate this idea with parameterized widths.

## 5. Testbench organization

Each testbench under `testbench/` focuses on one construct. The waveform screenshots supplied with the reference material are stored in `images/` and can be used to compare expected transitions.

Example:

```bash
iverilog -o sim rtl/case_mux.v testbench/tb_case_mux.v
vvp sim
gtkwave tb_case_mux.vcd
```

## 6. Coding checklist

Before synthesizing combinational RTL:

- Give outputs a default value where appropriate.
- Cover all selection conditions.
- Include a `default` branch when it improves robustness.
- Avoid accidental state retention.
- Keep generate indices and widths consistent.
- Verify the synthesized result rather than relying only on visual inspection of RTL.

## Takeaways

- `case` is a clear way to describe multi-way selection.
- Complete assignments prevent accidental latch inference.
- `generate` creates repeated hardware structurally at elaboration time.
- Mux and demux designs are excellent exercises for checking combinational completeness.
