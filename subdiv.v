module subtractor(out, a, b);

input  [6:0]  a,b;
output [13:0] out;

wire   [7:0] tempb = {1'b0,b};
wire   [7:0] negateb = -tempb;
wire   [13:0] tempout;
signedAdder add({1'b0,a}, negateb, tempout); 
assign  out[13] = tempout[7]; //represent sign (if negative then 1)
assign  out[12:8] = 5'b0;
wire   [7:0] tempc = -tempout[7:0];
mux2v #(8) m2 (out[7:0], tempout[7:0], tempc[7:0], out[13]);

endmodule

module divide(out, a, b);

input  [6:0]  a,b;
output [13:0] out;
assign out[13] = b==7'b0;
assign out[12:0] = a/b; //lol

endmodule
