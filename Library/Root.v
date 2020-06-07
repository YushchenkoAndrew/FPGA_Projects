`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:05:14 03/22/2020 
// Design Name: 
// Module Name:    Root 
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

module Root(
	input i_clk, 
	input[1:0] i_x,
	output[1:0] o_y
    );
	
	
	parameter [7:0] s_bit = 7;			//system bit 
	
	//Explanation of input/output parameters:
	//clk - Clock for this system
	//i_x - Get value (index i) from X register(array)
	//p   - This parameter need to delay result
	//o_y - Out value y in number(index) i
	
	
	reg[7:0] H = 0;
	reg[7:0] R = 0;
	reg[7:0] Y = 0;
	reg[s_bit:0] clk_CNT = 0;			//clock counter
	reg[7:0] shiftReg = 'b10000000;
	
	reg[1:0] r_y = 'b0;
	
	
	always @(posedge i_clk)
		begin
			H = (R << 1) + {i_x, 5'b0000};
			
		end
		
		always @(negedge i_clk)
			begin
			if ((Y + (shiftReg >>> 1)) > H)
				begin
					R = H;
					r_y = 2'b00;
				end
			else if (H < ((Y + shiftReg) <<< 1))
				begin
					R = H -	Y - (shiftReg >>> 1);
					Y = Y + shiftReg;
					r_y = 2'b01;
				end
			else
				begin
					R = H -	((Y + shiftReg) <<< 1);
					//Y[s_bit - clk_CNT + 1] = 1'b1;
					Y = Y + (shiftReg <<< 1);
					r_y = 2'b10;
				end	
					
			shiftReg = shiftReg >>> 1;
		end
		
		
		assign o_y = r_y;
	
endmodule












