/*
 * State machine
 * ---------------------
 * For: University of Leeds
 * Date: 23rd April 2021
 *
 * Description
 * ------------
 * The module is a simple example of a three state
 *
 */

module State_machine (
    input clock, 
    input reset,
    input w,
	 input n,
	 input r,
    output reg cut,
	 output reg rush,
	 output reg result
); 

//State-Machine Registers
reg [1:0] state;

//Local Parameters used to define state names (similar to #define in C)
localparam A_STATE = 2'b00;
localparam B_STATE = 2'b01;
localparam C_STATE = 2'b10;

//Define the outputs for each state, which are only dependent on the state
always @(state) begin
    cut = 1'b0; // Default value for output
	 rush = 1'b0;
	 result = 1'b0;
    case (state)
        A_STATE: begin // Define state A outputs
            cut = 1'b1;
        end
        B_STATE: begin // Define state B outputs
            rush = 1'b1;
        end
        C_STATE: begin // Define state C outputs
            result = 1'b1;
        end
    endcase
end

//Define state transitions, which are synchronous
always @(posedge clock or posedge reset) begin
    if (reset) begin
        //Reset the state machine
        state <= A_STATE;
    end else begin
        case (state)
            A_STATE: begin // Define state A behaviour
                if (w) begin 
                    state <= B_STATE;
                end 
                if (!w) begin
                    state <= A_STATE;
                end
            end
            B_STATE: begin // Define state B behaviour
                if (n) begin
                    state <= C_STATE;
                end 
                if (!n) begin
                    state <= A_STATE;
                end
            end
            C_STATE: begin // Define state C behaviour
                if (!r) begin
                    state <= C_STATE;
                end 
                if (r) begin
                    state <= A_STATE;
                end
            end
            default: begin
                state <= A_STATE;
            end
        endcase
    end
end

endmodule
