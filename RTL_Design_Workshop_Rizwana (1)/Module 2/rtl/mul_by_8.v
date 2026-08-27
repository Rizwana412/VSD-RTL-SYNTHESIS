module mul_by_8(input [2:0] a, output [5:0] y);
  assign y = {a, 3'b000};
endmodule
