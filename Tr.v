/*
 * Tr
 * ---------------------
 * For: University of Leeds
 * Date: 25rd April 2021
 *
 * Description
 * ------------
 * 
 *
 */
module Tr(
reset,
clock,
con0,//contestants
con1,
con2,
chose
);

input reset;
input clock;
input con0;
input con1;
input con2;
output [2:0] chose;
reg [2:0] chose;

always @(negedge reset or posedge clock)
   begin
      if (!reset)
      begin
         chose <= 3'b000;
      end
      else 
      begin
         if ((con0 == 1'b1 | chose[0] == 1'b1) & (~(chose[1] == 1'b1 | chose[2] == 1'b1 )))
         begin
            chose[0] <= 1'b1;
         end
         if ((con1 == 1'b1 | chose[1] == 1'b1) & (~(chose[0] == 1'b1 | chose[2] == 1'b1 )))
         begin
            chose[1] <= 1'b1;
         end
         if ((con2 == 1'b1 | chose[2] == 1'b1) & (~(chose[1] == 1'b1 | chose[0] == 1'b1 )))
         begin
            chose[2] <= 1'b1;
         end
        
      end
   end
	endmodule