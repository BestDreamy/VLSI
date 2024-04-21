/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06-SP5-2
// Date      : Sun Apr 21 21:34:20 2024
/////////////////////////////////////////////////////////////


module multiplier_tb ( clk, rst, a_en, b_en, data, z );
  input [3:0] data;
  output [7:0] z;
  input clk, rst, a_en, b_en;
  wire   n52, n53, n54, n55, n56, n57, n58, n59, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269;
  wire   [3:0] a;
  wire   [3:0] b;

  HSR_CLKNAND2_0 U108 ( .A1(n139), .A2(n138), .ZN(n53) );
  HSR_CLKNAND2_0 U109 ( .A1(n143), .A2(n142), .ZN(n58) );
  HSR_CLKNAND2_0 U111 ( .A1(n146), .A2(a[2]), .ZN(n143) );
  HSR_CLKNAND2_0 U112 ( .A1(n148), .A2(n147), .ZN(n59) );
  HSR_CLKNAND2_0 U114 ( .A1(n146), .A2(a[3]), .ZN(n148) );
  HSR_CLKNAND2_0 U115 ( .A1(n135), .A2(n134), .ZN(n56) );
  HSR_CLKNAND2_0 U117 ( .A1(n146), .A2(a[0]), .ZN(n135) );
  HSR_CLKNAND2_0 U118 ( .A1(n137), .A2(n136), .ZN(n52) );
  HSR_CLKNAND2_0 U120 ( .A1(n149), .A2(b[0]), .ZN(n137) );
  HSR_CLKNAND2_0 U121 ( .A1(n141), .A2(n140), .ZN(n57) );
  HSR_CLKNAND2_0 U123 ( .A1(n146), .A2(a[1]), .ZN(n141) );
  HSR_CLKNAND2_0 U124 ( .A1(n145), .A2(n144), .ZN(n54) );
  HSR_CLKNAND2_0 U126 ( .A1(n149), .A2(b[2]), .ZN(n145) );
  HSR_CLKNAND2_0 U127 ( .A1(n151), .A2(n150), .ZN(n55) );
  HSR_CLKNAND2_0 U129 ( .A1(n149), .A2(b[3]), .ZN(n151) );
  HSR_CLKNAND2_0 U136 ( .A1(n149), .A2(b[1]), .ZN(n139) );
  HSR_NOR2_2 U168 ( .A1(b_en), .A2(rst), .ZN(n149) );
  HSR_NOR2_2 U169 ( .A1(a_en), .A2(rst), .ZN(n146) );
  HSR_DQ_0 \b_reg[2]  ( .D(n54), .CK(clk), .Q(b[2]) );
  HSR_D_0 \b_reg[3]  ( .D(n55), .CK(clk), .Q(b[3]), .QN(n269) );
  HSR_DQ_1 \b_reg[0]  ( .D(n52), .CK(clk), .Q(b[0]) );
  HSR_DQ_1 \a_reg[3]  ( .D(n59), .CK(clk), .Q(a[3]) );
  HSR_DQ_4 \b_reg[1]  ( .D(n53), .CK(clk), .Q(b[1]) );
  HSR_DQ_4 \a_reg[1]  ( .D(n57), .CK(clk), .Q(a[1]) );
  HSR_DQ_2 \a_reg[2]  ( .D(n58), .CK(clk), .Q(a[2]) );
  HSR_DQ_2 \a_reg[0]  ( .D(n56), .CK(clk), .Q(a[0]) );
  HSR_NOR2_1 U151 ( .A1(n242), .A2(n243), .ZN(n262) );
  HSR_XOR2_2 U152 ( .A1(n244), .A2(n238), .Z(n242) );
  HSR_MAOI222_0 U153 ( .A(n236), .B(n235), .C(n234), .ZN(n238) );
  HSR_CLKAND2_2 U154 ( .A1(a[1]), .A2(b[1]), .Z(n214) );
  HSR_AND2_2 U155 ( .A1(a[2]), .A2(b[0]), .Z(n215) );
  HSR_IN_0 U156 ( .I(n214), .ZN(n213) );
  HSR_IN_0 U157 ( .I(n234), .ZN(n218) );
  HSR_MUX2_2 U158 ( .I0(n224), .I1(n223), .S(n222), .Z(z[2]) );
  HSR_NOR2_1 U159 ( .A1(n262), .A2(n248), .ZN(n249) );
  HSR_OAI211_1 U160 ( .A1(n255), .A2(n254), .B(a[3]), .C(b[2]), .ZN(n267) );
  HSR_NOR2_1 U161 ( .A1(n241), .A2(n252), .ZN(n257) );
  HSR_CLKNOR2_4 U162 ( .A1(n220), .A2(n219), .ZN(n243) );
  HSR_XOR2_1 U163 ( .A1(n240), .A2(b[2]), .Z(n241) );
  HSR_MUX2N_0 U164 ( .I0(n229), .I1(b[2]), .S(a[0]), .ZN(n223) );
  HSR_NOR2_1 U165 ( .A1(n221), .A2(n251), .ZN(n229) );
  HSR_NOR2_1 U166 ( .A1(n269), .A2(n252), .ZN(n265) );
  HSR_CLKN_1 U167 ( .I(a[3]), .ZN(n252) );
  HSR_CLKNAND2_1 U170 ( .A1(b[3]), .A2(a[1]), .ZN(n245) );
  HSR_AND2_1 U171 ( .A1(b[2]), .A2(a[0]), .Z(n224) );
  HSR_CLKNAND2_1 U172 ( .A1(b[3]), .A2(a[0]), .ZN(n219) );
  HSR_CLKNAND2_1 U173 ( .A1(b[2]), .A2(a[1]), .ZN(n236) );
  HSR_AND2_1 U174 ( .A1(b[3]), .A2(a[2]), .Z(n256) );
  HSR_NAND2_2 U175 ( .A1(n232), .A2(n231), .ZN(n237) );
  HSR_NAND2_2 U176 ( .A1(n227), .A2(n226), .ZN(n254) );
  HSR_AND2_4 U177 ( .A1(b[0]), .A2(a[0]), .Z(z[0]) );
  HSR_NOR2_2 U178 ( .A1(n221), .A2(n216), .ZN(n225) );
  HSR_NOR2_2 U179 ( .A1(n233), .A2(n239), .ZN(n244) );
  HSR_IN_0 U180 ( .I(n257), .ZN(n259) );
  HSR_IN_0 U181 ( .I(n253), .ZN(n255) );
  HSR_XNOR3_1 U182 ( .A1(n243), .A2(n245), .A3(n242), .ZN(z[4]) );
  HSR_XNOR3_1 U183 ( .A1(n256), .A2(n263), .A3(n249), .ZN(z[5]) );
  HSR_XNOR3_1 U184 ( .A1(n265), .A2(n267), .A3(n264), .ZN(z[6]) );
  HSR_IN_0 U185 ( .I(n256), .ZN(n260) );
  HSR_AOI21_0 U186 ( .A1(n221), .A2(n216), .B(n225), .ZN(n217) );
  HSR_CLKNAND2_0 U187 ( .A1(b_en), .A2(data[2]), .ZN(n144) );
  HSR_CLKNAND2_0 U188 ( .A1(b_en), .A2(data[1]), .ZN(n138) );
  HSR_CLKNAND2_0 U189 ( .A1(data[2]), .A2(a_en), .ZN(n142) );
  HSR_CLKNAND2_0 U190 ( .A1(b_en), .A2(data[3]), .ZN(n150) );
  HSR_CLKNAND2_0 U191 ( .A1(b_en), .A2(data[0]), .ZN(n136) );
  HSR_CLKNAND2_0 U192 ( .A1(data[1]), .A2(a_en), .ZN(n140) );
  HSR_CLKNAND2_0 U193 ( .A1(a_en), .A2(data[3]), .ZN(n147) );
  HSR_CLKNAND2_0 U194 ( .A1(a_en), .A2(data[0]), .ZN(n134) );
  HSR_IN_0 U195 ( .I(n215), .ZN(n212) );
  HSR_OAI21_2 U196 ( .A1(z[0]), .A2(n213), .B(n212), .ZN(n222) );
  HSR_CLKNAND2_1 U197 ( .A1(n222), .A2(n224), .ZN(n235) );
  HSR_OAI21_2 U198 ( .A1(n215), .A2(z[0]), .B(n214), .ZN(n227) );
  HSR_NAND2_2 U199 ( .A1(a[2]), .A2(b[1]), .ZN(n221) );
  HSR_NAND2_2 U200 ( .A1(b[0]), .A2(a[3]), .ZN(n216) );
  HSR_XOR2_2 U201 ( .A1(n227), .A2(n217), .Z(n234) );
  HSR_XNOR3_2 U202 ( .A1(n236), .A2(n235), .A3(n218), .ZN(n220) );
  HSR_AOI21_0 U203 ( .A1(n220), .A2(n219), .B(n243), .ZN(z[3]) );
  HSR_CLKNAND2_0 U204 ( .A1(a[1]), .A2(b[0]), .ZN(n251) );
  HSR_IN_0 U205 ( .I(n225), .ZN(n226) );
  HSR_IN_0 U206 ( .I(b[1]), .ZN(n228) );
  HSR_NOR2_0 U207 ( .A1(n254), .A2(n228), .ZN(n230) );
  HSR_MUX2N_2 U208 ( .I0(n230), .I1(n229), .S(n252), .ZN(n232) );
  HSR_CLKNAND2_0 U209 ( .A1(b[2]), .A2(a[2]), .ZN(n231) );
  HSR_IN_0 U210 ( .I(n237), .ZN(n233) );
  HSR_NOR2_2 U211 ( .A1(n232), .A2(n231), .ZN(n239) );
  HSR_OAI21_2 U212 ( .A1(n239), .A2(n238), .B(n237), .ZN(n253) );
  HSR_IN_0 U213 ( .I(n254), .ZN(n240) );
  HSR_XOR2_2 U214 ( .A1(n253), .A2(n257), .Z(n263) );
  HSR_IN_1 U215 ( .I(n243), .ZN(n247) );
  HSR_IN_0 U216 ( .I(n244), .ZN(n246) );
  HSR_OAI21_2 U217 ( .A1(n247), .A2(n246), .B(n245), .ZN(n258) );
  HSR_IN_0 U218 ( .I(n258), .ZN(n248) );
  HSR_CLKNAND2_0 U219 ( .A1(b[1]), .A2(a[0]), .ZN(n250) );
  HSR_XOR2_0 U220 ( .A1(n251), .A2(n250), .Z(z[1]) );
  HSR_IOA21_0 U221 ( .A1(n260), .A2(n259), .B(n258), .ZN(n261) );
  HSR_OAI22_2 U222 ( .A1(n263), .A2(n260), .B1(n262), .B2(n261), .ZN(n264) );
  HSR_IN_0 U223 ( .I(n264), .ZN(n268) );
  HSR_IN_0 U224 ( .I(n265), .ZN(n266) );
  HSR_AOI21_0 U225 ( .A1(n268), .A2(n267), .B(n266), .ZN(z[7]) );
endmodule

