`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:44:10 04/17/2020
// Design Name:   Main
// Module Name:   D:/Program/Xilinx/Example7/Simulation.v
// Project Name:  Example7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Simulation;

	// Inputs
	reg i_clk;
	reg [7:0] i_Switch;

	// Outputs
	wire [7:0] o_LED;
	wire HSYNC;
	wire VSYNC;
	wire [2:0] o_Red;
	wire [2:0] o_Green;
	wire [1:0] o_Blue;

	// Instantiate the Unit Under Test (UUT)
	Main uut (
		.i_clk(i_clk), 
		.i_Switch(i_Switch), 
		.o_LED(o_LED), 
		.HSYNC(HSYNC), 
		.VSYNC(VSYNC), 
		.o_Red(o_Red), 
		.o_Green(o_Green), 
		.o_Blue(o_Blue)
	);
	
	
	integer i = 0;

	initial begin
		// Initialize Inputs
		i_clk = 0;
		i_Switch = 0;
		
		
		for (i = 0; i < 2000000000; i = i + 1)
			#20 i_clk = ~i_clk;

		// Wait 100 ns for global reset to finish
        
		// Add stimulus here

	end
      
endmodule

