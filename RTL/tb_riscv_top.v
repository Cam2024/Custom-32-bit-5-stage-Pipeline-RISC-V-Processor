`timescale 1ns / 1ps
module tb_riscv_top;
	reg clk;
	reg rst_n;

	// Instantiate the Unit Under Test (UUT)
	riscv uut (
		.clk(clk), 
		.rst_n(rst_n)
	);
always #10 clk= ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst_n=1;

	end
    
endmodule
