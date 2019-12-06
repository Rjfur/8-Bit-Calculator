`begin_keywords "1800-2012"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2019 07:07:55 PM
// Design Name: 
// Module Name: calc_top
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


module calc_top(
    input [7:0] A,
    input [7:0] B,
    input BTN_ADD,
    input BTN_SUB,
    input BTN_MUL,
    input BTN_DIV,
    input BTNC,
    input CLK100MHZ,
    output [15:0] out
    );
    
    timeunit 1ns/1ps;
    
    logic[8:0] add_out, sub_out;
    logic[15:0] mul_out, div_out;
    logic[4:0] button_sel;
    logic[15:0] mux_out;
    logic reg_en;
    
    
adder add_instance (
.A(A),
.B(B),
.out(add_out)
);

subtractor sub_instance (
.A(A),
.B(B),
.out(sub_out)
);

multiplier_ip mul_instance (
.A(A),
.B(B),
.P(mul_out)
);

divider_ip div_instance (
.aclk(CLK100MHZ),
.s_axis_dividend_tdata(A),
.s_axis_divisor_tdata(B),
.m_axis_dout_tdata(div_out)
);

register reg_instance (
.clk(CLK100MHZ),
.en(reg_en),
.d(mux_out),
.q(out)
);
    //adder add_instance(A, B, add_out);
    //subtractor sub_instance(A, B, sub_out);
    //multiplier_ip mul_instance(A, B, mul_out);
    //divider_ip div_instance(A, B, div_out);
    
    // mux to select 
    assign button_sel = {BTNC, BTN_DIV, BTN_MUL, BTN_SUB, BTN_ADD};
    //assign out = mux_out;
    
    assign reg_en = BTNC | BTN_DIV | BTN_MUL | BTN_SUB | BTN_ADD;
    
    always_comb
    begin
        case(button_sel)
            5'b00001 : mux_out = add_out;
            5'b00010 : mux_out = sub_out;
            5'b00100 : mux_out = mul_out;
            5'b01000 : mux_out = div_out;
            default : mux_out = add_out;
        endcase
    end
    
// structural
// A and B connect to adder, subtractor, multiplier, divider

// each has an output
// selected (mux) by push buttons
//  ??? might need encoder (one hot to binary)
// register to save output, only enabled when button is pressed
// output of register goes to 7 seg decoder   
    
endmodule: calc_top

`end_keywords