/*
 * Dy_scan
 * ---------------------
 * For: University of Leeds
 * Date: 28rd April 2021
 *
 * Description
 * ------------
 * 
 *
 */
module Dy_scan(
reset,
clock,
a1,
a2,
a3,
daout,
bs
);

input reset;
input clock;
input [7:0]  a1;
input [7:0]  a2;
input [7:0]  a3;
output [3:0] daout;
reg [3:0]    daout;
output [5:0] bs;
reg [5:0]    bs;

reg[2:0] sec;

always @(posedge clock or negedge reset)
      begin
		  if(!reset)
		   begin
		      sec<=3'b000;
		   end
		 else
         if (sec == 3'b110)
            sec <= 3'b000;
         else  
            sec <= sec + 1;
      end
 
 always @(sec  or a1 or a2 or a3)
    begin
	  case(sec)
	  3'b000:
	      begin 
				daout <= a1[7:4];bs<=6'b000001;end
	  3'b001:
			begin
            daout <= a1[3:0];bs<=6'b000010;end
     3'b010:
			begin
            daout <= a2[7:4];bs<=6'b000100;end
     3'b011:
			begin
            daout <= a2[3:0];bs<=6'b001000;end
	  3'b101:
			begin
            daout <= a3[7:4];bs<=6'b010000;end
     3'b110:
			begin
            daout <= a3[3:0];bs<=4'b100000;end
				
			default :
			begin
            daout <= 4'b0000;bs<=6'b000000;end
         endcase
			end

	endmodule
