module case_demux(input din, input [1:0] sel, output reg [3:0] y);
  always @(*) begin
    y = 4'b0000;
    case (sel)
      2'b00: y[0] = din;
      2'b01: y[1] = din;
      2'b10: y[2] = din;
      2'b11: y[3] = din;
      default: y = 4'b0000;
    endcase
  end
endmodule
