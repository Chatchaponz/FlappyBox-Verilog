`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 12:42:56 AM
// Design Name: 
// Module Name: obstacle_manager
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

module obstacle_manager(
    input wire clk, reset,
    input wire [9:0] o1_x, o2_x, o3_x, o4_x, // x position of all obstacles
    input wire [9:0] p_y,p_x,
    input wire game_en,
    output wire score_get,                   // output signal asserted when getting a score
    output wire [3:0]enable                  // enable signal tell each obstacle to start moving
    );
    
    //enable signal register
    reg [3:0]enable_reg; // this enable is like reset signal : 0 is enable 1 is disable 
    
    //score register
    reg score_reg;
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
        begin
            enable_reg = 15; //disable all
            score_reg = 0;
        end
        else
            begin
            //queue each obstacle by x position of obstacle ahead
            if(((o4_x <= 505 && o1_x > o4_x)||(o4_x > o1_x)||(o4_x == o1_x))&& game_en)
                enable_reg[0] = 0; //enable obstacle 1
                
            if(((o1_x <= 505 && o2_x > o1_x)||(o1_x > o2_x))&& game_en)
                enable_reg[1] = 0; //enable obstacle 2
                
            if(((o2_x <= 505 && o3_x > o2_x)||(o2_x > o3_x))&& game_en)
                enable_reg[2] = 0; //enable obstacle 3
                
            if(((o3_x <= 505 && o4_x > o3_x)||(o3_x > o4_x))&& game_en)
                enable_reg[3] = 0; //enable obstacle 4
            
            //when player jump pass each one of obstacle, they will get a score
            if( game_en && ( (p_x-3 == o1_x)  || (p_x-3 == o2_x) || (p_x-3 == o3_x) || (p_x-3 == o4_x) ) )
            begin
                score_reg = 1;
            end
               else
                score_reg = 0;
 
            end
    end
    
    // assign output     
    assign enable = enable_reg;
    assign score_get = score_reg;
endmodule
