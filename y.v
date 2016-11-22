`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2016 10:32:20 AM
// Design Name: 
// Module Name: y
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


module y(
	output reg ydone,
	output reg yout,
	output reg [15:0] yreg,
	input xout,
	input op,
	input [15:0] y0,
	input [4:0] i,
	input [3:0] sely,
	input start,
	input clk
	);
	
	reg cin_reg;
	reg [4:0] counter;
	
	wire a;
	
	fa1bit adder(cout,yn,a,xout,cin,op); // inputs should be wire type
	
	always @(*)
	case(sely)
		5'h0:	yout=yreg[0];
		5'h1:	yout=yreg[1];
		5'h2:	yout=yreg[2];
		5'h3:	yout=yreg[3];
		5'h4:	yout=yreg[4];
		5'h5:	yout=yreg[5];
		5'h6:	yout=yreg[6];
		5'h7:	yout=yreg[7];
		5'h8:	yout=yreg[8];
		5'h9:	yout=yreg[9];
		5'ha:	yout=yreg[10];
		5'hb:	yout=yreg[11];
		5'hc:	yout=yreg[12];
		5'hd:	yout=yreg[13];
		5'he:	yout=yreg[14];
		5'hf:	yout=yreg[15];
		default:	yout=yreg[0];
	endcase
	
	always @(posedge clk)
	begin
		if(i==5'b0)
		begin
			yreg=y0;
			cin_reg=0;
			ydone=0;
			counter=0;
		end
		else
		begin
			if(start)
			begin
				if(counter==5'b1_0000)
				begin
					yreg=yreg;
					ydone=1;
				end
				else
				begin
					yreg<={yn,yreg[15:1]};
					cin_reg<=cout;
					counter=counter+1;
				end
			end
			else
			begin
				yreg=yreg;
				counter=0;
				ydone=0;
			end
		end
	end
	
	assign a=yreg[0];
	assign cin=cin_reg;
	
endmodule
