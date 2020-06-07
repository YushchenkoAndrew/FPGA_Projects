`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:21:05 03/19/2020 
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
	input[7:0] i_Switches,
	input[3:0] i_Button,
	output[7:0] o_LED,
	output[7:0] o_SevenSegmentDisplay,
	output[3:0] o_Chosen_Segment
    );

	reg[7:0] r_Switches = 'b0;
	reg[25:0] r_Delay = 'b0;
	reg CLK = 'b0;
	reg[15:0] CNT = 0;
	reg blinker = 1'b1;
	reg r_DEC = 1'b0;
	
	wire[7:0] w_OUT_Number;
	wire[3:0] w_Chosen_Segment;
	
	SevenSegmentDisplay display (
		.i_clk(CLK),
		.i_Data(CNT),
		.o_Chosen_Segment(w_Chosen_Segment),
		.o_SevenSegmentDisplay(w_OUT_Number)
	 );
	
	always @(posedge i_clk)
		begin
			r_Delay = r_Delay + 1'b1;
			
			if (r_Delay[9:0] == 10'b1111111111)
				CLK = !CLK;
			
			// I set	the blinker twice for beaty effect 
			if (r_Delay == 'd25000000)
				blinker = 1'b1;
			
			if (r_Delay == 'd50000000)
				begin
					blinker = 1'b0;
					
					//	Here I create equation that can be use in second caounter but also 
					//		in timer
					if(r_DEC == 1'b1)
						begin
							if (CNT != 'b0)
								CNT = CNT - 1'b1;
						end
					else
						CNT = CNT + 1'b1;
						
					r_Delay = 'b0;
				end
			
			
			case(i_Button)
				4'b0001:	CNT = 'b0;
				4'b0010: CNT = {r_Switches, CNT[7:0]};
				4'b0100: CNT = {CNT[15:8], r_Switches};
				4'b1000: r_DEC = !r_DEC;
			endcase
		end
		
	always @(*)
		begin
			r_Switches = i_Switches;
		end

	assign o_LED = r_Switches;
	
	//	This thing below do a simple thing, it just show number but if the number is showing on 1 segment
	// 	We turn on dot led
	assign o_SevenSegmentDisplay = (w_OUT_Number ^ {blinker & (w_Chosen_Segment == 4'b1110), 7'b0000000});
	assign o_Chosen_Segment = w_Chosen_Segment;


endmodule





