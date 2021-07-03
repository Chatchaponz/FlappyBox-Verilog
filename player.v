`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2020 10:50:37 AM
// Design Name: 
// Module Name: player
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


module player(
    input wire clk, reset,
    input wire btnU,
    input wire video_on,
    input wire [9:0] x, y,
    input wire [2:0] skin_select,// signal asserted to change skin
    input wire original_skin,    // signal asserted when to use original box skin
    input wire [1:0] game_state,
    output wire [11:0] rgb_out,  // fixed rgb output for some skin
    output player_on,            // output signal asserted when input x/y are within player sprite in display area
    output wire [9:0] p_x, p_y   // player coordinate on screen
    );
    
    // constant declarations
    // pixel coordinate boundaries for VGA display area
    localparam MAX_X = 640;
    localparam MAX_Y = 480;
    localparam MIN_Y =  2;
    
    // tile width and height
    localparam T_W = 20;
    localparam T_H = 24;
    
    // symbolic state constant representing game state idle
    localparam idle = 2'b01;
    
    /***********************************************************************************/
    /*                           sprite location registers                             */  
    /***********************************************************************************/
    // Player sprite location regs, pixel location with respect to top left corner
    reg [9:0] s_x_reg ,s_y_reg;
    reg [9:0] s_x_next, s_y_next;
   
    // infer registers for sprite location
    
     always @(posedge clk, posedge reset)
        if (reset)
            begin
            s_x_reg     <= 90;                 // initialize to left side of screen,
            s_y_reg     <= 240;                // on middle air
            end
        else
            begin
            s_x_reg     <= 90;
            s_y_reg     <= s_y_next;
            end
    
    /***********************************************************************************/
    /*                           FSMD for Sprite in y motion                           */  
    /***********************************************************************************/
    // symbolic state representations
    localparam  jump_down  = 0, // jumping down
                jump_up    = 1; // jumping up
    
    // constant parameters that determine jump speed and height, and walking animation speed                
    localparam TIME_START_Y      =   100000;  // starting time to load when beginning to jump up
    localparam TIME_STEP_Y       =     8000;  // increment/decrement value to time loaded to jump_t_reg after position update
    localparam TIME_MAX_Y        =   600000;  // maximum time reached at peak of jump
    localparam TIME_TERM_Y       =   250000;  // terminal time reached when jumping down
    
    reg state_reg_y, state_next_y;          // register for FSMD state
    reg [19:0] jump_t_reg, jump_t_next;     // register to keep track of count down/up time for jumping
    reg [19:0] start_reg_y, start_next_y;   // register to keep track of start time for count down/up for jumping
  

     // signals for up-button positive edge signal
    reg [7:0] btnU_reg;
    wire btnU_edge;
    assign btnU_edge = ~(&btnU_reg) & btnU;
   
    // infer registers used for FSMD and up-button state reg
    always @(posedge clk, posedge reset)
        if(reset)
            begin
            state_reg_y  <= 0;
            jump_t_reg   <= 0;
            start_reg_y  <= 0;
            btnU_reg     <= 0;
            end
        else
            begin
            state_reg_y  <= state_next_y;
            jump_t_reg   <= jump_t_next;
            start_reg_y  <= start_next_y;
            btnU_reg     <= {btnU_reg[6:0], btnU};
            end
            
    // FSMD next-state logic and data path        
    always @*
        begin
        // defaults
        state_next_y  = state_reg_y;
        jump_t_next   = jump_t_reg;
        start_next_y  = start_reg_y;
        s_y_next      = s_y_reg;
        
        case (state_reg_y)
        
            jump_down:
                begin
                if(jump_t_reg > 0)                                 // if jump time reg > 0
                    begin
                    jump_t_next = jump_t_reg - 1;                  // decrement reg
                    end
                    
                if(jump_t_reg == 0)                                // if jump time reg = 0
                    begin
                     if(game_state == idle )                       // if on start screen no move in y axis
                        s_y_next = 227;
                        
                     else if(s_y_next < MAX_Y - T_H)               // else if player within screen start fall down
                        begin
                        s_y_next = s_y_reg + 1;
                        end
                     else                                          // else player falling down to bottom of the screen then remain in the same position
                        begin
                        s_y_next = s_y_reg;
                        end
                        
                     if(start_reg_y > TIME_TERM_Y)                 // if time start reg isn't down to start time
                            begin
                            start_next_y = start_reg_y - TIME_STEP_Y; // dercrement time start reg
                            jump_t_next = start_reg_y - TIME_STEP_Y;  // set jump time reg to new start time
                            end
                        else
                            begin  
                            jump_t_next = TIME_TERM_Y;
                            end
                    end
                    
                if(btnU_edge)                           // if up button pressed
                    begin
                    state_next_y = jump_up;             // go to jump up state
                    start_next_y = TIME_START_Y;        // load start time in start time reg
                    jump_t_next = TIME_START_Y;         // load start time in jump time reg
                    end
                end
                
            jump_up:
                begin
               
                if(jump_t_reg > 0)                                // if jump time reg > 0
                    begin
                    jump_t_next = jump_t_reg - 1;                 // decrement reg
                    end
                   
                if(jump_t_reg == 0)                               // if jump time reg = 0
                    begin
                    
		            if(start_reg_y <= TIME_MAX_Y)                 // if player can go up
		              begin
		              
			           if(s_y_next > MIN_Y)                       // and below top of the screen
			             begin 
			              s_y_next = s_y_reg - 1;                 // move player sprite up by one pixel
			             end
			             
			           else
			             begin
			              s_y_next = s_y_reg;                     // else stay at the same position
			             end
			             
			          end
                    else 				                          
			          begin
			             state_next_y = jump_down;                 // go to jump down state
			             start_next_y = TIME_MAX_Y;                // load max time in start time reg
                         jump_t_next  = TIME_MAX_Y;                // load max time in jump time reg
			          end
						
		        if(start_reg_y <= TIME_MAX_Y)                     // if start time reg < maximum
                        begin
                        start_next_y = start_reg_y + TIME_STEP_Y; // increment start time reg
                        jump_t_next = start_reg_y + TIME_STEP_Y;  // set jump time reg to new start value
                        end
                    else                                          // else if start time reg > maximum
                        begin
                        start_next_y = TIME_MAX_Y;                // load max time in start time reg
                        jump_t_next  = TIME_MAX_Y;                // load max time in jump time reg
                        end
                    end
                end
        endcase
        end
     
    /***********************************************************************************/
    /*                                     ROM indexing                                */  
    /***********************************************************************************/  
    
    // sprite coordinate addreses, from upper left corner
    // used to index ROM data
    
    wire [4:0] col;
    wire [4:0] row;         
    
    wire jump_state;
    // state indicated player currently jumping
    assign jump_state = state_reg_y;
    
    // row and column run by x and y form VGA and update by player current location
    assign col = x - s_x_reg; 
    assign row = y - s_y_reg;
    
    wire [11:0] color_data;
    
    player_rom player_rom_unit (.clk(clk), .row(row), .col(col), .skin_select(skin_select), .jump_state(jump_state),.color_data(color_data));
    
    // if original_skin is on
    assign rgb_out = original_skin ? 12'b0 : color_data;
    
    // vector to signal when vga_sync pixel is within body tile (see diagram)
    wire body_on;
    assign body_on = (x >= s_x_reg) && (x <= s_x_reg + T_W - 1)         // original_skin is on
                      && (y >= s_y_reg) && (y <= s_y_reg + T_H - 1)     // box skin
                      && original_skin ? 1 :
                                           
                     (x >= s_x_reg) && (x <= s_x_reg + T_W - 1)         // original_skin is off 
                      && (y >= s_y_reg) && (y <= s_y_reg + T_H - 1)     // send out regular skin signal
                      && color_data != 12'b111111111111 ? 1 : 0;   
    
    // assign module output signals
    assign p_x = s_x_reg;
    assign p_y = s_y_reg;
    
    // rgb output
    assign player_on = body_on && video_on ? 1 : 0;
   
endmodule
