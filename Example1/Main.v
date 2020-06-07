`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:59:06 03/18/2020 
// Design Name: 
// Module Name:    Main 
// Project Name: 	 Example1
// Target Devices: 
// Tool versions: 
// Description: 	 This program just realise a simple counter
// 						which clocked by i_Button
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Main(
	input i_Button,
	output[7:0] o_LED
    );
	 
	 reg[7:0] counter_Led = 'b0;
	 
	always @(posedge i_Button)
		begin
			counter_Led = counter_Led + 1'b1;
		end
	
	assign o_LED = counter_Led;
	
endmodule






