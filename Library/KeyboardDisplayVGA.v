`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:23:56 04/19/2020 
// Design Name: 
// Module Name:    KeyboardDisplayVGA 
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
module KeyboardDisplayVGA(
	 input i_clk,
	 input[9:0] i_h_CNT,
	 input[9:0] i_v_CNT,
	 input[23:0] i_KeyData,
	 input i_VideoEnable,
	 output[3:0] o_Data
    );

	
	reg [8:0] r_Buffer;

	reg[9:0] Index = 'b0;
	reg[9:0] r_BuffIndex = 'b0;
	
	reg writeEnable = 'b0;
	
	wire [8:0] r_BufferBit;
	
	
	SRAM Buffer(
	 .i_clk(i_clk),
	 .i_AddrWrite(Index),
	 .i_AddrRead(r_BuffIndex),
	 .i_write(writeEnable),
	 .i_Data(r_Buffer),
	 .o_Data(r_BufferBit)
	 );
	


	reg[3:0] r_Data = 'b0;
	
	
	reg CursorState = 'b0;
	
	reg[22:0] r_Delay = 'b0;
	
	always @(posedge i_clk)
		begin
			r_Delay = r_Delay + 1'b1;
			
			if (r_Delay == 'b0)
				CursorState = ~CursorState;
		end

	
	wire[7:0] w_BitsMap;
	
	CharROM ROM (
		 .i_clk(i_clk),
		 .i_CharIndex(r_BufferBit),
		 .i_Row(i_v_CNT[3:1]),
		 .o_BitsMap(w_BitsMap));
	
	reg[7:0] r_StoreNewKey = 'b0;
	
	reg CAPS_LOCK_FLAG = 'b0;
	reg SHIFT_FLAG = 'b0;
	reg BACK_SPACE_FLAG = 'b0;
	
	reg[3:0] r_KeyState = 'b0;
	
	localparam[3:0]	NEW_KEY_STATE				=	'b0000;
	localparam[3:0]	CAPS_LOCK_STATE			=	'b0001;
	localparam[3:0]	ANOTHER_KEY_STATE 		=	'b0010;
	localparam[3:0]	END_PRESS_STATE			=	'b0011;
	localparam[3:0]	SHIFT_STATE					=	'b0100;
	localparam[3:0]	COMBO_KEY_STATE			=	'b0101;
	localparam[3:0]	SHIFT_PRESSING_STATE		=	'b0110;
	localparam[3:0]	SYSTEM_KEY_STATE			=	'b0111;
	localparam[3:0]	SYSTEM_KEY_BREAK_STATE	=	'b1000;
	localparam[3:0]	BACK_SPACE_STATE			=	'b1001;
	
	wire NewKeyPress = (r_StoreNewKey != i_KeyData[7:0] && i_KeyData[7:0] != 'hF0  && i_KeyData[15:8] != 'hF0);
	
	always @(posedge i_clk)
		begin
		
		writeEnable = 1'b0;
		if (BACK_SPACE_FLAG)
			begin
				BACK_SPACE_FLAG = 'b0;
				Index = Index - 1;
			end
		
			case (r_KeyState)			
				NEW_KEY_STATE:
					begin						
						r_Buffer = {CAPS_LOCK_FLAG, i_KeyData[7:0]};
						writeEnable = r_StoreNewKey != 'hE0 && i_KeyData[7:0] != 'hE0 ? 1'b1 : 'b0;
						
						case (i_KeyData[7:0])
							'h58		:	r_KeyState = CAPS_LOCK_STATE;
							'hE0		:	r_KeyState = NEW_KEY_STATE;
							'h66		:	r_KeyState = BACK_SPACE_STATE;
							default	:	r_KeyState = ANOTHER_KEY_STATE;
						endcase
						
						if (r_StoreNewKey == 'hE0 && i_KeyData[7:0] != 'hE0)
							r_KeyState = SYSTEM_KEY_STATE;
							
						r_StoreNewKey = i_KeyData[7:0];
					end
					
				ANOTHER_KEY_STATE:
					begin
						if (NewKeyPress)
							case (i_KeyData[15:8])
								'h12	:	r_KeyState = SHIFT_STATE;
								'h59	:	r_KeyState = SHIFT_STATE;
								default	:	r_KeyState = COMBO_KEY_STATE;
							endcase
						
						if (i_KeyData[15:8] == 'hF0 && r_StoreNewKey == i_KeyData[7:0])
							r_KeyState = END_PRESS_STATE;
					end
				
				SYSTEM_KEY_STATE:
					begin
						
						case(i_KeyData[7:0])						
							'h74		:		Index = Index + 1'b1;
							'h6B		:		Index = Index - 1'b1;
							'h75		:		Index = Index - 'h20;
							'h72		:		Index = Index + 'h20;
						endcase			
						
						r_KeyState = SYSTEM_KEY_BREAK_STATE;
					end
					
				SYSTEM_KEY_BREAK_STATE:
					if (i_KeyData[23:16] == 'hF0)
						r_KeyState = NEW_KEY_STATE;
					
				COMBO_KEY_STATE:
					begin				
						Index = CAPS_LOCK_FLAG == r_Buffer[8] ? Index + 1 : Index;
						
						r_KeyState = NEW_KEY_STATE;
					end
					
				BACK_SPACE_STATE:
					begin
						Index = Index - 2'b10;
						r_Buffer = 'b0;
						Index = Index + 1;
						writeEnable = 1'b1;
						
						BACK_SPACE_FLAG = 1'b1;
						r_KeyState = ANOTHER_KEY_STATE;
					end
					
				CAPS_LOCK_STATE:
					begin
						CAPS_LOCK_FLAG = !CAPS_LOCK_FLAG;
						r_KeyState = ANOTHER_KEY_STATE;
					end
				
				SHIFT_STATE:
					if (NewKeyPress)
						begin
							r_Buffer = {!CAPS_LOCK_FLAG, i_KeyData[7:0]};
							writeEnable = 1'b1;
							
							SHIFT_FLAG <= 1'b1;
							
							r_StoreNewKey = i_KeyData[7:0];
							r_KeyState = SHIFT_PRESSING_STATE;
						end
				
				SHIFT_PRESSING_STATE:
					begin
						if (NewKeyPress)
							begin
								r_KeyState = SHIFT_STATE;
								Index = Index + 1;
							end
						
						if (i_KeyData[15:8] == 'hF0 && (i_KeyData[7:0] == 'h12 || i_KeyData[7:0] == 'h59))
							r_KeyState = END_PRESS_STATE;
					end
						
				END_PRESS_STATE:
					if (i_KeyData[23:16] == 'hF0)
						begin
							r_KeyState = NEW_KEY_STATE;
							Index = (CAPS_LOCK_FLAG == r_Buffer[8]) | SHIFT_FLAG ? Index + 1 : Index;
							SHIFT_FLAG <= 'b0;
						end
			endcase
			
		end	
	
	wire[7:0] r_Cursor = (((i_v_CNT[9:4] - 1) << 5) == (Index - i_h_CNT[9:4])) & CursorState ? 1 << 7 : 'b0;
	
	always @(posedge i_clk)
		begin
			if (i_VideoEnable == 1'b1 && (i_v_CNT[9:4] >= 'h01 && i_v_CNT[9:4] <= 'h10) && i_h_CNT[9:4] <= 'h22 && i_h_CNT[9:4] >= 'h03)
				begin
					r_Data = (w_BitsMap | r_Cursor) & (1 << i_h_CNT[3:1]) ? 'b111 : 'b0;
					
					r_BuffIndex = i_h_CNT[9:4] + ((i_v_CNT[9:4] - 1) << 5);
				end
			else
				r_Data = 'b0;
				
		end

		
	assign o_Data = r_Data;

endmodule
