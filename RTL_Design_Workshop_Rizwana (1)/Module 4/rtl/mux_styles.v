module mux_styles(
  input a, input b, input sel, output y_ternary, output reg y_procedural
);
  assign y_ternary = sel ? b : a;

  always @(*) begin
    if (sel) y_procedural = b;
    else     y_procedural = a;
  end
endmodule
