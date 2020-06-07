`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:47:54 05/08/2020
// Design Name:   RootAlgorithm
// Module Name:   D:/Program/Xilinx/Example5/SimulationRoot.v
// Project Name:  Example5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RootAlgorithm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SimulationRoot;

	// Modelue Inputs
	reg i_clk;
	reg i_Reset;
	reg [1:0] i_x;
	
	// Module Outputs
	wire [1:0] o_y;
	
	// Temp value to store Input/Output data
	reg[1:0] X [7:0];
	reg[7:0] Y = 'b0;

	
	// Instantiate the Unit Under Test (UUT)
	RootAlgorithm uut (
		.i_clk(i_clk), 
		.i_Reset(i_Reset), 
		.i_x(i_x), 
		.o_y(o_y)
	);
	
	// Index 
	reg[2:0] Index; 
	
	initial begin
		// Reset Module
		i_clk = 0;
		i_Reset = 1;
		i_x = 0;
		
		#1 i_clk = 1'b1;
		i_Reset = 0;
		#1 i_clk = 1'b0;
		
		
		// Set X = .10220001
		X[0] = 'b01;
		X[1] = 'b00;
		X[2] = 'b00;
		X[3] = 'b00;
		X[4] = 'b10;
		X[5] = 'b10;
		X[6] = 'b00;
		X[7] = 'b01;
	
		// Take each value from X and send it to Module
		for (Index = 'b111; Index > 'b0; Index = Index - 1)
			begin
				i_x = X[Index];
				#1 i_clk = 1'b1;
				i_Reset = 1;
				#1 i_clk = 1'b0;
				Y = (Y << 1) + o_y;
			end
	
			i_x = X[0];
			#1 i_clk = 1'b1;
			#1 i_clk = 1'b0;
			Y = (Y << 1) + o_y;
			
			// Create additional clock cycle, because of delay p = 1
			i_x = 'b0;
			#1 i_clk = 1'b1;
			#1 i_clk = 1'b0;
			Y = (Y << 1) + o_y;
	end
      
endmodule

