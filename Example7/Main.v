`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:28:57 04/17/2020 
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
	input i_PS2C,
	input i_PS2D,
	output[7:0] o_LED,
	output[7:0] o_SevenSegmentDisplay,
	output[3:0] o_Chosen_Segment,
	output HSYNC,
	output VSYNC,
	output[2:0] o_Red,
	output[2:0] o_Green,
	output[1:0] o_Blue
    );
	 
	 	 
	 
	wire[7:0] w_SevenSegmentDisplay;
	wire[3:0] w_Chosen_Segment;
	
	
	 wire[23:0] w_DataPS2;
	 
	 KeyboardDisplay display (
		.i_clk(i_clk),
		.i_Data(w_DataPS2),
		.o_SevenSegmentDisplay(w_SevenSegmentDisplay),
		.o_Chosen_Segment(w_Chosen_Segment)
		 );
	 
	 
	 
	 
	 PS2 ps2 (
		.i_clk(i_clk),
		.i_PS2C(i_PS2C),
		.i_PS2D(i_PS2D),
		.o_Data(w_DataPS2)
	 );
	 
	
	
	wire w_hsync;
	wire w_vsync;
	
	wire[9:0] w_h_CNT;
	wire[9:0] w_v_CNT;
	
	wire w_VideoEnable;

	VGA_Sync vga_sync (
	 .i_clk(i_clk),
	 .o_hsync(w_hsync),
	 .o_vsync(w_vsync),
	 .o_h_CNT(w_h_CNT),	
	 .o_v_CNT(w_v_CNT),
	 .o_VideoEnable(w_VideoEnable)
	 );
	 
	 
	 
	wire[3:0] w_DataVGA;
	
	KeyboardDisplayVGA displayVGA (
		 .i_clk(i_clk),
		 .i_h_CNT(w_h_CNT),
		 .i_v_CNT(w_v_CNT),
		 .i_KeyData(w_DataPS2),
		 .i_VideoEnable(w_VideoEnable),
		 .o_Data(w_DataVGA)
		 );
		
		

	
	assign o_LED = i_Switch;
	assign o_SevenSegmentDisplay = w_SevenSegmentDisplay;
	assign o_Chosen_Segment = w_Chosen_Segment;
	
	assign HSYNC = w_hsync;
	assign VSYNC = w_vsync;
	
	assign o_Red = w_VideoEnable ? w_DataVGA[2:0] : 'b0;
	assign o_Green = w_VideoEnable ? w_DataVGA[2:0] : 'b0;
	assign o_Blue = w_VideoEnable ? w_DataVGA[1:0] : 'b0;

endmodule
