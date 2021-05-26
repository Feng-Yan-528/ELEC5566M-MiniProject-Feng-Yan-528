/*
 * LT24 display module
 * ------------------------
 * By: Feng Yan 
 * For: University of Leeds
 * Date: 8th May 2021
 *
 * Short Description
 * -----------------
 * This module is used to display the answer questions, 
 * the LCD can show the number of contestants after answering, and judge whether it is correct or not
 *
 */

module Bigscreen (
    // Global Clock/Reset
    // - Clock
    input              clock,
    // - Global Reset
    input              globalReset,
	 input              x,
    // - Application Reset - for debug
    output             resetApp,
    
	 input              w,
//	 input              m,

    // LT24 Interface
    output             LT24Wr_n,
    output             LT24Rd_n,
    output             LT24CS_n,
    output             LT24RS,
    output             LT24Reset_n,
    output [     15:0] LT24Data,
    output             LT24LCDOn
);

//
// Local Variables
//
wire  [ 7:0] xAddr;
wire  [ 8:0] yAddr;
reg  [15:0] pixelData;
wire        pixelReady;
reg         pixelWrite;
reg  [31:0] rom_addr;
wire   [15:0] rom_rd;
//
// LCD Display
//
localparam LCD_WIDTH  = 240;
localparam LCD_HEIGHT = 320;
localparam PIC_X_START = 8'd60;
localparam PIC_Y_START = 9'd00;
localparam PIC_WIDTH =  120;
localparam PIC_HEIGHT = 320;

