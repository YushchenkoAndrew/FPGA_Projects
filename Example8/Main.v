`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:17:54 04/28/2020 
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
	output o_Note,
	output[7:0] o_LED
    );
	
	localparam SONG_SIZE = 127;
	 
	reg [8:0] MarioSong[SONG_SIZE:0];
	
	integer r_i;
	
	reg[6:0] Index = 'b0;
	
	reg[32:0] r_Delay = 'b0;
	
	initial
		begin
			MarioSong['h00] = 'h0E7;
			MarioSong['h01] = 'h0E7;
			MarioSong['h02] = 'h111;
			MarioSong['h03] = 'h0E7;
			MarioSong['h04] = 'h111;
			MarioSong['h05] = 'h0C7;
			MarioSong['h06] = 'h0E7;
			MarioSong['h07] = 'h111;
			MarioSong['h08] = 'h007;
			MarioSong['h09] = 'h111;
			MarioSong['h0A] = 'h111;
			MarioSong['h0B] = 'h111;
			MarioSong['h0C] = 'h006;
			MarioSong['h0D] = 'h111;
			MarioSong['h0E] = 'h111;
			MarioSong['h0F] = 'h111;
			
			MarioSong['h10] = 'h0C7;
			MarioSong['h11] = 'h111;
			MarioSong['h12] = 'h111;
			MarioSong['h13] = 'h006;
			MarioSong['h14] = 'h111;
			MarioSong['h15] = 'h111;
			MarioSong['h16] = 'h0E6;
			MarioSong['h17] = 'h111;
			MarioSong['h18] = 'h111;
			MarioSong['h19] = 'h0A6;
			MarioSong['h1A] = 'h111;
			MarioSong['h1B] = 'h0B6;
			MarioSong['h1C] = 'h111;
			MarioSong['h1D] = 'h1A6;
			MarioSong['h1E] = 'h0A6;
			MarioSong['h1F] = 'h111;
			
			MarioSong['h20] = 'h006;
			MarioSong['h21] = 'h0E7;
			MarioSong['h22] = 'h007;
			MarioSong['h23] = 'h0A7;
			MarioSong['h24] = 'h111;
			MarioSong['h25] = 'h0F7;
			MarioSong['h26] = 'h007;
			MarioSong['h27] = 'h111;
			MarioSong['h28] = 'h0E7;
			MarioSong['h29] = 'h111;
			MarioSong['h2A] = 'h0C7;
			MarioSong['h2B] = 'h0D7;
			MarioSong['h2C] = 'h0B6;
			MarioSong['h2D] = 'h111;
			MarioSong['h2E] = 'h111;
			MarioSong['h2F] = 'h111;
			
			MarioSong['h30] = 'h0C7;
			MarioSong['h31] = 'h111;
			MarioSong['h32] = 'h111;
			MarioSong['h33] = 'h006;
			MarioSong['h34] = 'h111;
			MarioSong['h35] = 'h111;
			MarioSong['h36] = 'h0E6;
			MarioSong['h37] = 'h111;
			MarioSong['h38] = 'h111;
			MarioSong['h39] = 'h0A6;
			MarioSong['h3A] = 'h111;
			MarioSong['h3B] = 'h0B6;
			MarioSong['h3C] = 'h111;
			MarioSong['h3D] = 'h1A6;
			MarioSong['h3E] = 'h0A6;
			MarioSong['h3F] = 'h111;
			
			MarioSong['h40] = 'h006;
			MarioSong['h41] = 'h0E7;
			MarioSong['h42] = 'h007;
			MarioSong['h43] = 'h0A7;
			MarioSong['h44] = 'h111;
			MarioSong['h45] = 'h0F7;
			MarioSong['h46] = 'h007;
			MarioSong['h47] = 'h111;
			MarioSong['h48] = 'h0E7;
			MarioSong['h49] = 'h111;
			MarioSong['h4A] = 'h0C7;
			MarioSong['h4B] = 'h0D7;
			MarioSong['h4C] = 'h0B6;
			MarioSong['h4D] = 'h111;
			MarioSong['h4E] = 'h111;
			MarioSong['h4F] = 'h111;
			
			for (r_i = 'h50; r_i < 'h80; r_i = r_i + 1)
				MarioSong[r_i] = 'b0;
		end
	 
	reg[8:0] r_Note = 'b0;
	reg r_NextNote = 'b0;
	
	wire w_Frequency;

	EightBitMusic Note (
		.i_clk(i_clk),
		.i_NextNote(r_NextNote),
		.i_Note(MarioSong[Index] - i_Switch),
		.o_Frequency(w_Frequency)
		 );
	
	always @(posedge i_clk)
		begin
			r_NextNote = 'b0;
			r_Delay  = r_Delay + 1;
			
			
			if (r_Delay >= 6250000)
				begin
					r_Delay = 'b0;
					Index = Index != 'h4F ? Index + 1 : 'b0;
					r_NextNote = ~r_NextNote;
				end
		end
		
	always @(*)
		begin
			r_Note = {1'b0, i_Switch};
		end
		
		
	assign o_LED = i_Switch;
	assign o_Note = w_Frequency;

endmodule
