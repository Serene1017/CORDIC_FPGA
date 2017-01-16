`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2016 10:57:12 PM
// Design Name: 
// Module Name: top_lab8
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


module top_lab8(
	output [7:0] seven,
	output [3:0] enable,
	output [3:0] i,
	input [15:0] z0,
	input reset,
	input comp,
	input clkin
	);
	
	wire [15:0] x,y;
	
	clock_divider #(.timeconst(5)) clkdiv1(clk1,clkin);
    clock_divider #(.timeconst(20)) clkdiv2(clk2,clkin);
	ctrlnew ctrl(i,stop,reset,comp,clk1);
	datapathnew2 dp(x,y,z0,i,reset,stop,clk1);
	//control dis(enable,seven,x[13:2],clk1);
	control dis(enable,seven,x,clk2);
endmodule
