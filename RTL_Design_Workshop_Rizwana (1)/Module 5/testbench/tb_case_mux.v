`timescale 1ns/1ps
module tb_case_mux;
  reg [3:0] d;
  reg [1:0] sel;
  wire y;
  case_mux dut(.d(d),.sel(sel),.y(y));
  integer i;
  initial begin
    $dumpfile("tb_case_mux.vcd"); $dumpvars(0,tb_case_mux);
    d=4'b1010;
    for(i=0;i<4;i=i+1) begin sel=i; #10; end
    $finish;
  end
endmodule
