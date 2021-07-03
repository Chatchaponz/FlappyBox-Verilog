`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2020 04:16:29 AM
// Design Name: 
// Module Name: game_state_machine
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module game_state_machine(
        input wire clk, hard_reset,   // clock and reset inputs for synchronous registers
        input wire start,up,          // start button signal input
        input wire collision,         // collision detection signal input
        output wire [1:0] game_state, // output game state machine's state
		output wire game_en,          // output signal asserted when game is in playing/hit states
        output reg game_reset         // output signal asserted to reset game mechanics modules (see use in display_top)
    );
    
    // positive edge detection for start button
	reg start_reg, up_reg;
	wire start_posedge, up_posedge;
	
	// infer start signal register
	always @(posedge clk, posedge hard_reset)
		if(hard_reset)
		begin
			start_reg <= 0;
			up_reg <= 0;
	    end
		else 
		begin
			start_reg <= start;
			up_reg <= up;
	    end
	// assert start_posedge on positive edge of start button signal
	assign start_posedge = start & ~start_reg;
	assign up_posedge = up & ~up_reg;
    
    // symbolic state declarations
	localparam [1:0] init     = 2'b00,  // state to idle
	                 idle     = 2'b01,  // start screen 
		             playing  = 2'b10,  // playing
			         gameover = 2'b11;  // game over!
			         
	reg [1:0] game_state_reg, game_state_next; // FSM state register
	reg [27:0] timeout_reg, timeout_next;      // timer register 
	reg game_en_reg, game_en_next;             // register for game enable signal
	
	// infer game state, timeout timer, hearts, and game enable register
	always @(posedge clk, posedge hard_reset)
		if(hard_reset)
			begin
			game_state_reg <= init;
			timeout_reg    <= 20000000;
			game_en_reg    <= 0;
			end
		else
			begin
			game_state_reg <= game_state_next;
			timeout_reg    <= timeout_next;
			game_en_reg    <= game_en_next;
			end
			
    always @*
        begin
		// defaults 
		game_state_next = game_state_reg;
		timeout_next    = timeout_reg;
		game_en_next    = game_en_reg;
		game_reset = 0;
		
		case(game_state_reg)
		
		    init:
				begin	
				if(timeout_reg > 0)                   // decrement timeout_reg until 0
					timeout_next = timeout_reg - 1;
				else 
					game_state_next = idle;           // go to idle game state
				end
		      
		    idle:
				begin
				if(up_posedge)                        // player presses up button to begin game
					begin
					game_en_next = 1;                 // game_en signal asserted next
					game_reset   = 1;                 // assert reset game signal
					game_state_next = playing;        // next state is playing
					end
				end
				  
		     playing:
				begin
				if(collision)                         // if player collides with obstacle while playing
					begin
						game_en_next = 0;             // disable game_en signal
						game_state_next = gameover;   // go to gameover state
					end
				end
				
			gameover:                                 // gameover state
				begin
				if(start_posedge)                     // wait for player to press start button
					begin
					game_state_next = init;           // go to init state
					game_reset   = 1;                 // assert game_reset signal to reset all gameplay mechanics modules (see display_top)
					end
				end	
			
		   endcase
		end
		
		// assign output signals
	   assign game_state = game_state_reg;
	   assign game_en = game_en_reg;   
	   
endmodule
