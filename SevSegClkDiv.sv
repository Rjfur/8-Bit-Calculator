`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2019 11:16:45 AM
// Design Name: 
// Module Name: SevSegClkDiv
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
//clock source of 100MHZ we need 1ms-16ms refresh rate for LEDs
//1KHZ-60HZ

module SevSegClkDiv(
    input  wire clk,
    output reg clk_div = 0
    );
    
    localparam division_val = 4999; // 60hz? //10khz
    integer counter = 0;
    
    always @(posedge clk)
    begin
       if (counter == division_val)
            counter <= 0;
        else
            counter <= counter + 1;
    end 
   
   //Divide clock
   always @(posedge clk)
   begin
        if (counter == division_val)
            clk_div <= ~clk_div; //flip the signal
        else 
            clk_div <= clk_div; //store value
   end
endmodule
