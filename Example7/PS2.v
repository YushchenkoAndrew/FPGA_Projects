`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:20:28 04/08/2020 
// Design Name: 
// Module Name:    PS2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 		Module for working with PS2 port and protocole
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PS2(
	input i_clk,
	input wire i_PS2C,
	input wire i_PS2D,
	output[23:0] o_Data
    );

	reg[23:0] r_Data = 'b0;
	reg[10:0] r_DataKey = 'b0;
	
	reg[1:0] r_State = 'b0;
	
	// Counter 
	reg[3:0] CNT = 'b0;
	
	// State for Mura machine
	localparam[1:0] START_STATE = 	2'b00;
	localparam[1:0] GET_DATA_STATE = 2'b01;
	localparam[1:0] NEXT_BIT_STATE = 2'b10;

	reg[7:0] f_PS2C = 'b0;			// Filter for PS2C
	reg[7:0] f_PS2D = 'b0;			// Filter for PS2D

	reg r_PS2C = 'b0;
	reg r_PS2D = 'b0;
	
	always @(posedge i_clk)
		begin			
			f_PS2C = {f_PS2C[6:0], i_PS2C};
			f_PS2D = {f_PS2D[6:0], i_PS2D};
			
			
			case(f_PS2C)
				'hFF: r_PS2C = 1'b1;
				'h00: r_PS2C = 1'b0;
			endcase
			
			case(f_PS2D)
				'hFF: r_PS2D = 1'b1;
				'h00: r_PS2D = 1'b0;
			endcase
		end

		
	

	always @(posedge i_clk)
		begin
			
			case (r_State)
				START_STATE:
					begin
						if (r_PS2D == 'b0)
							r_State = GET_DATA_STATE;
					end
				GET_DATA_STATE:
					begin
						if (CNT < 4'b1011)
							begin
								if (r_PS2C == 'b0)
									begin
										r_DataKey = {r_PS2D, r_DataKey[10:1]};
										r_State = NEXT_BIT_STATE;
									end
							end
						else
							begin
								r_Data = {r_Data[15:0], r_DataKey[9:2]};
								CNT = 'b0;
								r_State = GET_DATA_STATE;
							end
					end
				NEXT_BIT_STATE:
					begin
						if (r_PS2C == 'b1)
							begin
								CNT = CNT + 1'b1;
								r_State = GET_DATA_STATE;
							end
					end
			endcase
			
		end
		
	assign o_Data = r_Data;

endmodule


















