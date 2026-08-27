`timescale 1ns/1ps
module tb_mux_styles;
  reg a,b,sel;
  wire y1,y2;
  mux_styles dut(.a(a),.b(b),.sel(sel),.y_ternary(y1),.y_procedural(y2));
  initial begin
    $dumpfile("tb_mux_styles.vcd"); $dumpvars(0,tb_mux_styles);
    a=0;b=1;sel=0;#10; sel=1;#10;
    a=1;b=0;sel=0;#10; sel=1;#10;
    $finish;
  end
endmodule
