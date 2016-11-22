`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2016 09:33:47 AM
// Design Name: 
// Module Name: x
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


module z(
	input [15:0] z0,
	input i,
	input clk
	);
	
	parameter regwidth=16;	
	parameter romwidth=16;
	parameter romdepth=16;
	
	reg [regwidth-1:0] zreg;
	reg [romwidth-1:0] zrom [0:romdepth-1];
	reg [3:0] counter;
	
	//assign zin=zrom[counter];
	fa1bit adder(cout,zn,zin,zreg[0],cin);
	
	always @(posedge clk)
	begin
		if(i=0)
			zreg=z0;
			counter=0;
		else
		begin
			zreg<={zn,zreg[15:1]};
			zin=zrom[counter][0];
			counter=counter+1;
		end
	end
	
endmodule
