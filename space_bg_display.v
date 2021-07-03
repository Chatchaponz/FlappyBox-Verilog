`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2020 02:46:36 AM
// Design Name: 
// Module Name: space_bg_display
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


module space_bg_display(
        input wire clk,          // input clock signal for synchronous rom
        input wire [9:0] x, y,   // current pixel coordinates from vga_sync circuit
        output wire sp_bg_on     // output signal asserted when x/y are within title on display
    );
	
	// vectors to index game_logo_rom
	wire [8:0] row;
	wire [9:0] col;
	wire [11:0] rgb_out;
	
	assign row = y[8:0];
	assign col = x;
	
	// space background is on when color not equal to black color
	assign sp_bg_on = (rgb_out != 12'b0) ? 1 : 0;
	
	//rom for space background
	space_background space_background_unit (.clk(clk), .row(row), .col(col), .color_data(rgb_out));
	
endmodule
