`timescale 1ns/1ps
module tb_dff_async_reset;
  reg clk, reset, d;
  wire q;
  dff_async_reset dut(.clk(clk), .reset(reset), .d(d), .q(q));
  always #5 clk = ~clk;
  initial begin
    $dumpfile("tb_dff_async_reset.vcd"); $dumpvars(0,tb_dff_async_reset);
    clk=0; reset=1; d=0; #3;
    reset=0; d=1; #12;
    reset=1; #2;
    reset=0; d=0; #10;
    $finish;
  end
endmodule
