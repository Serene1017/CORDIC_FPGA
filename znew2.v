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


module znew2(
	output reg [15:0] z,
	output zsign,
	input [15:0] z0,
	input [15:0] zrom,
	input cin,
	input reset,
	input stop,
	input clk
	);
	
	wire [15:0] sum,a,b;
	wire cout;	// no use
	
	cla_16_two_level alu(sum,cout,a,b,cin);
	
	assign a=z;
	assign b=cin?(~zrom):zrom;
	
	always @(posedge clk)
	begin
		if(reset)
		begin
			z<=z0;
		end
		else
		begin
			if(!stop)
				z<=sum;
			else
				z<=z;
		end	
	end
	
	assign zsign=z[15];
endmodule
