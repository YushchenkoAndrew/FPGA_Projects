`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:05:14 03/19/2020 
// Design Name: 
// Module Name:    SevenSegmentDisplay 
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
module SevenSegmentDisplay(
		input i_clk,
		input[15:0] i_Data,
		output[3:0] o_Chosen_Segment,
		output[7:0] o_SevenSegmentDisplay
    );

	reg[3:0] r_Chosen_Segment = 'b1110;
	reg[7:0] r_SevenSegmentDisplay = 7'b0110000;
	reg[15:0] r_Data = 'b0;
	
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
			r_Chosen_Segment = {r_Chosen_Segment[2:0], 1'b1};
			r_Data = r_Data >> 4;
			
			if (r_Chosen_Segment == 4'b1111)
				begin
					r_Chosen_Segment = 4'b1110;
					r_Data = i_Data;
				end
				
			r_SevenSegmentDisplay = getNumber(r_Data);
		end
		
	 
	//Just show turn Up switchs in array of leds
	assign o_SevenSegmentDisplay = r_SevenSegmentDisplay;
	assign o_Chosen_Segment = r_Chosen_Segment;
endmodule
