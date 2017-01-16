`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2016 05:34:24 PM
// Design Name: 
// Module Name: tb_ctrlnew
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


module tb_ctrlnew(
    );
    
    wire [3:0] i;
    wire stop;
    wire [1:0] state;
    wire [4:0] counter;
    
    reg reset,comp,clk;
    
    ctrlnew_test uut(i,stop,state,counter,reset,comp,clk);
    
    initial
    begin
        clk=0;
        reset=0;
        comp=0;
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
    end
endmodule
