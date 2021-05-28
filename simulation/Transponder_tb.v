/*
 * Transponder_tb
 * ---------------------
 * For: University of Leeds
 * Date: 6th May 2021
 *
 * Description
 * ------------
 * Test the whole module
 */
`timescale 10 us/100 ns
 
module Transponder_tb;

 reg reset,clock,con0,con1,con2,w,refresh;
 wire [6:0] bs0,bs1,bs2,bs3;


 wire beep,LT24Wr_n,LT24Rd_n,LT24CS_n,LT24RS,LT24Reset_n,LT24Data,LT24LCDOn;

transponder transponder_dut(
.clock(clock),
.reset(reset),
.refresh(refresh),
.con0(con0),
.con1(con1),
.con2(con2),
.w(w),
.bs0(bs0),
.bs1(bs1),
.bs2(bs2),
.bs3(bs3),
.beep(beep),
.LT24Wr_n(LT24Wr_n),
.LT24Rd_n(LT24Rd_n),
.LT24CS_n(LT24CS_n),
.LT24RS(LT24RS),
.LT24Reset_n(LT24Reset_n),
.LT24Data(LT24Data),
.LT24LCDOn(LT24LCDOn)
);

initial begin
clock=1'b1;
reset=1'b0;
refresh=1'b0;
con0=1'b1;
con1=1'b1;
con2=1'b1;
w=1'b1;
#2000
reset=1'b1;
#5000

con0= 1'b0;
#2000
refresh=1'b0;
#3000
reset=1'b0;
end
always #0.2 clock=~clock;

endmodule
 