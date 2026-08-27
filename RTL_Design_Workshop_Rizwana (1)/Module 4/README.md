# Module 4 — Mux Coding Styles, Blocking Assignments, and GLS

## Goal

Compare alternative ways of describing combinational multiplexing and understand why a coding style can produce simulation/synthesis surprises.

## Topics

- Ternary mux
- Procedural mux
- Blocking assignments
- Combinational sensitivity
- Bad/incomplete mux coding
- Gate-level simulation (GLS)

## 1. Mux styles

`mux_styles.v` contains a continuous-assignment mux and a procedural mux.

A compact form is:

```verilog
assign y = sel ? b : a;
```

The equivalent procedural form can use:

```verilog
always @(*) begin
    if (sel)
        y = b;
    else
        y = a;
end
```

For purely combinational logic, every output should be assigned for every input condition.

## 2. Why incomplete assignment is dangerous

If a combinational process does not assign an output on every path, the simulator may retain the previous value. That behavior corresponds to storage and can lead to an unintended latch.

The reference `bad_mux` material illustrates this caveat.

## 3. Blocking assignments

Blocking assignments (`=`) update the left-hand side immediately within the procedural flow. They are commonly used for combinational calculations.

Nonblocking assignments (`<=`) are normally preferred for clocked sequential logic because they model simultaneous state updates.

## 4. Gate-level simulation

RTL simulation asks whether the abstract design behaves correctly. GLS goes one step further by simulating a synthesized gate-level netlist.

A simplified workflow is:

```text
RTL → Synthesis → Gate-level netlist → GLS testbench → Waveform
```

The supplied `gls_waveform.png` is kept in the module images for comparison with the RTL-level behavior.

## 5. Verification checklist

- Every mux branch assigns its output.
- Combinational sensitivity is complete.
- Sequential blocks use a clocked event control.
- Blocking/nonblocking assignment is selected according to the intended hardware.
- RTL and gate-level outputs are compared when GLS is performed.

## Takeaways

- Multiple RTL styles can infer the same mux.
- Incomplete combinational assignments can infer latches.
- Blocking assignments are useful in combinational procedural logic.
- GLS helps verify that synthesized hardware still matches the intended behavior.