localparam BACK_COLOR = 16'b0000000000000000;

 
LT24Display #(
    .WIDTH       (LCD_WIDTH  ),
    .HEIGHT      (LCD_HEIGHT ),
    .CLOCK_FREQ  (50000000  )
) Display (
    //Clock and Reset In
    .clock       (clock      ),
    .globalReset (globalReset),
    //Reset for User Logic
    .resetApp    (resetApp   ),
    //Pixel Interface
    .xAddr       (xAddr      ),
    .yAddr       (yAddr      ),
    .pixelData   (pixelData  ),
    .pixelWrite  (1'b1       ),
    .pixelReady  (pixelReady ),
    //Use pixel addressing mode
    .pixelRawMode(1'b0       ),
    //Unused Command Interface
    .cmdData     (8'b0       ),
    .cmdWrite    (1'b0       ),
    .cmdDone     (1'b0       ),
    .cmdReady    (           ),
    //Display Connections
    .LT24Wr_n    (LT24Wr_n   ),
    .LT24Rd_n    (LT24Rd_n   ),
    .LT24CS_n    (LT24CS_n   ),
    .LT24RS      (LT24RS     ),
    .LT24Reset_n (LT24Reset_n),
    .LT24Data    (LT24Data   ),
    .LT24LCDOn   (LT24LCDOn  )
);


//
// X Counter
//
wire [7:0] xCount;
UpCounterNbit #(
    .WIDTH    (          8),
    .MAX_VALUE(LCD_WIDTH)
) xCounter (
    .clock     (clock     ),
    .reset     (resetApp  ),
    .enable    (pixelReady),
    .countValue(xCount    )
);

//
// Y Counter
//
wire [8:0] yCount;

wire yCntEnable = pixelReady && (xCount == 240);
UpCounterNbit #(
    .WIDTH    (           9),
    .MAX_VALUE(LCD_HEIGHT)
) yCounter (
    .clock     (clock     ),
    .reset     (resetApp  ),
    .enable    (yCntEnable),
    .countValue(yCount    )
);


assign  xAddr = xCount;
assign  yAddr = yCount;


//
//Instantiate the Subject
//

reg   [31:0] rom_addr_0;
wire  [15:0] rom_rd_0;
reg  [15:0] pixelData_0;

Subject subject(
.address(rom_addr_0),
.clock(clock),
.q(rom_rd_0)
);


always@(posedge clock or posedge globalReset)begin
    if(globalReset)begin
        pixelData_0 <= BACK_COLOR;
		 end
    else if((xAddr >= PIC_X_START) && (xAddr < PIC_X_START + PIC_WIDTH) && (yAddr >=PIC_Y_START) && (yAddr < PIC_Y_START + PIC_HEIGHT))begin
        pixelData_0 <= rom_rd_0;
		  end else
       pixelData_0 <= 16'd0;
		  end 



always @ (posedge clock or posedge globalReset) begin
       if(globalReset) begin
        rom_addr_0 <= 16'd0;
		  end else 
        if((yAddr >= PIC_Y_START) && (yAddr < PIC_Y_START + PIC_HEIGHT) && (xAddr >= PIC_X_START) &&(xAddr < PIC_X_START + PIC_WIDTH)) begin   
        rom_addr_0 <=({xCount}/2+{yCount}*PIC_WIDTH) ;
        end
		  else
        rom_addr_0 <= 16'd0;
		  end 
		  

reg [1:0] stateM;
localparam A_STATE   = 2'b01;
localparam B_STATE   = 2'b10;	  
localparam C_STATE   = 2'b11;	  

reg   [31:0] rom_addr_1;
wire  [15:0] rom_rd_1;
ERROR error(
.address(rom_addr_1),
.clock(clock),
.q(rom_rd_1)
);

reg  [15:0] pixelData_1;
always@(posedge clock or posedge globalReset)begin
    if(globalReset)begin
        pixelData_1 <= BACK_COLOR;
		 end
    else if((xAddr >= PIC_X_START) && (xAddr < PIC_X_START + PIC_WIDTH) && (yAddr >=PIC_Y_START) && (yAddr < PIC_Y_START + PIC_HEIGHT))begin
        pixelData_1 <= rom_rd_1;
		  end else
        pixelData_1 <= 16'd0;
		  end 



always @ (posedge clock or posedge globalReset) begin
       if(globalReset) begin
        rom_addr_1 <= 16'd0;
		  end else 
        if((yAddr >= PIC_Y_START) && (yAddr < PIC_Y_START + PIC_HEIGHT) && (xAddr >= PIC_X_START) &&(xAddr < PIC_X_START + PIC_WIDTH)) begin   
        rom_addr_1 <=({xCount}/2+{yCount}*PIC_WIDTH) ;
        end
		  else
        rom_addr_1 <= 16'd0;
		  end 
		
		
reg   [31:0] rom_addr_2;
wire  [15:0] rom_rd_2;
TRUE true(
.address(rom_addr_2),
.clock(clock),
.q(rom_rd_2)
);

reg  [15:0] pixelData_2;
always@(posedge clock or posedge globalReset)begin
    if(globalReset)begin
        pixelData_2 <= BACK_COLOR;
		 end
    else if((xAddr >= PIC_X_START) && (xAddr < PIC_X_START + PIC_WIDTH) && (yAddr >=PIC_Y_START) && (yAddr < PIC_Y_START + PIC_HEIGHT))begin
        pixelData_2 <= rom_rd_2;
		  end else
        pixelData_2 <= 16'd0;
		  end 



always @ (posedge clock or posedge globalReset) begin
       if(globalReset) begin
        rom_addr_2 <= 16'd0;
		  end else 
        if((yAddr >= PIC_Y_START) && (yAddr < PIC_Y_START + PIC_HEIGHT) && (xAddr >= PIC_X_START) &&(xAddr < PIC_X_START + PIC_WIDTH)) begin   
        rom_addr_2 <=({xCount}/2+{yCount}*PIC_WIDTH) ;
        end
		  else
        rom_addr_2 <= 16'd0;
		  end 
		  		  
		  
always @ (posedge clock ) begin
      case (stateM)
        A_STATE: begin // Define state A behaviour
	    pixelData <= pixelData_0;
       rom_addr  <= rom_addr_0; 
        
    end B_STATE: begin// Define state B behaviour
        pixelData <= pixelData_1;
        rom_addr  <=rom_addr_1; 
		  
	 end	C_STATE: begin// Define state C behaviour
        pixelData <= pixelData_2;
        rom_addr  <=rom_addr_2; 
		end
    endcase
end 


always @ (posedge clock or posedge globalReset) begin
    if (globalReset) begin
	     stateM <= A_STATE;
		 end else begin
      case (stateM)
          A_STATE: begin 
			 stateM <= A_STATE; 	 
			 if (x) begin 
			 if (!w)  begin
              stateM <= B_STATE;
          end else if (w) begin
              stateM <= C_STATE;				  
           end
			end
		  end
		    B_STATE: begin 
          if (!globalReset) begin
              stateM <= A_STATE;
           end 
			 end
		    C_STATE: begin 
          if (!globalReset) begin
              stateM <= A_STATE;
          end 
	      end
		endcase
	end
end	  

endmodule





