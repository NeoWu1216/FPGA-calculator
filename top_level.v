`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2016 09:21:02 PM
// Design Name: 
// Module Name: top_level
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


module top_level(
    input clk,
    input [15:0] sw,
    output [15:0] led,
    output [6:0] seg,
    output [3:0] an
    );
    
wire tempclk, outclk, outclk2, overclk;

clk_wiz c_w (clk, tempclk);
clock_divider #(5000) c_d(tempclk, outclk);
clock_divider #(10000) c_d2(tempclk, outclk2);
clock_divider #(3000000) c_d3(tempclk, overclk);

wire [3:0] hund,ten,one,thou, overflow, overflow1, final1,realfinal;
wire [13:0] mult, sum, diff, quo, binary;
wire [6:0] seg1, segOver, segPositive,  O, V, E, R, n /*n stands for negative*/; 
assign O = ~7'b0111111;
assign V = ~7'b0111110;
assign E = ~7'b1111001;
assign R = ~7'b1110111;
assign n = ~7'b1000000;

wire [15:0] alter  = 16'b1010101010101010;
mux4v #(16) selectLed(led, 16'b0, 16'b0, alter, ~alter, {overflow, overclk});

wallace14 wall(mult, sw[13:7], sw[6:0]);
adder add(sw[6:0],sw[13:7],sum);
subtractor sub(diff, sw[13:7], sw[6:0]);
divide div(quo, sw[13:7], sw[6:0]);

mux4v #(14) mselect(binary, sum, {1'b0, diff[12:0]} , mult, {1'b0, quo[12:0]}, {sw[15], sw[14]});
DecimalDigitDecoder ddd({2'b0,binary}, overflow1, thou, hund, ten, one);
BCDToLED btl(realfinal, seg1);
assign overflow = overflow1 | (sw[14] && sw[15] && quo[13]);
mux2v #(7) segment(segPositive, seg1, segOver, overflow[0]|overflow[1]|overflow[2]|overflow[3]); 
mux2v #(7) segment2(seg, segPositive, n, outclk && outclk2 && sw[14] && !sw[15] && diff[13]);

mux4v #(4) m(realfinal,one,ten,hund,thou,{outclk, outclk2});
mux4v #(7) mOver(segOver, R, E, V, O, {outclk, outclk2}); 
assign an[0] = !(!outclk && !outclk2);
assign an[1] = !(!outclk && outclk2);
assign an[2] = !(outclk && !outclk2);
assign an[3] = !(outclk && outclk2);

endmodule
