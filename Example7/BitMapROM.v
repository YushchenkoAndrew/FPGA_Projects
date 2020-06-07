`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:52:02 04/28/2020 
// Design Name: 
// Module Name:    BitMapROM 
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
module BitMapROM #(parameter ADDR_WIDTH = 13, DATA_WIDTH = 8, DEPTH = 8191) (
 	 input wire i_clk,
	 input wire [ADDR_WIDTH - 1:0] i_Addr,
	 output reg [DATA_WIDTH - 1:0] o_Data
    );
	 
	 
	reg [DATA_WIDTH - 1:0] PROM[0:DEPTH];
	
	reg[12:0] Index;

	 initial
		begin
			for (Index = 'b0; Index <= 'h1FFF; Index = Index + 1'b1)
				PROM[Index] = 'b0;
			
			
		// Num = 0
			PROM['h450] = 'h00;
			PROM['h451] = 'h1C;
			PROM['h452] = 'h22;
			PROM['h453] = 'h32;
			PROM['h454] = 'h2A;
			PROM['h455] = 'h26;
			PROM['h456] = 'h22;
			PROM['h457] = 'h1C;
			
			// Num = 1
			PROM['h160] = 'h00;
			PROM['h161] = 'h08;
			PROM['h162] = 'h0C;
			PROM['h163] = 'h08;
			PROM['h164] = 'h08;
			PROM['h165] = 'h08;
			PROM['h166] = 'h08;
			PROM['h167] = 'h1C;
			
			// Num = 2								
			PROM['h1E0] = 'h00;
			PROM['h1E1] = 'h1C;
			PROM['h1E2] = 'h22;
			PROM['h1E3] = 'h20;
			PROM['h1E4] = 'h10;
			PROM['h1E5] = 'h08;
			PROM['h1E6] = 'h04;
			PROM['h1E7] = 'h3E;
			
			// Num = 3
			PROM['h260] = 'h00;
			PROM['h261] = 'h3E;
			PROM['h262] = 'h10;
			PROM['h263] = 'h08;
			PROM['h264] = 'h10;
			PROM['h265] = 'h20;
			PROM['h266] = 'h22;
			PROM['h267] = 'h1C;
			
			// Num = 4
			PROM['h250] = 'h00;
			PROM['h251] = 'h10;
			PROM['h252] = 'h18;
			PROM['h253] = 'h14;
			PROM['h254] = 'h12;
			PROM['h255] = 'h7E;
			PROM['h256] = 'h10;
			PROM['h257] = 'h10;
			
			// Num = 5 
			PROM['h2E0] = 'h00;
			PROM['h2E1] = 'h3E;
			PROM['h2E2] = 'h02;
			PROM['h2E3] = 'h1E;
			PROM['h2E4] = 'h20;
			PROM['h2E5] = 'h20;
			PROM['h2E6] = 'h22;
			PROM['h2E7] = 'h1C;
			
	//'h36:									// Num = 6
	//	begin
	//		PROM[0] = 'h00;
	//		PROM[1] = 'h18;
	//		PROM[2] = 'h04;
	//		PROM[3] = 'h02;
	//		PROM[4] = 'h1E;
	//		PROM[5] = 'h22;
	//		PROM[6] = 'h22;
	//		PROM[7] = 'h1C;
	//	end
	//'h3D:									// Num = 7
	//	begin
	//		PROM[0] = 'h00;
	//		PROM[1] = 'h3E;
	//		PROM[2] = 'h22;
	//		PROM[3] = 'h10;
	//		PROM[4] = 'h08;
	//		PROM[5] = 'h08;
	//		PROM[6] = 'h08;
	//		PROM[7] = 'h08;
	//	end
	//'h3E:									// Num = 8
	//	begin
	//		PROM[0] = 'h00;
	//		PROM[1] = 'h1C;
	//		PROM[2] = 'h22;
	//		PROM[3] = 'h22;
	//		PROM[4] = 'h1C;
	//		PROM[5] = 'h22;
	//		PROM[6] = 'h22;
	//		PROM[7] = 'h1C;
	//	end
	//'h46:									// Num = 9
	//	begin
	//		PROM[0] = 'h00;
	//		PROM[1] = 'h1C;
	//		PROM[2] = 'h22;
	//		PROM[3] = 'h22;
	//		PROM[4] = 'h3C;
	//		PROM[5] = 'h20;
	//		PROM[6] = 'h10;
	//		PROM[7] = 'h0C;
	//	end
	//'h4E:									// Char = -
	//	begin
	//		PROM[0] = 'h00;
	//		PROM[1] = 'h00;
	//		PROM[2] = 'h00;
	//		PROM[3] = 'h00;
	//		PROM[4] = 'h3E;
	//		PROM[5] = 'h00;
	//		PROM[6] = 'h00;
	//		PROM[7] = 'h00;						
	//	end
	//'h55:									// Char = 
	//	begin
	//		PROM[0] = 'h00;
	//		PROM[1] = 'h00;
	//		PROM[2] = 'h00;
	//		PROM[3] = 'h3E;
	//		PROM[4] = 'h00;
	//		PROM[5] = 'h3E;
	//		PROM[6] = 'h00;
	//		PROM[7] = 'h00;						
	//	end
	//'h54:									// Char = [
	//	begin
	//		PROM[0] = 'h00;
	//		PROM[1] = 'h1C;
	//		PROM[2] = 'h04;
	//		PROM[3] = 'h04;
	//		PROM[4] = 'h04;
	//		PROM[5] = 'h04;
	//		PROM[6] = 'h04;
	//		PROM[7] = 'h1C;						
	//	end
	//'h5B:									// Char = ]
	//	begin
	//		PROM[0] = 'h00;
	//		PROM[1] = 'h1C;
	//		PROM[2] = 'h10;
	//		PROM[3] = 'h10;
	//		PROM[4] = 'h10;
	//		PROM[5] = 'h10;
	//		PROM[6] = 'h10;
	//		PROM[7] = 'h1C;						
	//	end
	//'h4C:									// Char = ;
	//	begin
	//		PROM[0] = 'h00;
	//		PROM[1] = 'h00;
	//		PROM[2] = 'h0C;
	//		PROM[3] = 'h0C;
	//		PROM[4] = 'h00;
	//		PROM[5] = 'h0C;
	//		PROM[6] = 'h08;
	//		PROM[7] = 'h04;						
	//	end
	//'h52:										// Char = '
	//	begin
	//		PROM[0] = 'h00;
	//		PROM[1] = 'h08;
	//		PROM[2] = 'h08;
	//		PROM[3] = 'h08;
	//		PROM[4] = 'h00;
	//		PROM[5] = 'h00;
	//		PROM[6] = 'h00;
	//		PROM[7] = 'h00;
	//	end
	//'h41:									// Char = ,
	//	begin
	//		PROM[0] = 'h00;
	//		PROM[1] = 'h00;
	//		PROM[2] = 'h00;
	//		PROM[3] = 'h00;
	//		PROM[4] = 'h00;
	//		PROM[5] = 'h0C;
	//		PROM[6] = 'h08;
	//		PROM[7] = 'h04;						
	//	end
	//'h49:									// Char = .
	//	begin
	//		PROM[0] = 'h00;
	//		PROM[1] = 'h00;
	//		PROM[2] = 'h00;
	//		PROM[3] = 'h00;
	//		PROM[4] = 'h00;
	//		PROM[5] = 'h00;
	//		PROM[6] = 'h0C;
	//		PROM[7] = 'h0C;						
	//	end
	//'h4A:									// Char = /
	//	begin
	//		PROM[0] = 'h00;
	//		PROM[1] = 'h00;
	//		PROM[2] = 'h20;
	//		PROM[3] = 'h10;
	//		PROM[4] = 'h08;
	//		PROM[5] = 'h04;
	//		PROM[6] = 'h02;
	//		PROM[7] = 'h00;						
	//	end
	//'h5D:									// Char = \
	//	begin
	//		PROM[0] = 'h00;
	//		PROM[1] = 'h00;
	//		PROM[2] = 'h02;
	//		PROM[3] = 'h04;
	//		PROM[4] = 'h08;
	//		PROM[5] = 'h10;
	//		PROM[6] = 'h20;
	//		PROM[7] = 'h00;						
	//	end

		end

	
	always @(posedge i_clk)
		begin
			o_Data <= PROM['h452];
		end



endmodule
