/*
 * Countdown
 * ---------------------
 * For: University of Leeds
 * Date: 6th May 2021
 *
 * Description
 * ------------
 * This is a countdown IP core, which is used as a countdown when 
 * the questions are displayed to limit the contestant's answer time
 */
 
module Countdown(
clock,
reset,
beep,
bs0,
C_en,
bs1
);

 input clock;
 input reset;
 input C_en;
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
 .C_en(C_en),
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
 