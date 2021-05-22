/*
 * Counter
 * ---------------------
 * For: University of Leeds
 * Date: 6th May 2021
 *
 * Description
 * ------------
 * Timing
 */
 module Counter(
 clock_1,
 reset,
 TimeH,
 TimeL,
 beep 
 );
 input clock_1;
 input reset;
	
 output reg [3:0]TimeH;//Two-digit digital tube shows high position
 output reg [3:0]TimeL;
	
 output beep;
	
 assign beep =({TimeH,TimeL}==8'h00);//When the count is 0, the buzzer goes off.
 
 initial {TimeH,TimeL} = 8'h15;
 
always@(posedge clock_1 or negedge reset)
	begin
		if(!reset)
			{TimeH,TimeL} <= 8'h15;
		else if({TimeH,TimeL}==8'h00)
			{TimeH,TimeL} <={TimeH,TimeL};
		else if(TimeL==4'h0)
			begin
				TimeH <=TimeH-4'h1;
				TimeL <=4'h9;
			end
		else
			begin
				TimeH <=TimeH;
				TimeL <=TimeL-1'b1;
			end
	end
endmodule
