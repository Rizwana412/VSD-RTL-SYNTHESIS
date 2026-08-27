// Educational example: incomplete assignment can infer a latch.
module bad_mux_example(input a, input b, input sel, output reg y);
  always @(*) begin
    if (sel)
      y = b;
    // No else assignment: y retains its previous value when sel=0.
  end
endmodule
