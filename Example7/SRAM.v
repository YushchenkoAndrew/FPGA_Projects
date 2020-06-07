`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:17:26 04/27/2020 
// Design Name: 
// Module Name:    SRAM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: Static Random Accesess Memory
//		This is template for a Block RAM
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SRAM #(parameter ADDR_WIDTH = 9, DATA_WIDTH = 9, DEPTH = 512)(
	 input wire i_clk,
	 input wire [ADDR_WIDTH - 1:0] i_AddrWrite,
	 input wire [ADDR_WIDTH - 1:0] i_AddrRead,
	 input wire i_write,
	 input wire [DATA_WIDTH - 1:0] i_Data,
	 output reg [DATA_WIDTH - 1:0] o_Data
    );

	reg [DATA_WIDTH - 1:0] RAM[0:DEPTH];
	
	always @(posedge i_clk)
		begin
			if (i_write)
				RAM[i_AddrWrite] <= i_Data;
			else
				o_Data <= RAM[i_AddrRead];
		end


endmodule






















