`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2020 09:07:29 PM
// Design Name: 
// Module Name: score
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


module score_display(
    input wire clk,reset,
    input wire game_en, 
    input wire [9:0] p_x, x, y,
    input wire score_get,
    input wire [1:0] game_state,
    output reg [6:0] seven_seg,
    output reg [3:0] an,
    output reg score_on
    );
    
    reg [3:0] LED_BCD;
     // Signals for displaying on 7-segment LED of Basys 3 FPGA 
    reg [20:0] refresh_counter; // the first 19-bit for creating 190Hz refresh rate
                                // the other 2-bit for creating 4 LED-activating signals
    wire [1:0] LED_activating_counter; 
    // refreshing the 4-digit 7-segment display on Basys 3 FPGA 
    
    // score register
    reg  [13:0] score, score_next;
    
    // route bcd values out from binary to bcd conversion circuit
	wire [3:0] bcd3, bcd2, bcd1, bcd0;
	
	// instantiate binary to bcd conversion circuit
	binary2bcd bcd_unit (.clk(clk), .reset(reset), .start(score_get),
                         .in(score), .bcd3(bcd3), .bcd2(bcd2), .bcd1(bcd1), .bcd0(bcd0));
    
    // count the score
    always @(posedge clk)
            begin
            score <= score_next;
            end
   		
    always @(posedge score_get or posedge reset)
    begin
        score_next = score;
        if(reset)
          score_next = 0;
        else if(score_get == 1 )
            if(score_next == 9999)      // if score reach max score the stay the same
                score_next = 9999;
            else
                score_next = score + 1;
        else
          score_next = score;
    end
    
    //190Hz refresh rate
    always @(posedge clk or posedge reset)
    begin 
        if(reset==1)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end 
    
    assign LED_activating_counter = refresh_counter[20:19];
    // anode activating signals for 4 LEDs
    // decoder to generate anode signals 
    always @(*)
    begin
        case(LED_activating_counter)
        2'b00: begin
            an = 4'b0111; 
            // activate LED1 and Deactivate LED2, LED3, LED4
            LED_BCD = score/1000;
            // the first digit of the 16-bit number
              end
        2'b01: begin
            an = 4'b1011; 
            // activate LED2 and Deactivate LED1, LED3, LED4
            LED_BCD = (score % 1000)/100;
            // the second digit of the 16-bit number
              end
        2'b10: begin
            an = 4'b1101; 
            // activate LED3 and Deactivate LED2, LED1, LED4
            LED_BCD = ((score % 1000)%100)/10;
            // the third digit of the 16-bit number
                end
        2'b11: begin
            an = 4'b1110; 
            // activate LED4 and Deactivate LED2, LED3, LED1
            LED_BCD = ((score % 1000)%100)%10;
            // the fourth digit of the 16-bit number    
               end
        endcase
        if(reset)
            an = 4'b1111;
    end
    
    // Cathode patterns of the 7-segment LED display 
    always @*
    begin
        case(LED_BCD)
        4'b0000: seven_seg = 7'b0000001; // "0"     
        4'b0001: seven_seg = 7'b1001111; // "1" 
        4'b0010: seven_seg = 7'b0010010; // "2" 
        4'b0011: seven_seg = 7'b0000110; // "3" 
        4'b0100: seven_seg = 7'b1001100; // "4" 
        4'b0101: seven_seg = 7'b0100100; // "5" 
        4'b0110: seven_seg = 7'b0100000; // "6" 
        4'b0111: seven_seg = 7'b0001111; // "7" 
        4'b1000: seven_seg = 7'b0000000; // "8"     
        4'b1001: seven_seg = 7'b0000100; // "9" 
        default: seven_seg = 7'b0000001; // "0"
        endcase
    end
    
    // *** on screen score display ***
	localparam gameover = 2'b11;
	wire [9:0]score_x = game_state == gameover ? 288:16;
	wire [9:0]score_y = game_state == gameover ? 268:16;
	// row and column regs to index numbers_rom
	reg [7:0] row;
	reg [3:0] col;
	
	// output from numbers_rom
	wire color_data;
	
	// infer number bitmap rom
	numbers_rom numbers_rom_unit(.clk(clk), .row(row), .col(col), .color_data(color_data));
	
	// display 4 digits on screen
	always @* 
		begin
		// defaults
		score_on = 0;
		row = 0;
		col = 0;
		
		// if vga pixel within bcd3 location on screen
		if(x >= score_x && x < score_x+16 && y >= score_y && y < score_y+16)
			begin
			col = x - score_x;
			row = y - score_y + (bcd3 * 16); // offset row index by scaled bcd3 value
			if(color_data == 1'b1)      // if bit is 1, assert score_on output
				score_on = 1;
			end
		
		// if vga pixel within bcd2 location on screen
		if(x >= score_x + 16 && x < score_x+32 && y >= score_y && y < score_y+16)
			begin
			col = x - score_x;
			row = y - score_y + (bcd2 * 16); // offset row index by scaled bcd2 value
			if(color_data == 1'b1)      // if bit is 1, assert score_on output
				score_on = 1;
			end
		
		// if vga pixel within bcd1 location on screen
		if(x >= score_x + 32 && x < score_x + 48 && y >= score_y && y < score_y+16)
			begin
			col = x - score_x;
			row = y - score_y + (bcd1 * 16); // offset row index by scaled bcd1 value
			if(color_data == 1'b1)      // if bit is 1, assert score_on output
				score_on = 1;
			end
		
		// if vga pixel within bcd0 location on screen
		if(x >= score_x + 48 && x < score_x + 64 && y >= score_y && y < score_y+16)
			begin
			col = x - score_x;
			row = y - score_y + (bcd0 * 16); // offset row index by scaled bcd0 value
			if(color_data == 1'b1)      // if bit is 1, assert score_on output
				score_on = 1;
			end
			
		end
    
endmodule
