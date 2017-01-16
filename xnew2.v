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

// verified
module xnew2(
	output reg [15:0] x,
	input [15:0] x0,
	input [15:0] y,
	input cin,
	input reset,
	input stop,
	input clk
	);
	
	wire [15:0] sum,a,b;
	wire cout;	// no use
	
	// cin=1 sub; cin=0 add
	cla_16_two_level alu(sum,cout,a,b,cin);
	
	assign a=x;
	assign b=cin?(~y):y;
	
	always @(posedge clk)
	begin
		if(reset)
		begin
			x<=x0;
		end
		else
		begin
			if(!stop)
			begin
				x<=sum;
			end
			else
			begin
				x<=x;
			end
		end
	end
endmodule
