/*
 * Seg_display
 * ---------------------
 * For: University of Leeds
 * Date: 6th May 2021
 *
 * Description
 * ------------
 * Digital tube display
 */
 module Seg_display(
 clock,
 reset,
 TimeH,
 TimeL,
 bs0,
 bs1
 );
 input clock;
 input reset;
 input [3:0]TimeH;
 input [3:0]TimeL;
 
 output reg[6:0] bs0;//Bit selection data bit
 output reg[6:0] bs1;
 
 reg[3:0] dispH;//Current display data
 reg[3:0] dispL;

always @(posedge clock )
 	begin
 	dispH <= TimeH; 
 	dispL <= TimeL;
	end
	
	always @(posedge clock or negedge reset)
	begin
		if(!reset) begin
			bs1 <= 7'h40;
		end
		else begin
			case(dispH) 
				4'h0:begin	
 				 bs1 <= 7'h40;
			   end
				4'h1:begin
 				 bs1 <= 7'h79;
				end
				4'h2:begin
				 bs1 <= 7'h24;
				end
				4'h3:begin
				 bs1 <= 7'h30;
				end
				4'h4:begin
				 bs1 <= 7'h19;
				end
				4'h5:begin
				 bs1 <= 7'h12;
				end
				4'h6:begin
				 bs1 <= 7'h2;
				end
				4'h7:begin
				 bs1 <= 7'h78;
				end 
				4'h8:begin
				 bs1 <= 7'h00;
				end
				4'h9:begin
				 bs1 <= 7'h10;
				end
			endcase
		end
	end
	
always @(posedge clock or negedge reset)
	begin
		if(!reset) begin
			bs0 <= 7'h40;
		end
		else begin
			case(dispL) 
				4'h0:begin	
				 bs0 <= 7'h40;
			   end
				4'h1:begin
			    bs0 <= 7'h79;
				end
				4'h2:begin
				 bs0 <= 7'h24;
				end
				4'h3:begin
			    bs0 <= 7'h30;
				end
				4'h4:begin
				 bs0 <= 7'h19;
				end
				4'h5:begin
			  	 bs0 <= 7'h12;
				end
				4'h6:begin
				 bs0 <= 7'h2;
				end
				4'h7:begin
		       bs0 <= 7'h78;
				end 
				4'h8:begin
				 bs0 <= 7'h00;
				end
				4'h9:begin
				 bs0 <= 7'h10;
				end
			endcase
		end
	end
	
	


endmodule
