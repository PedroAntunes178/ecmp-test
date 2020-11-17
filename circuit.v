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
   `OUTPUT(f,W)
   );
   `SIGNAL(cnt, 7)
   `SIGNAL(f_final, W)
   `SIGNAL(f_final_1, W)
   `SIGNAL(f_final_2, W)
   `SIGNAL2OUT(f, f_final)

   `REG_RE(clk, rst, 1'b0, en & (cnt!=99), f_final_1, f_final)
   `REG_RE(clk, rst, 1'b0, en & (cnt!=99), f_final_2, f_final_1)
   `COUNTER_RE(clk, rst, en & (cnt!=99), cnt)
   `COMB f_final = f_final_1 + f_final_2 + (cnt == 1'b1);
endmodule
