module wallace(p, a, b);
  input [3:0]  a,b;
  output [7:0]  p; 
  assign p[0] = a[0]&b[0]; 
  wire [21:0]temp; //s(first) is down, cout is left
  halfadder ha1(p[1], temp[0], a[0]&b[1], a[1]&b[0]);

  fulladder fa2(temp[1], temp[2], a[0]&b[2], a[1]&b[1], a[2]&b[0]);
  halfadder ha2(p[2], temp[3], temp[0], temp[1]); 

  fulladder fa3(temp[4], temp[12], a[1]&b[2], a[2]&b[1], a[3]&b[0]);
  fulladder fa31(temp[5], temp[6], a[0]&b[3], temp[4], temp[2]);
  halfadder ha3(p[3], temp[7], temp[3], temp[5]);

  fulladder fa4(temp[8], temp[9], a[1]&b[3], a[2]&b[2], a[3]&b[1]);
  halfadder ha4(temp[10], temp[11], temp[12], temp[8]);
  fulladder fa41(p[4], temp[13], temp[6], temp[10], temp[7]);

  halfadder ha5(temp[14], temp[15], a[2]&b[3], a[3]&b[2]);
  halfadder ha51(temp[16], temp[17], temp[14], temp[9]);
  fulladder fa5(p[5], temp[18], temp[16], temp[11], temp[13]);

  halfadder ha6(temp[19], temp[20], a[3]&b[3], temp[15]);
  fulladder fa6(p[6], temp[21], temp[17], temp[19], temp[18]);

  halfadder ha7(p[7],,temp[20], temp[21]);
endmodule

