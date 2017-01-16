`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2016 10:04:59 PM
// Design Name: 
// Module Name: bcd_seven
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


module bcd_seven(
	output reg [7:0] seven,
	input [3:0] bcd
	);

	always @(bcd)
	begin
		case(bcd)
			4'b0000 : seven = ~8'b0011_1111;         // "0"
			4'b0001 : seven = ~8'b0000_0110;         // "1"
			4'b0010 : seven = ~8'b0101_1011;         // "2"
			4'b0011 : seven = ~8'b0100_1111;         // "3"
			4'b0100 : seven = ~8'b0110_0110;         // "4"
			4'b0101 : seven = ~8'b0110_1101;         // "5"
			4'b0110 : seven = ~8'b0111_1101;         // "6"
			4'b0111 : seven = ~8'b0000_0111;         // "7"
			4'b1000 : seven = ~8'b0111_1111;         // "8"
			4'b1001 : seven = ~8'b0110_1111;         // "9"
			4'b1010 : seven = ~8'b0111_0111;         // "A"
			4'b1011 : seven = ~8'b0111_1100;         // "b"
			4'b1100 : seven = ~8'b0011_1001;         // "C"
			4'b1101 : seven = ~8'b0101_1110;         // "d"
			4'b1110 : seven = ~8'b0111_1001;         // "E"
			4'b1111 : seven = ~8'b0111_0001;         // "F"
			default : seven = ~8'b0000_0000;         // all dim out 
		endcase
	end
endmodule
