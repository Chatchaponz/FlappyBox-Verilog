module gameover_display
    (
        input wire clk,             // input clock signal for synchronous rom
        input wire [9:0] x, y,      // current pixel coordinates from vga_sync circuit
        output wire gameover_on     // output signal asserted when x/y are within gameover on display
    );
	
	// vectors to index gameover_rom
	wire [5:0] row;
	wire [8:0] col;
	wire [11:0] rgb_out;
	
	assign row = y - 217;
	assign col = x - 140;
	
	// assert gameover_on when vga x/y is located within gameover logo on screen and color_data doesn't equal black color
	assign gameover_on = (x >= 140 && x < 499 && y >= 217 && y < 263 && rgb_out != 12'b0) ? 1 : 0;
	
	// instantiate gameover_rom
	gameover_rom gameover_rom_unit (.clk(clk), .row(row), .col(col), .color_data(rgb_out));

endmodule