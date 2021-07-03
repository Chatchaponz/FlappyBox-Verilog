`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2020 09:43:18 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
        input wire clk, hard_reset,                             // clk - board clock 100 MHz || hard_reset - switch R2 (left side of board)
        input wire btnU,btnC,                                   // btnU - center button || up button
        input wire [7:0]sw,                                     // sw - switch W13 -> V17 (right side of board)
        input wire diff,diff2,                                  // diff - switch T1 - hard difficulty 1 incresing speed (left side of board)
                                                                // diff2 - switch V1 - hard difficulty 2 show dark color plate in middle of the screen (left side of board)
        output wire [6:0] seven_seg,                            // seven segment light
        output wire [3:0] an,                                   // an anode activate
        output wire hsync,vsync,                                // horizontal sync and vertical sync for VGA
        output wire [11:0] rgb                                  // 12 bits RGB output 
    );
    wire game_reset;                                             // route signal to trigger reset in other modules from inside game_state_machine
    localparam idle = 2'b01;                                     // symbolic state constant representing game state idle
	localparam gameover = 2'b11;                                 // symbolic state constant representing game state gameover
    wire [1:0] game_state;                                       // route current game state from game_state_machine
    wire game_en;                                                // route signal conveying is game is enabled (playing mode)
    wire reset;                                                  // reset signal
    assign reset = hard_reset || game_reset;                     // assert reset when either hard_reset or game_reset are asserted
    wire [9:0] x, y;                                             // location of VGA pixel
	wire video_on, pixel_tick;                                   // route VGA signals
	reg [11:0] rgb_reg, rgb_next;                                // RGB data register to route out to VGA DAC
	wire [9:0] p_x, p_y;                                         // vector to route player's x/y location
	wire [9:0] o1_x, S_H1;                                       // vector to route obstacle1's x/y location and save zone height
	wire [9:0] o2_x, S_H2;                                       // vector to route obstacle2's x/y location and save zone height
	wire [9:0] o3_x, S_H3;                                       // vector to route obstacle3's x/y location and save zone height
    wire [9:0] o4_x, S_H4;                                       // vector to route obstacle4's x/y location and save zone height
	
	reg [11:0] player_rgb,obstacle1_rgb,                         // RGB regs for various sprite units, to route RGB data to VGA circuit
	           obstacle2_rgb,obstacle3_rgb,obstacle4_rgb,
	           bg_rgb,gameover_rgb,title_rgb,score_rgb,sp_bg_rgb;
	wire [11:0] fix_p_rgb;                                       // RGB for sprite that fixed color
	wire player_on,obstacle1_on,obstacle2_on,obstacle3_on,obstacle4_on     // on signals for various sprite units
	     ,gameover_on,title_on, score_on, sp_bg_on;
	wire collision;                                                        // signal asserted from collision
	                                       
	wire [25:0] speed_offset;                                              // amount of obstacles speed 
	assign speed_offset = diff  ? 3500000 : 2750000 ;	
	
	wire player_up;                                                        
	assign player_up = btnU & game_en;                                     // allow player to push up button only in playing game state 
	
	wire [3:0] enable;                                                     // enable each obstacle to start moving
	
	wire score_get;                                                        // signal asserted from getting a score
	
	
	// instantiate vga_sync circuit
	vga_sync vsync_unit (.clk(clk), .reset(hard_reset), .hsync(hsync), .vsync(vsync),
                         .video_on(video_on), .p_tick(pixel_tick), .x(x), .y(y));                            
    
    // instantiate player sprite circuit
	player player_unit (.clk(clk), .reset(reset),.btnU(player_up), .video_on(video_on), .x(x), .y(y), .skin_select(sw[5:3]),
				        .original_skin(sw[6]),.game_state(game_state),.rgb_out(fix_p_rgb),.player_on(player_on), .p_x(p_x), .p_y(p_y));
	
	// instantiate obstacle manager circuit
	obstacle_manager manage_obstacle_unit (.clk(clk), .reset(reset),.o1_x(o1_x), .o2_x(o2_x), .o3_x(o3_x), .o4_x(o4_x),
	                    .p_y(p_y), .game_en(game_en), .enable(enable),.score_get(score_get),  .p_x(p_x));
		
	
	// instantiate obstacle1 sprite circuit
	obstacle1 obstacle_unit_1 (.clk(clk), .reset(enable[0]), .video_on(video_on), .x(x), .y(y), .speed_offset(speed_offset),.p_y(p_y),
				        .original_skin(sw[6]),.obstacle_on(obstacle1_on), .o1_x(o1_x), .S_H1(S_H1));
	
	// instantiate obstacle2 sprite circuit
	obstacle2 obstacle_unit_2 (.clk(clk), .reset(enable[1]), .video_on(video_on), .x(x), .y(y), .speed_offset(speed_offset),.p_y(p_y),
				        .original_skin(sw[6]),.o1_x(o1_x), .obstacle_on(obstacle2_on), .o2_x(o2_x), .S_H2(S_H2));	
				        
    // instantiate obstacle3 sprite circuit
	obstacle3 obstacle_unit_3 (.clk(clk), .reset(enable[2]), .video_on(video_on), .x(x), .y(y), .speed_offset(speed_offset),.p_y(p_y),
				        .original_skin(sw[6]),.o2_x(o2_x), .obstacle_on(obstacle3_on), .o3_x(o3_x), .S_H3(S_H3));
    
    // instantiate obstacle4 sprite circuit
	obstacle4 obstacle_unit_4 (.clk(clk), .reset(enable[3]), .video_on(video_on), .x(x), .y(y), .speed_offset(speed_offset),.p_y(p_y),
				        .original_skin(sw[6]),.o3_x(o3_x), .obstacle_on(obstacle4_on), .o4_x(o4_x), .S_H4(S_H4));
				        
	// instantiate collision detection circuit
	collision collision_unit (.p_x(p_x), .p_y(p_y), .o1_x(o1_x), .S_H1(S_H1), .o2_x(o2_x), .S_H2(S_H2), 
	                    .o3_x(o3_x), .S_H3(S_H3), .o4_x(o4_x), .S_H4(S_H4), .collision(collision));
     
    // instantate game FSM circuit
	game_state_machine game_FSM (.clk(clk), .hard_reset(hard_reset),.start(btnC),.up(btnU),.collision(collision),
	                             .game_state(game_state),.game_en(game_en),.game_reset(game_reset)); 
    
    // instantate score display circuit
    score_display score_display_unit (.clk(clk), .reset(reset), .game_en(game_en),
                                      .p_x(p_x), .x(x), .y(y), .seven_seg(seven_seg), .an(an),.score_get(score_get),.game_state(game_state),
                                      .score_on(score_on));
    
    // instantiate gameover display circuit
	gameover_display gameover_display_unit (.clk(clk), .x(x), .y(y), .gameover_on(gameover_on)); 
	
    // instantiate game title display circuit
	game_title game_title_display_unit (.clk(clk), .x(x), .y(y), .title_on(title_on));  
	
	// instantiate space background display circuit
	space_bg_display space_bg_display_unit (.clk(clk), .x(x), .y(y), .sp_bg_on(sp_bg_on));                                
    
    //  *** RGB multiplexing circuit ***
	// routes correct RGB data for each theme and each rom depending on video_on, < >_on signals, and game_state signal
    	always @*
		  begin
		      //theme and color
		      case(sw[2:0])
		      3'b000: // original theme black and white
		      begin
		      player_rgb = (sw[5:3] == 3'b101 || sw[5:3] == 3'b110 || sw[5:3] == 3'b111) && !sw[6] ? fix_p_rgb : 12'b0;
		      obstacle1_rgb = 12'b0;
		      obstacle2_rgb = 12'b0;
		      obstacle3_rgb = 12'b0;
		      obstacle4_rgb = 12'b0;
		      gameover_rgb = 12'b0;
		      title_rgb = 12'b0;
		      score_rgb = 12'b0;
		      sp_bg_rgb = 12'b0;
		      bg_rgb = 12'b111111111111;
		      end
		      3'b001: // invert black and white theme
		      begin 
		      player_rgb = (sw[5:3] == 3'b101 || sw[5:3] == 3'b110 || sw[5:3] == 3'b111) && !sw[6] ? fix_p_rgb : ~12'b0;
		      obstacle1_rgb = ~12'b0;
		      obstacle2_rgb = ~12'b0;
		      obstacle3_rgb = ~12'b0;
		      obstacle4_rgb = ~12'b0;
		      gameover_rgb = ~12'b0;
		      title_rgb = ~12'b0;
		      score_rgb = ~12'b0;
		      sp_bg_rgb = ~12'b0;
		      bg_rgb = ~12'b111111111111;
		      end
		      3'b010: // light blue and dark blue theme
		      begin
		      player_rgb =  (sw[5:3] == 3'b101 || sw[5:3] == 3'b110 || sw[5:3] == 3'b111) && !sw[6] ? fix_p_rgb : 12'b000000001111;
		      obstacle1_rgb = 12'b000000001111;
		      obstacle2_rgb = 12'b000000001111;
		      obstacle3_rgb = 12'b000000001111;
		      obstacle4_rgb = 12'b000000001111;
		      gameover_rgb = 12'b000000001111;
		      title_rgb = 12'b000000001111;
		      score_rgb = 12'b000000001111;
		      sp_bg_rgb = 12'b000000001111;
		      bg_rgb = 12'b001111111111;
		      end
		      3'b011: // light pink and dark pink theme
		      begin
		      player_rgb =  (sw[5:3] == 3'b101 || sw[5:3] == 3'b110 || sw[5:3] == 3'b111) && !sw[6] ? fix_p_rgb : 12'b111100100111;
		      obstacle1_rgb = 12'b111100100111;
		      obstacle2_rgb = 12'b111100100111;
		      obstacle3_rgb = 12'b111100100111;
		      obstacle4_rgb = 12'b111100100111;
		      gameover_rgb = 12'b111100100111;
		      title_rgb = 12'b111100100111;
		      score_rgb = 12'b111100100111;
		      sp_bg_rgb = 12'b111100100111;
		      bg_rgb = 12'b111110101111;
		      end
		      3'b100: // pastel green and purple theme
		      begin
		      player_rgb =  (sw[5:3] == 3'b101 || sw[5:3] == 3'b110 || sw[5:3] == 3'b111) && !sw[6] ? fix_p_rgb : 12'b011000111001;
		      obstacle1_rgb = 12'b011000111001;
		      obstacle2_rgb = 12'b011000111001;
		      obstacle3_rgb = 12'b011000111001;
		      obstacle4_rgb = 12'b011000111001;
		      gameover_rgb = 12'b011000111001;
		      title_rgb = 12'b011000111001;
		      score_rgb = 12'b011000111001;
		      sp_bg_rgb = 12'b011000111001;
		      bg_rgb = 12'b011011101000;
		      end
		      3'b101: // pastel blue and brown theme
		      begin
		      player_rgb =  (sw[5:3] == 3'b101 || sw[5:3] == 3'b110 || sw[5:3] == 3'b111) && !sw[6] ? fix_p_rgb : 12'b011001000011;
		      obstacle1_rgb = 12'b011001000011;
		      obstacle2_rgb = 12'b011001000011;
		      obstacle3_rgb = 12'b011001000011;
		      obstacle4_rgb = 12'b011001000011;
		      gameover_rgb = 12'b011001000011;
		      title_rgb = 12'b011001000011;
		      score_rgb = 12'b011001000011;
		      sp_bg_rgb = 12'b011001000011;
		      bg_rgb = 12'b011010111011;
		      end
		      3'b110: // pastel pink and purple theme
		      begin
		      player_rgb = (sw[5:3] == 3'b101 || sw[5:3] == 3'b110 || sw[5:3] == 3'b111) && !sw[6] ? fix_p_rgb : 12'b110001010110;
		      obstacle1_rgb = 12'b110101110111;
		      obstacle2_rgb = 12'b110101110111;
		      obstacle3_rgb = 12'b110101110111;
		      obstacle4_rgb = 12'b110101110111;
		      gameover_rgb = 12'b110001010110;
		      title_rgb = 12'b110001010110;
		      score_rgb = 12'b110001010110;
		      sp_bg_rgb = 12'b110001010110;
		      bg_rgb = 12'b101111001111;
		      end
		      3'b111: // neon green theme
		      begin
		      player_rgb =  (sw[5:3] == 3'b101 || sw[5:3] == 3'b110 || sw[5:3] == 3'b111) && !sw[6] ? fix_p_rgb : 12'b000010010000;
		      obstacle1_rgb = 12'b000010010000;
		      obstacle2_rgb = 12'b000010010000;
		      obstacle3_rgb = 12'b000010010000;
		      obstacle4_rgb = 12'b000010010000;
		      gameover_rgb = 12'b000010010000;
		      title_rgb = 12'b000010010000;
		      score_rgb = 12'b000010010000;
		      sp_bg_rgb = 12'b000010010000;
		      bg_rgb = 12'b000111111001;
		      end
		      default: // orginal theme
		      begin
		      player_rgb = 12'b0;
		      obstacle1_rgb = 12'b0;
		      obstacle2_rgb = 12'b0;
		      obstacle3_rgb = 12'b0;
		      obstacle4_rgb = 12'b0;
		      gameover_rgb = 12'b0;
		      title_rgb = 12'b0;
		      score_rgb = 12'b0;
		      sp_bg_rgb = 12'b0;
		      bg_rgb = 12'b111111111111;
		      end
		      endcase
		      
		      if (~video_on) // hard_reset is activate
			      rgb_next = 12'b0; // black
			      
		      else if(player_on && ( game_en || game_state == idle )) // show player
		          rgb_next = player_rgb;
		          
		      else if(score_on && ( game_en || game_state == gameover )) // show score
		          rgb_next = score_rgb;
		      
		      else if(obstacle1_on && game_en) // show 1st obstacle
		          rgb_next = obstacle1_rgb;
		          
		      else if(obstacle2_on && game_en) // show 2nd obstacle
		          rgb_next = obstacle2_rgb;
		          
		      else if(obstacle3_on && game_en) // show 3rd obstacle
		          rgb_next = obstacle3_rgb;
		          
		      else if(obstacle4_on && game_en) // show 4th obstacle
		          rgb_next = obstacle4_rgb;
		          
		      else if(gameover_on && game_state == gameover && game_state != idle) // show gameover
		          rgb_next = gameover_rgb; // black
		          
		      else if(title_on && game_state == idle) // show title
		          rgb_next = title_rgb;
		          
		      else if (diff2 
		               && (x >= 208 && x <= 210
		               || x >= 212 && x <= 217 
		               || x >= 220 && x <= 460 
		               || x >= 463 && x <= 468
		               || x >= 470 && x <= 472)   
		               && game_en)                   // show title
		          rgb_next = obstacle1_rgb;
		          
		      else if(sp_bg_on && !sw[7] && !sw[6])  // hard difficulty 2 show dark color plate in middle of the screen
		          rgb_next = sp_bg_rgb;
		      else
		          rgb_next = bg_rgb; //white         // plane background
		     
		end
		
      // rgb buffer register
	   always @(posedge clk)
		  if (pixel_tick)
			 rgb_reg <= rgb_next;		
			
	   // output rgb data to VGA DAC
	   assign rgb = rgb_reg;                       
endmodule
