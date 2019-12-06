`begin_keywords "1800-2012" // Use keyword list from SystemVerilog-2012.
program automatic test ( // This is the test bench. It specifies input signals to drive the DUT.
  output logic[7:0] A, B,
  output logic[3:0] mode,
  output logic BTNC,
  input logic[15:0] result, 
  input logic clk
 );
timeunit 1ns/1ps; // Delays are in nano-seconds, with 3-decimal place accuracy.

logic [32:0] errors; // Keep a running total of error count.
logic [32:0] add_errors;    // Keep a running total of errors specifically for addition operator
logic [32:0] sub_errors;    // Keep a running total of errors specifically for subtraction operator
logic [32:0] mul_errors;    // Keep a running total of errors specifically for multiplication operator
logic [32:0] div_errors;    // Keep a running total of errors specifically for division operator
logic[1:0] temp;    // stores random binary value from 1 to 3
initial errors = 32'h00000000; // Initial error count is zero.
initial add_errors = 32'h00000000;
initial sub_errors = 32'h00000000;
initial mul_errors = 32'h00000000;
initial div_errors = 32'h00000000;

logic w, x; // Internal variables.

  initial begin
    repeat (1000) // Run 30 times.
      begin
        @ (posedge clk); // Testbench program code executes in Reactive region to avoid simulation race.

// Genterate random inputs, which will drive DUT at next positive clock edge.
      BTNC = 0;
      A = $urandom_range(255,0);
      B = $urandom_range(255,0);
      temp = $urandom_range(3,0);
      case (temp)
        4'h0 : mode = 4'b0001;
        4'h1 : mode = 4'b0010;
        4'h2 : mode = 4'b0100;
        4'h3 : mode = 4'b1000;
      endcase
      @(posedge clk) check_results; // Delay to the next positive clock edge and verify that output matches
                                    // a calculated expected result.
    end
    @(posedge clk)$finish;
  end

// Verify results
task check_results;
  $display("At %0d: \t a=%x b=%x mode=%d result=%x",
           $time, A, B, mode, result);
  case (mode)
    4'b0001: if (result !== A + B)
            begin
            errors = errors + 1;
            add_errors = add_errors + 1;
            $error("expected A + B = %h", A + B);
            end
    4'b0010: if (result !== A - B)
            begin
            errors = errors + 1;
            sub_errors = sub_errors + 1;
            $error("expected A - B = %d", A - B);
            end
    4'b0100: if (result !== A * B)
            begin
            errors = errors + 1;
            mul_errors = mul_errors + 1;
            $error("expected A * B = %d", A * B);
            end
    4'b1000: if (result !== A / B)
            begin
            errors = errors + 1;
            div_errors = div_errors + 1;
            $error("expected A / B = %d", A / B);
            end
  endcase
endtask

final // This is a "final" block. Its code runs just before the simulation terminates.
   $display("Sim complete w/ %0d add errors, %0d sub errors, %0d mul errors, %0d div errors (%0d TOTAL ERRORS).",
            add_errors, sub_errors, mul_errors, div_errors, errors);  
endprogram: test 
`end_keywords