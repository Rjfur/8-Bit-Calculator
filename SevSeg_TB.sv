`timescale 1ns / 1ps


module SevSeg_TB;

/////////////////////////CLOCK DIVIDER TEST/////////////////////////////////
//reg clk = 0;
//wire clk_div;

////wrapper
//SevSegClkDiv UUT(
//.clk(clk),
//.clk_div(clk_div)
//);

//always #5 clk = ~clk; //every 5ns flip signal => 10ns period => 100Mhz

//////////////////////////////////////////////////////////////////////////////
 
 ////////////////////////SevSeg Controller ///////////////////////////////////  

//    reg CLK = 0;
//    reg [7:0] SW=0;
//    wire[6:0] CA;
//    wire[7:0] AN;
//    wire [7:0] LED;
    
//    TopLevel_SevSegDriver UUT(CLK, SW, CA, AN, LED);
//    always #5 CLK = ~CLK;
    
//    initial
//    begin
   
//    #100 SW [3:0] = 4;
//    #400 SW [7:4] = 5;
//    //#700 SW [3:0] = 2;
//    //#100 SW [3:0] = 4;
   
//    end
//////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////Binary to BCD //////////////////////////////////////////////////////
    reg clk = 0;
    reg [7:0] eightbitval=0;
    wire[3:0] ones;
    wire[3:0] tens;
    wire [3:0] hundreds;
    
    Binary_to_BCD UUT (clk, eightbitval, ones, tens, hudnreds);
    
    always #5 clk = ~clk;
    initial begin
        eightbitval = 0;
        #500 eightbitval = 10;
        #500 eightbitval = 250;
        #500 eightbitval = 137;
    end
endmodule
