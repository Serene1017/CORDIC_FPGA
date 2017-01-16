`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2016 08:12:06 PM
// Design Name: 
// Module Name: tb_xnew
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


module tb_xnew(
	);
	
	wire [15:0] x;
	reg [15:0] x0,y;
	
	wire xdone;
	reg cin,reset,stop,clk;
	
	initial
	begin
		clk=0;
		x0=16'b0010011011011101;
	end
	
	always
		#10 clk=~clk;
	
	xnew uut(x,xdone,x0,y,cin,reset,stop,clk);
	
	initial
	begin
		reset=1; stop=0;
		#25 reset=0; y=16'b0; cin=1; //y0
		// note: forget shifting
		#20 y=(16'b0010011011011101>>>1); cin=1; //y1
		#20 y=(16'b0011101001001011>>>2); cin=0; //y2
		#20 y=(16'b0011010101110000>>>3); cin=0; //y3
		#20 y=(16'b0011000100101111>>>4); cin=0; //y4
		#20 y=(16'b0010111010100101>>>5); cin=0; //y5
		#20 y=(16'b0010110101000110>>>6); cin=0; //y6                                          
		#20 y=(16'b0010110010010010>>>7); cin=1; //y7
		#20 y=(16'b0010110011101101>>>8); cin=1; //y8
		#20 y=(16'b0010110100011011>>>9); cin=1; //y9
		#20 y=(16'b0010110100110010>>>10); cin=1; //y10
		#20 y=(16'b0010110100111101>>>11); cin=1; //y11
		#20 y=(16'b0010110101000011>>>12); cin=0; //y12
		#20 y=(16'b0010110101000000>>>13); cin=1; //y13
		#20 y=(16'b0010110101000001>>>14); cin=0; //y14
		#20 y=(16'b0010110101000001>>>15); cin=1; //y15
		#10 stop=1;
		
	end
	
	
endmodule
