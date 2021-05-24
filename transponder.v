/*
 * Top scrip
 * ---------------------
 * For: University of Leeds
 * Date: 23rd April 2021
 *
 * Description
 * ------------
 * The main program
 *
 */
 
 module transponder(
 reset,clock,con0,con1,con2,bs0,bs1,beep,
 LT24Wr_n,LT24Rd_n,LT24CS_n,LT24RS,LT24Reset_n,LT24Data,LT24LCDOn,
 detect 
 );
input   reset,clock,con0,con1,con2;

output beep,detect;
output[6:0] bs0,bs1;
output     LT24Wr_n;
output     LT24Rd_n;
output     LT24CS_n;
output     LT24RS;
output     LT24Reset_n;
output [15:0] LT24Data;
output     LT24LCDOn;

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

Bigscreen bigscreen(
 .clock(clock),
 .globalReset(globalReset),  
 .w(w),
 .m(m),
 .a(a),
 .b(b),
 .LT24Wr_n(LT24Wr_n),
 .LT24Rd_n(LT24Rd_n),
 .LT24CS_n(LT24CS_n),
 .LT24RS(LT24RS),
 .LT24Reset_n(LT24Reset_n),
 .LT24Data(LT24Data),
 .LT24LCDOn(LT24LCDOn)
);

assign Judge=!((chose[0]==1)||(chose[1]==1)||(chose[2]==1))&&1'b1;
assign detect= Judge;




endmodule



	