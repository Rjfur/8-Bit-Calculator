`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2019 07:53:38 PM
// Design Name: 
// Module Name: SvSegDecoder
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


module SvSegDecoder(
    input   [3:0] BCD,
    output reg [6:0] Decode
    );
    
    always @(BCD)
        case(BCD)
        4'b0000: Decode = 7'b100_0000;  //0
        4'b0001: Decode = 7'b111_1001;  //1
        4'b0010: Decode = 7'b010_0100;  //2
        4'b0011: Decode = 7'b011_0000;  //3
        4'b0100: Decode = 7'b001_1001;  //4
        4'b0101: Decode = 7'b001_0010;  //5
        4'b0110: Decode = 7'b000_0010;  //6
        4'b0111: Decode = 7'b111_1000;  //7
        4'b1000: Decode = 7'b000_0000;  //8
        4'b1001: Decode = 7'b001_0000;  //9
        4'b1010: Decode = 7'b000_1000;  //A
        4'b1011: Decode = 7'b000_0011;  //B
        4'b1100: Decode = 7'b100_0110;  //C
        4'b1101: Decode = 7'b010_0001;  //D
        4'b1110: Decode = 7'b000_0110;  //E
        4'b1111: Decode = 7'b000_1110;  //F
            default: Decode = 7'b000_0000;
        endcase
endmodule
