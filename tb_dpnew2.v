`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2016 06:12:38 PM
// Design Name: 
// Module Name: tb_dpnew2
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


module tb_dpnew2(
	);
	
	wire [15:0] x,y;
	wire [3:0] i;
	wire stop;
	wire [4:0] counter;
	wire [1:0] state;
	
	reg reset,comp,clk;    
	reg [15:0] z0;
	
	ctrldp_test uut(x,y,stop,state,i,counter,z0,reset,comp,clk);
	
	initial
	begin
	 clk=0;
	 reset=1;
	 z0=16'b0011001001000011; //pi/4
	end
	
	always
		#10 clk=~clk;
		 
	initial
	begin
		#16 reset=1;
		#20 reset=0;comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
		#50 comp=0;
		#50 comp=1;
	end
	
	
endmodule
