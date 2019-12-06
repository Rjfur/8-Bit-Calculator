`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2019 08:04:30 PM
// Design Name: 
// Module Name: SevSegController
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


module SevSegController( 
    input  [2:0] refcounter,
    input [3:0] ones_r,
    input [3:0] tens_r,
    input [3:0] hundreds_r,
    input [3:0] thousands_r,
    input [3:0] ones_l,
    input [3:0] tens_l,
    input [3:0] hundreds_l,
    input [3:0] thousands_l,
    output  reg [3:0] Cath_out = 0, //BCD out
    //output  reg [3:0] Cath_out_l = 0, //BCD out
    output  reg [7:0] An_out = 0
    );

  ////////////////////Anode Control /////////////////////////
   always@(refcounter)
   begin
     case(refcounter)
        3'b000:
        An_out = 8'b11111110; //digit 0 ON
        3'b001:
        An_out = 8'b11111101; //digit 1 ON
        3'b010:
        An_out = 8'b11111011; //digit 2 ON
        3'b011:
        An_out = 8'b11110111; //digit 3 ON
        3'b100:
        An_out = 8'b11101111; //digit 4 ON
        3'b101:
        An_out = 8'b11011111; //digit 5 ON
        3'b110:
        An_out = 8'b10111111; //digit 6 ON
        3'b111:
        An_out = 8'b01111111; //digit 7 ON
       
       endcase
        
    end
///////////////////digit box were display on/////////////////////////////////////////////////

//////////////////////// Cathode Control///////////////////////////////
 always@(refcounter)
   begin
     case(refcounter)
        3'b000:
        Cath_out = ones_r; //digit 0 ON
        3'b001:
        Cath_out = tens_r; //digit 1 ON
        3'b010:
        Cath_out = hundreds_r; //digit 2 ON 
        3'b011:
        Cath_out = thousands_r; //digit 3 ON
        3'b100:
        Cath_out = ones_l; //digit 0 ON
        3'b101:
        Cath_out = tens_l; //digit 1 ON
        3'b110:
        Cath_out = hundreds_l; //digit 2 ON 
        3'b111:
        Cath_out = thousands_l; //digit 3 ON
       endcase
    end      
    //number were displaying 
endmodule
