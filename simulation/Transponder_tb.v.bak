/*
 * Countdown_tb
 * ---------------------
 * For: University of Leeds
 * Date: 6th May 2021
 *
 * Description
 * ------------
 * Test the whole module
 */
`timescale 1ns/100 ps
 
module Countdown_tb;

 reg clock;
 reg reset;
 wire [6:0] bs0;
 wire [6:0] bs1;
 wire [3:0] TimeH,TimeL;


 wire beep,clock_5,clock_10,clock_f;

Countdown countdown_dut(
.clock(clock),
.reset(reset),
.bs1(bs1),
.bs0(bs0),
.clock_5(clock_5),
.clock_10(clock_10),
.clock_f(clock_f),
.beep(beep),
.TimeH(TimeH),
.TimeL(TimeL)
);

initial begin
//$display("%d ns\tSimulation Started",$time);
//$monitor("%d ns\tclock=%d\t reset=%d\t bs1=%b\t bs0=%b\t clock_5=%b\t clock_10=%b\t clock_f=%b\t beep=%b ",$time,clock,reset,bs1,bs0,beep,clock_5,clock_10,clock_f,Tim);
clock=1'b1;
reset=1'b0;
#200
clock=1'b1;
reset=1'b1;

//$display("%d ns\tSimulation Finished",$time); //Finished
end
always #20 clock=~clock;

endmodule
 