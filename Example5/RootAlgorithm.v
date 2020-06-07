`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:21:09 03/25/2020 
// Design Name: 
// Module Name:    RootAlgorithm 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 	 Create practice realization of Our root algorithm
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module RootAlgorithm(
	input i_clk,								// Input Clock signal
	input i_Reset,								// Input Reset signal
	input[1:0] i_x,							// Input X value
	output reg[1:0] o_y						// Output Y (Result)
    );

	
	// Parameters below are the same as algorithm	
	reg[7:0] H;
	reg[7:0] R;
	reg[7:0] Y;
	reg[7:0] shiftReg;					// This reg state for value 2^(-i)
	
	// Set to parameters staring value, Equation (2)
	initial
		begin
			H = 'b0;
			R = 'b0;
			Y = 'b0;
			o_y = 'b0;
			shiftReg = 'b10000000;		// Set reg into start value 2^(-1)
		end
	
	// Some wire for calculation Equation (4), (5)
	wire[7:0] w_Equation2 = Y + shiftReg[7:1];
	wire[7:0] w_Equation3 = {Y + shiftReg, 1'b0};


	// Equation (3)
	always @(posedge i_clk)
		begin
			H = {(R + {i_x, 4'b0}), 1'b0};
		end
		
		
	// All functionality are the same as in equations (5), (6)
	always @(negedge i_clk)
		begin
			if (!i_Reset)				// Reset module
				begin
					R = 'b0;
					Y = 'b0;
					shiftReg = 'b10000000;
				end
			else
				begin
										
					if (H < w_Equation2)					// Check second system equation border
						begin									//		 if it less then calculate first equation
							o_y = 2'b00;
							R = H;
						end
					else
						if (H < w_Equation3)				// Check third system equation border,
							begin								//		 if it less then calculate second equation
								o_y = 2'b01;
								R = H - w_Equation2;
								Y = Y + shiftReg;
							end
						else
							begin								// Otherwise calculate third equation
								o_y = 2'b10;
								R = H - w_Equation3;
								Y = Y + {shiftReg[6:0], 1'b0};
							end
					
					shiftReg = shiftReg >> 1;
				end
			
		end	
		
endmodule















