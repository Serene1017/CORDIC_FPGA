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
	output reg sign,	// the sign bit of zreg
	output reg zdone,	// signal for completing sh&comp
	input op,	// control signal of the adder/subtracter
	input [15:0] z0,	// initial value
	input [4:0] i,	// how many times of pressing button
	input start,	// start sh&comp
	input clk
	);
	
	reg [15:0] zreg;
	reg [15:0] zrom [0:15];
	reg [4:0] counter;
	reg cin_reg;
	reg zin;
	
	wire zn;
	wire cout;
	wire a,b,cin;
	
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
	
	fa1bit adder(cout,zn,a,b,cin,op); // inputs should be wire type
	
	
	// shift register
	always @(posedge clk)
	begin
		if(i==5'b0)
		/* 
			initial status
		*/
		begin
			zreg=z0;
			cin_reg=0;
			sign=zreg[15];
			zin=zrom[0][0];
			zdone=0;
			counter=0;
		end
		else
		begin
			if(start)
			begin
				if(counter==5'b1_0000)	// finish shifting 16 times
				begin
					zreg=zreg;
					zdone=1;
					sign=zreg[15];
				end
				else
				begin
					zreg<={zn,zreg[15:1]};
					cin_reg<=cout;
					counter<=counter+1;
					zin<=zrom[i-1][counter];
				end
			end
			else // if not started the sh&comp
			begin
				zreg<=zreg;
				counter=0;
				zdone=0;
			end
		end
	end
	
	// convert reg type to wire type for 1bit adder/subtracter 
	assign a=zreg[0];
	assign b=zin;
	assign cin=cin_reg;

endmodule
