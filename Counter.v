/*
 * Counter
 * ---------------------
 * By:Feng Yan
 * University of Leeds
 * Date: 6th May 2021
 *
 * Description
 * ------------
 * Counting module, when the enable terminal is high, starts to work counting, 
 * and the clock subtracts each high level to count until 0.
 */
 module Counter(
 clock_1,
 reset,
 TimeH,
 TimeL,
 C_en,//Determining whether to count or not
 beep
 );
 input clock_1;
 input reset;
 input C_en;
 
 output reg [3:0]TimeH,TimeL;//Two-digit digital tube shows high position
 reg [3:0] TimeH_1,TimeL_1,TimeH_2,TimeL_2;

 
 output beep;
 
//A state machine that defines a counter, divided into a start state and a stop state	
 reg [1:0] state_Counter;
 localparam Start_STATE  = 2'b01;
 localparam Stop_STATE   = 2'b10;
	
 
 
 initial begin
{TimeH_2,TimeL_2} = 8'h0;
 end
 
always@(posedge clock_1 or negedge reset) begin
	if(!reset)
			{TimeH_1,TimeL_1} <= 8'h15;   
		else if({TimeH_1,TimeL_1}==8'h00)
			{TimeH_1,TimeL_1} <={TimeH_1,TimeL_1};
		else if(TimeL_1==4'h0)
			begin
				TimeH_1 <=TimeH_1-4'h1;
				TimeL_1 <=4'h9;
			end
		else
			begin
				TimeH_1 <=TimeH_1;
				TimeL_1 <=TimeL_1-1'b1;
			end
	   end


always@(posedge clock_1 or negedge reset) begin	
		case(state_Counter)
	   Start_STATE:begin
		      TimeH <=TimeH_1;
		      TimeL <=TimeL_1;
		end
		 Stop_STATE:begin
	         TimeH <=TimeH_2;
				TimeL <=TimeL_2;
	   end
	endcase
end
		
	always @ (posedge clock_1 or negedge reset) begin
    if (!reset) begin
	     state_Counter <= Start_STATE;
		 end else begin
      case (state_Counter)
          Start_STATE: begin 
			 if (!C_en) begin 
               state_Counter <= Stop_STATE;
          end else
          if (C_en) begin
               state_Counter <= Start_STATE;
          end
			end
			 Stop_STATE: begin
			 if (C_en) begin 
               state_Counter <= Stop_STATE;
          end else
          if (!C_en) begin
               state_Counter <= Stop_STATE;
          end
			end
		endcase
	 end
end


assign beep =({TimeH,TimeL}==8'h00);//When the count is 0, the buzzer goes off.
endmodule
