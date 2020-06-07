`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:11:21 03/18/2020 
// Design Name: 
// Module Name:    Main 
// Project Name: 	 Example3
// Target Devices: 
// Tool versions: 
// Description: 	Simple project for testing and having experients in
//							creating some system for FPGA
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
	output[7:0] o_LED,
	output[3:0] o_Segment,
	output[7:0] o_SevenSegmentDisplay
    );
	 
	reg[7:0] r_Switch = 'b0;
	reg[3:0] r_Segment = 'b1110;
	reg[7:0] r_SevenSegmentDisplay = 7'b0110000;
	reg[15:0] r_Delay = 'b0;
	
	function[7:0] getNumber;
		input [3:0] i_State;
		begin
			case (i_State)
				4'b0000	:	getNumber = 8'b11000000;
				4'b0001	:	getNumber = 8'b11111001;
				4'b0010	:	getNumber = 8'b10100100;
				4'b0011	:	getNumber = 8'b10110000;
				4'b0100	:	getNumber = 8'b10011001;
				4'b0101	:	getNumber = 8'b10010010;
				4'b0110	:	getNumber = 8'b10000010;
				4'b0111	:	getNumber = 8'b11111000;
				
				4'b1000	:	getNumber = 8'b10000000;
				4'b1001	:	getNumber = 8'b10010000;
				4'b1010	:	getNumber = 8'b10001000;
				4'b1011	:	getNumber = 8'b10000011;
				4'b1100	:	getNumber = 8'b11000110;
				4'b1101	:	getNumber = 8'b10100001;
				4'b1110	:	getNumber = 8'b10000110;
				4'b1111	:	getNumber = 8'b10001110;
			endcase
		end
	endfunction
	
	// This block show LOW BYTE in Seven Segment Dispalay if counter_State == 0 else 
	//		it show HIGH BYTE
	always @(posedge i_clk)
		begin
			if ((r_Delay & 16'b1000000000000000) == 'b0)
				begin
					r_Segment = 4'b1110;
					
					r_SevenSegmentDisplay = getNumber(r_Switch);
				end
			else 
				begin
					r_Switch = r_Switch >> 4;
					r_Segment = 4'b1101;
					
					r_SevenSegmentDisplay = getNumber(r_Switch);
				end
				
			r_Switch = i_Switch;
			r_Delay = r_Delay + 1'b1;
		end
		
	 
	//Just show turn Up switchs in array of leds
	assign o_LED = r_Switch;
	assign o_Segment = r_Segment;
	assign o_SevenSegmentDisplay = r_SevenSegmentDisplay;

endmodule


