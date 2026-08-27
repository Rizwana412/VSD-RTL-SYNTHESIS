`timescale 1ns/1ps
module tb_optimized_counter;
  reg clk, reset;
  wire [3:0] count;
  optimized_counter #(.WIDTH(4)) dut(.clk(clk),.reset(reset),.count(count));
  always #5 clk=~clk;
  initial begin
    $dumpfile("tb_optimized_counter.vcd"); $dumpvars(0,tb_optimized_counter);
    clk=0; reset=1; #12; reset=0; #60; $finish;
  end
endmodule
