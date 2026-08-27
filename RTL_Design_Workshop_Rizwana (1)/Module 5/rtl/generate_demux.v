module generate_demux #(parameter WIDTH=4)(
  input [WIDTH-1:0] din, input sel, output [WIDTH-1:0] y
);
  genvar i;
  generate
    for (i=0; i<WIDTH; i=i+1) begin : demux_bits
      assign y[i] = sel ? din[i] : 1'b0;
    end
  endgenerate
endmodule
