`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2019 06:48:11 PM
// Design Name: 
// Module Name: RefreshCounter
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


module RefreshCounter(
input refresh_clk,
output reg [2:0] refresh_count = 0

    );
    always@(posedge refresh_clk)
    begin
    refresh_count <= refresh_count + 1;
    end
endmodule
