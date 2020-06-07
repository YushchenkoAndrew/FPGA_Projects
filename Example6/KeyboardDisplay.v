`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:59:26 04/10/2020 
// Design Name: 
// Module Name:    KeyboardDisplay 
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
module KeyboardDisplay(
    input i_clk,
		input[23:0] i_Data,
		output[3:0] o_Chosen_Segment,
		output[7:0] o_SevenSegmentDisplay
    );
	
	
	reg CLK = 'b0;
	reg[15:0] r_Delay = 'b0;
	
	reg[23:0] r_KeyData = 'b0;
	reg r_Enable = 'b1;

	reg[3:0] r_Chosen_Segment = 'b1110;
	reg[7:0] r_SevenSegmentDisplay = 7'b0110000;
	
	reg[31:0] r_Data = 'h0FFFFFFFF;
	reg[39:0] r_LastData = 'b0;
	
	function[7:0] getChar;
		input [7:0] i_State;
		begin
			getChar = 'b0;
			
			case (i_State)
				8'h45	:	getChar = 8'b11000000;		// num = 0
				8'h16	:	getChar = 8'b11111001;		// num = 1
				8'h1E	:	getChar = 8'b10100100;		// num = 2
				8'h26	:	getChar = 8'b10110000;		// num = 3
				8'h25	:	getChar = 8'b10011001;		// num = 4
				8'h2E	:	getChar = 8'b10010010;		// num = 5
				8'h36	:	getChar = 8'b10000010;		// num = 6
				8'h3D	:	getChar = 8'b11111000;		// num = 7
				8'h3E	:	getChar = 8'b10000000;		// num = 8
				8'h46	:	getChar = 8'b10010000;		// num = 9


				8'h1C	:	getChar = 8'b10001000;		// char = a
				8'h32	:	getChar = 8'b10000011;		// char = b
				8'h21	:	getChar = 8'b11000110;		// char = c
				8'h23	:	getChar = 8'b10100001;		// char = d
				8'h24	:	getChar = 8'b10000110;		// char = e
				8'h2B	:	getChar = 8'b10001110;		// char = f
				8'h33	:	getChar = 8'b10001001;		// char = h
				8'h43	:	getChar = 8'b11001111;		// char = i
				8'h4B	:	getChar = 8'b11000111;		// char = l
				8'h31	:	getChar = 8'b10101011;		// char = n
				8'h44	:	getChar = 8'b10100011;		// char = o
				8'h4D	:	getChar = 8'b10001100;		// char = p
				8'h15	:	getChar = 8'b10011000;		// char = q
				8'h2D	:	getChar = 8'b10101111;		// char = r
				8'h1B	:	getChar = 8'b10010010;		// char = s
				8'h2C	:	getChar = 8'b10000111;		// char = t
				8'h3C	:	getChar = 8'b11000001;		// char = u
				
				8'h29	:	getChar = 8'b11111111;		// char = ' '
				8'h4E	:	getChar = 8'b10111111;		// char = '-'
				8'h49	:	getChar = 8'b01111111;		// char = '.'
				8'h66	:	getChar = 8'h66;				// char = '<-'
			endcase
		end
	endfunction
	
	reg[31:0] r_DisplayData = 'b0;
	
	// This block show LOW BYTE in Seven Segment Dispalay if counter_State == 0 else 
	//		it show HIGH BYTE
	always @(posedge CLK)
		begin
			r_Chosen_Segment = {r_Chosen_Segment[2:0], 1'b1};
			r_DisplayData = r_DisplayData >> 8;
			
			if (r_Chosen_Segment == 4'b1111)
				begin
					r_Chosen_Segment = 4'b1110;
					r_DisplayData = r_Data;
				end
				
			r_SevenSegmentDisplay = r_DisplayData[7:0];
		end
		
		
	always @(posedge i_clk)
		begin
			//r_Result = w_Data[15:0];
			
							
			if (r_KeyData[15:8] != 'hF0 && r_Enable == 1'b1)
				begin
					r_LastData = {r_LastData[31:24], r_Data};
					r_Data = r_Data << 8;
					r_Enable = 'b0;
				end
			
			r_Data[7:0] = getChar(r_KeyData[7:0]);
			
			case(r_Data[7:0])
				8'h66	:	r_Data = r_LastData[39:8];
			endcase

			
				
			if (r_KeyData[15:8] == 'hF0)
				begin
					r_Enable = 1'b1;
					if (r_Data[7:0] == 'b0)
						r_Data = r_LastData[31:0];
				end
			
		end	
		
	always @(posedge i_clk)
		begin
			r_Delay = r_Delay + 1'b1;
			if (r_Delay == 'b0)
				CLK = ~CLK;
		end
		
	always @(*)
		begin
			r_KeyData = i_Data;
		end
		
	 
	//Just show turn Up switchs in array of leds
	assign o_SevenSegmentDisplay = r_SevenSegmentDisplay;
	assign o_Chosen_Segment = r_Chosen_Segment;


endmodule
