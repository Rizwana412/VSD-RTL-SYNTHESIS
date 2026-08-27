module optimized_counter #(parameter WIDTH=4)(
  input clk, input reset, output reg [WIDTH-1:0] count
);
  always @(posedge clk) begin
    if (reset) count <= {WIDTH{1'b0}};
    else       count <= count + {{(WIDTH-1){1'b0}},1'b1};
  end
endmodule
