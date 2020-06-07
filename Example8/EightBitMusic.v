`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:19:52 04/28/2020 
// Design Name: 
// Module Name:    8-BitMusic 
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
module EightBitMusic(
	input i_clk,
	input i_NextNote,
	input[8:0] i_Note,
	output reg o_Frequency
    );
	 
	//	In i_Note value should be {#(1) / 0, Note, Octaves}
	 
	// Constan for counter 
	localparam A4			= 113636;
	localparam A4_Sharp	= 107259;
	localparam B4			= 101230;
	localparam C4			=  95551;
	localparam C4_Sharp	=  90187;
	localparam D4			=  85126;
	localparam D4_Sharp	=  80354;
	localparam E4			=  75840;
	localparam F4			=  71584;
	localparam F4_Sharp	=  67567;
	localparam G4			=  63775;
	localparam G4_Sharp	=  60194;

	reg[32:0] r_Delay = 'b0;
	reg[32:0] r_Border = 'b0;
	

	always @(posedge i_clk)
		begin
			r_Delay = r_Delay + 1;
			
			if (r_Delay >= r_Border)
				begin
					o_Frequency <= r_Border != 'b111111 ? ~o_Frequency : 'b0;
					r_Delay = 'b0;
				end
		end

	always @(posedge i_NextNote)
		begin
			case (i_Note[8:4])
				'h0A:	r_Border = i_Note[3:0] >= 'h04 ? A4 >> (i_Note[3:0] - 'h04) : A4 << ('h04 - i_Note[3:0]);
				'h1A:	r_Border = i_Note[3:0] >= 'h04 ? A4_Sharp >> (i_Note[3:0] - 'h04) : A4_Sharp << ('h04 - i_Note[3:0]);
				'h0B:	r_Border = i_Note[3:0] >= 'h04 ? B4 >> (i_Note[3:0] - 'h04) : B4 << ('h04 - i_Note[3:0]);
				'h0C:	r_Border = i_Note[3:0] >= 'h04 ? C4 >> (i_Note[3:0] - 'h04) : C4 << ('h04 - i_Note[3:0]);
				'h1C:	r_Border = i_Note[3:0] >= 'h04 ? C4_Sharp >> (i_Note[3:0] - 'h04) : C4_Sharp << ('h04 - i_Note[3:0]);
				'h0D:	r_Border = i_Note[3:0] >= 'h04 ? D4 >> (i_Note[3:0] - 'h04) : D4 << ('h04 - i_Note[3:0]);
				'h1D:	r_Border = i_Note[3:0] >= 'h04 ? D4_Sharp >> (i_Note[3:0] - 'h04) : D4_Sharp << ('h04 - i_Note[3:0]);
				'h0E:	r_Border = i_Note[3:0] >= 'h04 ? E4 >> (i_Note[3:0] - 'h04) : E4 << ('h04 - i_Note[3:0]);
				'h0F:	r_Border = i_Note[3:0] >= 'h04 ? F4 >> (i_Note[3:0] - 'h04) : F4 << ('h04 - i_Note[3:0]);
				'h1F:	r_Border = i_Note[3:0] >= 'h04 ? F4_Sharp >> (i_Note[3:0] - 'h04) : F4_Sharp << ('h04 - i_Note[3:0]);
				
				// Below is Note - G and G#
				'h00:	r_Border = i_Note[3:0] >= 'h04 ? G4 >> (i_Note[3:0] - 'h04) : G4 << ('h04 - i_Note[3:0]);
				'h10:	r_Border = i_Note[3:0] >= 'h04 ? G4_Sharp >> (i_Note[3:0] - 'h04) : G4_Sharp << ('h04 - i_Note[3:0]);
			endcase
			
		end

endmodule


















