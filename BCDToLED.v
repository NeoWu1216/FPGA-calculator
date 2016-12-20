`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2016 07:22:50 PM
// Design Name: 
// Module Name: BCDToLED
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


module BCDToLED(
    input [3:0] x,
    output [6:0] seg
    );
    
    assign seg[0]=x[2]&~x[1]&~x[0]|~x[3]&~x[2]&~x[1]&x[0];
    assign seg[1]=x[2]&~x[1]&x[0]|x[2]&x[1]&~x[0];
    assign seg[2]=~x[2]&x[1]&~x[0];
    assign seg[3]=x[2]&~x[1]&~x[0]|~x[2]&~x[1]&x[0]|x[2]&x[1]&x[0];
    assign seg[4]=x[0]|x[2]&~x[1];
    assign seg[5]=x[0]&~x[3]&~x[2]|x[1]&x[0]|~x[2]&x[1];
    assign seg[6]=~x[1]&~x[3]&~x[2]|x[2]&x[1]&x[0];
    
endmodule
