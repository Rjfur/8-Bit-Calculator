`begin_keywords "1800-2012" // Use keyword list from SystemVerilog-2012.
module top; // Top level module connecting the testbench to the DUT.
timeunit 1ns/1ps; // Delays are in nano-seconds, with 3-decimal place accuracy.

logic[7:0] A, B; 
logic BTNC, clk;
logic[15:0] out;
logic[3:0] mode;

test tb1 (
    .A(A),
    .B(B),
    .mode(mode),
    .BTNC(BTNC),
    .result(out),
    .clk(clk)
); // Instantiate the testbench.

calc_top dut (
    .A(A),
    .B(B),
    .BTN_ADD(mode[0]),
    .BTN_SUB(mode[1]),
    .BTN_MUL(mode[2]),
    .BTN_DIV(mode[3]),
    .BTNC(BTNC),
    .CLK100MHZ(clk),
    .out(out)
); // Instantiate the DUT.

initial // Generate the clock.
  begin
    clk <= 0; // Ititial value of simulation clock is 0.
    forever #10 clk = ~clk; // Simulation clock period is 10ns.
  end

endmodule: top
`end_keywords