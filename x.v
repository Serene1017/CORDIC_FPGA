`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2016 10:31:08 AM
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


module x(
	output reg xdone,
	output reg xout,
	output reg [15:0] xreg,
	input yout,
	input op,
	input [15:0] x0,
	input [4:0] i,
	input [3:0] selx,
	input start,
	input clk
	);
	
	reg cin_reg;
	reg [4:0] counter;
	
	wire a;
	
	fa1bit adder(cout,xn,a,yout,cin,op); // inputs should be wire type
	
	always @(*)
	case(selx)
		5'h0:	xout=xreg[0];
		5'h1:	xout=xreg[1];
		5'h2:	xout=xreg[2];
		5'h3:	xout=xreg[3];
		5'h4:	xout=xreg[4];
		5'h5:	xout=xreg[5];
		5'h6:	xout=xreg[6];
		5'h7:	xout=xreg[7];
		5'h8:	xout=xreg[8];
		5'h9:	xout=xreg[9];
		5'ha:	xout=xreg[10];
		5'hb:	xout=xreg[11];
		5'hc:	xout=xreg[12];
		5'hd:	xout=xreg[13];
		5'he:	xout=xreg[14];
		5'hf:	xout=xreg[15];
		default:	xout=xreg[0];
	endcase
	
	always @(posedge clk)
	begin
		if(i==5'b0)
		begin
			xreg=x0;
			cin_reg=0;
			xdone=0;
			counter=0;
		end
		else
		begin
			if(start)
			begin
				if(counter==5'b1_0000)
				begin
					xreg=xreg;
					xdone=1;
				end
				else
				begin
					xreg<={xn,xreg[15:1]};
					cin_reg<=cout;
					counter=counter+1;
				end
			end
			else
			begin
				xreg=xreg;
				counter=0;
				xdone=0;
			end
		end
	end
	
	assign a=xreg[0];
	assign cin=cin_reg;
	
endmodule
