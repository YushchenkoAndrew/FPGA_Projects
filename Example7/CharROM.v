`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:38:20 04/22/2020 
// Design Name: 
// Module Name:    CharROM 
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
module CharROM(
	 input i_clk,
	 input[8:0] i_CharIndex,
	 input[2:0] i_Row,
	 output[7:0] o_BitsMap
    );

	reg[7:0] r_CharArray [0:7];
	reg[7:0] r_BitsMap = 'b0;
	
	always @(posedge i_clk)
		begin
			r_CharArray[0] = 'h00;
			r_CharArray[1] = 'h00;
			r_CharArray[2] = 'h00;
			r_CharArray[3] = 'h00;
			r_CharArray[4] = 'h00;
			r_CharArray[5] = 'h00;
			r_CharArray[6] = 'h00;
			r_CharArray[7] = 'h00;
		
		
			if (i_CharIndex[8] == 'b0)				//---------------LOW CAPS LOCK-------------
				case (i_CharIndex)
					'h45:									// Num = 0
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h1C;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h32;
							r_CharArray[4] = 'h2A;
							r_CharArray[5] = 'h26;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h1C;
						end
					'h16:									// Num = 1
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h08;
							r_CharArray[2] = 'h0C;
							r_CharArray[3] = 'h08;
							r_CharArray[4] = 'h08;
							r_CharArray[5] = 'h08;
							r_CharArray[6] = 'h08;
							r_CharArray[7] = 'h1C;
						end
					'h1E:									// Num = 2
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h1C;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h20;
							r_CharArray[4] = 'h10;
							r_CharArray[5] = 'h08;
							r_CharArray[6] = 'h04;
							r_CharArray[7] = 'h3E;
						end
					'h26:									// Num = 3
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h3E;
							r_CharArray[2] = 'h10;
							r_CharArray[3] = 'h08;
							r_CharArray[4] = 'h10;
							r_CharArray[5] = 'h20;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h1C;
						end
					'h25:									// Num = 4
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h10;
							r_CharArray[2] = 'h18;
							r_CharArray[3] = 'h14;
							r_CharArray[4] = 'h12;
							r_CharArray[5] = 'h7E;
							r_CharArray[6] = 'h10;
							r_CharArray[7] = 'h10;
						end
					'h2E:									// Num = 5
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h3E;
							r_CharArray[2] = 'h02;
							r_CharArray[3] = 'h1E;
							r_CharArray[4] = 'h20;
							r_CharArray[5] = 'h20;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h1C;
						end
					'h36:									// Num = 6
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h18;
							r_CharArray[2] = 'h04;
							r_CharArray[3] = 'h02;
							r_CharArray[4] = 'h1E;
							r_CharArray[5] = 'h22;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h1C;
						end
					'h3D:									// Num = 7
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h3E;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h10;
							r_CharArray[4] = 'h08;
							r_CharArray[5] = 'h08;
							r_CharArray[6] = 'h08;
							r_CharArray[7] = 'h08;
						end
					'h3E:									// Num = 8
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h1C;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h22;
							r_CharArray[4] = 'h1C;
							r_CharArray[5] = 'h22;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h1C;
						end
					'h46:									// Num = 9
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h1C;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h22;
							r_CharArray[4] = 'h3C;
							r_CharArray[5] = 'h20;
							r_CharArray[6] = 'h10;
							r_CharArray[7] = 'h0C;
						end
					'h4E:									// Char = -
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h00;
							r_CharArray[4] = 'h3E;
							r_CharArray[5] = 'h00;
							r_CharArray[6] = 'h00;
							r_CharArray[7] = 'h00;						
						end
					'h55:									// Char = 
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h3E;
							r_CharArray[4] = 'h00;
							r_CharArray[5] = 'h3E;
							r_CharArray[6] = 'h00;
							r_CharArray[7] = 'h00;						
						end
					'h54:									// Char = [
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h1C;
							r_CharArray[2] = 'h04;
							r_CharArray[3] = 'h04;
							r_CharArray[4] = 'h04;
							r_CharArray[5] = 'h04;
							r_CharArray[6] = 'h04;
							r_CharArray[7] = 'h1C;						
						end
					'h5B:									// Char = ]
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h1C;
							r_CharArray[2] = 'h10;
							r_CharArray[3] = 'h10;
							r_CharArray[4] = 'h10;
							r_CharArray[5] = 'h10;
							r_CharArray[6] = 'h10;
							r_CharArray[7] = 'h1C;						
						end
					'h4C:									// Char = ;
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h0C;
							r_CharArray[3] = 'h0C;
							r_CharArray[4] = 'h00;
							r_CharArray[5] = 'h0C;
							r_CharArray[6] = 'h08;
							r_CharArray[7] = 'h04;						
						end
					'h52:										// Char = '
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h08;
							r_CharArray[2] = 'h08;
							r_CharArray[3] = 'h08;
							r_CharArray[4] = 'h00;
							r_CharArray[5] = 'h00;
							r_CharArray[6] = 'h00;
							r_CharArray[7] = 'h00;
						end
					'h41:									// Char = ,
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h00;
							r_CharArray[4] = 'h00;
							r_CharArray[5] = 'h0C;
							r_CharArray[6] = 'h08;
							r_CharArray[7] = 'h04;						
						end
					'h49:									// Char = .
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h00;
							r_CharArray[4] = 'h00;
							r_CharArray[5] = 'h00;
							r_CharArray[6] = 'h0C;
							r_CharArray[7] = 'h0C;						
						end
					'h4A:									// Char = /
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h20;
							r_CharArray[3] = 'h10;
							r_CharArray[4] = 'h08;
							r_CharArray[5] = 'h04;
							r_CharArray[6] = 'h02;
							r_CharArray[7] = 'h00;						
						end
					'h5D:									// Char = \
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h02;
							r_CharArray[3] = 'h04;
							r_CharArray[4] = 'h08;
							r_CharArray[5] = 'h10;
							r_CharArray[6] = 'h20;
							r_CharArray[7] = 'h00;						
						end
						
						
					'h1C:									// Char = a
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h1C;
							r_CharArray[4] = 'h20;
							r_CharArray[5] = 'h3C;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h3C;
						end
					'h32:										// Char = b
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h02;
							r_CharArray[2] = 'h02;
							r_CharArray[3] = 'h1A;
							r_CharArray[4] = 'h26;
							r_CharArray[5] = 'h22;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h1E;
						end
					'h21:										// Char = c
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h1C;
							r_CharArray[4] = 'h02;
							r_CharArray[5] = 'h02;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h1C;
						end
					'h23:										// Char = d
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h20;
							r_CharArray[2] = 'h20;
							r_CharArray[3] = 'h2C;
							r_CharArray[4] = 'h32;
							r_CharArray[5] = 'h22;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h3C;
						end
					'h24:										// Char = e
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h1C;
							r_CharArray[4] = 'h22;
							r_CharArray[5] = 'h3E;
							r_CharArray[6] = 'h02;
							r_CharArray[7] = 'h1C;
						end
					'h2B:										// Char = f
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h18;
							r_CharArray[2] = 'h24;
							r_CharArray[3] = 'h04;
							r_CharArray[4] = 'h0E;
							r_CharArray[5] = 'h04;
							r_CharArray[6] = 'h04;
							r_CharArray[7] = 'h04;
						end
					'h34:										// Char = g
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h3C;
							r_CharArray[4] = 'h22;
							r_CharArray[5] = 'h3C;
							r_CharArray[6] = 'h20;
							r_CharArray[7] = 'h1C;
						end
					'h33:										// Char = h
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h02;
							r_CharArray[2] = 'h02;
							r_CharArray[3] = 'h1A;
							r_CharArray[4] = 'h26;
							r_CharArray[5] = 'h22;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h22;
						end
					'h43:										// Char = i
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h08;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h08;
							r_CharArray[4] = 'h0C;
							r_CharArray[5] = 'h08;
							r_CharArray[6] = 'h08;
							r_CharArray[7] = 'h1C;
						end
					'h3B:										// Char = j
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h10;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h18;
							r_CharArray[4] = 'h10;
							r_CharArray[5] = 'h10;
							r_CharArray[6] = 'h12;
							r_CharArray[7] = 'h0C;
						end
					'h42:										// Char = k
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h02;
							r_CharArray[2] = 'h02;
							r_CharArray[3] = 'h12;
							r_CharArray[4] = 'h0A;
							r_CharArray[5] = 'h06;
							r_CharArray[6] = 'h0A;
							r_CharArray[7] = 'h12;
						end
					'h4B:										// Char = l
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h0C;
							r_CharArray[2] = 'h08;
							r_CharArray[3] = 'h08;
							r_CharArray[4] = 'h08;
							r_CharArray[5] = 'h08;
							r_CharArray[6] = 'h08;
							r_CharArray[7] = 'h1C;
						end
					'h3A:										// Char = m
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h16;
							r_CharArray[4] = 'h2A;
							r_CharArray[5] = 'h2A;
							r_CharArray[6] = 'h2A;
							r_CharArray[7] = 'h2A;
						end
					'h31:										// Char = n
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h1A;
							r_CharArray[4] = 'h26;
							r_CharArray[5] = 'h22;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h22;
						end
					'h44:										// Char = o
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h1C;
							r_CharArray[4] = 'h22;
							r_CharArray[5] = 'h22;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h1C;
						end
					'h4D:										// Char = p
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h1E;
							r_CharArray[4] = 'h22;
							r_CharArray[5] = 'h1E;
							r_CharArray[6] = 'h02;
							r_CharArray[7] = 'h02;
						end
					'h15:										// Char = q
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h2C;
							r_CharArray[4] = 'h32;
							r_CharArray[5] = 'h3C;
							r_CharArray[6] = 'h20;
							r_CharArray[7] = 'h20;
						end
					'h2D:										// Char = r
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h1A;
							r_CharArray[4] = 'h26;
							r_CharArray[5] = 'h02;
							r_CharArray[6] = 'h02;
							r_CharArray[7] = 'h02;
						end
					'h1B:										// Char = s
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h1C;
							r_CharArray[4] = 'h02;
							r_CharArray[5] = 'h1C;
							r_CharArray[6] = 'h20;
							r_CharArray[7] = 'h1E;
						end
					'h2C:										// Char = t
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h04;
							r_CharArray[2] = 'h04;
							r_CharArray[3] = 'h0E;
							r_CharArray[4] = 'h04;
							r_CharArray[5] = 'h04;
							r_CharArray[6] = 'h24;
							r_CharArray[7] = 'h18;
						end
					'h3C:										// Char = u
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h22;
							r_CharArray[4] = 'h22;
							r_CharArray[5] = 'h22;
							r_CharArray[6] = 'h32;
							r_CharArray[7] = 'h2C;
						end
					'h2A:										// Char = v
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h22;
							r_CharArray[4] = 'h22;
							r_CharArray[5] = 'h22;
							r_CharArray[6] = 'h14;
							r_CharArray[7] = 'h08;
						end
					'h1D:										// Char = w
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h22;
							r_CharArray[4] = 'h22;
							r_CharArray[5] = 'h2A;
							r_CharArray[6] = 'h2A;
							r_CharArray[7] = 'h14;
						end
					'h22:										// Char = x
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h22;
							r_CharArray[4] = 'h14;
							r_CharArray[5] = 'h08;
							r_CharArray[6] = 'h14;
							r_CharArray[7] = 'h22;
						end
					'h35:										// Char = y
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h22;
							r_CharArray[4] = 'h22;
							r_CharArray[5] = 'h3C;
							r_CharArray[6] = 'h20;
							r_CharArray[7] = 'h1C;
						end
					'h1A:										// Char = z
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h3E;
							r_CharArray[4] = 'h10;
							r_CharArray[5] = 'h08;
							r_CharArray[6] = 'h04;
							r_CharArray[7] = 'h3E;
						end
				endcase
				
			else												//--------------HIGH CAPS LOCK-----------------
				case (i_CharIndex[7:0])
					'h16:									// Char = !
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h08;
							r_CharArray[2] = 'h08;
							r_CharArray[3] = 'h08;
							r_CharArray[4] = 'h08;
							r_CharArray[5] = 'h00;
							r_CharArray[6] = 'h00;
							r_CharArray[7] = 'h08;
						end
					'h1E:									// Char = @
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h1C;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h20;
							r_CharArray[4] = 'h2C;
							r_CharArray[5] = 'h2A;
							r_CharArray[6] = 'h2A;
							r_CharArray[7] = 'h1C;
						end
					'h26:									// Char = #
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h14;
							r_CharArray[2] = 'h14;
							r_CharArray[3] = 'h3E;
							r_CharArray[4] = 'h14;
							r_CharArray[5] = 'h3E;
							r_CharArray[6] = 'h14;
							r_CharArray[7] = 'h14;
						end
					'h25:									// Char = $
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h08;
							r_CharArray[2] = 'h3C;
							r_CharArray[3] = 'h0A;
							r_CharArray[4] = 'h1C;
							r_CharArray[5] = 'h28;
							r_CharArray[6] = 'h1E;
							r_CharArray[7] = 'h08;
						end
					'h2E:									// Char = %
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h06;
							r_CharArray[2] = 'h26;
							r_CharArray[3] = 'h10;
							r_CharArray[4] = 'h08;
							r_CharArray[5] = 'h04;
							r_CharArray[6] = 'h32;
							r_CharArray[7] = 'h30;
						end
					'h36:									// Char = ^
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h08;
							r_CharArray[2] = 'h14;
							r_CharArray[3] = 'h22;
							r_CharArray[4] = 'h00;
							r_CharArray[5] = 'h00;
							r_CharArray[6] = 'h00;
							r_CharArray[7] = 'h00;
						end
					'h3D:									// Char = &
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h0C;
							r_CharArray[2] = 'h12;
							r_CharArray[3] = 'h0A;
							r_CharArray[4] = 'h04;
							r_CharArray[5] = 'h2A;
							r_CharArray[6] = 'h12;
							r_CharArray[7] = 'h2C;
						end
					'h3E:									// Char = *
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h08;
							r_CharArray[3] = 'h2A;
							r_CharArray[4] = 'h1C;
							r_CharArray[5] = 'h2A;
							r_CharArray[6] = 'h08;
							r_CharArray[7] = 'h00;
						end
					'h46:									// Num = (
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h10;
							r_CharArray[2] = 'h08;
							r_CharArray[3] = 'h04;
							r_CharArray[4] = 'h04;
							r_CharArray[5] = 'h04;
							r_CharArray[6] = 'h08;
							r_CharArray[7] = 'h10;
						end
					'h45:									// Char = )
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h04;
							r_CharArray[2] = 'h08;
							r_CharArray[3] = 'h10;
							r_CharArray[4] = 'h10;
							r_CharArray[5] = 'h10;
							r_CharArray[6] = 'h08;
							r_CharArray[7] = 'h04;						
						end
					'h4E:									// Char = _
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h00;
							r_CharArray[3] = 'h00;
							r_CharArray[4] = 'h00;
							r_CharArray[5] = 'h00;
							r_CharArray[6] = 'h00;
							r_CharArray[7] = 'h3E;						
						end
					'h55:									// Char = +
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h08;
							r_CharArray[3] = 'h08;
							r_CharArray[4] = 'h3E;
							r_CharArray[5] = 'h08;
							r_CharArray[6] = 'h08;
							r_CharArray[7] = 'h00;						
						end
					'h54:									// Char = {
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h10;
							r_CharArray[2] = 'h08;
							r_CharArray[3] = 'h08;
							r_CharArray[4] = 'h04;
							r_CharArray[5] = 'h08;
							r_CharArray[6] = 'h08;
							r_CharArray[7] = 'h10;						
						end
					'h5B:									// Char = }
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h04;
							r_CharArray[2] = 'h08;
							r_CharArray[3] = 'h08;
							r_CharArray[4] = 'h10;
							r_CharArray[5] = 'h08;
							r_CharArray[6] = 'h08;
							r_CharArray[7] = 'h04;						
						end
					'h4C:									// Char = :
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h00;
							r_CharArray[2] = 'h0C;
							r_CharArray[3] = 'h0C;
							r_CharArray[4] = 'h00;
							r_CharArray[5] = 'h0C;
							r_CharArray[6] = 'h0C;
							r_CharArray[7] = 'h00;						
						end
					'h52:										// Char = "
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h14;
							r_CharArray[2] = 'h14;
							r_CharArray[3] = 'h14;
							r_CharArray[4] = 'h00;
							r_CharArray[5] = 'h00;
							r_CharArray[6] = 'h00;
							r_CharArray[7] = 'h00;
						end
					'h41:									// Char = <
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h10;
							r_CharArray[2] = 'h08;
							r_CharArray[3] = 'h04;
							r_CharArray[4] = 'h02;
							r_CharArray[5] = 'h04;
							r_CharArray[6] = 'h08;
							r_CharArray[7] = 'h10;						
						end
					'h49:									// Char = >
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h04;
							r_CharArray[2] = 'h08;
							r_CharArray[3] = 'h10;
							r_CharArray[4] = 'h20;
							r_CharArray[5] = 'h10;
							r_CharArray[6] = 'h08;
							r_CharArray[7] = 'h04;						
						end
					'h4A:									// Char = ?
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h1C;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h20;
							r_CharArray[4] = 'h10;
							r_CharArray[5] = 'h08;
							r_CharArray[6] = 'h00;
							r_CharArray[7] = 'h08;						
						end
					'h5D:									// Char = |
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h08;
							r_CharArray[2] = 'h08;
							r_CharArray[3] = 'h08;
							r_CharArray[4] = 'h08;
							r_CharArray[5] = 'h08;
							r_CharArray[6] = 'h08;
							r_CharArray[7] = 'h08;						
						end
						
					
					
					'h1C:										// Char = A
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h08;
							r_CharArray[2] = 'h14;
							r_CharArray[3] = 'h22;
							r_CharArray[4] = 'h22;
							r_CharArray[5] = 'h3E;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h22;
						end					
					'h32:										// Char = B
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h1E;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h22;
							r_CharArray[4] = 'h1E;
							r_CharArray[5] = 'h22;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h1E;
						end
					'h21:										// Char = C
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h1C;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h02;
							r_CharArray[4] = 'h02;
							r_CharArray[5] = 'h02;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h1C;
						end
					'h23:										// Char = D
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h0E;
							r_CharArray[2] = 'h12;
							r_CharArray[3] = 'h22;
							r_CharArray[4] = 'h22;
							r_CharArray[5] = 'h22;
							r_CharArray[6] = 'h12;
							r_CharArray[7] = 'h0E;
						end
					'h24:										// Char = E
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h3E;
							r_CharArray[2] = 'h02;
							r_CharArray[3] = 'h02;
							r_CharArray[4] = 'h1E;
							r_CharArray[5] = 'h02;
							r_CharArray[6] = 'h02;
							r_CharArray[7] = 'h3E;
						end
					'h2B:										// Char = F
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h3E;
							r_CharArray[2] = 'h02;
							r_CharArray[3] = 'h02;
							r_CharArray[4] = 'h1E;
							r_CharArray[5] = 'h02;
							r_CharArray[6] = 'h02;
							r_CharArray[7] = 'h02;
						end
					'h34:										// Char = G
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h1C;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h02;
							r_CharArray[4] = 'h3A;
							r_CharArray[5] = 'h22;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h3C;
						end
					'h33:										// Char = H
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h22;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h22;
							r_CharArray[4] = 'h3E;
							r_CharArray[5] = 'h22;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h22;
						end
					'h43:										// Char = I
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h1C;
							r_CharArray[2] = 'h08;
							r_CharArray[3] = 'h08;
							r_CharArray[4] = 'h08;
							r_CharArray[5] = 'h08;
							r_CharArray[6] = 'h08;
							r_CharArray[7] = 'h1C;
						end
					'h3B:										// Char = J
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h38;
							r_CharArray[2] = 'h10;
							r_CharArray[3] = 'h10;
							r_CharArray[4] = 'h10;
							r_CharArray[5] = 'h10;
							r_CharArray[6] = 'h12;
							r_CharArray[7] = 'h0C;
						end
					'h42:										// Char = K
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h22;
							r_CharArray[2] = 'h12;
							r_CharArray[3] = 'h0A;
							r_CharArray[4] = 'h06;
							r_CharArray[5] = 'h0A;
							r_CharArray[6] = 'h12;
							r_CharArray[7] = 'h22;
						end
					'h4B:										// Char = L
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h02;
							r_CharArray[2] = 'h02;
							r_CharArray[3] = 'h02;
							r_CharArray[4] = 'h02;
							r_CharArray[5] = 'h02;
							r_CharArray[6] = 'h02;
							r_CharArray[7] = 'h3E;
						end
					'h3A:										// Char = M
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h22;
							r_CharArray[2] = 'h36;
							r_CharArray[3] = 'h2A;
							r_CharArray[4] = 'h2A;
							r_CharArray[5] = 'h22;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h22;
						end
					'h31:										// Char = N
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h22;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h26;
							r_CharArray[4] = 'h2A;
							r_CharArray[5] = 'h32;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h22;
						end
					'h44:										// Char = O
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h1C;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h22;
							r_CharArray[4] = 'h22;
							r_CharArray[5] = 'h22;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h1C;
						end
					'h4D:										// Char = P
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h1E;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h22;
							r_CharArray[4] = 'h1E;
							r_CharArray[5] = 'h02;
							r_CharArray[6] = 'h02;
							r_CharArray[7] = 'h02;
						end
					'h15:										// Char = Q
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h1C;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h22;
							r_CharArray[4] = 'h22;
							r_CharArray[5] = 'h2A;
							r_CharArray[6] = 'h12;
							r_CharArray[7] = 'h2C;
						end
					'h2D:										// Char = R
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h1E;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h22;
							r_CharArray[4] = 'h1E;
							r_CharArray[5] = 'h0A;
							r_CharArray[6] = 'h12;
							r_CharArray[7] = 'h22;
						end
					'h1B:										// Char = S
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h1C;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h02;
							r_CharArray[4] = 'h1C;
							r_CharArray[5] = 'h20;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h1C;
						end
					'h2C:										// Char = T
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h3E;
							r_CharArray[2] = 'h08;
							r_CharArray[3] = 'h08;
							r_CharArray[4] = 'h08;
							r_CharArray[5] = 'h08;
							r_CharArray[6] = 'h08;
							r_CharArray[7] = 'h08;
						end
					'h3C:										// Char = U
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h22;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h22;
							r_CharArray[4] = 'h22;
							r_CharArray[5] = 'h22;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h1C;
						end
					'h2A:										// Char = V
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h22;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h22;
							r_CharArray[4] = 'h22;
							r_CharArray[5] = 'h22;
							r_CharArray[6] = 'h14;
							r_CharArray[7] = 'h08;
						end
					'h1D:										// Char = W
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h22;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h22;
							r_CharArray[4] = 'h2A;
							r_CharArray[5] = 'h2A;
							r_CharArray[6] = 'h2A;
							r_CharArray[7] = 'h14;
						end
					'h22:										// Char = X
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h22;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h14;
							r_CharArray[4] = 'h08;
							r_CharArray[5] = 'h14;
							r_CharArray[6] = 'h22;
							r_CharArray[7] = 'h22;
						end
					'h35:										// Char = Y
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h22;
							r_CharArray[2] = 'h22;
							r_CharArray[3] = 'h22;
							r_CharArray[4] = 'h14;
							r_CharArray[5] = 'h08;
							r_CharArray[6] = 'h08;
							r_CharArray[7] = 'h08;
						end
					'h1A:										// Char = Z
						begin
							r_CharArray[0] = 'h00;
							r_CharArray[1] = 'h3E;
							r_CharArray[2] = 'h20;
							r_CharArray[3] = 'h10;
							r_CharArray[4] = 'h08;
							r_CharArray[5] = 'h04;
							r_CharArray[6] = 'h02;
							r_CharArray[7] = 'h3E;
						end
					
				endcase
		
		
			r_BitsMap = r_CharArray[i_Row];
		end
		
	assign o_BitsMap = r_BitsMap;

endmodule
