/*
 * Countdown
 * ---------------------
 * For: University of Leeds
 * Date: 6th May 2021
 *
 * Description
 * ------------
 * Connect each module
 */
 
module Countdown(
clock,
reset,
beep,
bs0,
bs1
);

 input clock;
 input reset;
 output [6:0] bs0;
 output [6:0] bs1;
 output beep;
 
 wire c;
 wire [3:0] TimeL;
 wire [3:0] TimeH;

 FD f(
 .clock(clock),
 .reset(reset),
 .clock_F(c)
 );
 
 Counter counter(
 .clock_1(c),
 .reset(reset),
 .TimeH(TimeH),
 .TimeL(TimeL),
 .beep(beep)
 );
 
 Seg_display seg_display(
 .clock(c),
 .reset(reset),
 .TimeH(TimeH),
 .TimeL(TimeL),
 .bs0(bs0),
 .bs1(bs1)
 );
 
 endmodule
 