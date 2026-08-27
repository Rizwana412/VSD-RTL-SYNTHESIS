module blocking_example(input a, input b, input c, output reg y);
  reg temp;
  always @(*) begin
    temp = a & b;
    y    = temp | c;
  end
endmodule
