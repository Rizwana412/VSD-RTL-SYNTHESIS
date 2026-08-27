module constant_dff_examples(
  input clk, input d, output reg q_zero, output reg q_one, output reg q_data
);
  always @(posedge clk) begin
    q_zero <= 1'b0;
    q_one  <= 1'b1;
    q_data <= d;
  end
endmodule
