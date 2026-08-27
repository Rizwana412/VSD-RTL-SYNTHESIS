module mul_by_2(input [2:0] a, output [3:0] y);
  assign y = {a, 1'b0};
endmodule
