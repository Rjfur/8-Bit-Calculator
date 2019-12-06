`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2019 11:53:13 AM
// Design Name: 
// Module Name: TopLevel_SevSegDriver
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


module TopLevel_SevSegDriver(
    input wire CLK,
    input wire[7:0] SW_Right,
    input wire[7:0] SW_Left,
    output wire[6:0] CA,
    output wire[7:0] AN,
    output wire [7:0] LED_Right,
    output wire [7:0] LED_Left
    );
    
    //wire clkdiv;
    wire refresh_clk;
    wire [3:0] one_r;
    wire [3:0] ten_r;
    wire [3:0] hundred_r;
    wire [3:0] one_l;
    wire [3:0] ten_l;
    wire [3:0] hundred_l;
    wire[2:0] refreshcounter;
    wire [3:0] BCD_IN;
    //wire [3:0] user_val  = "0000";
    
    assign LED_Right = SW_Right;
    assign LED_Left = SW_Left;
    
//wrapper for clock divider
SevSegClkDiv CLKDIVIDER (
.clk(CLK),
.clk_div(refresh_clk)
);

//wrapper for refreshcounter
RefreshCounter REFRESH (
.refresh_clk(refresh_clk),
.refresh_count(refreshcounter)
);

//wrapper for Binary to BCD
Binary_to_BCD BINtoBCD(
.clk(refresh_clk),
.Rightbitval(SW_Right),
.Leftbitval(SW_Left),  
.ones_r(one_r),
.tens_r(ten_r),
.hundreds_r(hundred_r), 
.ones_l(one_l),      
.tens_l(ten_l),    
.hundreds_l(hundred_l) 
);

//wrapper for seven seg controller
SevSegController CONTROLLER(
.ones_r(one_r),
.tens_r(ten_r),
.hundreds_r(hundred_r),
.ones_l(one_l),
.tens_l(ten_l),
.hundreds_l(hundred_l),
.refcounter(refreshcounter),
.Cath_out(BCD_IN),
.An_out(AN)  
);   

//wrapper for decoder
SvSegDecoder DECODER(
.BCD(BCD_IN),
.Decode(CA)
);
endmodule
