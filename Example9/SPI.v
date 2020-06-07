`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:52:02 04/29/2020 
// Design Name: 
// Module Name:    SPI 
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
module SPI(
	input i_clk,
	input[7:0] i_Data,
	output reg[7:0] o_Data,
	output reg o_New_Data_Enable,
	
	// SPI Interface
	output reg CLK,
	input MISO,
	output reg MOSI,
	output reg CS				// Signal is inverted -> /CS
    );
	
	reg[7:0] r_MasterData = 'b0;
	
	reg[7:0] r_SlaveData = 'b0;
	reg[2:0] r_Index = 'b0;			// Show recieve / transmit data 
	reg[10:0] r_Delay = 'b0;
	
	
	always @(posedge i_clk)
		begin
			r_Delay = r_Delay + 1;
			
			if (r_Delay == 'b0)
				begin
					CLK = !CLK;
					r_Delay = 'b0;
					r_MasterData = i_Data;
				end
		end
		
	always @(posedge i_clk)
		begin
			o_Data <= r_Index == 'b0 ? r_SlaveData : o_Data;
		end
		
		
	always @(posedge CLK)
		begin
			CS = r_Index == 0 ? ~CS : CS;
			o_New_Data_Enable = r_Index == 'b0 && !CS;
		
			MOSI <= r_MasterData[r_Index];
			r_Index = r_Index + 1;
		end
		
	always @(negedge CLK)
	 begin
		r_SlaveData[r_Index - 1] <= MISO;
	 end
		
endmodule










 








