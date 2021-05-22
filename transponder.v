/*
 * Top scrip
 * ---------------------
 * For: University of Leeds
 * Date: 23rd April 2021
 *
 * Description
 * ------------
 * The module is a simple example of a three state
 *
 */
 
 module transponder(
 reset,
 clock,
 con0,
 con1,
 con2,
 bs0,
 bs1,
 beep
 );
input   reset;
input   clock;
input   con0;
input   con1;
input   con2;

output[6:0] bs0,bs1;
output beep;

wire [2:0]chose;
wire       Judge;    

Tr tr(
.reset(reset),
.clock(clock),
.con0(con0),
.con1(con1),
.con2(con2),
.chose(chose)
);

Countdown countdown(
.clock(clock),
.reset(reset),
.C_en(Judge),
.beep(beep),
.bs0(bs0),
.bs1(bs1)
);

assign Judge=~(chose[0]==1)||(chose[1]==1)||(chose[2]==1);

endmodule



	