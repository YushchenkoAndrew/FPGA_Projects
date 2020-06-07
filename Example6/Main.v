`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:12:02 04/08/2020 
// Design Name: 
// Module Name:    Main 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Main(
		input i_clk,
		input i_PS2C,
		input i_PS2D,
		output[7:0] o_LED,
		output[7:0] o_SevenSegmentDisplay,
		output[3:0] o_Chosen_Segment
    );
	 
	 
	 reg[23:0] r_Result = 'b0;
	 
	 
	wire[7:0] w_SevenSegmentDisplay;
	wire[3:0] w_Chosen_Segment;
	
	
	 wire[23:0] w_Data;
	 
	 KeyboardDisplay display (
		.i_clk(i_clk),
		.i_Data(r_Result),
		.o_SevenSegmentDisplay(w_SevenSegmentDisplay),
		.o_Chosen_Segment(w_Chosen_Segment)
		 );
	 
	 
	 
	 
	 PS2 ps2 (
		.i_clk(i_clk),
		.i_PS2C(i_PS2C),
		.i_PS2D(i_PS2D),
		.o_Data(w_Data)
	 );
		

	always @(posedge i_clk)
		begin
			r_Result = w_Data;
			
		end
		
	
	
	assign o_LED = w_Data[23:16];
	assign o_SevenSegmentDisplay = w_SevenSegmentDisplay;
	assign o_Chosen_Segment = w_Chosen_Segment;

endmodule


























