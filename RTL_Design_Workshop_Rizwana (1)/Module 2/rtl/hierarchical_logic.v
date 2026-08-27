module and_stage(input a, input b, output y);
  assign y = a & b;
endmodule

module or_stage(input a, input b, output y);
  assign y = a | b;
endmodule

module hierarchical_logic(input a, input b, input c, output y);
  wire t;
  and_stage u_and(.a(a), .b(b), .y(t));
  or_stage  u_or (.a(t), .b(c), .y(y));
endmodule
