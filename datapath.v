`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2016 08:35:05 AM
// Design Name: 
// Module Name: datapath
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


module datapath(
	output [15:0] x,
	output [15:0] y,
	output done,
	output sign,
	input op,
	input [15:0] z0,
	input [4:0] i,
	input [3:0] selx,
	input [3:0] sely,
	input start,
	input clk
	); 
	
	wire [15:0] x0,y0;
	
	//signed fixed point (14 bits for fraction) 
	parameter k16=16'b0010_0110_1101_1101;
	
	assign x0=k16;
	assign y0=16'b0;
	
	x xcom(xdone,xout,x,yout,op,x0,i,selx,start,clk);
	y ycom(ydone,yout,y,xout,op,y0,i,sely,start,clk);
	z zcom(sign,zdone,op,z0,i,start,clk);
	
	assign done=xdone&ydone&zdone;

endmodule
