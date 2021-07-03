`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2020 03:42:00 AM
// Design Name: 
// Module Name: collision
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


module collision(
		input wire [9:0] p_x, p_y,      // player x/y
		input wire [9:0] o1_x, S_H1,    // obstacle1 x and save zone height
		input wire [9:0] o2_x, S_H2,    // obstacle2 x and save zone height
		input wire [9:0] o3_x, S_H3,    // obstacle3 x and save zone height
		input wire [9:0] o4_x, S_H4,    // obstacle4 x and save zone height
		output wire collision           // output signal asserted when obstacle and player collide
    );
    
    // register for collision state
	reg collide;
	       
	always @ *
		begin
		      // default
		      collide = 0;
		      
		      //floor
		      if(p_y + 25 == 480)
		         collide = 1;
	
		      //obstacle1
		      if(((p_x + 20 > o1_x - 29) && ( p_x + 20 < o1_x )
		         && ( (S_H1 > p_y) || (p_y+25 > S_H1+120) ) )
		         || ( (p_x + 20 > o1_x) && (p_x < o1_x )
		         && ( (S_H1 > p_y) || (p_y+25 > S_H1+120) ) ) )
		         collide = 1;
		      
		      //obstacle2
		      if(((p_x + 20 > o2_x - 29) && ( p_x + 20 < o2_x )
		         && ( (S_H2 > p_y) || (p_y+25 > S_H2+120) ) )
		         || ( (p_x + 20 > o2_x) && (p_x  < o2_x )
		         && ( (S_H2 > p_y) || (p_y+25 > S_H2+120) ) ) )
		         collide = 1;
		         
		      //obstacle3
		      if(((p_x + 20 > o3_x - 29) && ( p_x + 20 < o3_x )
		         && ( (S_H3 > p_y) || (p_y+25 > S_H3+120) ) )
		         || ( (p_x + 20 > o3_x) && (p_x  < o3_x )
		         && ( (S_H3 > p_y) || (p_y+25 > S_H3+120) ) ) )
		         collide = 1;
		      
		      //obstacle4
		      if(((p_x + 20 > o4_x - 29) && ( p_x + 20 < o4_x )
		         && ( (S_H4 > p_y) || (p_y+25 > S_H4+120) ) )
		         || ( (p_x + 20 > o4_x) && (p_x  < o4_x )
		         && ( (S_H4 > p_y) || (p_y+25 > S_H4+120) ) ) )
		         collide = 1;     	      
		end
		
    // assert output signal
	assign collision = collide;
endmodule
