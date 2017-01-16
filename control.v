`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2016 10:26:25 PM
// Design Name: 
// Module Name: control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module control(
	output reg [3:0] enable,
	output [7:0] seven,
	input [15:0] q,
	input clk
	);
	
	localparam zero=4'b0000;
	reg [1:0] counter;
	reg [3:0] bcd;
	
	bcd_seven decoder(seven,bcd);  	
	always @(posedge clk)
	begin
		counter = counter + 1'b1;
		begin
			case(counter)
				2'b00 :
					begin 
						enable<=4'b1110;
						bcd<=q[3:0];
					end
				2'b01 : 
					begin 
						enable<=4'b1101;
						bcd<=q[7:4];
					end
				2'b10 : 
						begin 
							enable<=4'b1011;
							bcd<=q[11:8];
						end
				2'b11 : 
						begin 
							enable<=4'b0111;
							bcd<=q[15:12];
						end
				default : 
						begin
							enable<=4'b1111;
							bcd<=zero;
						end
			endcase
		end
	end
endmodule
