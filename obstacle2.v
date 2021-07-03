`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2020 07:23:14 PM
// Design Name: 
// Module Name: obstacle
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


module obstacle2(
    input wire clk, reset,
    input wire video_on,
    input wire [9:0] x, y,
    input wire [25:0] speed_offset,
    input wire [9:0] p_y,
    input wire [9:0] o1_x,
    input wire original_skin,
    output obstacle_on,         // output signal asserted when input x/y are within obstacle sprite in display area
    output wire [9:0] o2_x,
    output wire [9:0] S_H2
    );

// constant declarations
    
    // tile width and height
    localparam T_W = 29;
    localparam T_H = 480;
    
    // Save Zone height
    localparam S_Z = 120;
    
    /***********************************************************************************/
    /*                           sprite location registers                             */  
    /***********************************************************************************/
    // Player sprite location regs, pixel location with respect to top left corner
    reg [9:0] s_x_reg, s_y_reg;
    reg [9:0] s_x_next, s_y_next;
    reg [9:0] S_H, S_H_next;
      
    // infer registers for sprite location  
        always @(posedge clk)
            begin
            s_x_reg     <= s_x_next;
            s_y_reg     <= 0;
            S_H         <= S_H_next;
            end
            
    /***********************************************************************************/
    /*                                sprite motion                                    */  
    /***********************************************************************************/
	  
    localparam TIME_MAX    =   4000000; 
    
    reg [25:0] time_reg;  // register to keep track of count time between position updates
	wire [25:0] time_next;     
   
    // infer time register
    always @(posedge clk, posedge reset)
	if(reset)
		time_reg <= 0;
	else
		time_reg <= time_next;
	
    // next-state logic, increment until maximum, then reset to 0
    assign time_next = (time_reg < TIME_MAX - speed_offset) ? time_reg + 1 : 0;
			
    // tick signal is asserted when time reg reaches max
    wire tick;
    assign tick = (time_reg == TIME_MAX - speed_offset ) ? 1 : 0;
      	
    // on positive edge of tick signal, or reset, update obstacle location 
    always @(posedge tick, posedge reset)
		begin
		//defaults
		s_x_next = s_x_reg;
		s_x_next = s_x_reg;
		S_H_next = S_H;
		
		if(reset)
		  begin
			s_x_next = 670;            // reset to starting x position
			S_H_next = {(p_y)%200}+20; // random height by calculate current y position of player
			if(S_H_next > 230 || S_H_next < 0)
			   S_H_next = 185;
		  end
	    else if(s_x_next == 0)
	       begin
	        s_x_next = 670;            // reset to starting x position
	        S_H_next = {(p_y)%200}+50; // random height by calculate current y position of player
	        if(S_H_next > 230 || S_H_next < 0)
			   S_H_next = 185;
	       end
		else 
			s_x_next = s_x_reg - 1;     // move obstacle to the left
    
		end
    	   
// used to index ROM data
    wire [4:0] col;
    wire [4:0] row;         
    
    assign col =  x - s_x_reg - 4 ;
    assign row =  y - 6;
    
    wire [11:0] color_data;
    
    obstacle_rom obstacle_rom_unit (.clk(clk), .row(row), .col(col), .color_data(color_data));
    	   
// vector to signal when vga_sync pixel is within upper obstacle or lower obstacle tile (see diagram)
    wire obstacle_up_on, obstacle_down_on;
    assign obstacle_up_on = (x >= s_x_reg - T_W + 1) && (x <= s_x_reg) 
                            && (y >= s_y_reg) && (y <= s_y_reg + S_H - 1) 
                            && original_skin ? 1 :
                            
                            (x >= s_x_reg - T_W + 1) && (x <= s_x_reg) 
                            && (y >= s_y_reg) && (y <= s_y_reg + S_H - 1) 
                            && color_data != 12'b111111111111 
                            ? 1 : 0;
                            
    assign obstacle_down_on = (x >= s_x_reg - T_W + 1) && (x <= s_x_reg) 
                            && ( y >= s_y_reg + S_H + S_Z - 1 ) && (y <= s_y_reg + T_H - 1 )
                            &&  original_skin ? 1 :
                             
                            (x >= s_x_reg - T_W + 1) && (x <= s_x_reg) 
                            && ( y >= s_y_reg + S_H + S_Z - 1 ) && (y <= s_y_reg + T_H - 1 )
                            && color_data != 12'b111111111111
                            ? 1 : 0;
    
    // assign module output signals
    assign o2_x = s_x_reg;
    assign S_H2 = S_H;
    
    // rgb output
    assign obstacle_on = obstacle_up_on || obstacle_down_on && video_on ? 1 : 0;
    
endmodule