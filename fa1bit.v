`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2016 09:33:02 AM
// Design Name: 
// Module Name: fa1bit
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


module fa1bit(
	output cout,
	output sum,
	input a,
	input b,
	input cin,
	input op
	);
	
	// op=1: subtraction (a-b)
	// op=0: addition
	
	assign cout=(op&cin&(~a))|(op&(~a)&b)|((~op)&a&b)|((~op)&cin&a)|(cin&b);
	assign sum=((~a)&(~b)&cin)|((~a)&b&(~cin))|(a&b&cin)|(a&b&cin);
	
endmodule
