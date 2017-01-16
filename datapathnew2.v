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


module datapathnew2(
	output [15:0] x,
	output [15:0] y,
	input [15:0] z0,
	input [3:0] i,
	input reset,
	input stop,
	input clk
	); 
	
	parameter xinit=16'b0010_0110_1101_1101;	//k16
	parameter yinit=16'b0;
	
	reg [15:0] zrom [0:15];
	wire [15:0] xval,yval,zval;
	wire [15:0] x0,y0;
	wire [15:0] z;
	wire zsign;
	
	initial
	begin
		zrom[0]=16'b0011_0010_0100_0011;
		zrom[1]=16'b0001_1101_1010_1100;
		zrom[2]=16'b0000_1111_1010_1101;
		zrom[3]=16'b0000_0111_1111_0101;
		zrom[4]=16'b0000_0011_1111_1110;
		zrom[5]=16'b0000_0001_1111_1111;
		zrom[6]=16'b0000_0000_1111_1111;
		zrom[7]=16'b0000_0000_0111_1111;
		zrom[8]=16'b0000_0000_0011_1111;
		zrom[9]=16'b0000_0000_0001_1111;
		zrom[10]=16'b0000_0000_0000_1111;
		zrom[11]=16'b0000_0000_0000_0111;
		zrom[12]=16'b0000_0000_0000_0011;
		zrom[13]=16'b0000_0000_0000_0001;
		zrom[14]=16'b0;
		zrom[15]=16'b0;
	end	

	xnew2 xmod(x,x0,yval,xcin,reset,stop,clk);
	ynew2 ymod(y,y0,xval,ycin,reset,stop,clk);
	znew2 zmod(z,zsign,z0,zval,zcin,reset,stop,clk);
	
	assign x0=xinit;
	assign y0=yinit;
	
	assign xval=x>>>i;
	assign yval=y>>>i;
	assign zval=zrom[i];
	
	assign xcin=zsign?1'b0:1'b1;
	assign ycin=zsign?1'b1:1'b0;
	assign zcin=zsign?1'b0:1'b1;
	
endmodule