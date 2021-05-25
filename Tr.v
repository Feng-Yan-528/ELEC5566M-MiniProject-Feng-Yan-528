/*
 * Tr
 * ---------------------
 * By: Feng Yan 
 * For: University of Leeds
 * Date: 25rd April 2021
 *
 * Description
 * ------------
 * This is a quick answer latch module, the contestants' quick answer signal latch
 */
module Tr(
reset,
clock,
con0,//contestants
con1,
con2,
TimeH,
TimeL,
chose
);

input reset;
input clock;
input con0;
input con1;
input con2;
output [2:0] chose;
output reg [3:0]TimeH,TimeL;

reg [2:0] chose,m;	
	
	
always @(negedge reset or posedge clock)
   begin
      if (!reset)
      begin
         chose <= 3'b000;
			TimeH <=4'h0;
		   TimeL <=4'h0;
      end
      else 
      begin
         if ((con0 == 1'b0 | chose[0] == 1'b1) & (~(chose[1] == 1'b1 | chose[2] == 1'b1 )))
         begin
            chose[0] <= 1'b1;
				TimeH <=4'h0;
		      TimeL <=4'h1;
         end
         if ((con1 == 1'b0 | chose[1] == 1'b1) & (~(chose[0] == 1'b1 | chose[2] == 1'b1 )))
         begin
            chose[1] <= 1'b1;
				TimeH <=4'h0;
		      TimeL <=4'h2;
         end
         if ((con2 == 1'b0 | chose[2] == 1'b1) & (~(chose[1] == 1'b1 | chose[0] == 1'b1 )))
         begin
            chose[2] <= 1'b1;
				TimeH <=4'h0;
		      TimeL <=4'h3;
         end
        
      end
   end
	

	endmodule
