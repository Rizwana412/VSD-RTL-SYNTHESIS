module dff_async_set(input clk, input set, input d, output reg q);
  always @(posedge clk or posedge set) begin
    if (set) q <= 1'b1;
    else     q <= d;
  end
endmodule
