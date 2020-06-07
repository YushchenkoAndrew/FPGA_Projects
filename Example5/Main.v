`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:00:47 03/24/2020 
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
	input[7:0] i_Switch,
	input[3:0] i_Button,
	output[7:0] o_LED,
	output[7:0] o_SevenSegmentDisplay,
	output[3:0] o_Chosen_Segment
    );
	 
	reg[7:0] r_Switch;
	reg[3:0] r_Button;
	
	
	// Some diclaration for SevenSegmentDisplay Module
	reg CLK = 1'b0;
	
	wire[7:0] w_SevenSegmentDisplay;
	wire[3:0] w_Chosen_Segment;
	
	reg[7:0] r_Result;
	
	SevenSegmentDisplay display (
		.i_clk(i_clk),
		.i_Data({r_Result, 1'b0}),
		.o_SevenSegmentDisplay(w_SevenSegmentDisplay),
		.o_Chosen_Segment(w_Chosen_Segment)
		 );
		 
	// Some diclaration for RootAlgorithm Module
	reg[1:0] r_x = 'b0;
	reg[3:0] CNT = 4'b1000;
	
	reg Reset = 1'b1;
		
	// Output root result 
	wire[1:0] w_y;
	
	RootAlgorithm root (
		.i_clk(CLK),
		.i_Reset(Reset),
		.i_x(r_x),
		.o_y(w_y));
		
	always @(posedge i_clk)
		begin
			CLK = ~CLK;
		end
		 
	always @(negedge i_clk)
		begin
			if (CNT != 4'b1111 && CLK == 'b0)
				begin
					CNT = CNT - 1'b1;
					// Take data (bit after bit) from Switchers
					r_x = CNT[3] ? 'b0 : {1'b0, r_Switch[CNT]};
					
					// Save your result that we get on negedge signal
					r_Result = (r_Result << 1) + w_y;
					
					
					// Set into HIGH level Reset signal if it was LOW
					Reset = 1'b1;
				end				
			
			case (r_Button)
				4'b1000:
					begin
						// Set Reset signal to LOW for Reset parameter in module RootAlgorithm
						Reset = 1'b0;
						r_Result = 0;
						
						//	Set into starting position, after DEC it will be 4'b0111
						//		this is take the seve element of r_Switch
						CNT = 4'b1000;
					end
			endcase
		end
		

	always @(*)
		begin
			r_Switch = i_Switch;
			r_Button = i_Button;
		end
	
	assign o_LED = r_Switch;
	assign o_SevenSegmentDisplay = w_SevenSegmentDisplay;
	assign o_Chosen_Segment = w_Chosen_Segment;
	
endmodule











