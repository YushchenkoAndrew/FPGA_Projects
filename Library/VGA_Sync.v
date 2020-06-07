`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:33:19 04/17/2020 
// Design Name: 
// Module Name:    VGA_Sync 
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
module VGA_Sync(
	input i_clk,
	output o_hsync,
	output o_vsync,
	output[9:0] o_h_CNT,			// Horisontal counter
	output[9:0] o_v_CNT,			// Vertical counter
	output o_VideoEnable
    );
	 
	// constant declarations for VGA sync parameters
	localparam H_DISPLAY       = 640; // horizontal display area
	localparam H_L_BORDER      =  48; // horizontal left border
	localparam H_R_BORDER      =  16; // horizontal right border
	localparam H_RETRACE       =  96; // horizontal retrace
	localparam H_MAX           = H_DISPLAY + H_L_BORDER + H_R_BORDER + H_RETRACE - 1;
	localparam START_H_RETRACE = H_DISPLAY + H_R_BORDER;
	localparam END_H_RETRACE   = H_DISPLAY + H_R_BORDER + H_RETRACE - 1;
	
	localparam V_DISPLAY       = 480; // vertical display area
	localparam V_T_BORDER      =  10; // vertical top border
	localparam V_B_BORDER      =  33; // vertical bottom border
	localparam V_RETRACE       =   2; // vertical retrace
	localparam V_MAX           = V_DISPLAY + V_T_BORDER + V_B_BORDER + V_RETRACE - 1;
   localparam START_V_RETRACE = V_DISPLAY + V_B_BORDER;
	localparam END_V_RETRACE   = V_DISPLAY + V_B_BORDER + V_RETRACE - 1;
	
	
	reg[9:0] h_CNT = 'b0;
	reg[9:0] v_CNT = 'b0;
	
	reg CLK = 'b0;
	
	always @(posedge i_clk)
		begin
			CLK = ~CLK;
		end
	
	
	always @(posedge CLK)
		begin
			h_CNT = h_CNT == H_MAX ? 'b0 : h_CNT + 1'b1;

			if (h_CNT == H_MAX)
				begin
					v_CNT = v_CNT == V_MAX ? 'b0 : v_CNT + 1'b1;
				end
		end

	
	assign o_hsync = h_CNT >= START_H_RETRACE & h_CNT <= END_H_RETRACE;
	assign o_vsync = v_CNT >= START_V_RETRACE & v_CNT <= END_V_RETRACE;
	assign o_h_CNT = h_CNT;
	assign o_v_CNT = v_CNT;
	assign o_VideoEnable = (h_CNT < H_DISPLAY) && (v_CNT < V_DISPLAY);
	
endmodule
















