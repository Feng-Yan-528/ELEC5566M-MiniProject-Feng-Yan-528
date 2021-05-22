/*
 * FD
 * ---------------------
 * For: University of Leeds
 * Date: 6th May 2021
 *
 * Description
 * ------------
 * Instantiate the three frequency division modules in series to get the final target 
 * frequency division module and complete the clock frequency division.
 */

module FD(
clock,
reset,
clock_F
);

input clock;
input reset;
output  clock_F;


wire c;
wire o;

F_5 fd(
.clock(clock),
.reset(reset),
.clock_5(c)
);

F_10 f10(
.clock(c),
.reset(reset),
.clock_10(o)
);

F_1 f1(
.clock(o),
.reset(reset),
.clock_f(clock_F)
);

endmodule


/*
 * F_1
 * ---------------------
 * For: University of Leeds
 * Date: 11th May 2021
 *
 * Description
 * ------------
 * Divide the 100Hz frequency into 1hz
 */
 
 module F_1(
 clock,
 reset,
 clock_f
 );
 
 input  clock;
 input  reset;
 output  clock_f;
 
 
  parameter	WIDTH	= 51;//The number of digits of the counter. The maximum value of the count is 2**WIDTH-1
  parameter	N	= 100;   

 
 reg  [WIDTH-1:0] cnt_1,cnt_0;//The register is used to store the value of the counter
 reg  clock_1,clock_0;
 

 always @ (posedge clock or negedge reset) 
		begin
			if(!reset)
				cnt_1<=0;
         else if (cnt_1==N-1)
				cnt_1<=0;
			else cnt_1<=cnt_1+1; //The counter keeps counting and clears when it reaches n-1, which is a counter of modulus N
		end
always @ (posedge clock or negedge reset)
		begin
			if(!reset)
				clock_1<=0;
			else if (cnt_1<(N>>1))
				clock_1<=0;
			else 
				clock_1<=1;
		end
		
always @ (negedge clock or negedge reset)
		begin
			if(!reset)
				cnt_0<=0;
			else if (cnt_0==(N-1))
				cnt_0<=0;
			else cnt_0<=cnt_0+1;
		end
		 
always @ (negedge clock or negedge reset)
		begin
			if(!reset)
				clock_0<=0;
			else if (cnt_0<(N>>1))  
				clock_0<=0;
			else 
				clock_0<=1;
		end


assign  clock_f=clock_1&clock_0;

endmodule

/*
 * F_5
 * ---------------------
 * For: University of Leeds
 * Date: 11th May 2021
 *
 * Description
 * ------------
 * Divide the 50MHz frequency into 10 0000hz
 */

module F_5(
 clock,
 reset,
 clock_5
 );
 
 input clock;
 input  reset;
 output  clock_5;
 
  parameter	WIDTH	= 251;//The number of digits of the counter. 
  parameter	N	= 500;   //The maximum value of the count is 2**WIDTH-1
 
 reg  [WIDTH-1:0] cnt_1,cnt_0;//The register is used to store the value of the counter
 reg  clock_1,clock_0;
 

 always @ (posedge clock or negedge reset) 
		begin
			if(!reset)
				cnt_1<=0;
         else if (cnt_1==N-1)
				cnt_1<=0;
			else cnt_1<=cnt_1+1; //The counter keeps counting and clears when it reaches n-1, which is a counter of modulus N
		end
always @ (posedge clock or negedge reset)
		begin
			if(!reset)
				clock_1<=0;
			else if (cnt_1<(N>>1))
				clock_1<=0;
			else 
				clock_1<=1;
		end
		
always @ (negedge clock or negedge reset)
		begin
			if(!reset)
				cnt_0<=0;
			else if (cnt_0==(N-1))
				cnt_0<=0;
			else cnt_0<=cnt_0+1;
		end
		 
always @ (negedge clock or negedge reset)
		begin
			if(!reset)
				clock_0<=0;
			else if (cnt_0<(N>>1))  
				clock_0<=0;
			else 
				clock_0<=1;
		end


assign  clock_5=clock_1&clock_0;

endmodule

/*
 * F_10
 * ---------------------
 * For: University of Leeds
 * Date: 6th May 2021
 *
 * Description
 * ------------
 * Divide the 10 0000Hz frequency into 100hz
 */
 
 module F_10(
 clock,
 reset,
 clock_10
 );
 
 input  clock;
 input  reset;
 output  clock_10;
 
 
  parameter	WIDTH	= 501;//The number of digits of the counter. The maximum value of the count is 2**WIDTH-1
  parameter	N	= 1000;   

 
 reg  [WIDTH-1:0] cnt_1,cnt_0;//The register is used to store the value of the counter
 reg  clock_1,clock_0;
 

 always @ (posedge clock or negedge reset) 
		begin
			if(!reset)
				cnt_1<=0;
         else if (cnt_1==N-1)
				cnt_1<=0;
			else cnt_1<=cnt_1+1; //The counter keeps counting and clears when it reaches n-1, which is a counter of modulus N
		end
always @ (posedge clock or negedge reset)
		begin
			if(!reset)
				clock_1<=0;
			else if (cnt_1<(N>>1))
				clock_1<=0;
			else 
				clock_1<=1;
		end
		
always @ (negedge clock or negedge reset)
		begin
			if(!reset)
				cnt_0<=0;
			else if (cnt_0==(N-1))
				cnt_0<=0;
			else cnt_0<=cnt_0+1;
		end
		 
always @ (negedge clock or negedge reset)
		begin
			if(!reset)
				clock_0<=0;
			else if (cnt_0<(N>>1))  
				clock_0<=0;
			else 
				clock_0<=1;
		end


assign  clock_10=clock_1&clock_0;

endmodule



