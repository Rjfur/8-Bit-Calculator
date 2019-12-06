`begin_keywords "1800-2012" // Use keyword list from SystemVerilog-2012.
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2019 06:57:18 PM
// Design Name: 
// Module Name: subtractor
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


module subtractor(
    input [7:0] A,
    input [7:0] B,
    output [8:0] out
    );
    
timeunit 1ns/1ps; // Delays are in nano-seconds, with 3-decimal place accuracy.

assign out = A - B;

endmodule: subtractor

`end_keywords