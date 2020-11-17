`timescale 1ns / 1ps
`include "iob_lib.vh"

`define W = 32
module circuit
  #(
    parameter W = 32
    )
  (
   `INPUT(rst,1),
   `INPUT(clk,1),
   `INPUT(en,1),
   `INPUT(x,W),
   `OUTPUT(y,W)
   );
   `SIGNAL(cnt, 7)
   `SIGNAL(y_final, W)
   `SIGNAL(y_final_1, W)
   `SIGNAL2OUT(y, y_final)


   `REG_RE(clk, rst, 1'b0, en & (cnt!=99), y_final_1, y_final)
   `COUNTER_RE(clk, rst, en & (cnt!=99), cnt)
   `COMB y_final = y_final_1 + y_final_1 + x + (cnt == 1'b1);
endmodule
