`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2016 07:41:23 PM
// Design Name: 
// Module Name: adder
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


module adder(
    input [6:0] first,
    input [6:0] second,
    output [13:0] result 
    );

    wire [6:1] cin;
    halfadder h (result[0], cin[1], first[0], second[0]);
    fulladder f1(result[1], cin[2], first[1], second[1], cin[1]);
    fulladder f2(result[2], cin[3], first[2], second[2], cin[2]);
    fulladder f3(result[3], cin[4], first[3], second[3], cin[3]);
    fulladder f4(result[4], cin[5], first[4], second[4], cin[4]);
    fulladder f5(result[5], cin[6], first[5], second[5], cin[5]);
    fulladder f6(result[6], result[7], first[6], second[6], cin[6]);
    assign result[13:8] = 6'b0;
endmodule


module signedAdder(
    input [7:0] first,
    input [7:0] second,
    output [13:0] result 
    );

    wire [7:1] cin;
    halfadder h (result[0], cin[1], first[0], second[0]);
    fulladder f1(result[1], cin[2], first[1], second[1], cin[1]);
    fulladder f2(result[2], cin[3], first[2], second[2], cin[2]);
    fulladder f3(result[3], cin[4], first[3], second[3], cin[3]);
    fulladder f4(result[4], cin[5], first[4], second[4], cin[4]);
    fulladder f5(result[5], cin[6], first[5], second[5], cin[5]);
    fulladder f6(result[6], cin[7], first[6], second[6], cin[6]);
    fulladder f7(result[7], result[8], first[7], second[7], cin[7]);
    assign result[13:9] = 5'b0;
endmodule
