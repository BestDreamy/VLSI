/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06-SP5-2
// Date      : Sun Apr 21 21:57:38 2024
/////////////////////////////////////////////////////////////


module multiplier_tb ( clk, rst, a_en, b_en, data, z );
  input [3:0] data;
  output [7:0] z;
  input clk, rst, a_en, b_en;
  wire   n52, n53, n54, n55, n56, n57, n58, n59, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151;
  wire   [3:0] a;
  wire   [3:0] b;

  HSR_DQ_2 \b_reg[0]  ( .D(n52), .CK(clk), .Q(b[0]) );
  HSR_DQ_2 \a_reg[0]  ( .D(n56), .CK(clk), .Q(a[0]) );
  HSR_DQ_2 \b_reg[1]  ( .D(n53), .CK(clk), .Q(b[1]) );
  HSR_DQ_0 \b_reg[3]  ( .D(n55), .CK(clk), .Q(b[3]) );
  HSR_DQ_0 \b_reg[2]  ( .D(n54), .CK(clk), .Q(b[2]) );
  HSR_DQ_2 \a_reg[3]  ( .D(n59), .CK(clk), .Q(a[3]) );
  HSR_DQ_2 \a_reg[2]  ( .D(n58), .CK(clk), .Q(a[2]) );
  HSR_DQ_2 \a_reg[1]  ( .D(n57), .CK(clk), .Q(a[1]) );
  HSR_XOR2_2 U63 ( .A1(n109), .A2(n108), .Z(n122) );
  HSR_XNOR3_2 U64 ( .A1(n106), .A2(n77), .A3(n103), .ZN(n73) );
  HSR_XNOR3_2 U65 ( .A1(n72), .A2(n71), .A3(n80), .ZN(n103) );
  HSR_AND2_2 U66 ( .A1(a[0]), .A2(b[0]), .Z(z[0]) );
  HSR_NOR2_3 U67 ( .A1(n127), .A2(n125), .ZN(n121) );
  HSR_CLKNAND2_1 U68 ( .A1(n99), .A2(n98), .ZN(n100) );
  HSR_CLKNAND2_0 U69 ( .A1(n119), .A2(n125), .ZN(n120) );
  HSR_CLKN_1 U70 ( .I(n109), .ZN(n110) );
  HSR_CLKNAND2_1 U71 ( .A1(n117), .A2(a[3]), .ZN(n119) );
  HSR_OAI21_1 U72 ( .A1(n74), .A2(n73), .B(n123), .ZN(n75) );
  HSR_MUX2N_1 U73 ( .I0(n89), .I1(n116), .S(n88), .ZN(n102) );
  HSR_AND2_1 U74 ( .A1(n104), .A2(n101), .Z(n78) );
  HSR_CLKNOR2_4 U75 ( .A1(n67), .A2(n68), .ZN(n77) );
  HSR_NOR2_1 U76 ( .A1(n81), .A2(a[3]), .ZN(n79) );
  HSR_CLKN_1 U77 ( .I(n76), .ZN(n106) );
  HSR_CLKNAND2_1 U78 ( .A1(a[0]), .A2(b[2]), .ZN(n68) );
  HSR_CLKNAND2_1 U79 ( .A1(a[3]), .A2(b[3]), .ZN(n132) );
  HSR_AND2_1 U80 ( .A1(b[0]), .A2(a[2]), .Z(n70) );
  HSR_AND2_1 U81 ( .A1(a[0]), .A2(b[3]), .Z(n74) );
  HSR_CLKNAND2_1 U82 ( .A1(b_en), .A2(data[1]), .ZN(n138) );
  HSR_CLKNAND2_4 U83 ( .A1(n97), .A2(n96), .ZN(n118) );
  HSR_OAI21_2 U84 ( .A1(n126), .A2(n121), .B(n120), .ZN(n131) );
  HSR_CLKNAND2_4 U85 ( .A1(n115), .A2(n114), .ZN(n126) );
  HSR_CLKNAND2_0 U86 ( .A1(a[2]), .A2(b[2]), .ZN(n101) );
  HSR_IN_0 U87 ( .I(n101), .ZN(n94) );
  HSR_IN_0 U88 ( .I(n84), .ZN(n87) );
  HSR_IN_2 U89 ( .I(n85), .ZN(n86) );
  HSR_CLKNAND2_0 U90 ( .A1(a[2]), .A2(b[3]), .ZN(n125) );
  HSR_NOR2_2 U91 ( .A1(n77), .A2(n76), .ZN(n92) );
  HSR_IN_0 U92 ( .I(n92), .ZN(n93) );
  HSR_IN_0 U93 ( .I(n104), .ZN(n95) );
  HSR_CLKNAND2_0 U94 ( .A1(n82), .A2(n81), .ZN(n84) );
  HSR_NOR2_2 U95 ( .A1(n80), .A2(n79), .ZN(n85) );
  HSR_NAND2_2 U96 ( .A1(a[1]), .A2(b[1]), .ZN(n63) );
  HSR_IN_0 U97 ( .I(a[0]), .ZN(n61) );
  HSR_IN_0 U98 ( .I(n103), .ZN(n107) );
  HSR_IN_0 U99 ( .I(n124), .ZN(n111) );
  HSR_NOR2_2 U100 ( .A1(n123), .A2(n110), .ZN(n113) );
  HSR_IN_0 U101 ( .I(n116), .ZN(n98) );
  HSR_IN_0 U102 ( .I(n118), .ZN(n99) );
  HSR_CLKNAND2_0 U103 ( .A1(a[0]), .A2(b[1]), .ZN(n130) );
  HSR_XNOR3_1 U104 ( .A1(n124), .A2(n123), .A3(n122), .ZN(z[4]) );
  HSR_XNOR3_1 U105 ( .A1(n128), .A2(n127), .A3(n126), .ZN(z[5]) );
  HSR_IN_0 U106 ( .I(n125), .ZN(n128) );
  HSR_XNOR3_1 U107 ( .A1(n133), .A2(n132), .A3(n131), .ZN(z[6]) );
  HSR_CLKNAND2_0 U108 ( .A1(n139), .A2(n138), .ZN(n53) );
  HSR_CLKNAND2_0 U109 ( .A1(n143), .A2(n142), .ZN(n58) );
  HSR_CLKNAND2_0 U110 ( .A1(a_en), .A2(data[2]), .ZN(n142) );
  HSR_CLKNAND2_0 U111 ( .A1(n146), .A2(a[2]), .ZN(n143) );
  HSR_CLKNAND2_0 U112 ( .A1(n148), .A2(n147), .ZN(n59) );
  HSR_CLKNAND2_0 U113 ( .A1(a_en), .A2(data[3]), .ZN(n147) );
  HSR_CLKNAND2_0 U114 ( .A1(n146), .A2(a[3]), .ZN(n148) );
  HSR_CLKNAND2_0 U115 ( .A1(n135), .A2(n134), .ZN(n56) );
  HSR_CLKNAND2_0 U116 ( .A1(a_en), .A2(data[0]), .ZN(n134) );
  HSR_CLKNAND2_0 U117 ( .A1(n146), .A2(a[0]), .ZN(n135) );
  HSR_CLKNAND2_0 U118 ( .A1(n137), .A2(n136), .ZN(n52) );
  HSR_CLKNAND2_0 U119 ( .A1(data[0]), .A2(b_en), .ZN(n136) );
  HSR_CLKNAND2_0 U120 ( .A1(n149), .A2(b[0]), .ZN(n137) );
  HSR_CLKNAND2_0 U121 ( .A1(n141), .A2(n140), .ZN(n57) );
  HSR_CLKNAND2_0 U122 ( .A1(a_en), .A2(data[1]), .ZN(n140) );
  HSR_CLKNAND2_0 U123 ( .A1(n146), .A2(a[1]), .ZN(n141) );
  HSR_CLKNAND2_0 U124 ( .A1(n145), .A2(n144), .ZN(n54) );
  HSR_CLKNAND2_0 U125 ( .A1(b_en), .A2(data[2]), .ZN(n144) );
  HSR_CLKNAND2_0 U126 ( .A1(n149), .A2(b[2]), .ZN(n145) );
  HSR_CLKNAND2_0 U127 ( .A1(n151), .A2(n150), .ZN(n55) );
  HSR_CLKNAND2_0 U128 ( .A1(b_en), .A2(data[3]), .ZN(n150) );
  HSR_CLKNAND2_0 U129 ( .A1(n149), .A2(b[3]), .ZN(n151) );
  HSR_NOR2_2 U130 ( .A1(n113), .A2(n112), .ZN(n114) );
  HSR_AOI21_0 U131 ( .A1(n133), .A2(n131), .B(n132), .ZN(z[7]) );
  HSR_IN_0 U132 ( .I(n102), .ZN(n90) );
  HSR_CLKNAND2_0 U133 ( .A1(n84), .A2(b[1]), .ZN(n83) );
  HSR_IN_0 U134 ( .I(a[2]), .ZN(n62) );
  HSR_IN_0 U135 ( .I(a[3]), .ZN(n88) );
  HSR_CLKNAND2_0 U136 ( .A1(n149), .A2(b[1]), .ZN(n139) );
  HSR_CLKNAND2_0 U137 ( .A1(a[1]), .A2(b[0]), .ZN(n129) );
  HSR_IN_2 U138 ( .I(n63), .ZN(n69) );
  HSR_NOR2_2 U139 ( .A1(n69), .A2(b[0]), .ZN(n66) );
  HSR_NAND3_1 U140 ( .A1(n61), .A2(n70), .A3(n69), .ZN(n65) );
  HSR_OAI21_2 U141 ( .A1(z[0]), .A2(n63), .B(n62), .ZN(n64) );
  HSR_INAND3_1 U142 ( .A1(n66), .B1(n65), .B2(n64), .ZN(n67) );
  HSR_AOI21_0 U143 ( .A1(n68), .A2(n67), .B(n77), .ZN(z[2]) );
  HSR_AND2_2 U144 ( .A1(b[2]), .A2(a[1]), .Z(n76) );
  HSR_AND2_2 U145 ( .A1(a[2]), .A2(b[1]), .Z(n81) );
  HSR_IN_1 U146 ( .I(n81), .ZN(n72) );
  HSR_AND2_2 U147 ( .A1(b[0]), .A2(a[3]), .Z(n82) );
  HSR_IN_1 U148 ( .I(n82), .ZN(n71) );
  HSR_OAI21_2 U149 ( .A1(z[0]), .A2(n70), .B(n69), .ZN(n80) );
  HSR_NAND2_2 U150 ( .A1(n73), .A2(n74), .ZN(n123) );
  HSR_IN_0 U151 ( .I(n75), .ZN(z[3]) );
  HSR_NAND2_2 U152 ( .A1(n77), .A2(n76), .ZN(n104) );
  HSR_OAI21_2 U153 ( .A1(n92), .A2(n107), .B(n78), .ZN(n91) );
  HSR_NOR2_2 U154 ( .A1(n85), .A2(n83), .ZN(n89) );
  HSR_INAND2_4 U155 ( .A1(n87), .B1(n86), .ZN(n116) );
  HSR_CLKNAND2_1 U156 ( .A1(n91), .A2(n90), .ZN(n97) );
  HSR_OAI211_2 U157 ( .A1(n95), .A2(n103), .B(n94), .C(n93), .ZN(n96) );
  HSR_NAND3_2 U158 ( .A1(n100), .A2(a[3]), .A3(b[2]), .ZN(n133) );
  HSR_XOR2_2 U159 ( .A1(n102), .A2(n101), .Z(n109) );
  HSR_NAND2_2 U160 ( .A1(n103), .A2(n77), .ZN(n105) );
  HSR_OAI211_2 U161 ( .A1(n107), .A2(n106), .B(n105), .C(n104), .ZN(n108) );
  HSR_AND2_2 U162 ( .A1(a[1]), .A2(b[3]), .Z(n124) );
  HSR_NAND2_2 U163 ( .A1(n122), .A2(n124), .ZN(n115) );
  HSR_NOR2_2 U164 ( .A1(n123), .A2(n111), .ZN(n112) );
  HSR_XOR2_2 U165 ( .A1(n116), .A2(b[2]), .Z(n117) );
  HSR_XOR2_4 U166 ( .A1(n118), .A2(n119), .Z(n127) );
  HSR_XOR2_0 U167 ( .A1(n130), .A2(n129), .Z(z[1]) );
  HSR_NOR2_2 U168 ( .A1(b_en), .A2(rst), .ZN(n149) );
  HSR_NOR2_2 U169 ( .A1(a_en), .A2(rst), .ZN(n146) );
endmodule

