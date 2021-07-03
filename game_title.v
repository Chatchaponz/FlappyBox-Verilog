`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 12:34:53 PM
// Design Name: 
// Module Name: game_title
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


module game_title
    (
        input wire clk,             // input clock signal for synchronous rom
        input wire [9:0] x, y,      // current pixel coordinates from vga_sync circuit
        output wire title_on        // output signal asserted when x/y are within title on display
    );
	
	// vectors to index game_title_rom
	wire [5:0] row;
	wire [8:0] col;
	wire [11:0] rgb_out;
	
	assign row = y - 215;
	assign col = x - 109-16;
	
	// assert game_title_on when vga x/y is located within game title on screen and color_data doesn't equal white color
	assign title_on = (x >= 109+16 && x < 531+16 && y >= 215 && y < 264 && rgb_out != 12'b111111111111) ? 1 : 0;
	
	// instantiate game_title_rom
	game_title_rom game_title_rom_unit (.clk(clk), .row(row), .col(col), .color_data(rgb_out));

endmodule
