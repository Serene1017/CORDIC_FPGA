`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2016 06:16:55 PM
// Design Name: 
// Module Name: xnew
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


module ynew2(
	output reg [15:0] y,
	input [15:0] y0,
	input [15:0] x,
	input cin,
	input reset,
	input stop,
	input clk
	);
	
	wire [15:0] sum,a,b;
	wire cout;	// no use
	
	// cin=1 sub; cin=0 add
	cla_16_two_level alu(sum,cout,a,b,cin);
	
	assign a=y;
	assign b=cin?(~x):x;
	
	always @(posedge clk)
	begin
		if(reset)
		begin
			y<=y0;
		end
		else
		begin
			if(!stop)
			begin
				y<=sum;
			end
			else
			begin
				y<=y;
			end
		end	
	end
endmodule