module wallaceWeird(p, a, b);
  input [13:0]  a,b;
  output [13:0]  p;
  assign p[0] = a[0]&b[0];
  wire [168:0] temp;
  fulladder fa0(p[1], temp[0], a[0]&b[1], a[1]&b[0], 1'b0);

  fulladder fa1(temp[1], temp[2], a[0]&b[2], a[1]&b[1], a[2]&b[0]);
  fulladder fa2(p[2], temp[3], temp[1], temp[0], 1'b0);

  fulladder fa3(temp[4], temp[5], a[0]&b[3], a[1]&b[2], a[2]&b[1]);
  fulladder fa4(temp[6], temp[7], temp[4], a[3]&b[0], temp[2]);
  fulladder fa5(p[3], temp[8], temp[6], temp[3], 1'b0);

  fulladder fa6(temp[9], temp[10], a[0]&b[4], a[1]&b[3], a[2]&b[2]);
  fulladder fa7(temp[11], temp[12], temp[9], a[3]&b[1], a[4]&b[0]);
  fulladder fa8(temp[13], temp[14], temp[11], temp[5], temp[7]);
  fulladder fa9(p[4], temp[15], temp[13], temp[8], 1'b0);

  fulladder fa10(temp[16], temp[17], a[0]&b[5], a[1]&b[4], a[2]&b[3]);
  fulladder fa11(temp[18], temp[19], temp[16], a[3]&b[2], a[4]&b[1]);
  fulladder fa12(temp[20], temp[21], temp[18], a[5]&b[0], temp[10]);
  fulladder fa13(temp[22], temp[23], temp[20], temp[12], temp[14]);
  fulladder fa14(p[5], temp[24], temp[22], temp[15], 1'b0);

  fulladder fa15(temp[25], temp[26], a[0]&b[6], a[1]&b[5], a[2]&b[4]);
  fulladder fa16(temp[27], temp[28], temp[25], a[3]&b[3], a[4]&b[2]);
  fulladder fa17(temp[29], temp[30], temp[27], a[5]&b[1], a[6]&b[0]);
  fulladder fa18(temp[31], temp[32], temp[29], temp[17], temp[19]);
  fulladder fa19(temp[33], temp[34], temp[31], temp[21], temp[23]);
  fulladder fa20(p[6], temp[35], temp[33], temp[24], 1'b0);

  fulladder fa21(temp[36], temp[37], a[0]&b[7], a[1]&b[6], a[2]&b[5]);
  fulladder fa22(temp[38], temp[39], temp[36], a[3]&b[4], a[4]&b[3]);
  fulladder fa23(temp[40], temp[41], temp[38], a[5]&b[2], a[6]&b[1]);
  fulladder fa24(temp[42], temp[43], temp[40], a[7]&b[0], temp[26]);
  fulladder fa25(temp[44], temp[45], temp[42], temp[28], temp[30]);
  fulladder fa26(temp[46], temp[47], temp[44], temp[32], temp[34]);
  fulladder fa27(p[7], temp[48], temp[46], temp[35], 1'b0);

  fulladder fa28(temp[49], temp[50], a[0]&b[8], a[1]&b[7], a[2]&b[6]);
  fulladder fa29(temp[51], temp[52], temp[49], a[3]&b[5], a[4]&b[4]);
  fulladder fa30(temp[53], temp[54], temp[51], a[5]&b[3], a[6]&b[2]);
  fulladder fa31(temp[55], temp[56], temp[53], a[7]&b[1], a[8]&b[0]);
  fulladder fa32(temp[57], temp[58], temp[55], temp[37], temp[39]);
  fulladder fa33(temp[59], temp[60], temp[57], temp[41], temp[43]);
  fulladder fa34(temp[61], temp[62], temp[59], temp[45], temp[47]);
  fulladder fa35(p[8], temp[63], temp[61], temp[48], 1'b0);

  fulladder fa36(temp[64], temp[65], a[0]&b[9], a[1]&b[8], a[2]&b[7]);
  fulladder fa37(temp[66], temp[67], temp[64], a[3]&b[6], a[4]&b[5]);
  fulladder fa38(temp[68], temp[69], temp[66], a[5]&b[4], a[6]&b[3]);
  fulladder fa39(temp[70], temp[71], temp[68], a[7]&b[2], a[8]&b[1]);
  fulladder fa40(temp[72], temp[73], temp[70], a[9]&b[0], temp[50]);
  fulladder fa41(temp[74], temp[75], temp[72], temp[52], temp[54]);
  fulladder fa42(temp[76], temp[77], temp[74], temp[56], temp[58]);
  fulladder fa43(temp[78], temp[79], temp[76], temp[60], temp[62]);
  fulladder fa44(p[9], temp[80], temp[78], temp[63], 1'b0);

  fulladder fa45(temp[81], temp[82], a[0]&b[10], a[1]&b[9], a[2]&b[8]);
  fulladder fa46(temp[83], temp[84], temp[81], a[3]&b[7], a[4]&b[6]);
  fulladder fa47(temp[85], temp[86], temp[83], a[5]&b[5], a[6]&b[4]);
  fulladder fa48(temp[87], temp[88], temp[85], a[7]&b[3], a[8]&b[2]);
  fulladder fa49(temp[89], temp[90], temp[87], a[9]&b[1], a[10]&b[0]);
  fulladder fa50(temp[91], temp[92], temp[89], temp[65], temp[67]);
  fulladder fa51(temp[93], temp[94], temp[91], temp[69], temp[71]);
  fulladder fa52(temp[95], temp[96], temp[93], temp[73], temp[75]);
  fulladder fa53(temp[97], temp[98], temp[95], temp[77], temp[79]);
  fulladder fa54(p[10], temp[99], temp[97], temp[80], 1'b0);

  fulladder fa55(temp[100], temp[101], a[0]&b[11], a[1]&b[10], a[2]&b[9]);
  fulladder fa56(temp[102], temp[103], temp[100], a[3]&b[8], a[4]&b[7]);
  fulladder fa57(temp[104], temp[105], temp[102], a[5]&b[6], a[6]&b[5]);
  fulladder fa58(temp[106], temp[107], temp[104], a[7]&b[4], a[8]&b[3]);
  fulladder fa59(temp[108], temp[109], temp[106], a[9]&b[2], a[10]&b[1]);
  fulladder fa60(temp[110], temp[111], temp[108], a[11]&b[0], temp[82]);
  fulladder fa61(temp[112], temp[113], temp[110], temp[84], temp[86]);
  fulladder fa62(temp[114], temp[115], temp[112], temp[88], temp[90]);
  fulladder fa63(temp[116], temp[117], temp[114], temp[92], temp[94]);
  fulladder fa64(temp[118], temp[119], temp[116], temp[96], temp[98]);
  fulladder fa65(p[11], temp[120], temp[118], temp[99], 1'b0);

  fulladder fa66(temp[121], temp[122], a[0]&b[12], a[1]&b[11], a[2]&b[10]);
  fulladder fa67(temp[123], temp[124], temp[121], a[3]&b[9], a[4]&b[8]);
  fulladder fa68(temp[125], temp[126], temp[123], a[5]&b[7], a[6]&b[6]);
  fulladder fa69(temp[127], temp[128], temp[125], a[7]&b[5], a[8]&b[4]);
  fulladder fa70(temp[129], temp[130], temp[127], a[9]&b[3], a[10]&b[2]);
  fulladder fa71(temp[131], temp[132], temp[129], a[11]&b[1], a[12]&b[0]);
  fulladder fa72(temp[133], temp[134], temp[131], temp[101], temp[103]);
  fulladder fa73(temp[135], temp[136], temp[133], temp[105], temp[107]);
  fulladder fa74(temp[137], temp[138], temp[135], temp[109], temp[111]);
  fulladder fa75(temp[139], temp[140], temp[137], temp[113], temp[115]);
  fulladder fa76(temp[141], temp[142], temp[139], temp[117], temp[119]);
  fulladder fa77(p[12], temp[143], temp[141], temp[120], 1'b0);

  fulladder fa78(temp[144], temp[145], a[0]&b[13], a[1]&b[12], a[2]&b[11]);
  fulladder fa79(temp[146], temp[147], temp[144], a[3]&b[10], a[4]&b[9]);
  fulladder fa80(temp[148], temp[149], temp[146], a[5]&b[8], a[6]&b[7]);
  fulladder fa81(temp[150], temp[151], temp[148], a[7]&b[6], a[8]&b[5]);
  fulladder fa82(temp[152], temp[153], temp[150], a[9]&b[4], a[10]&b[3]);
  fulladder fa83(temp[154], temp[155], temp[152], a[11]&b[2], a[12]&b[1]);
  fulladder fa84(temp[156], temp[157], temp[154], a[13]&b[0], temp[122]);
  fulladder fa85(temp[158], temp[159], temp[156], temp[124], temp[126]);
  fulladder fa86(temp[160], temp[161], temp[158], temp[128], temp[130]);
  fulladder fa87(temp[162], temp[163], temp[160], temp[132], temp[134]);
  fulladder fa88(temp[164], temp[165], temp[162], temp[136], temp[138]);
  fulladder fa89(temp[166], temp[167], temp[164], temp[140], temp[142]);
  fulladder fa90(p[13], temp[168], temp[166], temp[143], 1'b0);

endmodule



module wallace14(p, a, b);
  input [6:0] a, b;
  output [13:0] p;
  wallaceWeird ww(p, {7'b0, a}, {7'b0, b});
endmodule
