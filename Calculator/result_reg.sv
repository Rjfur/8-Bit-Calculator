`begin_keywords "1800-2012"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2019 05:53:24 PM
// Design Name: 
// Module Name: result_reg
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


module register(
    input logic clk,
    input logic en,
    input logic [15:0] d,
    output logic [15:0] q);

timeunit 1ns/1ps; // Delays are in nano-seconds, with 3-decimal place accuracy.

always_ff @(posedge clk)
    if (en)
        q <= d;
endmodule: register

`end_keywords