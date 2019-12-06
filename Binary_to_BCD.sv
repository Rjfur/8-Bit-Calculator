`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 

// Design Name: 
// Module Name: Binary_to_BCD
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


module Binary_to_BCD(
input clk,
input [7:0] Rightbitval,
input [7:0] Leftbitval,  
output reg [3:0] ones_r =0,
output reg [3:0] tens_r =0,
output reg [3:0] hundreds_r =0, 
output reg [3:0] ones_l =0,      
output reg [3:0] tens_l =0,    
output reg [3:0] hundreds_l =0 
 
  ); 
 reg [3:0] i =0;                
 reg [19:0] shift_reg_right = 0;
 
 reg [3:0] j =0;                
 reg [19:0] shift_reg_left = 0;//temp registers 
 
 reg [3:0] temp_ones_r =0;
 reg [3:0] temp_tens_r =0;  
 reg [3:0] temp_hundreds_r =0;
 
 reg [3:0] temp_ones_l =0;    
 reg [3:0] temp_tens_l =0;    
 reg [3:0] temp_hundreds_l =0;
 
 reg [7:0] current_val_r = 0;
  reg [7:0] current_val_l = 0;
  
  // for loop running on clock
  ////////////////////////////////////Right////////////////////////////////////////////////////////
 always @ (posedge clk)
 begin 
    if (i ==0 &(current_val_r != Rightbitval)) begin
        shift_reg_right = 20'd0;
 
        current_val_r = Rightbitval;
        shift_reg_right[7:0] = Rightbitval;
        temp_ones_r =shift_reg_right[11:8];    
        temp_tens_r =shift_reg_right[15:12];    
        temp_hundreds_r =shift_reg_right[19:16];
        i = i+1;
 
 end
 if (i < 9 & i >0) begin
    //check if greater than 5  
    if (temp_hundreds_r >=5) temp_hundreds_r = temp_hundreds_r+3;
    if (temp_tens_r >=5) temp_tens_r = temp_tens_r+3;
    if (temp_ones_r >=5) temp_ones_r = temp_ones_r+3;
    
    //put hunds tens and ones into shift reg
    shift_reg_right [19:8] = {temp_hundreds_r,temp_tens_r,temp_ones_r};
    //shift left by 1
    shift_reg_right = shift_reg_right <<1;
    //set new vals to tmp
    temp_ones_r =shift_reg_right[11:8];     
    temp_tens_r =shift_reg_right[15:12];    
    temp_hundreds_r =shift_reg_right[19:16];
    i=i+1;
 end
if (i==9) begin
    i=0;
    //assign temp values to the actual oputputs
    ones_r = temp_ones_r;
    tens_r = temp_tens_r;
    hundreds_r = temp_hundreds_r;
 end
end
//////////////////////////////////////////////////////////////////////////////////
///////////////////////////Left////////////////////////////////////////////////////
 always @ (posedge clk)
 begin 
    if (j ==0 &(current_val_l != Leftbitval)) begin
        shift_reg_left = 20'd0;
 
        current_val_l = Leftbitval;
        shift_reg_left[7:0] = Leftbitval;
        temp_ones_l =shift_reg_left[11:8];    
        temp_tens_l =shift_reg_left[15:12];    
        temp_hundreds_l =shift_reg_left[19:16];
        j = j+1;
 
 end
 if (j < 9 & j >0) begin
    //check if greater than 5  
    if (temp_hundreds_l >=5) temp_hundreds_l = temp_hundreds_l+3;
    if (temp_tens_l >=5) temp_tens_l = temp_tens_l+3;
    if (temp_ones_l >=5) temp_ones_l = temp_ones_l+3;
    
    //put hunds tens and ones into shift reg
    shift_reg_left [19:8] = {temp_hundreds_l,temp_tens_l,temp_ones_l};
    //shift left by 1
    shift_reg_left = shift_reg_left <<1;
    //set new vals to tmp
    temp_ones_l =shift_reg_left[11:8];     
    temp_tens_l =shift_reg_left[15:12];    
    temp_hundreds_l =shift_reg_left[19:16];
    j=j+1;
 end
if (j==9) begin
    j=0;
    //assign temp values to the actual oputputs
    ones_l = temp_ones_l;
    tens_l = temp_tens_l;
    hundreds_l = temp_hundreds_l;
 end
end
endmodule
