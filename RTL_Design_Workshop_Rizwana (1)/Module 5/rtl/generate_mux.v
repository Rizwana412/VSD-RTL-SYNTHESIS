module generate_mux #(parameter WIDTH=4)(
  input [WIDTH-1:0] a, b, input sel, output [WIDTH-1:0] y
);
  genvar i;
  generate
    for (i=0; i<WIDTH; i=i+1) begin : mux_bits
      assign y[i] = sel ? b[i] : a[i];
    end
  endgenerate
endmodule
