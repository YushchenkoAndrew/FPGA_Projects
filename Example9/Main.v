`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:45 04/29/2020 
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
	output[7:0] o_LED,
	
	output o_CS,
	output o_MOSI,
	input i_MISO,
	output o_CLK
    );
	 
	wire[7:0] w_MISO_Data;
	wire w_New_Data_Enable;
	 
	reg[7:0] r_MOSI_Data = 'b0;
	
	wire w_CS;
	wire w_MOSI;
	wire w_CLK;
	
	SPI spi(
		.i_clk(i_clk),
		.i_Data(r_MOSI_Data),
		.o_Data(w_MISO_Data),
		.o_New_Data_Enable(w_New_Data_Enable),
		
		.CLK(w_CLK),
		.MISO(i_MISO),
		.MOSI(w_MOSI),
		.CS(w_CS)
		 );
	
	
	localparam[2:0] SERIAL_READ_STATE		=	'b000;
	localparam[2:0] GET_SIZE_STATE			=	'b101;
	localparam[2:0] SERIAL_SUCCESS_STATE	=	'b100;
	localparam[2:0] STREAM_SIZE_STATE		=	'b001;
	localparam[2:0] NEXT_DATA_STATE			=	'b010;
	localparam[2:0] END_SERIAL_STATE			=	'b011;
	
	
	reg[2:0] SERIAL_STATE = 'b0;
	reg[7:0] r_BufferSize = 'b0;
	
	reg[7:0] r_LED = 'b0;
	reg[7:0] r_BufferIndex = 'b0;
	
	always @(posedge w_New_Data_Enable)
		begin		
		r_LED = 'h00;
		
			case (SERIAL_STATE)
				SERIAL_READ_STATE:
					begin
						if (w_MISO_Data == 'hFF)
							begin
								r_MOSI_Data = 'hF7;
								SERIAL_STATE = STREAM_SIZE_STATE;		
							end
						else
							begin
								r_MOSI_Data = 'hFB;
								SERIAL_STATE = GET_SIZE_STATE;
								r_BufferIndex = 'b0;
							end
					end
					
				GET_SIZE_STATE:
					begin
						r_MOSI_Data = 'h07;
						
						r_LED = 'h3E;
						
						SERIAL_STATE = SERIAL_READ_STATE;
						
						if (w_MISO_Data == 'hFF)
							SERIAL_STATE = STREAM_SIZE_STATE;
					end
				
					
				STREAM_SIZE_STATE:
					begin
						r_BufferSize = w_MISO_Data - 1;
						SERIAL_STATE = NEXT_DATA_STATE;
						
						
						r_MOSI_Data = 'hF3;
					end
					
				NEXT_DATA_STATE:
					begin
						
						r_MOSI_Data = 'hF3;
						
						r_BufferIndex = r_BufferIndex + 1;
						
						if (r_BufferIndex == r_BufferSize)
							SERIAL_STATE = END_SERIAL_STATE;
					end
				
				END_SERIAL_STATE:
					begin
						r_MOSI_Data = 'hFF;
						SERIAL_STATE = i_Switch == 'h01 ? SERIAL_READ_STATE : END_SERIAL_STATE;
					end
			endcase
		end
		
	
	assign o_LED = r_LED;
	assign o_CS = w_CS;
	assign o_MOSI = w_MOSI;
	assign o_CLK = w_CLK;

endmodule













