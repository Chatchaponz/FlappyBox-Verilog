`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2020 11:24:56 AM
// Design Name: 
// Module Name: player_rom
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


module player_rom(
        input wire clk,
		input wire [4:0] row,
		input wire [4:0] col,
		input wire [2:0] skin_select,
		input wire jump_state,
		output reg [11:0] color_data
    );
    (* rom_style = "block" *)

	//signal declaration
	reg [4:0] row_reg;
	reg [4:0] col_reg;

	always @(posedge clk)
		begin
		row_reg <= row;
		col_reg <= col;
		end

	always @*
	if(skin_select == 3'b000 )
	if(jump_state) //if player jump use this skin
	case ({row_reg, col_reg}) //Exclamation Mark
	
		10'b0000000001: color_data = 12'b0;//1
		10'b0000000010: color_data = 12'b0;//2
		10'b0000000011: color_data = 12'b0;//3
		10'b0000000100: color_data = 12'b0;//4
		10'b0000000101: color_data = 12'b0;//5
		10'b0000000110: color_data = 12'b0;//6
		10'b0000000111: color_data = 12'b0;//7
		10'b0000001000: color_data = 12'b0;//8
		10'b0000001001: color_data = 12'b0;//9
		10'b0000001010: color_data = 12'b0;//10
		10'b0000001011: color_data = 12'b0;//11
		10'b0000001100: color_data = 12'b0;//12
		10'b0000001101: color_data = 12'b0;//13
		10'b0000001110: color_data = 12'b0;//14
		10'b0000001111: color_data = 12'b0;//15
		10'b0000010000: color_data = 12'b0;//16
		10'b0000010001: color_data = 12'b0;//17
		10'b0000010010: color_data = 12'b0;//18

		10'b0000100000: color_data = 12'b0;//0
		10'b0000100001: color_data = 12'b0;//1
		10'b0000100010: color_data = 12'b0;//2
		10'b0000100011: color_data = 12'b0;//3
		10'b0000100100: color_data = 12'b0;//4
		10'b0000100101: color_data = 12'b0;//5
		10'b0000100110: color_data = 12'b0;//6
		10'b0000100111: color_data = 12'b0;//7
		10'b0000101000: color_data = 12'b0;//8
		10'b0000101001: color_data = 12'b0;//9
		10'b0000101010: color_data = 12'b0;//10
		10'b0000101011: color_data = 12'b0;//11
		10'b0000101100: color_data = 12'b0;//12
		10'b0000101101: color_data = 12'b0;//13
		10'b0000101110: color_data = 12'b0;//14
		10'b0000101111: color_data = 12'b0;//15
		10'b0000110000: color_data = 12'b0;//16
		10'b0000110001: color_data = 12'b0;//17
		10'b0000110010: color_data = 12'b0;//18
		10'b0000110011: color_data = 12'b0;//19

		10'b0001000000: color_data = 12'b0;//0
		10'b0001000001: color_data = 12'b0;//1
		10'b0001000010: color_data = 12'b0;//2
		10'b0001010001: color_data = 12'b0;//17
		10'b0001010010: color_data = 12'b0;//18
		10'b0001010011: color_data = 12'b0;//19

		10'b0001100000: color_data = 12'b0;//0
		10'b0001100001: color_data = 12'b0;//1
		10'b0001110010: color_data = 12'b0;//18
		10'b0001110011: color_data = 12'b0;//19

		10'b0010000000: color_data = 12'b0;//0
		10'b0010000001: color_data = 12'b0;//1
		10'b0010010010: color_data = 12'b0;//18
		10'b0010010011: color_data = 12'b0;//19

		10'b0010100000: color_data = 12'b0;//0
		10'b0010100001: color_data = 12'b0;//1
		10'b0010101000: color_data = 12'b0;//8
		10'b0010101001: color_data = 12'b0;//9
		10'b0010101010: color_data = 12'b0;//10
		10'b0010101011: color_data = 12'b0;//11
		10'b0010110010: color_data = 12'b0;//18
		10'b0010110011: color_data = 12'b0;//19
		
		10'b0011000000: color_data = 12'b0;//0
		10'b0011000001: color_data = 12'b0;//1
		10'b0011000111: color_data = 12'b0;//7
		10'b0011001000: color_data = 12'b0;//8
		10'b0011001001: color_data = 12'b0;//9
		10'b0011001010: color_data = 12'b0;//10
		10'b0011001011: color_data = 12'b0;//11
		10'b0011001100: color_data = 12'b0;//12
		10'b0011010010: color_data = 12'b0;//18
		10'b0011010011: color_data = 12'b0;//19

		10'b0011100000: color_data = 12'b0;//0
		10'b0011100001: color_data = 12'b0;//1
		10'b0011100110: color_data = 12'b0;//6
		10'b0011100111: color_data = 12'b0;//7
		10'b0011101000: color_data = 12'b0;//8
		10'b0011101001: color_data = 12'b0;//9
		10'b0011101010: color_data = 12'b0;//10
		10'b0011101011: color_data = 12'b0;//11
		10'b0011101100: color_data = 12'b0;//12
		10'b0011101101: color_data = 12'b0;//13
		10'b0011110010: color_data = 12'b0;//18
		10'b0011110011: color_data = 12'b0;//19

		10'b0100000000: color_data = 12'b0;//0
		10'b0100000001: color_data = 12'b0;//1
		10'b0100000101: color_data = 12'b0;//5
		10'b0100000110: color_data = 12'b0;//6
		10'b0100000111: color_data = 12'b0;//7
		10'b0100001000: color_data = 12'b0;//8
		10'b0100001001: color_data = 12'b0;//9
		10'b0100001010: color_data = 12'b0;//10
		10'b0100001011: color_data = 12'b0;//11
		10'b0100001100: color_data = 12'b0;//12
		10'b0100001101: color_data = 12'b0;//13
		10'b0100001110: color_data = 12'b0;//14
		10'b0100010010: color_data = 12'b0;//18
		10'b0100010011: color_data = 12'b0;//19

		10'b0100100000: color_data = 12'b0;//0
		10'b0100100001: color_data = 12'b0;//1
		10'b0100100101: color_data = 12'b0;//5
		10'b0100100110: color_data = 12'b0;//6
		10'b0100100111: color_data = 12'b0;//7
		10'b0100101000: color_data = 12'b0;//8
		10'b0100101001: color_data = 12'b0;//9
		10'b0100101010: color_data = 12'b0;//10
		10'b0100101011: color_data = 12'b0;//11
		10'b0100101100: color_data = 12'b0;//12
		10'b0100101101: color_data = 12'b0;//13
		10'b0100101110: color_data = 12'b0;//14
		10'b0100110010: color_data = 12'b0;//18
		10'b0100110011: color_data = 12'b0;//19

		10'b0101000000: color_data = 12'b0;//0
		10'b0101000001: color_data = 12'b0;//1
		10'b0101000101: color_data = 12'b0;//5
		10'b0101000110: color_data = 12'b0;//6
		10'b0101000111: color_data = 12'b0;//7
		10'b0101001000: color_data = 12'b0;//8
		10'b0101001001: color_data = 12'b0;//9
		10'b0101001010: color_data = 12'b0;//10
		10'b0101001011: color_data = 12'b0;//11
		10'b0101001100: color_data = 12'b0;//12
		10'b0101001101: color_data = 12'b0;//13
		10'b0101001110: color_data = 12'b0;//14
		10'b0101010010: color_data = 12'b0;//18
		10'b0101010011: color_data = 12'b0;//19

		10'b0101100000: color_data = 12'b0;//0
		10'b0101100001: color_data = 12'b0;//1
		10'b0101100110: color_data = 12'b0;//6
		10'b0101100111: color_data = 12'b0;//7
		10'b0101101000: color_data = 12'b0;//8
		10'b0101101001: color_data = 12'b0;//9
		10'b0101101010: color_data = 12'b0;//10
		10'b0101101011: color_data = 12'b0;//11
		10'b0101101100: color_data = 12'b0;//12
		10'b0101101101: color_data = 12'b0;//13
		10'b0101110010: color_data = 12'b0;//18
		10'b0101110011: color_data = 12'b0;//19

		10'b0110000000: color_data = 12'b0;//0
		10'b0110000001: color_data = 12'b0;//1
		10'b0110000111: color_data = 12'b0;//7
		10'b0110001000: color_data = 12'b0;//8
		10'b0110001001: color_data = 12'b0;//9
		10'b0110001010: color_data = 12'b0;//10
		10'b0110001011: color_data = 12'b0;//11
		10'b0110001100: color_data = 12'b0;//12
		10'b0110010010: color_data = 12'b0;//18
		10'b0110010011: color_data = 12'b0;//19

		10'b0110100000: color_data = 12'b0;//0
		10'b0110100001: color_data = 12'b0;//1
		10'b0110101000: color_data = 12'b0;//8
		10'b0110101001: color_data = 12'b0;//9
		10'b0110101010: color_data = 12'b0;//10
		10'b0110101011: color_data = 12'b0;//11
		10'b0110110010: color_data = 12'b0;//18
		10'b0110110011: color_data = 12'b0;//19

		10'b0111000000: color_data = 12'b0;//0
		10'b0111000001: color_data = 12'b0;//1
		10'b0111001000: color_data = 12'b0;//8
		10'b0111001001: color_data = 12'b0;//9
		10'b0111001010: color_data = 12'b0;//10
		10'b0111001011: color_data = 12'b0;//11
		10'b0111010010: color_data = 12'b0;//18
		10'b0111010011: color_data = 12'b0;//19

		10'b0111100000: color_data = 12'b0;//0
		10'b0111100001: color_data = 12'b0;//1
		10'b0111110010: color_data = 12'b0;//18
		10'b0111110011: color_data = 12'b0;//19

		10'b1000000000: color_data = 12'b0;//0
		10'b1000000001: color_data = 12'b0;//1
		10'b1000001001: color_data = 12'b0;//9
		10'b1000001010: color_data = 12'b0;//10
		10'b1000010010: color_data = 12'b0;//18
		10'b1000010011: color_data = 12'b0;//19

		10'b1000100000: color_data = 12'b0;//0
		10'b1000100001: color_data = 12'b0;//1
		10'b1000101000: color_data = 12'b0;//8
		10'b1000101001: color_data = 12'b0;//9
		10'b1000101010: color_data = 12'b0;//10
		10'b1000101011: color_data = 12'b0;//11
		10'b1000110010: color_data = 12'b0;//18
		10'b1000110011: color_data = 12'b0;//19

		10'b1001000000: color_data = 12'b0;//0
		10'b1001000001: color_data = 12'b0;//1
		10'b1001001000: color_data = 12'b0;//8
		10'b1001001001: color_data = 12'b0;//9
		10'b1001001010: color_data = 12'b0;//10
		10'b1001001011: color_data = 12'b0;//11
		10'b1001010010: color_data = 12'b0;//18
		10'b1001010011: color_data = 12'b0;//19

		10'b1001100000: color_data = 12'b0;//0
		10'b1001100001: color_data = 12'b0;//1
		10'b1001101001: color_data = 12'b0;//9
		10'b1001101010: color_data = 12'b0;//10
		10'b1001110010: color_data = 12'b0;//18
		10'b1001110011: color_data = 12'b0;//19

		10'b1010000000: color_data = 12'b0;//0
		10'b1010000001: color_data = 12'b0;//1
		10'b1010010010: color_data = 12'b0;//18
		10'b1010010011: color_data = 12'b0;//19

		10'b1010100000: color_data = 12'b0;//0
		10'b1010100001: color_data = 12'b0;//1
		10'b1010100010: color_data = 12'b0;//2
		10'b1010110001: color_data = 12'b0;//17
		10'b1010110010: color_data = 12'b0;//18
		10'b1010110011: color_data = 12'b0;//19

		10'b1011000000: color_data = 12'b0;//0
		10'b1011000001: color_data = 12'b0;//1
		10'b1011000010: color_data = 12'b0;//2
		10'b1011000011: color_data = 12'b0;//3
		10'b1011000100: color_data = 12'b0;//4
		10'b1011000101: color_data = 12'b0;//5
		10'b1011000110: color_data = 12'b0;//6
		10'b1011000111: color_data = 12'b0;//7
		10'b1011001000: color_data = 12'b0;//8
		10'b1011001001: color_data = 12'b0;//9
		10'b1011001010: color_data = 12'b0;//10
		10'b1011001011: color_data = 12'b0;//11
		10'b1011001100: color_data = 12'b0;//12
		10'b1011001101: color_data = 12'b0;//13
		10'b1011001110: color_data = 12'b0;//14
		10'b1011001111: color_data = 12'b0;//15
		10'b1011010000: color_data = 12'b0;//16
		10'b1011010001: color_data = 12'b0;//17
		10'b1011010010: color_data = 12'b0;//18
		10'b1011010011: color_data = 12'b0;//19

		10'b1011100001: color_data = 12'b0;//1
		10'b1011100010: color_data = 12'b0;//2
		10'b1011100011: color_data = 12'b0;//3
		10'b1011100100: color_data = 12'b0;//4
		10'b1011100101: color_data = 12'b0;//5
		10'b1011100110: color_data = 12'b0;//6
		10'b1011100111: color_data = 12'b0;//7
		10'b1011101000: color_data = 12'b0;//8
		10'b1011101001: color_data = 12'b0;//9
		10'b1011101010: color_data = 12'b0;//10
		10'b1011101011: color_data = 12'b0;//11
		10'b1011101100: color_data = 12'b0;//12
		10'b1011101101: color_data = 12'b0;//13
		10'b1011101110: color_data = 12'b0;//14
		10'b1011101111: color_data = 12'b0;//15
		10'b1011110000: color_data = 12'b0;//16
		10'b1011110001: color_data = 12'b0;//17
		10'b1011110010: color_data = 12'b0;//18
		
		default: color_data = 12'b111111111111;
	endcase
	else // else use this skin
	case ({row_reg, col_reg}) //Question Mark
	   
		10'b0000000001: color_data = 12'b0;//1
		10'b0000000010: color_data = 12'b0;//2
		10'b0000000011: color_data = 12'b0;//3
		10'b0000000100: color_data = 12'b0;//4
		10'b0000000101: color_data = 12'b0;//5
		10'b0000000110: color_data = 12'b0;//6
		10'b0000000111: color_data = 12'b0;//7
		10'b0000001000: color_data = 12'b0;//8
		10'b0000001001: color_data = 12'b0;//9
		10'b0000001010: color_data = 12'b0;//10
		10'b0000001011: color_data = 12'b0;//11
		10'b0000001100: color_data = 12'b0;//12
		10'b0000001101: color_data = 12'b0;//13
		10'b0000001110: color_data = 12'b0;//14
		10'b0000001111: color_data = 12'b0;//15
		10'b0000010000: color_data = 12'b0;//16
		10'b0000010001: color_data = 12'b0;//17
		10'b0000010010: color_data = 12'b0;//18

		10'b0000100000: color_data = 12'b0;//0
		10'b0000100001: color_data = 12'b0;//1
		10'b0000100010: color_data = 12'b0;//2
		10'b0000100011: color_data = 12'b0;//3
		10'b0000100100: color_data = 12'b0;//4
		10'b0000100101: color_data = 12'b0;//5
		10'b0000100110: color_data = 12'b0;//6
		10'b0000100111: color_data = 12'b0;//7
		10'b0000101000: color_data = 12'b0;//8
		10'b0000101001: color_data = 12'b0;//9
		10'b0000101010: color_data = 12'b0;//10
		10'b0000101011: color_data = 12'b0;//11
		10'b0000101100: color_data = 12'b0;//12
		10'b0000101101: color_data = 12'b0;//13
		10'b0000101110: color_data = 12'b0;//14
		10'b0000101111: color_data = 12'b0;//15
		10'b0000110000: color_data = 12'b0;//16
		10'b0000110001: color_data = 12'b0;//17
		10'b0000110010: color_data = 12'b0;//18
		10'b0000110011: color_data = 12'b0;//19

		10'b0001000000: color_data = 12'b0;//0
		10'b0001000001: color_data = 12'b0;//1
		10'b0001000010: color_data = 12'b0;//2
		10'b0001010001: color_data = 12'b0;//17
		10'b0001010010: color_data = 12'b0;//18
		10'b0001010011: color_data = 12'b0;//19

		10'b0001100000: color_data = 12'b0;//0
		10'b0001100001: color_data = 12'b0;//1
		10'b0001100101: color_data = 12'b0;//5
		10'b0001100110: color_data = 12'b0;//6
		10'b0001100111: color_data = 12'b0;//7
		10'b0001101000: color_data = 12'b0;//8
		10'b0001101001: color_data = 12'b0;//9
		10'b0001101010: color_data = 12'b0;//10
		10'b0001101011: color_data = 12'b0;//11
		10'b0001101100: color_data = 12'b0;//12
		10'b0001101101: color_data = 12'b0;//13
		10'b0001101110: color_data = 12'b0;//14
		10'b0001110010: color_data = 12'b0;//18
		10'b0001110011: color_data = 12'b0;//19

		10'b0010000000: color_data = 12'b0;//0
		10'b0010000001: color_data = 12'b0;//1
		10'b0010000100: color_data = 12'b0;//4
		10'b0010000101: color_data = 12'b0;//5
		10'b0010000110: color_data = 12'b0;//6
		10'b0010000111: color_data = 12'b0;//7
		10'b0010001000: color_data = 12'b0;//8
		10'b0010001001: color_data = 12'b0;//9
		10'b0010001010: color_data = 12'b0;//10
		10'b0010001011: color_data = 12'b0;//11
		10'b0010001100: color_data = 12'b0;//12
		10'b0010001101: color_data = 12'b0;//13
		10'b0010001110: color_data = 12'b0;//14
		10'b0010001111: color_data = 12'b0;//15
		10'b0010010010: color_data = 12'b0;//18
		10'b0010010011: color_data = 12'b0;//19

		10'b0010100000: color_data = 12'b0;//0
		10'b0010100001: color_data = 12'b0;//1
		10'b0010100011: color_data = 12'b0;//3
		10'b0010100100: color_data = 12'b0;//4
		10'b0010100101: color_data = 12'b0;//5
		10'b0010100110: color_data = 12'b0;//6
		10'b0010100111: color_data = 12'b0;//7
		10'b0010101000: color_data = 12'b0;//8
		10'b0010101001: color_data = 12'b0;//9
		10'b0010101010: color_data = 12'b0;//10
		10'b0010101011: color_data = 12'b0;//11
		10'b0010101100: color_data = 12'b0;//12
		10'b0010101101: color_data = 12'b0;//13
		10'b0010101110: color_data = 12'b0;//14
		10'b0010101111: color_data = 12'b0;//15
		10'b0010110000: color_data = 12'b0;//16
		10'b0010110010: color_data = 12'b0;//18
		10'b0010110011: color_data = 12'b0;//19
		
		10'b0011000000: color_data = 12'b0;//0
		10'b0011000001: color_data = 12'b0;//1
		10'b0011000011: color_data = 12'b0;//3
		10'b0011000100: color_data = 12'b0;//4
		10'b0011000101: color_data = 12'b0;//5
		10'b0011000110: color_data = 12'b0;//6
		10'b0011000111: color_data = 12'b0;//7
		10'b0011001000: color_data = 12'b0;//8
		10'b0011001001: color_data = 12'b0;//9
		10'b0011001010: color_data = 12'b0;//10
		10'b0011001011: color_data = 12'b0;//11
		10'b0011001100: color_data = 12'b0;//12
		10'b0011001101: color_data = 12'b0;//13
		10'b0011001110: color_data = 12'b0;//14
		10'b0011001111: color_data = 12'b0;//15
		10'b0011010000: color_data = 12'b0;//16
		10'b0011010010: color_data = 12'b0;//18
		10'b0011010011: color_data = 12'b0;//19

		10'b0011100000: color_data = 12'b0;//0
		10'b0011100001: color_data = 12'b0;//1
		10'b0011100011: color_data = 12'b0;//3
		10'b0011100100: color_data = 12'b0;//4
		10'b0011100101: color_data = 12'b0;//5
		10'b0011100110: color_data = 12'b0;//6
		10'b0011100111: color_data = 12'b0;//7
		10'b0011101100: color_data = 12'b0;//12
		10'b0011101101: color_data = 12'b0;//13
		10'b0011101110: color_data = 12'b0;//14
		10'b0011101111: color_data = 12'b0;//15
		10'b0011110000: color_data = 12'b0;//16
		10'b0011110010: color_data = 12'b0;//18
		10'b0011110011: color_data = 12'b0;//19

		10'b0100000000: color_data = 12'b0;//0
		10'b0100000001: color_data = 12'b0;//1
		10'b0100000100: color_data = 12'b0;//4
		10'b0100000101: color_data = 12'b0;//5
		10'b0100000110: color_data = 12'b0;//6
		10'b0100001101: color_data = 12'b0;//13
		10'b0100001110: color_data = 12'b0;//14
		10'b0100001111: color_data = 12'b0;//15
		10'b0100010000: color_data = 12'b0;//16
		10'b0100010010: color_data = 12'b0;//18
		10'b0100010011: color_data = 12'b0;//19

		10'b0100100000: color_data = 12'b0;//0
		10'b0100100001: color_data = 12'b0;//1
		10'b0100101100: color_data = 12'b0;//12
		10'b0100101101: color_data = 12'b0;//13
		10'b0100101110: color_data = 12'b0;//14
		10'b0100101111: color_data = 12'b0;//15
		10'b0100110000: color_data = 12'b0;//16
		10'b0100110010: color_data = 12'b0;//18
		10'b0100110011: color_data = 12'b0;//19

		10'b0101000000: color_data = 12'b0;//0
		10'b0101000001: color_data = 12'b0;//1
		10'b0101001001: color_data = 12'b0;//9
		10'b0101001010: color_data = 12'b0;//10
		10'b0101001011: color_data = 12'b0;//11
		10'b0101001100: color_data = 12'b0;//12
		10'b0101001101: color_data = 12'b0;//13
		10'b0101001110: color_data = 12'b0;//14
		10'b0101001111: color_data = 12'b0;//15
		10'b0101010000: color_data = 12'b0;//16
		10'b0101010010: color_data = 12'b0;//18
		10'b0101010011: color_data = 12'b0;//19

		10'b0101100000: color_data = 12'b0;//0
		10'b0101100001: color_data = 12'b0;//1
		10'b0101101000: color_data = 12'b0;//8
		10'b0101101001: color_data = 12'b0;//9
		10'b0101101010: color_data = 12'b0;//10
		10'b0101101011: color_data = 12'b0;//11
		10'b0101101100: color_data = 12'b0;//12
		10'b0101101101: color_data = 12'b0;//13
		10'b0101101110: color_data = 12'b0;//14
		10'b0101101111: color_data = 12'b0;//15
		10'b0101110010: color_data = 12'b0;//18
		10'b0101110011: color_data = 12'b0;//19

		10'b0110000000: color_data = 12'b0;//0
		10'b0110000001: color_data = 12'b0;//1
		10'b0110001000: color_data = 12'b0;//8
		10'b0110001001: color_data = 12'b0;//9
		10'b0110001010: color_data = 12'b0;//10
		10'b0110001011: color_data = 12'b0;//11
		10'b0110001100: color_data = 12'b0;//12
		10'b0110001101: color_data = 12'b0;//13
		10'b0110010010: color_data = 12'b0;//18
		10'b0110010011: color_data = 12'b0;//19

		10'b0110100000: color_data = 12'b0;//0
		10'b0110100001: color_data = 12'b0;//1
		10'b0110101000: color_data = 12'b0;//8
		10'b0110101001: color_data = 12'b0;//9
		10'b0110101010: color_data = 12'b0;//10
		10'b0110101011: color_data = 12'b0;//11
		10'b0110110010: color_data = 12'b0;//18
		10'b0110110011: color_data = 12'b0;//19

		10'b0111000000: color_data = 12'b0;//0
		10'b0111000001: color_data = 12'b0;//1
		10'b0111001000: color_data = 12'b0;//8
		10'b0111001001: color_data = 12'b0;//9
		10'b0111001010: color_data = 12'b0;//10
		10'b0111010010: color_data = 12'b0;//18
		10'b0111010011: color_data = 12'b0;//19

		10'b0111100000: color_data = 12'b0;//0
		10'b0111100001: color_data = 12'b0;//1
		10'b0111110010: color_data = 12'b0;//18
		10'b0111110011: color_data = 12'b0;//19

		10'b1000000000: color_data = 12'b0;//0
		10'b1000000001: color_data = 12'b0;//1
		10'b1000001000: color_data = 12'b0;//8
		10'b1000001001: color_data = 12'b0;//9
		10'b1000001010: color_data = 12'b0;//10
		10'b1000010010: color_data = 12'b0;//18
		10'b1000010011: color_data = 12'b0;//19

		10'b1000100000: color_data = 12'b0;//0
		10'b1000100001: color_data = 12'b0;//1
		10'b1000100111: color_data = 12'b0;//7
		10'b1000101000: color_data = 12'b0;//8
		10'b1000101001: color_data = 12'b0;//9
		10'b1000101010: color_data = 12'b0;//10
		10'b1000101011: color_data = 12'b0;//11
		10'b1000110010: color_data = 12'b0;//18
		10'b1000110011: color_data = 12'b0;//19

		10'b1001000000: color_data = 12'b0;//0
		10'b1001000001: color_data = 12'b0;//1
		10'b1001000111: color_data = 12'b0;//7
		10'b1001001000: color_data = 12'b0;//8
		10'b1001001001: color_data = 12'b0;//9
		10'b1001001010: color_data = 12'b0;//10
		10'b1001001011: color_data = 12'b0;//11
		10'b1001010010: color_data = 12'b0;//18
		10'b1001010011: color_data = 12'b0;//19

		10'b1001100000: color_data = 12'b0;//0
		10'b1001100001: color_data = 12'b0;//1
		10'b1001101000: color_data = 12'b0;//8
		10'b1001101001: color_data = 12'b0;//9
		10'b1001101010: color_data = 12'b0;//10
		10'b1001110010: color_data = 12'b0;//18
		10'b1001110011: color_data = 12'b0;//19

		10'b1010000000: color_data = 12'b0;//0
		10'b1010000001: color_data = 12'b0;//1
		10'b1010010010: color_data = 12'b0;//18
		10'b1010010011: color_data = 12'b0;//19

		10'b1010100000: color_data = 12'b0;//0
		10'b1010100001: color_data = 12'b0;//1
		10'b1010100010: color_data = 12'b0;//2
		10'b1010110001: color_data = 12'b0;//17
		10'b1010110010: color_data = 12'b0;//18
		10'b1010110011: color_data = 12'b0;//19

		10'b1011000000: color_data = 12'b0;//0
		10'b1011000001: color_data = 12'b0;//1
		10'b1011000010: color_data = 12'b0;//2
		10'b1011000011: color_data = 12'b0;//3
		10'b1011000100: color_data = 12'b0;//4
		10'b1011000101: color_data = 12'b0;//5
		10'b1011000110: color_data = 12'b0;//6
		10'b1011000111: color_data = 12'b0;//7
		10'b1011001000: color_data = 12'b0;//8
		10'b1011001001: color_data = 12'b0;//9
		10'b1011001010: color_data = 12'b0;//10
		10'b1011001011: color_data = 12'b0;//11
		10'b1011001100: color_data = 12'b0;//12
		10'b1011001101: color_data = 12'b0;//13
		10'b1011001110: color_data = 12'b0;//14
		10'b1011001111: color_data = 12'b0;//15
		10'b1011010000: color_data = 12'b0;//16
		10'b1011010001: color_data = 12'b0;//17
		10'b1011010010: color_data = 12'b0;//18
		10'b1011010011: color_data = 12'b0;//19

		10'b1011100001: color_data = 12'b0;//1
		10'b1011100010: color_data = 12'b0;//2
		10'b1011100011: color_data = 12'b0;//3
		10'b1011100100: color_data = 12'b0;//4
		10'b1011100101: color_data = 12'b0;//5
		10'b1011100110: color_data = 12'b0;//6
		10'b1011100111: color_data = 12'b0;//7
		10'b1011101000: color_data = 12'b0;//8
		10'b1011101001: color_data = 12'b0;//9
		10'b1011101010: color_data = 12'b0;//10
		10'b1011101011: color_data = 12'b0;//11
		10'b1011101100: color_data = 12'b0;//12
		10'b1011101101: color_data = 12'b0;//13
		10'b1011101110: color_data = 12'b0;//14
		10'b1011101111: color_data = 12'b0;//15
		10'b1011110000: color_data = 12'b0;//16
		10'b1011110001: color_data = 12'b0;//17
		10'b1011110010: color_data = 12'b0;//18
		
		default: color_data = 12'b111111111111;
	endcase
	else if ( skin_select == 3'b001)
	case ({row_reg, col_reg}) // star
		10'b0000001000: color_data = 12'b0;//8
		10'b0000001001: color_data = 12'b0;//9
		10'b0000001010: color_data = 12'b0;//10
		10'b0000001011: color_data = 12'b0;//11

		10'b0000100111: color_data = 12'b0;//7
		10'b0000101000: color_data = 12'b0;//8
		10'b0000101100: color_data = 12'b0;//12

		10'b0001000111: color_data = 12'b0;//7
		10'b0001001000: color_data = 12'b0;//8
		10'b0001001100: color_data = 12'b0;//12

		10'b0001100110: color_data = 12'b0;//6
		10'b0001100111: color_data = 12'b0;//7
		10'b0001101101: color_data = 12'b0;//13

		10'b0010000110: color_data = 12'b0;//6
		10'b0010000111: color_data = 12'b0;//7
		10'b0010001101: color_data = 12'b0;//13

		10'b0010100101: color_data = 12'b0;//5
		10'b0010100110: color_data = 12'b0;//6
		10'b0010101110: color_data = 12'b0;//14

		10'b0011000000: color_data = 12'b0;//0
		10'b0011000001: color_data = 12'b0;//1
		10'b0011000010: color_data = 12'b0;//2
		10'b0011000011: color_data = 12'b0;//3
		10'b0011000100: color_data = 12'b0;//4
		10'b0011000101: color_data = 12'b0;//5
		10'b0011000110: color_data = 12'b0;//6
		10'b0011001110: color_data = 12'b0;//14
		10'b0011001111: color_data = 12'b0;//15
		10'b0011010000: color_data = 12'b0;//16
		10'b0011010001: color_data = 12'b0;//17
		10'b0011010010: color_data = 12'b0;//18
		10'b0011010011: color_data = 12'b0;//19

		10'b0011100000: color_data = 12'b0;//0
		10'b0011110011: color_data = 12'b0;//19

		10'b0100000000: color_data = 12'b0;//0
		10'b0100010011: color_data = 12'b0;//19

		10'b0100100000: color_data = 12'b0;//0
		10'b0100100001: color_data = 12'b0;//1
		10'b0100100110: color_data = 12'b0;//6
		10'b0100100111: color_data = 12'b0;//7
		10'b0100101100: color_data = 12'b0;//12
		10'b0100101101: color_data = 12'b0;//13
		10'b0100110011: color_data = 12'b0;//19

		10'b0101000001: color_data = 12'b0;//1
		10'b0101000010: color_data = 12'b0;//2
		10'b0101000110: color_data = 12'b0;//6
		10'b0101000111: color_data = 12'b0;//7
		10'b0101001100: color_data = 12'b0;//12
		10'b0101001101: color_data = 12'b0;//13
		10'b0101010010: color_data = 12'b0;//18

		10'b0101100001: color_data = 12'b0;//1
		10'b0101100010: color_data = 12'b0;//2
		10'b0101100110: color_data = 12'b0;//6
		10'b0101100111: color_data = 12'b0;//7
		10'b0101101100: color_data = 12'b0;//12
		10'b0101101101: color_data = 12'b0;//13
		10'b0101110001: color_data = 12'b0;//17
		10'b0101110010: color_data = 12'b0;//18

		10'b0110000010: color_data = 12'b0;//2
		10'b0110000011: color_data = 12'b0;//3
		10'b0110000110: color_data = 12'b0;//6
		10'b0110000111: color_data = 12'b0;//7
		10'b0110001100: color_data = 12'b0;//12
		10'b0110001101: color_data = 12'b0;//13
		10'b0110010000: color_data = 12'b0;//16
	
		10'b0110100010: color_data = 12'b0;//2
		10'b0110100011: color_data = 12'b0;//3
		10'b0110101111: color_data = 12'b0;//15
		10'b0110110000: color_data = 12'b0;//16

		10'b0111000011: color_data = 12'b0;//3
		10'b0111000100: color_data = 12'b0;//4
		10'b0111001111: color_data = 12'b0;//15	

		10'b0111100011: color_data = 12'b0;//3
		10'b0111100100: color_data = 12'b0;//4
		10'b0111101111: color_data = 12'b0;//15	

		10'b1000000011: color_data = 12'b0;//3
		10'b1000000100: color_data = 12'b0;//4
		10'b1000001111: color_data = 12'b0;//15	

		10'b1000100011: color_data = 12'b0;//3
		10'b1000110000: color_data = 12'b0;//16	

		10'b1001000010: color_data = 12'b0;//2
		10'b1001000011: color_data = 12'b0;//3
		10'b1001001000: color_data = 12'b0;//8
		10'b1001001001: color_data = 12'b0;//9
		10'b1001001010: color_data = 12'b0;//10
		10'b1001001011: color_data = 12'b0;//11
		10'b1001010000: color_data = 12'b0;//16		
		10'b1001010001: color_data = 12'b0;//17	

		10'b1001100001: color_data = 12'b0;//1
		10'b1001100010: color_data = 12'b0;//2
		10'b1001100111: color_data = 12'b0;//7
		10'b1001101000: color_data = 12'b0;//8
		10'b1001101001: color_data = 12'b0;//9
		10'b1001101010: color_data = 12'b0;//10
		10'b1001101011: color_data = 12'b0;//11
		10'b1001101100: color_data = 12'b0;//12
		10'b1001110001: color_data = 12'b0;//17	
		10'b1001110010: color_data = 12'b0;//18

		10'b1010000001: color_data = 12'b0;//1
		10'b1010000110: color_data = 12'b0;//6
		10'b1010000111: color_data = 12'b0;//7
		10'b1010001100: color_data = 12'b0;//12
		10'b1010001101: color_data = 12'b0;//13
		10'b1010010010: color_data = 12'b0;//18

		10'b1010100000: color_data = 12'b0;//0
		10'b1010100001: color_data = 12'b0;//1
		10'b1010100101: color_data = 12'b0;//5
		10'b1010100110: color_data = 12'b0;//6
		10'b1010101101: color_data = 12'b0;//13
		10'b1010101110: color_data = 12'b0;//14
		10'b1010110010: color_data = 12'b0;//18
		10'b1010110011: color_data = 12'b0;//19

		10'b1011000000: color_data = 12'b0;//0
		10'b1011000100: color_data = 12'b0;//4
		10'b1011000101: color_data = 12'b0;//5
		10'b1011001110: color_data = 12'b0;//14
		10'b1011001111: color_data = 12'b0;//15
		10'b1011010011: color_data = 12'b0;//19

		10'b1011100000: color_data = 12'b0;//0
		10'b1011100001: color_data = 12'b0;//1
		10'b1011100010: color_data = 12'b0;//2
		10'b1011100011: color_data = 12'b0;//3
		10'b1011100100: color_data = 12'b0;//4	
		10'b1011101111: color_data = 12'b0;//15
		10'b1011110000: color_data = 12'b0;//16
		10'b1011110001: color_data = 12'b0;//17
		10'b1011110010: color_data = 12'b0;//18
		10'b1011110011: color_data = 12'b0;//19		
		
		
		default: color_data = 12'b111111111111;
	endcase
	else if(skin_select == 3'b010)
	case ({row_reg, col_reg}) //UFO

		10'b0000001000: color_data = 12'b0;//8
		10'b0000001001: color_data = 12'b0;//9
		10'b0000001010: color_data = 12'b0;//10
		10'b0000001011: color_data = 12'b0;//11

		10'b0000100110: color_data = 12'b0;//6
		10'b0000100111: color_data = 12'b0;//7
		10'b0000101100: color_data = 12'b0;//12
		10'b0000101101: color_data = 12'b0;//13
		
		10'b0001000101: color_data = 12'b0;//5
		10'b0001001110: color_data = 12'b0;//14

		10'b0001100100: color_data = 12'b0;//4
		10'b0001101011: color_data = 12'b0;//11
		10'b0001101100: color_data = 12'b0;//12
		10'b0001101111: color_data = 12'b0;//15

		10'b0010000011: color_data = 12'b0;//3
		10'b0010001011: color_data = 12'b0;//11
		10'b0010001100: color_data = 12'b0;//12	
		10'b0010001101: color_data = 12'b0;//13	
		10'b0010010000: color_data = 12'b0;//16	

		10'b0010100010: color_data = 12'b0;//2	
		10'b0010101100: color_data = 12'b0;//12	
		10'b0010101101: color_data = 12'b0;//13	
		10'b0010101110: color_data = 12'b0;//14
		10'b0010110001: color_data = 12'b0;//17

		10'b0011000010: color_data = 12'b0;//2	
		10'b0011001101: color_data = 12'b0;//13	
		10'b0011001110: color_data = 12'b0;//14
		10'b0011001111: color_data = 12'b0;//15
		10'b0011010001: color_data = 12'b0;//17

		10'b0011100001: color_data = 12'b0;//1
		10'b0011101110: color_data = 12'b0;//14
		10'b0011101111: color_data = 12'b0;//15
		10'b0011110010: color_data = 12'b0;//18

		10'b0100000001: color_data = 12'b0;//1
		10'b0100010010: color_data = 12'b0;//18

		10'b0100100001: color_data = 12'b0;//1
		10'b0100100010: color_data = 12'b0;//2
		10'b0100100011: color_data = 12'b0;//3
		10'b0100100100: color_data = 12'b0;//4
		10'b0100100101: color_data = 12'b0;//5
		10'b0100100110: color_data = 12'b0;//6
		10'b0100100111: color_data = 12'b0;//7
		10'b0100101000: color_data = 12'b0;//8
		10'b0100101001: color_data = 12'b0;//9
		10'b0100101010: color_data = 12'b0;//10
		10'b0100101011: color_data = 12'b0;//11
		10'b0100101100: color_data = 12'b0;//12
		10'b0100101101: color_data = 12'b0;//13
		10'b0100101110: color_data = 12'b0;//14
		10'b0100101111: color_data = 12'b0;//15
		10'b0100110000: color_data = 12'b0;//16
		10'b0100110001: color_data = 12'b0;//17
		10'b0100110010: color_data = 12'b0;//18
		
		10'b0101000000: color_data = 12'b0;//0
		10'b0101000001: color_data = 12'b0;//1
		10'b0101000010: color_data = 12'b0;//2
		10'b0101000011: color_data = 12'b0;//3
		10'b0101000100: color_data = 12'b0;//4
		10'b0101000101: color_data = 12'b0;//5
		10'b0101000110: color_data = 12'b0;//6
		10'b0101000111: color_data = 12'b0;//7
		10'b0101001000: color_data = 12'b0;//8
		10'b0101001001: color_data = 12'b0;//9
		10'b0101001010: color_data = 12'b0;//10
		10'b0101001011: color_data = 12'b0;//11
		10'b0101001100: color_data = 12'b0;//12
		10'b0101001101: color_data = 12'b0;//13
		10'b0101001110: color_data = 12'b0;//14
		10'b0101001111: color_data = 12'b0;//15
		10'b0101010000: color_data = 12'b0;//16
		10'b0101010001: color_data = 12'b0;//17
		10'b0101010010: color_data = 12'b0;//18
		10'b0101010011: color_data = 12'b0;//19

		10'b0101100000: color_data = 12'b0;//0
		10'b0101100010: color_data = 12'b0;//2
		10'b0101100100: color_data = 12'b0;//4
		10'b0101100101: color_data = 12'b0;//5
		10'b0101100110: color_data = 12'b0;//6
		10'b0101101000: color_data = 12'b0;//8
		10'b0101101001: color_data = 12'b0;//9
		10'b0101101010: color_data = 12'b0;//10
		10'b0101101011: color_data = 12'b0;//11
		10'b0101101101: color_data = 12'b0;//13
		10'b0101101110: color_data = 12'b0;//14
		10'b0101101111: color_data = 12'b0;//15
		10'b0101110001: color_data = 12'b0;//17
		10'b0101110011: color_data = 12'b0;//19

		10'b0110000000: color_data = 12'b0;//0
		10'b0110000001: color_data = 12'b0;//1
		10'b0110000010: color_data = 12'b0;//2
		10'b0110000011: color_data = 12'b0;//3
		10'b0110000100: color_data = 12'b0;//4
		10'b0110000101: color_data = 12'b0;//5
		10'b0110000110: color_data = 12'b0;//6
		10'b0110000111: color_data = 12'b0;//7
		10'b0110001000: color_data = 12'b0;//8
		10'b0110001001: color_data = 12'b0;//9
		10'b0110001010: color_data = 12'b0;//10
		10'b0110001011: color_data = 12'b0;//11
		10'b0110001100: color_data = 12'b0;//12
		10'b0110001101: color_data = 12'b0;//13
		10'b0110001110: color_data = 12'b0;//14
		10'b0110001111: color_data = 12'b0;//15
		10'b0110010000: color_data = 12'b0;//16
		10'b0110010001: color_data = 12'b0;//17
		10'b0110010010: color_data = 12'b0;//18
		10'b0110010011: color_data = 12'b0;//19

		10'b0110100000: color_data = 12'b0;//0
		10'b0110100001: color_data = 12'b0;//1
		10'b0110100010: color_data = 12'b0;//2
		10'b0110100011: color_data = 12'b0;//3
		10'b0110100100: color_data = 12'b0;//4
		10'b0110100101: color_data = 12'b0;//5
		10'b0110100110: color_data = 12'b0;//6
		10'b0110100111: color_data = 12'b0;//7
		10'b0110101000: color_data = 12'b0;//8
		10'b0110101001: color_data = 12'b0;//9
		10'b0110101010: color_data = 12'b0;//10
		10'b0110101011: color_data = 12'b0;//11
		10'b0110101100: color_data = 12'b0;//12
		10'b0110101101: color_data = 12'b0;//13
		10'b0110101110: color_data = 12'b0;//14
		10'b0110101111: color_data = 12'b0;//15
		10'b0110110000: color_data = 12'b0;//16
		10'b0110110001: color_data = 12'b0;//17
		10'b0110110010: color_data = 12'b0;//18
		10'b0110110011: color_data = 12'b0;//19

		10'b0111000001: color_data = 12'b0;//1
		10'b0111000010: color_data = 12'b0;//2
		10'b0111000011: color_data = 12'b0;//3
		10'b0111000100: color_data = 12'b0;//4
		10'b0111000101: color_data = 12'b0;//5
		10'b0111000110: color_data = 12'b0;//6
		10'b0111000111: color_data = 12'b0;//7
		10'b0111001000: color_data = 12'b0;//8
		10'b0111001001: color_data = 12'b0;//9
		10'b0111001010: color_data = 12'b0;//10
		10'b0111001011: color_data = 12'b0;//11
		10'b0111001100: color_data = 12'b0;//12
		10'b0111001101: color_data = 12'b0;//13
		10'b0111001110: color_data = 12'b0;//14
		10'b0111001111: color_data = 12'b0;//15
		10'b0111010000: color_data = 12'b0;//16
		10'b0111010001: color_data = 12'b0;//17
		10'b0111010010: color_data = 12'b0;//18

		10'b0111100010: color_data = 12'b0;//2
		10'b0111100011: color_data = 12'b0;//3
		10'b0111100100: color_data = 12'b0;//4
		10'b0111100101: color_data = 12'b0;//5
		10'b0111100110: color_data = 12'b0;//6
		10'b0111100111: color_data = 12'b0;//7
		10'b0111101000: color_data = 12'b0;//8
		10'b0111101001: color_data = 12'b0;//9
		10'b0111101010: color_data = 12'b0;//10
		10'b0111101011: color_data = 12'b0;//11
		10'b0111101100: color_data = 12'b0;//12
		10'b0111101101: color_data = 12'b0;//13
		10'b0111101110: color_data = 12'b0;//14
		10'b0111101111: color_data = 12'b0;//15
		10'b0111110000: color_data = 12'b0;//16
		10'b0111110001: color_data = 12'b0;//17

		10'b1000000100: color_data = 12'b0;//4
		10'b1000000101: color_data = 12'b0;//5
		10'b1000000110: color_data = 12'b0;//6
		10'b1000000111: color_data = 12'b0;//7
		10'b1000001000: color_data = 12'b0;//8
		10'b1000001001: color_data = 12'b0;//9
		10'b1000001010: color_data = 12'b0;//10
		10'b1000001011: color_data = 12'b0;//11
		10'b1000001100: color_data = 12'b0;//12
		10'b1000001101: color_data = 12'b0;//13
		10'b1000001110: color_data = 12'b0;//14
		10'b1000001111: color_data = 12'b0;//15

		10'b1000100100: color_data = 12'b0;//4
		10'b1000100101: color_data = 12'b0;//5
		10'b1000100110: color_data = 12'b0;//6
		10'b1000100111: color_data = 12'b0;//7
		10'b1000101000: color_data = 12'b0;//8
		10'b1000101001: color_data = 12'b0;//9
		10'b1000101010: color_data = 12'b0;//10
		10'b1000101011: color_data = 12'b0;//11
		10'b1000101100: color_data = 12'b0;//12
		10'b1000101101: color_data = 12'b0;//13
		10'b1000101110: color_data = 12'b0;//14
		10'b1000101111: color_data = 12'b0;//15

		//one line space

		10'b1001100100: color_data = 12'b0;//4
		10'b1001100101: color_data = 12'b0;//5
		10'b1001100110: color_data = 12'b0;//6
		10'b1001100111: color_data = 12'b0;//7
		10'b1001101000: color_data = 12'b0;//8
		10'b1001101001: color_data = 12'b0;//9
		10'b1001101010: color_data = 12'b0;//10
		10'b1001101011: color_data = 12'b0;//11
		10'b1001101100: color_data = 12'b0;//12
		10'b1001101101: color_data = 12'b0;//13
		10'b1001101110: color_data = 12'b0;//14
		10'b1001101111: color_data = 12'b0;//15

		//one line space

		10'b1010100110: color_data = 12'b0;//6
		10'b1010100111: color_data = 12'b0;//7
		10'b1010101000: color_data = 12'b0;//8
		10'b1010101001: color_data = 12'b0;//9
		10'b1010101010: color_data = 12'b0;//10
		10'b1010101011: color_data = 12'b0;//11
		10'b1010101100: color_data = 12'b0;//12
		10'b1010101101: color_data = 12'b0;//13

		//one line space
		
		10'b1011101000: color_data = 12'b0;//8
		10'b1011101001: color_data = 12'b0;//9
		10'b1011101010: color_data = 12'b0;//10
		10'b1011101011: color_data = 12'b0;//11

		
		default: color_data = 12'b111111111111;
	endcase
	else if(skin_select == 3'b011)
	case ({row_reg, col_reg}) //Sheep
	
		10'b0000000101: color_data = 12'b0;//5
		10'b0000000110: color_data = 12'b0;//6
		10'b0000000111: color_data = 12'b0;//7
		10'b0000001000: color_data = 12'b0;//8
		10'b0000001001: color_data = 12'b0;//9
		10'b0000001010: color_data = 12'b0;//10
		10'b0000001011: color_data = 12'b0;//11
		10'b0000001100: color_data = 12'b0;//12
		10'b0000001101: color_data = 12'b0;//13
		10'b0000001110: color_data = 12'b0;//14

		10'b0000100100: color_data = 12'b0;//4
		10'b0000100101: color_data = 12'b0;//5
		10'b0000101110: color_data = 12'b0;//14
		10'b0000101111: color_data = 12'b0;//15
		
		10'b0001000011: color_data = 12'b0;//3
		10'b0001001111: color_data = 12'b0;//15
		10'b0001010000: color_data = 12'b0;//16

		10'b0001100010: color_data = 12'b0;//2
		10'b0001101111: color_data = 12'b0;//15
		10'b0001110000: color_data = 12'b0;//16
		10'b0001110001: color_data = 12'b0;//17

		10'b0010000001: color_data = 12'b0;//1
		10'b0010000110: color_data = 12'b0;//6
		10'b0010000111: color_data = 12'b0;//7
		10'b0010001000: color_data = 12'b0;//8
		10'b0010001001: color_data = 12'b0;//9
		10'b0010001010: color_data = 12'b0;//10
		10'b0010001011: color_data = 12'b0;//11
		10'b0010001100: color_data = 12'b0;//12
		10'b0010001101: color_data = 12'b0;//13
		10'b0010010000: color_data = 12'b0;//16
		10'b0010010001: color_data = 12'b0;//17
		10'b0010010010: color_data = 12'b0;//18

		10'b0010100000: color_data = 12'b0;//0
		10'b0010100110: color_data = 12'b0;//6
		10'b0010100111: color_data = 12'b0;//7
		10'b0010101000: color_data = 12'b0;//8
		10'b0010101001: color_data = 12'b0;//9
		10'b0010101010: color_data = 12'b0;//10
		10'b0010101011: color_data = 12'b0;//11
		10'b0010101100: color_data = 12'b0;//12
		10'b0010101101: color_data = 12'b0;//13
		10'b0010110001: color_data = 12'b0;//17
		10'b0010110010: color_data = 12'b0;//18
		10'b0010110011: color_data = 12'b0;//19

		10'b0011000000: color_data = 12'b0;//0
		10'b0011000100: color_data = 12'b0;//4
		10'b0011000101: color_data = 12'b0;//5
		10'b0011000110: color_data = 12'b0;//6
		10'b0011000111: color_data = 12'b0;//7
		10'b0011001001: color_data = 12'b0;//9
		10'b0011001010: color_data = 12'b0;//10
		10'b0011001100: color_data = 12'b0;//12
		10'b0011001101: color_data = 12'b0;//13
		10'b0011001110: color_data = 12'b0;//14
		10'b0011001111: color_data = 12'b0;//15
		10'b0011010001: color_data = 12'b0;//17
		10'b0011010010: color_data = 12'b0;//18
		10'b0011010011: color_data = 12'b0;//19

		10'b0011100000: color_data = 12'b0;//0
		10'b0011100100: color_data = 12'b0;//4
		10'b0011100101: color_data = 12'b0;//5
		10'b0011100110: color_data = 12'b0;//6
		10'b0011100111: color_data = 12'b0;//7
		10'b0011101001: color_data = 12'b0;//9
		10'b0011101010: color_data = 12'b0;//10
		10'b0011101100: color_data = 12'b0;//12
		10'b0011101101: color_data = 12'b0;//13
		10'b0011101110: color_data = 12'b0;//14
		10'b0011101111: color_data = 12'b0;//15
		10'b0011110001: color_data = 12'b0;//17
		10'b0011110010: color_data = 12'b0;//18
		10'b0011110011: color_data = 12'b0;//19

		10'b0100000000: color_data = 12'b0;//0
		10'b0100000110: color_data = 12'b0;//6
		10'b0100000111: color_data = 12'b0;//7
		10'b0100001000: color_data = 12'b0;//8
		10'b0100001001: color_data = 12'b0;//9
		10'b0100001010: color_data = 12'b0;//10
		10'b0100001011: color_data = 12'b0;//11
		10'b0100001100: color_data = 12'b0;//12
		10'b0100001101: color_data = 12'b0;//13
		10'b0100010001: color_data = 12'b0;//17
		10'b0100010010: color_data = 12'b0;//18
		10'b0100010011: color_data = 12'b0;//19

		10'b0100100000: color_data = 12'b0;//0
		10'b0100100110: color_data = 12'b0;//6
		10'b0100100111: color_data = 12'b0;//7
		10'b0100101000: color_data = 12'b0;//8
		10'b0100101001: color_data = 12'b0;//9
		10'b0100101010: color_data = 12'b0;//10
		10'b0100101011: color_data = 12'b0;//11
		10'b0100101100: color_data = 12'b0;//12
		10'b0100101101: color_data = 12'b0;//13
		10'b0100110001: color_data = 12'b0;//17
		10'b0100110010: color_data = 12'b0;//18
		10'b0100110011: color_data = 12'b0;//19
	
		10'b0101000000: color_data = 12'b0;//0
		10'b0101000110: color_data = 12'b0;//6
		10'b0101000111: color_data = 12'b0;//7
		10'b0101001000: color_data = 12'b0;//8
		10'b0101001001: color_data = 12'b0;//9
		10'b0101001010: color_data = 12'b0;//10
		10'b0101001011: color_data = 12'b0;//11
		10'b0101001100: color_data = 12'b0;//12
		10'b0101001101: color_data = 12'b0;//13
		10'b0101010001: color_data = 12'b0;//17
		10'b0101010010: color_data = 12'b0;//18
		10'b0101010011: color_data = 12'b0;//19

		10'b0101100000: color_data = 12'b0;//0
		10'b0101100110: color_data = 12'b0;//6
		10'b0101100111: color_data = 12'b0;//7
		10'b0101101000: color_data = 12'b0;//8
		10'b0101101001: color_data = 12'b0;//9
		10'b0101101010: color_data = 12'b0;//10
		10'b0101101011: color_data = 12'b0;//11
		10'b0101101100: color_data = 12'b0;//12
		10'b0101101101: color_data = 12'b0;//13
		10'b0101110001: color_data = 12'b0;//17
		10'b0101110010: color_data = 12'b0;//18
		10'b0101110011: color_data = 12'b0;//19

		10'b0110000000: color_data = 12'b0;//0
		10'b0110001000: color_data = 12'b0;//8
		10'b0110001001: color_data = 12'b0;//9
		10'b0110001010: color_data = 12'b0;//10
		10'b0110001011: color_data = 12'b0;//11
		10'b0110010001: color_data = 12'b0;//17
		10'b0110010010: color_data = 12'b0;//18
		10'b0110010011: color_data = 12'b0;//19

		10'b0110100000: color_data = 12'b0;//0
		10'b0110101000: color_data = 12'b0;//8
		10'b0110101001: color_data = 12'b0;//9
		10'b0110101010: color_data = 12'b0;//10
		10'b0110101011: color_data = 12'b0;//11
		10'b0110110000: color_data = 12'b0;//16
		10'b0110110001: color_data = 12'b0;//17
		10'b0110110010: color_data = 12'b0;//18
		10'b0110110011: color_data = 12'b0;//19

		10'b0111000000: color_data = 12'b0;//0
		10'b0111010000: color_data = 12'b0;//16
		10'b0111010001: color_data = 12'b0;//17
		10'b0111010010: color_data = 12'b0;//18
		10'b0111010011: color_data = 12'b0;//19

		10'b0111100000: color_data = 12'b0;//0
		10'b0111100001: color_data = 12'b0;//1
		10'b0111101111: color_data = 12'b0;//15
		10'b0111110000: color_data = 12'b0;//16
		10'b0111110001: color_data = 12'b0;//17
		10'b0111110010: color_data = 12'b0;//18
		10'b0111110011: color_data = 12'b0;//19

		10'b1000000001: color_data = 12'b0;//1
		10'b1000001110: color_data = 12'b0;//14
		10'b1000001111: color_data = 12'b0;//15
		10'b1000010000: color_data = 12'b0;//16
		10'b1000010001: color_data = 12'b0;//17
		10'b1000010010: color_data = 12'b0;//18

		10'b1000100001: color_data = 12'b0;//1
		10'b1000101110: color_data = 12'b0;//14
		10'b1000101111: color_data = 12'b0;//15
		10'b1000110000: color_data = 12'b0;//16
		10'b1000110001: color_data = 12'b0;//17
		10'b1000110010: color_data = 12'b0;//18

		10'b1001000010: color_data = 12'b0;//2
		10'b1001000011: color_data = 12'b0;//3
		10'b1001000100: color_data = 12'b0;//4
		10'b1001001001: color_data = 12'b0;//9
		10'b1001001010: color_data = 12'b0;//10
		10'b1001001101: color_data = 12'b0;//13
		10'b1001001110: color_data = 12'b0;//14
		10'b1001001111: color_data = 12'b0;//15
		10'b1001010000: color_data = 12'b0;//16
		10'b1001010001: color_data = 12'b0;//17

		10'b1001100100: color_data = 12'b0;//4
		10'b1001100101: color_data = 12'b0;//5
		10'b1001100110: color_data = 12'b0;//6
		10'b1001101001: color_data = 12'b0;//9
		10'b1001101010: color_data = 12'b0;//10
		10'b1001101100: color_data = 12'b0;//12
		10'b1001101101: color_data = 12'b0;//13
		10'b1001101110: color_data = 12'b0;//14

		10'b1010000110: color_data = 12'b0;//6
		10'b1010001001: color_data = 12'b0;//9
		10'b1010001010: color_data = 12'b0;//10
		10'b1010001100: color_data = 12'b0;//12
		10'b1010001101: color_data = 12'b0;//13

		10'b1010100110: color_data = 12'b0;//6
		10'b1010101001: color_data = 12'b0;//9
		10'b1010101010: color_data = 12'b0;//10
		10'b1010101100: color_data = 12'b0;//12
		10'b1010101101: color_data = 12'b0;//13

		10'b1011000110: color_data = 12'b0;//6
		10'b1011001001: color_data = 12'b0;//9
		10'b1011001010: color_data = 12'b0;//10
		10'b1011001100: color_data = 12'b0;//12
		10'b1011001101: color_data = 12'b0;//13

		10'b1011100110: color_data = 12'b0;//6
		10'b1011100111: color_data = 12'b0;//7
		10'b1011101000: color_data = 12'b0;//8
		10'b1011101001: color_data = 12'b0;//9
		10'b1011101010: color_data = 12'b0;//10
		10'b1011101011: color_data = 12'b0;//11
		10'b1011101100: color_data = 12'b0;//12
		10'b1011101101: color_data = 12'b0;//13
		
		default: color_data = 12'b111111111111;
	endcase
	else if(skin_select == 3'b100)
	case ({row_reg, col_reg}) //Heart
	
		10'b0000000011: color_data = 12'b0;//3
		10'b0000000100: color_data = 12'b0;//4
		10'b0000001111: color_data = 12'b0;//15
		10'b0000010000: color_data = 12'b0;//16

		10'b0000100010: color_data = 12'b0;//2
		10'b0000100011: color_data = 12'b0;//3
		10'b0000100100: color_data = 12'b0;//4
		10'b0000100101: color_data = 12'b0;//5
		10'b0000100110: color_data = 12'b0;//6
		10'b0000101101: color_data = 12'b0;//13
		10'b0000101110: color_data = 12'b0;//14
		10'b0000101111: color_data = 12'b0;//15
		10'b0000110000: color_data = 12'b0;//16
		10'b0000110001: color_data = 12'b0;//17
		
		10'b0001000001: color_data = 12'b0;//1
		10'b0001000010: color_data = 12'b0;//2
		10'b0001000011: color_data = 12'b0;//3
		10'b0001000100: color_data = 12'b0;//4
		10'b0001000101: color_data = 12'b0;//5
		10'b0001000110: color_data = 12'b0;//6
		10'b0001001101: color_data = 12'b0;//13
		10'b0001001110: color_data = 12'b0;//14
		10'b0001001111: color_data = 12'b0;//15
		10'b0001010000: color_data = 12'b0;//16
		10'b0001010001: color_data = 12'b0;//17
		10'b0001010010: color_data = 12'b0;//18

		10'b0001100000: color_data = 12'b0;//0	
		10'b0001100001: color_data = 12'b0;//1
		10'b0001100010: color_data = 12'b0;//2
		10'b0001100011: color_data = 12'b0;//3
		10'b0001100100: color_data = 12'b0;//4
		10'b0001100101: color_data = 12'b0;//5
		10'b0001100110: color_data = 12'b0;//6
		10'b0001100111: color_data = 12'b0;//7
		10'b0001101000: color_data = 12'b0;//8
		10'b0001101011: color_data = 12'b0;//11
		10'b0001101100: color_data = 12'b0;//12
		10'b0001101101: color_data = 12'b0;//13
		10'b0001101110: color_data = 12'b0;//14
		10'b0001101111: color_data = 12'b0;//15
		10'b0001110000: color_data = 12'b0;//16
		10'b0001110001: color_data = 12'b0;//17
		10'b0001110010: color_data = 12'b0;//18
		10'b0001110011: color_data = 12'b0;//19

		10'b0010000000: color_data = 12'b0;//0	
		10'b0010000001: color_data = 12'b0;//1
		10'b0010000010: color_data = 12'b0;//2
		10'b0010000011: color_data = 12'b0;//3
		10'b0010000100: color_data = 12'b0;//4
		10'b0010000101: color_data = 12'b0;//5
		10'b0010000110: color_data = 12'b0;//6
		10'b0010000111: color_data = 12'b0;//7
		10'b0010001000: color_data = 12'b0;//8
		10'b0010001011: color_data = 12'b0;//11
		10'b0010001100: color_data = 12'b0;//12
		10'b0010001101: color_data = 12'b0;//13
		10'b0010001110: color_data = 12'b0;//14
		10'b0010001111: color_data = 12'b0;//15
		10'b0010010000: color_data = 12'b0;//16
		10'b0010010001: color_data = 12'b0;//17
		10'b0010010010: color_data = 12'b0;//18
		10'b0010010011: color_data = 12'b0;//19

		10'b0010100000: color_data = 12'b0;//0	
		10'b0010100001: color_data = 12'b0;//1
		10'b0010100010: color_data = 12'b0;//2
		10'b0010100011: color_data = 12'b0;//3
		10'b0010100100: color_data = 12'b0;//4
		10'b0010100101: color_data = 12'b0;//5
		10'b0010100110: color_data = 12'b0;//6
		10'b0010100111: color_data = 12'b0;//7
		10'b0010101000: color_data = 12'b0;//8
		10'b0010101001: color_data = 12'b0;//9
		10'b0010101010: color_data = 12'b0;//10
		10'b0010101011: color_data = 12'b0;//11
		10'b0010101100: color_data = 12'b0;//12
		10'b0010101101: color_data = 12'b0;//13
		10'b0010101110: color_data = 12'b0;//14
		10'b0010101111: color_data = 12'b0;//15
		10'b0010110000: color_data = 12'b0;//16
		10'b0010110001: color_data = 12'b0;//17
		10'b0010110010: color_data = 12'b0;//18
		10'b0010110011: color_data = 12'b0;//19

		10'b0011000000: color_data = 12'b0;//0	
		10'b0011000001: color_data = 12'b0;//1
		10'b0011000010: color_data = 12'b0;//2
		10'b0011000011: color_data = 12'b0;//3
		10'b0011000100: color_data = 12'b0;//4
		10'b0011000101: color_data = 12'b0;//5
		10'b0011000110: color_data = 12'b0;//6
		10'b0011000111: color_data = 12'b0;//7
		10'b0011001000: color_data = 12'b0;//8
		10'b0011001001: color_data = 12'b0;//9
		10'b0011001010: color_data = 12'b0;//10
		10'b0011001011: color_data = 12'b0;//11
		10'b0011001100: color_data = 12'b0;//12
		10'b0011001101: color_data = 12'b0;//13
		10'b0011001110: color_data = 12'b0;//14
		10'b0011001111: color_data = 12'b0;//15
		10'b0011010000: color_data = 12'b0;//16
		10'b0011010001: color_data = 12'b0;//17
		10'b0011010010: color_data = 12'b0;//18
		10'b0011010011: color_data = 12'b0;//19

		10'b0011100000: color_data = 12'b0;//0	
		10'b0011100001: color_data = 12'b0;//1
		10'b0011100010: color_data = 12'b0;//2
		10'b0011100011: color_data = 12'b0;//3
		10'b0011100100: color_data = 12'b0;//4
		10'b0011100101: color_data = 12'b0;//5
		10'b0011100110: color_data = 12'b0;//6
		10'b0011100111: color_data = 12'b0;//7
		10'b0011101000: color_data = 12'b0;//8
		10'b0011101001: color_data = 12'b0;//9
		10'b0011101010: color_data = 12'b0;//10
		10'b0011101011: color_data = 12'b0;//11
		10'b0011101100: color_data = 12'b0;//12
		10'b0011101101: color_data = 12'b0;//13
		10'b0011101110: color_data = 12'b0;//14
		10'b0011101111: color_data = 12'b0;//15
		10'b0011110000: color_data = 12'b0;//16
		10'b0011110001: color_data = 12'b0;//17
		10'b0011110010: color_data = 12'b0;//18
		10'b0011110011: color_data = 12'b0;//19

		10'b0100000000: color_data = 12'b0;//0	
		10'b0100000001: color_data = 12'b0;//1
		10'b0100000010: color_data = 12'b0;//2
		10'b0100000011: color_data = 12'b0;//3
		10'b0100000100: color_data = 12'b0;//4
		10'b0100000101: color_data = 12'b0;//5
		10'b0100000110: color_data = 12'b0;//6
		10'b0100000111: color_data = 12'b0;//7
		10'b0100001000: color_data = 12'b0;//8
		10'b0100001001: color_data = 12'b0;//9
		10'b0100001010: color_data = 12'b0;//10
		10'b0100001011: color_data = 12'b0;//11
		10'b0100001100: color_data = 12'b0;//12
		10'b0100001101: color_data = 12'b0;//13
		10'b0100001110: color_data = 12'b0;//14
		10'b0100001111: color_data = 12'b0;//15
		10'b0100010000: color_data = 12'b0;//16
		10'b0100010001: color_data = 12'b0;//17
		10'b0100010010: color_data = 12'b0;//18
		10'b0100010011: color_data = 12'b0;//19

		10'b0100100000: color_data = 12'b0;//0	
		10'b0100100001: color_data = 12'b0;//1
		10'b0100100010: color_data = 12'b0;//2
		10'b0100100011: color_data = 12'b0;//3
		10'b0100100100: color_data = 12'b0;//4
		10'b0100100101: color_data = 12'b0;//5
		10'b0100100110: color_data = 12'b0;//6
		10'b0100100111: color_data = 12'b0;//7
		10'b0100101000: color_data = 12'b0;//8
		10'b0100101001: color_data = 12'b0;//9
		10'b0100101010: color_data = 12'b0;//10
		10'b0100101011: color_data = 12'b0;//11
		10'b0100101100: color_data = 12'b0;//12
		10'b0100101101: color_data = 12'b0;//13
		10'b0100101110: color_data = 12'b0;//14
		10'b0100101111: color_data = 12'b0;//15
		10'b0100110000: color_data = 12'b0;//16
		10'b0100110001: color_data = 12'b0;//17
		10'b0100110010: color_data = 12'b0;//18
		10'b0100110011: color_data = 12'b0;//19

		10'b0101000000: color_data = 12'b0;//0	
		10'b0101000001: color_data = 12'b0;//1
		10'b0101000010: color_data = 12'b0;//2
		10'b0101000011: color_data = 12'b0;//3
		10'b0101000100: color_data = 12'b0;//4
		10'b0101000101: color_data = 12'b0;//5
		10'b0101000110: color_data = 12'b0;//6
		10'b0101000111: color_data = 12'b0;//7
		10'b0101001000: color_data = 12'b0;//8
		10'b0101001001: color_data = 12'b0;//9
		10'b0101001010: color_data = 12'b0;//10
		10'b0101001011: color_data = 12'b0;//11
		10'b0101001100: color_data = 12'b0;//12
		10'b0101001101: color_data = 12'b0;//13
		10'b0101001110: color_data = 12'b0;//14
		10'b0101001111: color_data = 12'b0;//15
		10'b0101010000: color_data = 12'b0;//16
		10'b0101010001: color_data = 12'b0;//17
		10'b0101010010: color_data = 12'b0;//18
		10'b0101010011: color_data = 12'b0;//19

		10'b0101100000: color_data = 12'b0;//0	
		10'b0101100001: color_data = 12'b0;//1
		10'b0101100010: color_data = 12'b0;//2
		10'b0101100011: color_data = 12'b0;//3
		10'b0101100100: color_data = 12'b0;//4
		10'b0101100101: color_data = 12'b0;//5
		10'b0101100110: color_data = 12'b0;//6
		10'b0101100111: color_data = 12'b0;//7
		10'b0101101000: color_data = 12'b0;//8
		10'b0101101001: color_data = 12'b0;//9
		10'b0101101010: color_data = 12'b0;//10
		10'b0101101011: color_data = 12'b0;//11
		10'b0101101100: color_data = 12'b0;//12
		10'b0101101101: color_data = 12'b0;//13
		10'b0101101110: color_data = 12'b0;//14
		10'b0101101111: color_data = 12'b0;//15
		10'b0101110000: color_data = 12'b0;//16
		10'b0101110001: color_data = 12'b0;//17
		10'b0101110010: color_data = 12'b0;//18
		10'b0101110011: color_data = 12'b0;//19

		10'b0110000000: color_data = 12'b0;//0	
		10'b0110000001: color_data = 12'b0;//1
		10'b0110000010: color_data = 12'b0;//2
		10'b0110000011: color_data = 12'b0;//3
		10'b0110000100: color_data = 12'b0;//4
		10'b0110000101: color_data = 12'b0;//5
		10'b0110000110: color_data = 12'b0;//6
		10'b0110000111: color_data = 12'b0;//7
		10'b0110001000: color_data = 12'b0;//8
		10'b0110001001: color_data = 12'b0;//9
		10'b0110001010: color_data = 12'b0;//10
		10'b0110001011: color_data = 12'b0;//11
		10'b0110001100: color_data = 12'b0;//12
		10'b0110001101: color_data = 12'b0;//13
		10'b0110001110: color_data = 12'b0;//14
		10'b0110001111: color_data = 12'b0;//15
		10'b0110010000: color_data = 12'b0;//16
		10'b0110010001: color_data = 12'b0;//17
		10'b0110010010: color_data = 12'b0;//18
		10'b0110010011: color_data = 12'b0;//19

		10'b0110100000: color_data = 12'b0;//0	
		10'b0110100001: color_data = 12'b0;//1
		10'b0110100010: color_data = 12'b0;//2
		10'b0110100011: color_data = 12'b0;//3
		10'b0110100100: color_data = 12'b0;//4
		10'b0110100101: color_data = 12'b0;//5
		10'b0110100110: color_data = 12'b0;//6
		10'b0110100111: color_data = 12'b0;//7
		10'b0110101000: color_data = 12'b0;//8
		10'b0110101001: color_data = 12'b0;//9
		10'b0110101010: color_data = 12'b0;//10
		10'b0110101011: color_data = 12'b0;//11
		10'b0110101100: color_data = 12'b0;//12
		10'b0110101101: color_data = 12'b0;//13
		10'b0110101110: color_data = 12'b0;//14
		10'b0110101111: color_data = 12'b0;//15
		10'b0110110000: color_data = 12'b0;//16
		10'b0110110001: color_data = 12'b0;//17
		10'b0110110010: color_data = 12'b0;//18
		10'b0110110011: color_data = 12'b0;//19

		10'b0111000000: color_data = 12'b0;//0	
		10'b0111000001: color_data = 12'b0;//1
		10'b0111000010: color_data = 12'b0;//2
		10'b0111000011: color_data = 12'b0;//3
		10'b0111000100: color_data = 12'b0;//4
		10'b0111000101: color_data = 12'b0;//5
		10'b0111000110: color_data = 12'b0;//6
		10'b0111000111: color_data = 12'b0;//7
		10'b0111001000: color_data = 12'b0;//8
		10'b0111001001: color_data = 12'b0;//9
		10'b0111001010: color_data = 12'b0;//10
		10'b0111001011: color_data = 12'b0;//11
		10'b0111001100: color_data = 12'b0;//12
		10'b0111001101: color_data = 12'b0;//13
		10'b0111001110: color_data = 12'b0;//14
		10'b0111001111: color_data = 12'b0;//15
		10'b0111010000: color_data = 12'b0;//16
		10'b0111010001: color_data = 12'b0;//17
		10'b0111010010: color_data = 12'b0;//18
		10'b0111010011: color_data = 12'b0;//19

		10'b0111100000: color_data = 12'b0;//0	
		10'b0111100001: color_data = 12'b0;//1
		10'b0111100010: color_data = 12'b0;//2
		10'b0111100011: color_data = 12'b0;//3
		10'b0111100100: color_data = 12'b0;//4
		10'b0111100101: color_data = 12'b0;//5
		10'b0111100110: color_data = 12'b0;//6
		10'b0111100111: color_data = 12'b0;//7
		10'b0111101000: color_data = 12'b0;//8
		10'b0111101001: color_data = 12'b0;//9
		10'b0111101010: color_data = 12'b0;//10
		10'b0111101011: color_data = 12'b0;//11
		10'b0111101100: color_data = 12'b0;//12
		10'b0111101101: color_data = 12'b0;//13
		10'b0111101110: color_data = 12'b0;//14
		10'b0111101111: color_data = 12'b0;//15
		10'b0111110000: color_data = 12'b0;//16
		10'b0111110001: color_data = 12'b0;//17
		10'b0111110010: color_data = 12'b0;//18
		10'b0111110011: color_data = 12'b0;//19

		10'b1000000000: color_data = 12'b0;//0	
		10'b1000000001: color_data = 12'b0;//1
		10'b1000000010: color_data = 12'b0;//2
		10'b1000000011: color_data = 12'b0;//3
		10'b1000000100: color_data = 12'b0;//4
		10'b1000000101: color_data = 12'b0;//5
		10'b1000000110: color_data = 12'b0;//6
		10'b1000000111: color_data = 12'b0;//7
		10'b1000001000: color_data = 12'b0;//8
		10'b1000001001: color_data = 12'b0;//9
		10'b1000001010: color_data = 12'b0;//10
		10'b1000001011: color_data = 12'b0;//11
		10'b1000001100: color_data = 12'b0;//12
		10'b1000001101: color_data = 12'b0;//13
		10'b1000001110: color_data = 12'b0;//14
		10'b1000001111: color_data = 12'b0;//15
		10'b1000010000: color_data = 12'b0;//16
		10'b1000010001: color_data = 12'b0;//17
		10'b1000010010: color_data = 12'b0;//18
		10'b1000010011: color_data = 12'b0;//19

		10'b1000100010: color_data = 12'b0;//2
		10'b1000100011: color_data = 12'b0;//3
		10'b1000100100: color_data = 12'b0;//4
		10'b1000100101: color_data = 12'b0;//5
		10'b1000100110: color_data = 12'b0;//6
		10'b1000100111: color_data = 12'b0;//7
		10'b1000101000: color_data = 12'b0;//8
		10'b1000101001: color_data = 12'b0;//9
		10'b1000101010: color_data = 12'b0;//10
		10'b1000101011: color_data = 12'b0;//11
		10'b1000101100: color_data = 12'b0;//12
		10'b1000101101: color_data = 12'b0;//13
		10'b1000101110: color_data = 12'b0;//14
		10'b1000101111: color_data = 12'b0;//15
		10'b1000110000: color_data = 12'b0;//16
		10'b1000110001: color_data = 12'b0;//17

		10'b1001000011: color_data = 12'b0;//3
		10'b1001000100: color_data = 12'b0;//4
		10'b1001000101: color_data = 12'b0;//5
		10'b1001000110: color_data = 12'b0;//6
		10'b1001000111: color_data = 12'b0;//7
		10'b1001001000: color_data = 12'b0;//8
		10'b1001001001: color_data = 12'b0;//9
		10'b1001001010: color_data = 12'b0;//10
		10'b1001001011: color_data = 12'b0;//11
		10'b1001001100: color_data = 12'b0;//12
		10'b1001001101: color_data = 12'b0;//13
		10'b1001001110: color_data = 12'b0;//14
		10'b1001001111: color_data = 12'b0;//15
		10'b1001010000: color_data = 12'b0;//16

		10'b1001100011: color_data = 12'b0;//3
		10'b1001100100: color_data = 12'b0;//4
		10'b1001100101: color_data = 12'b0;//5
		10'b1001100110: color_data = 12'b0;//6
		10'b1001100111: color_data = 12'b0;//7
		10'b1001101000: color_data = 12'b0;//8
		10'b1001101001: color_data = 12'b0;//9
		10'b1001101010: color_data = 12'b0;//10
		10'b1001101011: color_data = 12'b0;//11
		10'b1001101100: color_data = 12'b0;//12
		10'b1001101101: color_data = 12'b0;//13
		10'b1001101110: color_data = 12'b0;//14
		10'b1001101111: color_data = 12'b0;//15
		10'b1001110000: color_data = 12'b0;//16

		10'b1010000101: color_data = 12'b0;//5
		10'b1010000110: color_data = 12'b0;//6
		10'b1010000111: color_data = 12'b0;//7
		10'b1010001000: color_data = 12'b0;//8
		10'b1010001001: color_data = 12'b0;//9
		10'b1010001010: color_data = 12'b0;//10
		10'b1010001011: color_data = 12'b0;//11
		10'b1010001100: color_data = 12'b0;//12
		10'b1010001101: color_data = 12'b0;//13
		10'b1010001110: color_data = 12'b0;//14

		10'b1010100101: color_data = 12'b0;//5
		10'b1010100110: color_data = 12'b0;//6
		10'b1010100111: color_data = 12'b0;//7
		10'b1010101000: color_data = 12'b0;//8
		10'b1010101001: color_data = 12'b0;//9
		10'b1010101010: color_data = 12'b0;//10
		10'b1010101011: color_data = 12'b0;//11
		10'b1010101100: color_data = 12'b0;//12
		10'b1010101101: color_data = 12'b0;//13
		10'b1010101110: color_data = 12'b0;//14

		10'b1011000111: color_data = 12'b0;//7
		10'b1011001000: color_data = 12'b0;//8
		10'b1011001001: color_data = 12'b0;//9
		10'b1011001010: color_data = 12'b0;//10
		10'b1011001011: color_data = 12'b0;//11
		10'b1011001100: color_data = 12'b0;//12

		10'b1011100111: color_data = 12'b0;//7
		10'b1011101000: color_data = 12'b0;//8
		10'b1011101001: color_data = 12'b0;//9
		10'b1011101010: color_data = 12'b0;//10
		10'b1011101011: color_data = 12'b0;//11
		10'b1011101100: color_data = 12'b0;//12

		default: color_data = 12'b111111111111;
	endcase
	else if(skin_select == 3'b101)
	case ({row_reg, col_reg}) //Charmander
	
		//Starts at row 1, ends at row 22
		10'b0000100011: color_data = 12'b0;//3

		10'b0001000011: color_data = 12'b0;//3
		10'b0001001100: color_data = 12'b0;//12
		10'b0001001101: color_data = 12'b0;//13
		10'b0001001110: color_data = 12'b0;//14
		10'b0001001111: color_data = 12'b0;//15

		10'b0001100010: color_data = 12'b0;//2
		10'b0001100011: color_data = 12'b111100100010;//3 red
		10'b0001100100: color_data = 12'b0;//4 
		10'b0001101011: color_data = 12'b0;//11
		10'b0001101100: color_data = 12'b111101100010;//12 orange
		10'b0001101101: color_data = 12'b111101100010;//13 orange
		10'b0001101110: color_data = 12'b111101100010;//14 orange
		10'b0001101111: color_data = 12'b111101100010;//15 orange
		10'b0001110000: color_data = 12'b0;//16 

		10'b0010000001: color_data = 12'b0;//1
		10'b0010000010: color_data = 12'b111100100010;//2 red
		10'b0010000011: color_data = 12'b111100100010;//3 red
		10'b0010000100: color_data = 12'b0;//4
		10'b0010001011: color_data = 12'b0;//11
		10'b0010001100: color_data = 12'b111101100010;//12 orange
		10'b0010001101: color_data = 12'b111101100010;//13 orange
		10'b0010001110: color_data = 12'b111101100010;//14 orange
		10'b0010001111: color_data = 12'b111101100010;//15 orange
		10'b0010010000: color_data = 12'b111101100010;//16 orange
		10'b0010010001: color_data = 12'b0;//17

		10'b0010100001: color_data = 12'b0;//1
		10'b0010100010: color_data = 12'b111100100010;//2 red
		10'b0010100011: color_data = 12'b111100100010;//3 red
		10'b0010100100: color_data = 12'b0;//4
		10'b0010101010: color_data = 12'b0;//10
		10'b0010101011: color_data = 12'b111101100010;//11 orange
		10'b0010101100: color_data = 12'b111101100010;//12 orange
		10'b0010101101: color_data = 12'b111101100010;//13 orange
		10'b0010101110: color_data = 12'b111101100010;//14 orange
		10'b0010101111: color_data = 12'b111101100010;//15 orange
		10'b0010110000: color_data = 12'b111101100010;//16 orange
		10'b0010110001: color_data = 12'b0;//17

		10'b0011000000: color_data = 12'b0;//0
		10'b0011000001: color_data = 12'b111100100010;//1 red
		10'b0011000010: color_data = 12'b111100100010;//2 red
		10'b0011000011: color_data = 12'b111100100010;//3 red
		10'b0011000100: color_data = 12'b111100100010;//4 red
		10'b0011000101: color_data = 12'b0;//5
		10'b0011001010: color_data = 12'b0;//10
		10'b0011001011: color_data = 12'b111101100010;//11 orange
		10'b0011001100: color_data = 12'b111101100010;//12 orange
		10'b0011001101: color_data = 12'b111101100010;//13 orange
		10'b0011001110: color_data = 12'b111101100010;//14 orange
		10'b0011001111: color_data = 12'b111101100010;//15 orange
		10'b0011010000: color_data = 12'b111101100010;//16 orange
		10'b0011010001: color_data = 12'b111101100010;//17 orange
		10'b0011010010: color_data = 12'b0;//18

		10'b0011100000: color_data = 12'b0;//0
		10'b0011100001: color_data = 12'b111100100010;//1 red
		10'b0011100010: color_data = 12'b111111110010;//2 yellow
		10'b0011100011: color_data = 12'b111100100010;//3 red
		10'b0011100100: color_data = 12'b111100100010;//4 red
		10'b0011100101: color_data = 12'b0;//5
		10'b0011101001: color_data = 12'b0;//9
		10'b0011101010: color_data = 12'b111101100010;//10 orange 
		10'b0011101011: color_data = 12'b111101100010;//11 orange
		10'b0011101100: color_data = 12'b111101100010;//12 orange
		10'b0011101101: color_data = 12'b0;//13
		10'b0011101110: color_data = 12'b111111111110;//14 almost-white
		10'b0011101111: color_data = 12'b111101100010;//15 orange
		10'b0011110000: color_data = 12'b111101100010;//16 orange
		10'b0011110001: color_data = 12'b111101100010;//17 orange
		10'b0011110010: color_data = 12'b111101100010;//18 orange
		10'b0011110011: color_data = 12'b0;//19

		10'b0100000000: color_data = 12'b0;//0
		10'b0100000001: color_data = 12'b111100100010;//1 red
		10'b0100000010: color_data = 12'b111111110010;//2 yellow
		10'b0100000011: color_data = 12'b111111110010;//3 yellow
		10'b0100000100: color_data = 12'b111100100010;//4 red
		10'b0100000101: color_data = 12'b0;//5
		10'b0100001001: color_data = 12'b0;//9
		10'b0100001010: color_data = 12'b111101100010;//10 orange
		10'b0100001011: color_data = 12'b111101100010;//11 orange
		10'b0100001100: color_data = 12'b111101100010;//12 orange
		10'b0100001101: color_data = 12'b0;//13
		10'b0100001110: color_data = 12'b0;//14
		10'b0100001111: color_data = 12'b111101100010;//15 orange
		10'b0100010000: color_data = 12'b111101100010;//16 orange
		10'b0100010001: color_data = 12'b111101100010;//17 orange
		10'b0100010010: color_data = 12'b111101100010;//18 orange
		10'b0100010011: color_data = 12'b0;//19

		10'b0100100001: color_data = 12'b0;//1
		10'b0100100010: color_data = 12'b0;//2
		10'b0100100011: color_data = 12'b111111110010;//3 yellow
		10'b0100100100: color_data = 12'b0;//4
		10'b0100101000: color_data = 12'b0;//8
		10'b0100101001: color_data = 12'b111101100010;//9  orange
		10'b0100101010: color_data = 12'b111101100010;//10 orange
		10'b0100101011: color_data = 12'b111101100010;//11 orange 
		10'b0100101100: color_data = 12'b111101100010;//12 orange
		10'b0100101101: color_data = 12'b0;//13
		10'b0100101110: color_data = 12'b0;//14
		10'b0100101111: color_data = 12'b111101100010;//15 orange
		10'b0100110000: color_data = 12'b111101100010;//16 orange
		10'b0100110001: color_data = 12'b111101100010;//17 orange
		10'b0100110010: color_data = 12'b111101100010;//18 orange
		10'b0100110011: color_data = 12'b0;//19

		10'b0101000010: color_data = 12'b0;//2
		10'b0101000011: color_data = 12'b111101100010;//3 orange
		10'b0101000100: color_data = 12'b0;//4
		10'b0101001000: color_data = 12'b0;//8
		10'b0101001001: color_data = 12'b111101100010;//9  orange
		10'b0101001010: color_data = 12'b111101100010;//10 orange
		10'b0101001011: color_data = 12'b111101100010;//11 orange
		10'b0101001100: color_data = 12'b111101100010;//12 orange
		10'b0101001101: color_data = 12'b111101100010;//13 orange
		10'b0101001110: color_data = 12'b111101100010;//14 orange
		10'b0101001111: color_data = 12'b111101100010;//15 orange
		10'b0101010000: color_data = 12'b111101100010;//16 orange
		10'b0101010001: color_data = 12'b111101100010;//17 orange
		10'b0101010010: color_data = 12'b111101100010;//18 orange
		10'b0101010011: color_data = 12'b0;//19

		10'b0101100010: color_data = 12'b0;//2
		10'b0101100011: color_data = 12'b111101100010;//3 orange
		10'b0101100100: color_data = 12'b111101100010;//4 orange
		10'b0101100101: color_data = 12'b0;//5
		10'b0101100111: color_data = 12'b0;//7
		10'b0101101000: color_data = 12'b111101100010;//8  orange
		10'b0101101001: color_data = 12'b111101100010;//9  orange
		10'b0101101010: color_data = 12'b111101100010;//10 orange
		10'b0101101011: color_data = 12'b111101100010;//11 orange
		10'b0101101100: color_data = 12'b111101100010;//12 orange
		10'b0101101101: color_data = 12'b111101100010;//13 orange
		10'b0101101110: color_data = 12'b111101100010;//14 orange
		10'b0101101111: color_data = 12'b111101100010;//15 orange
		10'b0101110000: color_data = 12'b111101100010;//16 orange
		10'b0101110001: color_data = 12'b111101100010;//17 orange
		10'b0101110010: color_data = 12'b0;//18

		10'b0110000011: color_data = 12'b0;//3
		10'b0110000100: color_data = 12'b111101100010;//4 orange
		10'b0110000101: color_data = 12'b111101100010;//5 orange
		10'b0110000110: color_data = 12'b0;//6
		10'b0110000111: color_data = 12'b0;//7
		10'b0110001000: color_data = 12'b111101100010;//8  orange
		10'b0110001001: color_data = 12'b111101100010;//9  orange
		10'b0110001010: color_data = 12'b111101100010;//10 orange
		10'b0110001011: color_data = 12'b111101100010;//11 orange
		10'b0110001100: color_data = 12'b111101100010;//12 orange
		10'b0110001101: color_data = 12'b111101100010;//13 orange
		10'b0110001110: color_data = 12'b111101100010;//14 orange
		10'b0110001111: color_data = 12'b111101100010;//15 orange
		10'b0110010000: color_data = 12'b0;//16
		10'b0110010001: color_data = 12'b0;//17
		
		10'b0110100011: color_data = 12'b0;//3
		10'b0110100100: color_data = 12'b111101100010;//4 orange
		10'b0110100101: color_data = 12'b111101100010;//5 orange
		10'b0110100110: color_data = 12'b0;//6
		10'b0110100111: color_data = 12'b111101100010;//7 orange
		10'b0110101000: color_data = 12'b111101100010;//8 orange
		10'b0110101001: color_data = 12'b111101100010;//9 orange
		10'b0110101010: color_data = 12'b0;//10 
		10'b0110101011: color_data = 12'b111101100010;//11 orange
		10'b0110101100: color_data = 12'b111101100010;//12 orange
		10'b0110101101: color_data = 12'b0;//13 
		10'b0110101110: color_data = 12'b0;//14 
		10'b0110101111: color_data = 12'b0;//15 

		10'b0111000100: color_data = 12'b0; //4 
		10'b0111000101: color_data = 12'b111101100010;//5 orange
		10'b0111000110: color_data = 12'b0;//6
		10'b0111000111: color_data = 12'b111101100010;//7 orange
		10'b0111001000: color_data = 12'b111101100010;//8 orange
		10'b0111001001: color_data = 12'b111101100010;//9 orange
		10'b0111001010: color_data = 12'b111101100010;//10 orange
		10'b0111001011: color_data = 12'b0;//11 
		10'b0111001100: color_data = 12'b111101100010;//12 orange
		10'b0111001101: color_data = 12'b111101100010;//13 orange
		10'b0111001110: color_data = 12'b111101100010;//14 orange
		10'b0111001111: color_data = 12'b0;//15 

		10'b0111100101: color_data = 12'b0;//5 
		10'b0111100110: color_data = 12'b0;//6
		10'b0111100111: color_data = 12'b111101100010;//7 orange
		10'b0111101000: color_data = 12'b111101100010;//8 orange
		10'b0111101001: color_data = 12'b0;//9 
		10'b0111101010: color_data = 12'b0;//10 
		10'b0111101011: color_data = 12'b111111110010;//11 yellow
		10'b0111101100: color_data = 12'b111111110010;//12 yellow
		10'b0111101101: color_data = 12'b111111110010;//13 yellow
		10'b0111101110: color_data = 12'b111111110010;//14 yellow
		10'b0111101111: color_data = 12'b111111110010;//15 yellow
		10'b0111110000: color_data = 12'b0;//16 

		10'b1000000110: color_data = 12'b0;//6
		10'b1000000111: color_data = 12'b0;//7 
		10'b1000001000: color_data = 12'b111101100010;//8 orange
		10'b1000001001: color_data = 12'b111101100010;//9 orange 
		10'b1000001010: color_data = 12'b111101100010;//10 orange
		10'b1000001011: color_data = 12'b111111110010;//11 yellow
		10'b1000001100: color_data = 12'b111111110010;//12 yellow
		10'b1000001101: color_data = 12'b111111110010;//13 yellow
		10'b1000001110: color_data = 12'b111111110010;//14 yellow
		10'b1000001111: color_data = 12'b111111110010;//15 yellow
		10'b1000010000: color_data = 12'b0;//16 

		10'b1000100111: color_data = 12'b0;//7 
		10'b1000101000: color_data = 12'b111101100010;//8 orange
		10'b1000101001: color_data = 12'b111101100010;//9 orange 
		10'b1000101010: color_data = 12'b111111110010;//10 yellow
		10'b1000101011: color_data = 12'b111111110010;//11 yellow
		10'b1000101100: color_data = 12'b111111110010;//12 yellow
		10'b1000101101: color_data = 12'b111111110010;//13 yellow
		10'b1000101110: color_data = 12'b111111110010;//14 yellow
		10'b1000101111: color_data = 12'b111111110010;//15 yellow
		10'b1000110000: color_data = 12'b0;//16 

		10'b1001000111: color_data = 12'b0;//7 
		10'b1001001000: color_data = 12'b111101100010;//8 orange
		10'b1001001001: color_data = 12'b111101100010;//9 orange 
		10'b1001001010: color_data = 12'b111111110010;//10 yellow
		10'b1001001011: color_data = 12'b111111110010;//11 yellow
		10'b1001001100: color_data = 12'b111111110010;//12 yellow
		10'b1001001101: color_data = 12'b111111110010;//13 yellow
		10'b1001001110: color_data = 12'b111111110010;//14 yellow
		10'b1001001111: color_data = 12'b0;//15 
		10'b1001010000: color_data = 12'b111111111110;//16 almost white
		10'b1001010001: color_data = 12'b0;//17

		10'b1001100111: color_data = 12'b0;//7 
		10'b1001101000: color_data = 12'b0;//8 
		10'b1001101001: color_data = 12'b111101100010;//9 orange 
		10'b1001101010: color_data = 12'b0;//10 
		10'b1001101011: color_data = 12'b0;//11 
		10'b1001101100: color_data = 12'b0;//12 
		10'b1001101101: color_data = 12'b0;//13 
		10'b1001101110: color_data = 12'b0;//14 
		10'b1001101111: color_data = 12'b0;//15 
		10'b1001110000: color_data = 12'b0;//16 

		10'b1010000111: color_data = 12'b0;//7 
		10'b1010001000: color_data = 12'b111101100010;//8 orange
		10'b1010001001: color_data = 12'b111101100010;//9 orange 
		10'b1010001010: color_data = 12'b111101100010;//10 orange
		10'b1010001011: color_data = 12'b0;//11 
		10'b1010001100: color_data = 12'b0;//12 
		10'b1010001101: color_data = 12'b0;//13 

		10'b1010100111: color_data = 12'b0;//7 
		10'b1010101000: color_data = 12'b111111111110;//8 almost white
		10'b1010101001: color_data = 12'b111101100010;//9 orange 
		10'b1010101010: color_data = 12'b111101100010;//10 orange
		10'b1010101011: color_data = 12'b111111111110;//11 almost white
		10'b1010101100: color_data = 12'b0;//12 

		10'b1011000111: color_data = 12'b0;//7 
		10'b1011001000: color_data = 12'b0;//8 
		10'b1011001001: color_data = 12'b0;//9
		10'b1011001010: color_data = 12'b0;//10 
		10'b1011001011: color_data = 12'b0;//11 
		
		default: color_data = 12'b111111111111;
	endcase
	else if(skin_select == 3'b110)
	case ({row_reg, col_reg}) //Sans
	
		10'b0000001110: color_data = 12'b001110101111;//14 blue

		10'b0000101110: color_data = 12'b001110101111;//14 blue

		10'b0001001110: color_data = 12'b001110101111;//14 blue

		10'b0001101111: color_data = 12'b001110101111;//15 blue

		10'b0010000100: color_data = 12'b0;//4
		10'b0010000101: color_data = 12'b0;//5
		10'b0010000110: color_data = 12'b0;//6
		10'b0010000111: color_data = 12'b0;//7
		10'b0010001000: color_data = 12'b0;//8
		10'b0010001001: color_data = 12'b0;//9
		10'b0010001010: color_data = 12'b0;//10
		10'b0010001011: color_data = 12'b0;//11
		10'b0010001100: color_data = 12'b0;//12
		10'b0010001101: color_data = 12'b0;//13
		10'b0010001110: color_data = 12'b001110101111;//14 blue
		10'b0010001111: color_data = 12'b001110101111;//15 blue

		10'b0010100010: color_data = 12'b0;//2
		10'b0010100011: color_data = 12'b0;//3		
		10'b0010100100: color_data = 12'b0;//4
		10'b0010100101: color_data = 12'b111111111110;//5 almost white
		10'b0010100110: color_data = 12'b111111111110;//6 almost white
		10'b0010100111: color_data = 12'b111111111110;//7 almost white
		10'b0010101000: color_data = 12'b111111111110;//8 almost white
		10'b0010101001: color_data = 12'b111111111110;//9 almost white
		10'b0010101010: color_data = 12'b111111111110;//10 almost white
		10'b0010101011: color_data = 12'b111111111110;//11 almost white
		10'b0010101100: color_data = 12'b111111111110;//12 almost white
		10'b0010101101: color_data = 12'b111111111110;//13 almost white
		10'b0010101110: color_data = 12'b001110101111;//14 blue
		10'b0010101111: color_data = 12'b001110101111;//15 blue
		10'b0010110000: color_data = 12'b001110101111;//16 blue
		10'b0010110001: color_data = 12'b0;//17 

		10'b0011000001: color_data = 12'b0;//1
		10'b0011000010: color_data = 12'b111111111110;//2 almost white
		10'b0011000011: color_data = 12'b111111111110;//3 almost white	 	
		10'b0011000100: color_data = 12'b111111111110;//4 almost white
		10'b0011000101: color_data = 12'b111111111110;//5 almost white
		10'b0011000110: color_data = 12'b111111111110;//6 almost white
		10'b0011000111: color_data = 12'b111111111110;//7 almost white
		10'b0011001000: color_data = 12'b111111111110;//8 almost white
		10'b0011001001: color_data = 12'b111111111110;//9 almost white
		10'b0011001010: color_data = 12'b111111111110;//10 almost white
		10'b0011001011: color_data = 12'b111111111110;//11 almost white
		10'b0011001100: color_data = 12'b111111111110;//12 almost white
		10'b0011001101: color_data = 12'b111111111110;//13 almost white
		10'b0011001110: color_data = 12'b111111111110;//14 almost white
		10'b0011001111: color_data = 12'b111111111110;//15 almost white
		10'b0011010000: color_data = 12'b001110101111;//16 blue
		10'b0011010001: color_data = 12'b111111111110;//17 almost white
		10'b0011010010: color_data = 12'b0;//18 

		10'b0011100001: color_data = 12'b0;//1
		10'b0011100010: color_data = 12'b111111111110;//2 almost white
		10'b0011100011: color_data = 12'b111111111110;//3 almost white	 	
		10'b0011100100: color_data = 12'b111111111110;//4 almost white
		10'b0011100101: color_data = 12'b111111111110;//5 almost white
		10'b0011100110: color_data = 12'b111111111110;//6 almost white
		10'b0011100111: color_data = 12'b111111111110;//7 almost white
		10'b0011101000: color_data = 12'b111111111110;//8 almost white
		10'b0011101001: color_data = 12'b111111111110;//9 almost white
		10'b0011101010: color_data = 12'b111111111110;//10 almost white
		10'b0011101011: color_data = 12'b111111111110;//11 almost white
		10'b0011101100: color_data = 12'b111111111110;//12 almost white
		10'b0011101101: color_data = 12'b111111111110;//13 almost white
		10'b0011101110: color_data = 12'b111111111110;//14 almost white
		10'b0011101111: color_data = 12'b111111111110;//15 almost white
		10'b0011110000: color_data = 12'b001110101111;//16 blue
		10'b0011110001: color_data = 12'b111111111110;//17 almost white
		10'b0011110010: color_data = 12'b0;//18 

		10'b0100000000: color_data = 12'b0;//0
		10'b0100000001: color_data = 12'b111111111110;//1 almost white
		10'b0100000010: color_data = 12'b111111111110;//2 almost white
		10'b0100000011: color_data = 12'b111111111110;//3 almost white	 	
		10'b0100000100: color_data = 12'b111111111110;//4 almost white
		10'b0100000101: color_data = 12'b111111111110;//5 almost white
		10'b0100000110: color_data = 12'b111111111110;//6 almost white
		10'b0100000111: color_data = 12'b111111111110;//7 almost white
		10'b0100001000: color_data = 12'b111111111110;//8 almost white
		10'b0100001001: color_data = 12'b111111111110;//9 almost white
		10'b0100001010: color_data = 12'b111111111110;//10 almost white
		10'b0100001011: color_data = 12'b111111111110;//11 almost white
		10'b0100001100: color_data = 12'b111111111110;//12 almost white
		10'b0100001101: color_data = 12'b111111111110;//13 almost white
		10'b0100001110: color_data = 12'b111111111110;//14 almost white
		10'b0100001111: color_data = 12'b001110101111;//15 blue
		10'b0100010000: color_data = 12'b001110101111;//16 blue
		10'b0100010001: color_data = 12'b111111111110;//17 almost white
		10'b0100010010: color_data = 12'b111111111110;//18 almost white
		10'b0100010011: color_data = 12'b0;//19

        10'b0100100000: color_data = 12'b0;//0
		10'b0100100001: color_data = 12'b111111111110;//1 almost white
		10'b0100100010: color_data = 12'b111111111110;//2 almost white
		10'b0100100011: color_data = 12'b111111111110;//3 almost white	 	
		10'b0100100100: color_data = 12'b111111111110;//4 almost white
		10'b0100100101: color_data = 12'b111111111110;//5 almost white
		10'b0100100110: color_data = 12'b111111111110;//6 almost white
		10'b0100100111: color_data = 12'b111111111110;//7 almost white
		10'b0100101000: color_data = 12'b111111111110;//8 almost white
		10'b0100101001: color_data = 12'b111111111110;//9 almost white
		10'b0100101010: color_data = 12'b111111111110;//10 almost white
		10'b0100101011: color_data = 12'b111111111110;//11 almost white
		10'b0100101100: color_data = 12'b111111111110;//12 almost white
		10'b0100101101: color_data = 12'b111111111110;//13 almost white
		10'b0100101110: color_data = 12'b111111111110;//14 almost white
		10'b0100101111: color_data = 12'b001110101111;//15 blue
		10'b0100110000: color_data = 12'b111111111110;//16 almost white
		10'b0100110001: color_data = 12'b111111111110;//17 almost white
		10'b0100110010: color_data = 12'b111111111110;//18 almost white
		10'b0100110011: color_data = 12'b0;//19
		
		10'b0101000000: color_data = 12'b0;//0
		10'b0101000001: color_data = 12'b111111111110;//1 almost white
		10'b0101000010: color_data = 12'b111111111110;//2 almost white
		10'b0101000011: color_data = 12'b0;//3 	 	
		10'b0101000100: color_data = 12'b0;//4 
		10'b0101000101: color_data = 12'b0;//5 
		10'b0101000110: color_data = 12'b0;//6 
		10'b0101000111: color_data = 12'b111111111110;//7 almost white
		10'b0101001000: color_data = 12'b111111111110;//8 almost white
		10'b0101001001: color_data = 12'b111111111110;//9 almost white
		10'b0101001010: color_data = 12'b111111111110;//10 almost white
		10'b0101001011: color_data = 12'b111111111110;//11 almost white
		10'b0101001100: color_data = 12'b111111111110;//12 almost white
		10'b0101001101: color_data = 12'b0;//13 
		10'b0101001110: color_data = 12'b0;//14 
		10'b0101001111: color_data = 12'b001110101111;//15 blue
		10'b0101010000: color_data = 12'b0;//16 
		10'b0101010001: color_data = 12'b111111111110;//17 almost white
		10'b0101010010: color_data = 12'b111111111110;//18 almost white
		10'b0101010011: color_data = 12'b0;//19
		
		10'b0101100000: color_data = 12'b0;//0
		10'b0101100001: color_data = 12'b111111111110;//1 almost white
		10'b0101100010: color_data = 12'b111111111110;//2 almost white
		10'b0101100011: color_data = 12'b0;//3 	 	
		10'b0101100100: color_data = 12'b0;//4 
		10'b0101100101: color_data = 12'b0;//5 
		10'b0101100110: color_data = 12'b0;//6 
		10'b0101100111: color_data = 12'b111111111110;//7 almost white
		10'b0101101000: color_data = 12'b111111111110;//8 almost white
		10'b0101101001: color_data = 12'b111111111110;//9 almost white
		10'b0101101010: color_data = 12'b111111111110;//10 almost white
		10'b0101101011: color_data = 12'b111111111110;//11 almost white
		10'b0101101100: color_data = 12'b111111111110;//12 almost white
		10'b0101101101: color_data = 12'b0;//13 
		10'b0101101110: color_data = 12'b001110101111;//14 blue
		10'b0101101111: color_data = 12'b001110101111;//15 blue
		10'b0101110000: color_data = 12'b0;//16 
		10'b0101110001: color_data = 12'b111111111110;//17 almost white
		10'b0101110010: color_data = 12'b111111111110;//18 almost white
		10'b0101110011: color_data = 12'b0;//19
		
		10'b0110000000: color_data = 12'b0;//0
		10'b0110000001: color_data = 12'b111111111110;//1 almost white
		10'b0110000010: color_data = 12'b111111111110;//2 almost white
		10'b0110000011: color_data = 12'b0;//3 	 	
		10'b0110000100: color_data = 12'b0;//4 
		10'b0110000101: color_data = 12'b0;//5 
		10'b0110000110: color_data = 12'b0;//6 
		10'b0110000111: color_data = 12'b111111111110;//7 almost white
		10'b0110001000: color_data = 12'b111111111110;//8 almost white
		10'b0110001001: color_data = 12'b111111111110;//9 almost white
		10'b0110001010: color_data = 12'b111111111110;//10 almost white
		10'b0110001011: color_data = 12'b111111111110;//11 almost white
		10'b0110001100: color_data = 12'b111111111110;//12 almost white
		10'b0110001101: color_data = 12'b0;//13 
		10'b0110001110: color_data = 12'b001110101111;//14 blue
		10'b0110001111: color_data = 12'b0;//15 
		10'b0110010000: color_data = 12'b0;//16 
		10'b0110010001: color_data = 12'b111111111110;//17 almost white
		10'b0110010010: color_data = 12'b111111111110;//18 almost white
		10'b0110010011: color_data = 12'b0;//19
		
		10'b0110100000: color_data = 12'b0;//0
		10'b0110100001: color_data = 12'b111111111110;//1 almost white
		10'b0110100010: color_data = 12'b111111111110;//2 almost white
		10'b0110100011: color_data = 12'b0;//3 	 	
		10'b0110100100: color_data = 12'b0;//4 
		10'b0110100101: color_data = 12'b0;//5 
		10'b0110100110: color_data = 12'b0;//6 
		10'b0110100111: color_data = 12'b111111111110;//7 almost white
		10'b0110101000: color_data = 12'b111111111110;//8 almost white
		10'b0110101001: color_data = 12'b0;//9 
		10'b0110101010: color_data = 12'b0;//10 
		10'b0110101011: color_data = 12'b111111111110;//11 almost white
		10'b0110101100: color_data = 12'b111111111110;//12 almost white
		10'b0110101101: color_data = 12'b0;//13 
		10'b0110101110: color_data = 12'b0;//14
		10'b0110101111: color_data = 12'b0;//15 
		10'b0110110000: color_data = 12'b0;//16 
		10'b0110110001: color_data = 12'b111111111110;//17 almost white
		10'b0110110010: color_data = 12'b111111111110;//18 almost white
		10'b0110110011: color_data = 12'b0;//19
		
		10'b0111000000: color_data = 12'b0;//0
		10'b0111000001: color_data = 12'b111111111110;//1 almost white
		10'b0111000010: color_data = 12'b111111111110;//2 almost white
		10'b0111000011: color_data = 12'b111111111110;//3 almost white	 	
		10'b0111000100: color_data = 12'b111111111110;//4 almost white
		10'b0111000101: color_data = 12'b111111111110;//5 almost white
		10'b0111000110: color_data = 12'b111111111110;//6 almost white
		10'b0111000111: color_data = 12'b111111111110;//7 almost white
		10'b0111001000: color_data = 12'b0;//8 
		10'b0111001001: color_data = 12'b0;//9 
		10'b0111001010: color_data = 12'b0;//10 
		10'b0111001011: color_data = 12'b0;//11 
		10'b0111001100: color_data = 12'b111111111110;//12 almost white
		10'b0111001101: color_data = 12'b111111111110;//13 almost white
		10'b0111001110: color_data = 12'b111111111110;//14 almost white
		10'b0111001111: color_data = 12'b111111111110;//15 almost white
		10'b0111010000: color_data = 12'b111111111110;//16 almost white
		10'b0111010001: color_data = 12'b111111111110;//17 almost white
		10'b0111010010: color_data = 12'b111111111110;//18 almost white
		10'b0111010011: color_data = 12'b0;//19
		
		10'b0111100000: color_data = 12'b0;//0
		10'b0111100001: color_data = 12'b111111111110;//1 almost white
		10'b0111100010: color_data = 12'b111111111110;//2 almost white
		10'b0111100011: color_data = 12'b111111111110;//3 almost white	 	
		10'b0111100100: color_data = 12'b111111111110;//4 almost white
		10'b0111100101: color_data = 12'b111111111110;//5 almost white
		10'b0111100110: color_data = 12'b111111111110;//6 almost white
		10'b0111100111: color_data = 12'b111111111110;//7 almost white
		10'b0111101000: color_data = 12'b111111111110;//8 almost white
		10'b0111101001: color_data = 12'b111111111110;//9 almost white
		10'b0111101010: color_data = 12'b111111111110;//10 almost white
		10'b0111101011: color_data = 12'b111111111110;//11 almost white
		10'b0111101100: color_data = 12'b111111111110;//12 almost white
		10'b0111101101: color_data = 12'b111111111110;//13 almost white
		10'b0111101110: color_data = 12'b111111111110;//14 almost white
		10'b0111101111: color_data = 12'b111111111110;//15 almost white
		10'b0111110000: color_data = 12'b111111111110;//16 almost white
		10'b0111110001: color_data = 12'b111111111110;//17 almost white
		10'b0111110010: color_data = 12'b111111111110;//18 almost white
		10'b0111110011: color_data = 12'b0;//19
			
		10'b1000000001: color_data = 12'b0;//1 
		10'b1000000010: color_data = 12'b111111111110;//2 almost white
		10'b1000000011: color_data = 12'b0;//3 	 	
		10'b1000000100: color_data = 12'b111111111110;//4 almost white
		10'b1000000101: color_data = 12'b111111111110;//5 almost white
		10'b1000000110: color_data = 12'b111111111110;//6 almost white
		10'b1000000111: color_data = 12'b111111111110;//7 almost white
		10'b1000001000: color_data = 12'b111111111110;//8 almost white
		10'b1000001001: color_data = 12'b111111111110;//9 almost white
		10'b1000001010: color_data = 12'b111111111110;//10 almost white
		10'b1000001011: color_data = 12'b111111111110;//11 almost white
		10'b1000001100: color_data = 12'b111111111110;//12 almost white
		10'b1000001101: color_data = 12'b111111111110;//13 almost white
		10'b1000001110: color_data = 12'b111111111110;//14 almost white
		10'b1000001111: color_data = 12'b111111111110;//15 almost white
		10'b1000010000: color_data = 12'b0;//16 
		10'b1000010001: color_data = 12'b111111111110;//17 almost white
		10'b1000010010: color_data = 12'b0;//18 
		
		10'b1000100000: color_data = 12'b0;//0
		10'b1000100001: color_data = 12'b0;//1
		10'b1000100010: color_data = 12'b111111111110;//2 almost white
		10'b1000100011: color_data = 12'b0;//3 	 	
		10'b1000100100: color_data = 12'b0;//4 
		10'b1000100101: color_data = 12'b0;//5 
		10'b1000100110: color_data = 12'b0;//6 
		10'b1000100111: color_data = 12'b0;//7 
		10'b1000101000: color_data = 12'b0;//8 
		10'b1000101001: color_data = 12'b0;//9 
		10'b1000101010: color_data = 12'b0;//10 
		10'b1000101011: color_data = 12'b0;//11 
		10'b1000101100: color_data = 12'b0;//12 
		10'b1000101101: color_data = 12'b0;//13 
		10'b1000101110: color_data = 12'b0;//14 
		10'b1000101111: color_data = 12'b0;//15 
		10'b1000110000: color_data = 12'b0;//16 
		10'b1000110001: color_data = 12'b111111111110;//17 almost white
		10'b1000110010: color_data = 12'b0;//18 
		10'b1000110011: color_data = 12'b0;//19
		
		10'b1001000000: color_data = 12'b0;//0
		10'b1001000001: color_data = 12'b111111111110;//1 almost white
		10'b1001000010: color_data = 12'b111111111110;//2 almost white
		10'b1001000011: color_data = 12'b111111111110;//3 almost white	 	
		10'b1001000100: color_data = 12'b0;//4 
		10'b1001000101: color_data = 12'b111111111110;//5 almost white
		10'b1001000110: color_data = 12'b0;//6 
		10'b1001000111: color_data = 12'b0;//7 
		10'b1001001000: color_data = 12'b111111111110;//8 almost white
		10'b1001001001: color_data = 12'b0;//9 
		10'b1001001010: color_data = 12'b0;//10 
		10'b1001001011: color_data = 12'b111111111110;//11 almost white
		10'b1001001100: color_data = 12'b0;//12 
		10'b1001001101: color_data = 12'b0;//13 
		10'b1001001110: color_data = 12'b111111111110;//14 almost white
		10'b1001001111: color_data = 12'b0;//15 
		10'b1001010000: color_data = 12'b111111111110;//16 almost white
		10'b1001010001: color_data = 12'b111111111110;//17 almost white
		10'b1001010010: color_data = 12'b111111111110;//18 almost white
		10'b1001010011: color_data = 12'b0;//19
		
		10'b1001100000: color_data = 12'b0;//0
		10'b1001100001: color_data = 12'b111111111110;//1 almost white
		10'b1001100010: color_data = 12'b111111111110;//2 almost white
		10'b1001100011: color_data = 12'b111111111110;//3 almost white	 	
		10'b1001100100: color_data = 12'b0;//4 
		10'b1001100101: color_data = 12'b111111111110;//5 almost white
		10'b1001100110: color_data = 12'b0;//6 
		10'b1001100111: color_data = 12'b0;//7 
		10'b1001101000: color_data = 12'b111111111110;//8 almost white
		10'b1001101001: color_data = 12'b0;//9 
		10'b1001101010: color_data = 12'b0;//10 
		10'b1001101011: color_data = 12'b111111111110;//11 almost white
		10'b1001101100: color_data = 12'b0;//12 
		10'b1001101101: color_data = 12'b0;//13 
		10'b1001101110: color_data = 12'b111111111110;//14 almost white
		10'b1001101111: color_data = 12'b0;//15 
		10'b1001110000: color_data = 12'b111111111110;//16 almost white
		10'b1001110001: color_data = 12'b111111111110;//17 almost white
		10'b1001110010: color_data = 12'b111111111110;//18 almost white
		10'b1001110011: color_data = 12'b0;//19
		
		10'b1010000000: color_data = 12'b0;//0
		10'b1010000001: color_data = 12'b111111111110;//1 almost white
		10'b1010000010: color_data = 12'b111111111110;//2 almost white
		10'b1010000011: color_data = 12'b111111111110;//3 almost white	 	
		10'b1010000100: color_data = 12'b111111111110;//4 almost white	 
		10'b1010000101: color_data = 12'b0;//5 
		10'b1010000110: color_data = 12'b0;//6 
		10'b1010000111: color_data = 12'b0;//7 
		10'b1010001000: color_data = 12'b0;//8 
		10'b1010001001: color_data = 12'b0;//9 
		10'b1010001010: color_data = 12'b0;//10 
		10'b1010001011: color_data = 12'b0;//11 
		10'b1010001100: color_data = 12'b0;//12 
		10'b1010001101: color_data = 12'b0;//13 
		10'b1010001110: color_data = 12'b0;//14 
		10'b1010001111: color_data = 12'b111111111110;//15 almost white	 
		10'b1010010000: color_data = 12'b111111111110;//16 almost white
		10'b1010010001: color_data = 12'b111111111110;//17 almost white
		10'b1010010010: color_data = 12'b111111111110;//18 almost white
		10'b1010010011: color_data = 12'b0;//19
		
		10'b1010100001: color_data = 12'b0;//1 
		10'b1010100010: color_data = 12'b0;//2 
		10'b1010100011: color_data = 12'b111111111110;//3 almost white	 	
		10'b1010100100: color_data = 12'b111111111110;//4 almost white	 
		10'b1010100101: color_data = 12'b111111111110;//5 almost white
		10'b1010100110: color_data = 12'b111111111110;//6 almost white
		10'b1010100111: color_data = 12'b111111111110;//7 almost white
		10'b1010101000: color_data = 12'b111111111110;//8 almost white
		10'b1010101001: color_data = 12'b111111111110;//9 almost white
		10'b1010101010: color_data = 12'b111111111110;//10 almost white
		10'b1010101011: color_data = 12'b111111111110;//11 almost white
		10'b1010101100: color_data = 12'b111111111110;//12 almost white
		10'b1010101101: color_data = 12'b111111111110;//13 almost white
		10'b1010101110: color_data = 12'b111111111110;//14 almost white
		10'b1010101111: color_data = 12'b111111111110;//15 almost white	 
		10'b1010110000: color_data = 12'b111111111110;//16 almost white
		10'b1010110001: color_data = 12'b0;//17 
		10'b1010110010: color_data = 12'b0;//18 
		
		10'b1011000010: color_data = 12'b0;//2 
		10'b1011000011: color_data = 12'b0;//3 	 	
		10'b1011000100: color_data = 12'b0;//4 
		10'b1011000101: color_data = 12'b111111111110;//5 almost white
		10'b1011000110: color_data = 12'b111111111110;//6 almost white
		10'b1011000111: color_data = 12'b111111111110;//7 almost white
		10'b1011001000: color_data = 12'b111111111110;//8 almost white
		10'b1011001001: color_data = 12'b111111111110;//9 almost white
		10'b1011001010: color_data = 12'b111111111110;//10 almost white
		10'b1011001011: color_data = 12'b111111111110;//11 almost white
		10'b1011001100: color_data = 12'b111111111110;//12 almost white
		10'b1011001101: color_data = 12'b111111111110;//13 almost white
		10'b1011001110: color_data = 12'b111111111110;//14 almost white
		10'b1011001111: color_data = 12'b0;//15 	 
		10'b1011010000: color_data = 12'b0;//16 
		10'b1011010001: color_data = 12'b0;//17 
		
		10'b1011100101: color_data = 12'b0;//5 
		10'b1011100110: color_data = 12'b0;//6 
		10'b1011100111: color_data = 12'b0;//7 
		10'b1011101000: color_data = 12'b0;//8 
		10'b1011101001: color_data = 12'b0;//9 
		10'b1011101010: color_data = 12'b0;//10 
		10'b1011101011: color_data = 12'b0;//11 
		10'b1011101100: color_data = 12'b0;//12 
		10'b1011101101: color_data = 12'b0;//13 
		10'b1011101110: color_data = 12'b0;//14 
		
		
		default: color_data = 12'b111111111111;
	endcase
	else if (skin_select == 3'b111)
	case ({row_reg, col_reg}) //Dinosaur

		10'b0000001000: color_data = 12'b0;//8
		10'b0000001001: color_data = 12'b0;//9
		10'b0000001100: color_data = 12'b0;//12
		10'b0000001101: color_data = 12'b0;//13

        10'b0000100000: color_data = 12'b111110001010;//0 dark pink
        10'b0000100001: color_data = 12'b111110001010;//1 dark pink
        10'b0000100011: color_data = 12'b111110001010;//3 dark pink
        10'b0000100100: color_data = 12'b111110001010;//4 dark pink
        10'b0000100111: color_data = 12'b0;//7
        10'b0000101000: color_data = 12'b100011110101;//8 yellow green
        10'b0000101001: color_data = 12'b100011110101;//9 yellow green
        10'b0000101010: color_data = 12'b0;//10
        10'b0000101011: color_data = 12'b0;//11
        10'b0000101100: color_data = 12'b100011110101;//12 yellow green
        10'b0000101101: color_data = 12'b100011110101;//13 yellow green
        10'b0000101110: color_data = 12'b0;//14

        10'b0001000000: color_data = 12'b111110001010;//0 dark pink
        10'b0001000001: color_data = 12'b111111001100;//1 light pink
        10'b0001000010: color_data = 12'b111110001010;//2 dark pink
        10'b0001000011: color_data = 12'b111111001100;//3 light pink
        10'b0001000100: color_data = 12'b111110001010;//4 dark pink
        10'b0001000110: color_data = 12'b0;//6
        10'b0001000111: color_data = 12'b0;//7
        10'b0001001000: color_data = 12'b0;//8
        10'b0001001001: color_data = 12'b0;//9
        10'b0001001010: color_data = 12'b0;//10
        10'b0001001011: color_data = 12'b0;//11
        10'b0001001100: color_data = 12'b0;//12
        10'b0001001101: color_data = 12'b0;//13
        10'b0001001110: color_data = 12'b0;//14

        10'b0001100000: color_data = 12'b111110001010;//0 dark pink
        10'b0001100001: color_data = 12'b111111001100;//1 light pink
        10'b0001100010: color_data = 12'b111111001100;//2 light pink
        10'b0001100011: color_data = 12'b111111001100;//3 light pink
        10'b0001100100: color_data = 12'b111110001010;//4 dark pink
        10'b0001100101: color_data = 12'b0;//5
        10'b0001100110: color_data = 12'b100011110101;//6 yellow green
        10'b0001100111: color_data = 12'b0;//7
        10'b0001101000: color_data = 12'b0;//8
        10'b0001101001: color_data = 12'b101011111110;//9 light green
        10'b0001101010: color_data = 12'b101011111110;//10 light green
        10'b0001101011: color_data = 12'b101011111110;//11 light green
        10'b0001101100: color_data = 12'b101011111110;//12 light green
        10'b0001101101: color_data = 12'b101011111110;//13 light green
        10'b0001101110: color_data = 12'b0;//14
        10'b0001101111: color_data = 12'b0;//15
        10'b0001110000: color_data = 12'b0;//16

        10'b0010000001: color_data = 12'b111111001100;//1 light pink
        10'b0010000010: color_data = 12'b111110001010;//2 dark pink
        10'b0010000011: color_data = 12'b111111001100;//3 light pink
        10'b0010000100: color_data = 12'b0;//4
        10'b0010000101: color_data = 12'b100011110101;//5 yellow green
        10'b0010000110: color_data = 12'b0;//6
        10'b0010000111: color_data = 12'b000010111001;//7 turquoise green
        10'b0010001000: color_data = 12'b000010111001;//8 turquoise green
        10'b0010001001: color_data = 12'b000010111001;//9 turquoise green
        10'b0010001010: color_data = 12'b000010111001;//10 turquoise green
        10'b0010001011: color_data = 12'b000010111001;//11 turquoise green
        10'b0010001100: color_data = 12'b000010111001;//12 turquoise green
        10'b0010001101: color_data = 12'b000010111001;//13 turquoise green
        10'b0010001110: color_data = 12'b101011111110;//14 light green
        10'b0010001111: color_data = 12'b101011111110;//15 light green
        10'b0010010000: color_data = 12'b0;//16
        10'b0010010001: color_data = 12'b0;//17
        10'b0010010010: color_data = 12'b0;//18

        10'b0010100010: color_data = 12'b111110001010;//2 dark pink
        10'b0010100100: color_data = 12'b0;//4
        10'b0010100101: color_data = 12'b100011110101;//5 yellow green
        10'b0010100110: color_data = 12'b0;//6
        10'b0010100111: color_data = 12'b000010111001;//7 turquoise green
        10'b0010101000: color_data = 12'b000010111001;//8 turquoise green
        10'b0010101001: color_data = 12'b000010111001;//9 turquoise green
        10'b0010101010: color_data = 12'b000010111001;//10 turquoise green
        10'b0010101011: color_data = 12'b000010111001;//11 turquoise green
        10'b0010101100: color_data = 12'b0;//12
        10'b0010101101: color_data = 12'b0;//13
        10'b0010101110: color_data = 12'b000010111001;//14 turquoise green
        10'b0010101111: color_data = 12'b000010111001;//15 turquoise green
        10'b0010110000: color_data = 12'b101011111110;//16 light green
        10'b0010110001: color_data = 12'b101011111110;//17 light green
        10'b0010110010: color_data = 12'b0;//18

        10'b0011000101: color_data = 12'b0;//5
        10'b0011000110: color_data = 12'b0;//6
        10'b0011000111: color_data = 12'b000010111001;//7 turquoise green
        10'b0011001000: color_data = 12'b000010111001;//8 turquoise green
        10'b0011001001: color_data = 12'b000010111001;//9 turquoise green
        10'b0011001010: color_data = 12'b000010111001;//10 turquoise green
        10'b0011001011: color_data = 12'b0;//11
        10'b0011001100: color_data = 12'b111111111110;//12 almost white
        10'b0011001101: color_data = 12'b0;//13
        10'b0011001110: color_data = 12'b0;//14
        10'b0011001111: color_data = 12'b000010111001;//15 turquoise green
        10'b0011010000: color_data = 12'b000010111001;//16 turquoise green
        10'b0011010001: color_data = 12'b000010111001;//17 turquoise green
        10'b0011010010: color_data = 12'b000010111001;//18 turquoise green
        10'b0011010011: color_data = 12'b0;//19

        10'b0011100100: color_data = 12'b0;//4
        10'b0011100101: color_data = 12'b0;//5
        10'b0011100110: color_data = 12'b0;//6
        10'b0011100111: color_data = 12'b000010111001;//7 turquoise green
        10'b0011101000: color_data = 12'b000010111001;//8 turquoise green
        10'b0011101001: color_data = 12'b000010111001;//9 turquoise green
        10'b0011101010: color_data = 12'b000010111001;//10 turquoise green
        10'b0011101011: color_data = 12'b000010111001;//11 turquoise green
        10'b0011101100: color_data = 12'b0;//12
        10'b0011101101: color_data = 12'b0;//13
        10'b0011101110: color_data = 12'b000010111001;//14 turquoise green
        10'b0011101111: color_data = 12'b000010111001;//15 turquoise green
        10'b0011110000: color_data = 12'b000010111001;//16 turquoise green
        10'b0011110001: color_data = 12'b000010111001;//17 turquoise green
        10'b0011110010: color_data = 12'b000010111001;//18 turquoise green
        10'b0011110011: color_data = 12'b0;//19

        10'b0100000011: color_data = 12'b0;//3
        10'b0100000100: color_data = 12'b100011110101;//4 yellow green
        10'b0100000101: color_data = 12'b0;//5
        10'b0100000110: color_data = 12'b101011111110;//6 light green
        10'b0100000111: color_data = 12'b000010111001;//7 turquoise green
        10'b0100001000: color_data = 12'b111111001100;//8 light pink
        10'b0100001001: color_data = 12'b111111001100;//9 light pink
        10'b0100001010: color_data = 12'b111110001010;//10 dark pink
        10'b0100001011: color_data = 12'b000010111001;//11 turquoise green
        10'b0100001100: color_data = 12'b000010111001;//12 turquoise green
        10'b0100001101: color_data = 12'b000010111001;//13 turquoise green
        10'b0100001110: color_data = 12'b000010111001;//14 turquoise green
        10'b0100001111: color_data = 12'b000010111001;//15 turquoise green
        10'b0100010000: color_data = 12'b0;//16
        10'b0100010001: color_data = 12'b000010111001;//17 turquoise green
        10'b0100010010: color_data = 12'b000010111001;//18 turquoise green
        10'b0100010011: color_data = 12'b0;//19

        10'b0100100010: color_data = 12'b0;//2
        10'b0100100011: color_data = 12'b100011110101;//3 yellow green
        10'b0100100100: color_data = 12'b100011110101;//4 yellow green
        10'b0100100101: color_data = 12'b0;//5
        10'b0100100110: color_data = 12'b101011111110;//6 light green
        10'b0100100111: color_data = 12'b000010111001;//7 turquoise green
        10'b0100101000: color_data = 12'b111110001010;//8 dark pink
        10'b0100101001: color_data = 12'b111110001010;//9 dark pink
        10'b0100101010: color_data = 12'b111110001010;//10 dark pink
        10'b0100101011: color_data = 12'b000010111001;//11 turquoise green
        10'b0100101100: color_data = 12'b000010111001;//12 turquoise green
        10'b0100101101: color_data = 12'b000010111001;//13 turquoise green
        10'b0100101110: color_data = 12'b000010111001;//14 turquoise green
        10'b0100101111: color_data = 12'b000010111001;//15 turquoise green
        10'b0100110000: color_data = 12'b000010111001;//16 turquoise green
        10'b0100110001: color_data = 12'b000010111001;//17 turquoise green
        10'b0100110010: color_data = 12'b000010111001;//18 turquoise green
        10'b0100110011: color_data = 12'b0;//19

        10'b0101000011: color_data = 12'b0;//3
        10'b0101000100: color_data = 12'b0;//4
        10'b0101000101: color_data = 12'b0;//5
        10'b0101000110: color_data = 12'b101011111110;//6 light green
        10'b0101000111: color_data = 12'b000010111001;//7 turquoise green
        10'b0101001000: color_data = 12'b000010111001;//8 turquoise green
        10'b0101001001: color_data = 12'b000010111001;//9 turquoise green
        10'b0101001010: color_data = 12'b000010111001;//10 turquoise green
        10'b0101001011: color_data = 12'b000010111001;//11 turquoise green
        10'b0101001100: color_data = 12'b000010111001;//12 turquoise green
        10'b0101001101: color_data = 12'b0;//13
        10'b0101001110: color_data = 12'b000010111001;//14 turquoise green
        10'b0101001111: color_data = 12'b0;//15
        10'b0101010000: color_data = 12'b000010111001;//16 turquoise green
        10'b0101010001: color_data = 12'b0;//17
        10'b0101010010: color_data = 12'b000010111001;//18 turquoise green
        10'b0101010011: color_data = 12'b0;//19

        10'b0101100100: color_data = 12'b0;//4
        10'b0101100101: color_data = 12'b0;//5
        10'b0101100110: color_data = 12'b101011111110;//6 light green
        10'b0101100111: color_data = 12'b000010111001;//7 turquoise green
        10'b0101101000: color_data = 12'b000010111001;//8 turquoise green
        10'b0101101001: color_data = 12'b000010111001;//9 turquoise green
        10'b0101101010: color_data = 12'b000010111001;//10 turquoise green
        10'b0101101011: color_data = 12'b000010111001;//11 turquoise green
        10'b0101101100: color_data = 12'b000010111001;//12 turquoise green
        10'b0101101101: color_data = 12'b000010111001;//13 turquoise green
        10'b0101101110: color_data = 12'b0;//14
        10'b0101101111: color_data = 12'b000010111001;//15 turquoise green
        10'b0101110000: color_data = 12'b0;//16
        10'b0101110001: color_data = 12'b000010000111;//17 dark green
        10'b0101110010: color_data = 12'b0;//18

        10'b0110000011: color_data = 12'b0;//3
        10'b0110000100: color_data = 12'b100011110101;//4 yellow green
        10'b0110000101: color_data = 12'b0;//5
        10'b0110000110: color_data = 12'b101011111110;//6 light green
        10'b0110000111: color_data = 12'b000010111001;//7 turquoise green
        10'b0110001000: color_data = 12'b000010111001;//8 turquoise green
        10'b0110001001: color_data = 12'b000010111001;//9 turquoise green
        10'b0110001010: color_data = 12'b000010111001;//10 turquoise green
        10'b0110001011: color_data = 12'b000010111001;//11 turquoise green
        10'b0110001100: color_data = 12'b000010111001;//12 turquoise green
        10'b0110001101: color_data = 12'b000010000111;//13 dark green
        10'b0110001110: color_data = 12'b000010000111;//14 dark green
        10'b0110001111: color_data = 12'b000010000111;//15 dark green
        10'b0110010000: color_data = 12'b000010000111;//16 dark green
        10'b0110010001: color_data = 12'b0;//17

        10'b0110100011: color_data = 12'b0;//3
        10'b0110100100: color_data = 12'b100011110101;//4 yellow green
        10'b0110100101: color_data = 12'b0;//5
        10'b0110100110: color_data = 12'b101011111110;//6 light green
        10'b0110100111: color_data = 12'b000010111001;//7 turquoise green
        10'b0110101000: color_data = 12'b000010111001;//8 turquoise green
        10'b0110101001: color_data = 12'b000010111001;//9 turquoise green
        10'b0110101010: color_data = 12'b000010111001;//10 turquoise green
        10'b0110101011: color_data = 12'b000010000111;//11 dark green
        10'b0110101100: color_data = 12'b000010000111;//12 dark green
        10'b0110101101: color_data = 12'b000010000111;//13 dark green
        10'b0110101110: color_data = 12'b000010000111;//14 dark green
        10'b0110101111: color_data = 12'b0;//15
        10'b0110110000: color_data = 12'b0;//16
        10'b0110110001: color_data = 12'b0;//17

        10'b0111000011: color_data = 12'b0;//3
        10'b0111000100: color_data = 12'b0;//4
        10'b0111000101: color_data = 12'b0;//5
        10'b0111000110: color_data = 12'b000010111001;//6 turquoise green
        10'b0111000111: color_data = 12'b000010111001;//7 turquoise green
        10'b0111001000: color_data = 12'b000010111001;//8 turquoise green
        10'b0111001001: color_data = 12'b0;//9
        10'b0111001010: color_data = 12'b0;//10
        10'b0111001011: color_data = 12'b000010111001;//11 turquoise green
        10'b0111001100: color_data = 12'b000010111001;//12 turquoise green
        10'b0111001101: color_data = 12'b000010111001;//13 turquoise green
        10'b0111001110: color_data = 12'b000010000111;//14 dark green
        10'b0111001111: color_data = 12'b0;//15
        10'b0111010000: color_data = 12'b0;//16
        10'b0111010001: color_data = 12'b0;//17

        10'b0111100100: color_data = 12'b0;//4
        10'b0111100101: color_data = 12'b0;//5
        10'b0111100110: color_data = 12'b000010111001;//6 turquoise green
        10'b0111100111: color_data = 12'b000010111001;//7 turquoise green
        10'b0111101000: color_data = 12'b000010111001;//8 turquoise green
        10'b0111101001: color_data = 12'b000010111001;//9 turquoise green
        10'b0111101010: color_data = 12'b000010111001;//10 turquoise green
        10'b0111101011: color_data = 12'b0;//11
        10'b0111101100: color_data = 12'b000010111001;//12 turquoise green
        10'b0111101101: color_data = 12'b000010111001;//13 turquoise green
        10'b0111101110: color_data = 12'b000010000111;//14 dark green
        10'b0111101111: color_data = 12'b0;//15
        10'b0111110000: color_data = 12'b000010111001;//16 turquoise green
        10'b0111110001: color_data = 12'b0;//17
        10'b0111110010: color_data = 12'b0;//18

        10'b1000000011: color_data = 12'b0;//3
        10'b1000000100: color_data = 12'b100011110101;//4 yellow green
        10'b1000000101: color_data = 12'b0;//5
        10'b1000000110: color_data = 12'b000010111001;//6 turquoise green
        10'b1000000111: color_data = 12'b000010111001;//7 turquoise green
        10'b1000001000: color_data = 12'b0;//8
        10'b1000001001: color_data = 12'b0;//9
        10'b1000001010: color_data = 12'b000010111001;//10 turquoise green
        10'b1000001011: color_data = 12'b0;//11
        10'b1000001100: color_data = 12'b000010111001;//12 turquoise green
        10'b1000001101: color_data = 12'b000010111001;//13 turquoise green
        10'b1000001110: color_data = 12'b000010000111;//14 dark green
        10'b1000001111: color_data = 12'b0;//15
        10'b1000010000: color_data = 12'b0;//16
        10'b1000010001: color_data = 12'b000010111001;//17 turquoise green
        10'b1000010010: color_data = 12'b0;//18

        10'b1000100000: color_data = 12'b0;//0
        10'b1000100011: color_data = 12'b0;//3
        10'b1000100100: color_data = 12'b100011110101;//4 yellow green
        10'b1000100101: color_data = 12'b0;//5
        10'b1000100110: color_data = 12'b000010111001;//6 turquoise green
        10'b1000100111: color_data = 12'b000010111001;//7 turquoise green
        10'b1000101000: color_data = 12'b000010111001;//8 turquoise green
        10'b1000101001: color_data = 12'b000010111001;//9 turquoise green
        10'b1000101010: color_data = 12'b0;//10
        10'b1000101011: color_data = 12'b0;//11
        10'b1000101100: color_data = 12'b000010111001;//12 turquoise green
        10'b1000101101: color_data = 12'b000010000111;//13 dark green
        10'b1000101110: color_data = 12'b000010000111;//14 dark green
        10'b1000101111: color_data = 12'b0;//15
        10'b1000110001: color_data = 12'b0;//17
        10'b1000110010: color_data = 12'b0;//18

        10'b1001000000: color_data = 12'b0;//0
        10'b1001000001: color_data = 12'b0;//1
        10'b1001000011: color_data = 12'b0;//3
        10'b1001000100: color_data = 12'b0;//4
        10'b1001000101: color_data = 12'b0;//5
        10'b1001000110: color_data = 12'b000010111001;//6 turquoise green
        10'b1001000111: color_data = 12'b000010111001;//7 turquoise green
        10'b1001001000: color_data = 12'b000010111001;//8 turquoise green
        10'b1001001001: color_data = 12'b000010111001;//9 turquoise green
        10'b1001001010: color_data = 12'b0;//10
        10'b1001001011: color_data = 12'b0;//11
        10'b1001001100: color_data = 12'b000010000111;//12 dark green
        10'b1001001101: color_data = 12'b000010000111;//13 dark green
        10'b1001001110: color_data = 12'b000010000111;//14 dark green
        10'b1001001111: color_data = 12'b0;//15
        10'b1001010001: color_data = 12'b0;//17
        10'b1001010010: color_data = 12'b0;//18

        10'b1001100000: color_data = 12'b0;//0
        10'b1001100001: color_data = 12'b000010111001;//1 turquoise green
        10'b1001100010: color_data = 12'b0;//2
        10'b1001100011: color_data = 12'b000010111001;//3 turquoise green
        10'b1001100100: color_data = 12'b000010111001;//4 turquoise green
        10'b1001100101: color_data = 12'b000010111001;//5 turquoise green
        10'b1001100110: color_data = 12'b000010111001;//6 turquoise green
        10'b1001100111: color_data = 12'b000010111001;//7 turquoise green
        10'b1001101000: color_data = 12'b0;//8
        10'b1001101001: color_data = 12'b0;//9
        10'b1001101010: color_data = 12'b000010000111;//10 dark green
        10'b1001101011: color_data = 12'b000010000111;//11 dark green
        10'b1001101100: color_data = 12'b000010000111;//12 dark green
        10'b1001101101: color_data = 12'b000010000111;//13 dark green
        10'b1001101110: color_data = 12'b0;//14
        10'b1001101111: color_data = 12'b0;//15

        10'b1010000000: color_data = 12'b0;//0
        10'b1010000001: color_data = 12'b000010111001;//1 turquoise green
        10'b1010000010: color_data = 12'b000010111001;//2 turquoise green
        10'b1010000011: color_data = 12'b000010111001;//3 turquoise green
        10'b1010000100: color_data = 12'b000010111001;//4 turquoise green
        10'b1010000101: color_data = 12'b000010111001;//5 turquoise green
        10'b1010000110: color_data = 12'b000010000111;//6 dark green
        10'b1010000111: color_data = 12'b000010000111;//7 dark green
        10'b1010001000: color_data = 12'b000010000111;//8 dark green
        10'b1010001001: color_data = 12'b0;//9
        10'b1010001010: color_data = 12'b0;//10
        10'b1010001011: color_data = 12'b000010000111;//11 dark green
        10'b1010001100: color_data = 12'b000010000111;//12 dark green
        10'b1010001101: color_data = 12'b000010000111;//13 dark green
        10'b1010001110: color_data = 12'b0;//14

        10'b1010100001: color_data = 12'b0;//1
        10'b1010100010: color_data = 12'b000010000111;//2 dark green
        10'b1010100011: color_data = 12'b000010000111;//3 dark green
        10'b1010100100: color_data = 12'b000010000111;//4 dark green
        10'b1010100101: color_data = 12'b000010000111;//5 dark green
        10'b1010100110: color_data = 12'b000010000111;//6 dark green
        10'b1010100111: color_data = 12'b000010000111;//7 dark green
        10'b1010101000: color_data = 12'b000010000111;//8 dark green
        10'b1010101001: color_data = 12'b000010000111;//9 dark green
        10'b1010101010: color_data = 12'b0;//10
        10'b1010101011: color_data = 12'b0;//11
        10'b1010101100: color_data = 12'b0;//12
        10'b1010101101: color_data = 12'b0;//13
        10'b1010101110: color_data = 12'b0;//14

        10'b1011000010: color_data = 12'b0;//2
        10'b1011000011: color_data = 12'b0;//3
        10'b1011000100: color_data = 12'b0;//4
        10'b1011000101: color_data = 12'b0;//5
        10'b1011000110: color_data = 12'b0;//6
        10'b1011000111: color_data = 12'b0;//7
        10'b1011001000: color_data = 12'b0;//8
        10'b1011001001: color_data = 12'b000010000111;//9 dark green
        10'b1011001010: color_data = 12'b0;//10
        10'b1011001101: color_data = 12'b0;//13
        10'b1011001110: color_data = 12'b0;//14

        10'b1011101000: color_data = 12'b0;//8
        10'b1011101001: color_data = 12'b0;//9
        10'b1011101010: color_data = 12'b0;//10
        10'b1011101011: color_data = 12'b0;//11
        10'b1011101101: color_data = 12'b0;//13
        10'b1011101110: color_data = 12'b0;//14
        10'b1011101111: color_data = 12'b0;//15
        10'b1011110000: color_data = 12'b0;//16

		default: color_data = 12'b111111111111;
	endcase
	else
	   color_data = 12'b0;
endmodule
