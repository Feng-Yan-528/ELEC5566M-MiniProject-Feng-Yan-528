/*
 * Score
 * ---------------------
 * By Feng Yan 
 * For: University of Leeds
 * Date: 26rd April 2021
 *
 * Description
 * ------------
 * 
 *
 */
module Score(
add,
sub,
clr,
chose,
a1,
a2,
a3,
led_out
);


input        clr;
input        add;
input        sub;
input [2:0]  chose;
output [7:0] a1;
reg [7:0]    a1;
output [7:0] a2;
reg [7:0]    a2;
output [7:0] a3;
reg [7:0]    a3;
output [2:0] led_out;
wire Judge;

assign led_out = chose;
assign Judge=add^sub;

always @(posedge clr or posedge Judge)
      if (clr == 1'b1)
      begin
         a1 <= 8'b00010000;
         a2 <= 8'b00010000;
         a3 <= 8'b00010000;
      end
      else 
      begin
         if (add == 1'b1)
            case (chose)
               3'b001 :
                  if (a1 == 8'b00010011)
						  a1[7:0] <= 8'b00000000;
                  else if (a1[3:0] == 4'b1001)
                   begin
						   a1[3:0] <= 4'b0000;
                     a1[7:4] <= a1[7:4] + 1'b1;
                  end
                  else
                     a1[3:0] <= a1[3:0] + 1'b1;
					3'b010 :
                  if (a2 == 8'b00010011)
						a2[7:0] <= 8'b00000000;
                  else if (a2[3:0] == 4'b1001)
                  begin
						   a2[3:0] <= 4'b0000;
                     a2[7:4] <= a2[7:4] + 1'b1;
                  end
                  else
                     a2[3:0] <= a2[3:0] + 1'b1;
					3'b011 :
                  if (a3 == 8'b00010011)
						a3[7:0] <= 8'b00000000;
                  else if (a3[3:0] == 4'b1001)
                  begin
						   a3[3:0] <= 4'b0000;
                     a3[7:4] <= a3[7:4] + 1'b1;
                  end
                  else
                     a3[3:0] <= a3[3:0] + 1'b1;
						endcase
		else if (sub == 1'b1)
            case (chose)
               3'b001 :
					if (a1 == 8'b00000000)
					a1[7:0] <= 8'b00000000;
					else if (a1[3:0] == 4'b0000)
                  begin
                     a1[3:0] <= 4'b1001;
                     a1[7:4] <= a1[7:4] - 1'b1;
                  end
                  else
                     a1[3:0] <= a1[3:0] - 1'b1;

                3'b010 :
                if (a2 == 8'b00000000)
					 a2[7:0] <= 8'b00000000;
                else if (a2[3:0] == 4'b0000)
                begin
                     a2[3:0] <= 4'b1001;
                     a2[7:4] <= a2[7:4] - 1'b1;
                  end
                  else
                     a2[3:0] <= a2[3:0] - 1'b1;
					 3'b011 :
                  if (a3 == 8'b00000000)
                   a3[7:0] <= 8'b00000000;
                  else if (a3[3:0] == 4'b0000)
                  begin
                     a3[3:0] <= 4'b1001;
                     a3[7:4] <= a3[7:4] - 1'b1;
                  end
                  else
                     a3[3:0] <= a3[3:0] - 1'b1;
						endcase
end


endmodule
