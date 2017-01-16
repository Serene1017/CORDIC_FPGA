`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2016 03:19:31 AM
// Design Name: 
// Module Name: ctrldp_test
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


module ctrldp_test(
    output [15:0] x,
    output [15:0] y,
    output stop,
    output [1:0] state,
    output [3:0] i,
    output [4:0] counter,
    input [15:0] z0,
    input reset,
    input comp,
    input clk
    );
    
    datapathnew2 uut1(x,y,z0,i,reset,stop,clk);
    ctrlnew_test uut2(i,stop,state,counter,reset,comp,clk);
    
endmodule
