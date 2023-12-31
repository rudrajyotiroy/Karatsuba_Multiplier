/*******************************************************
* File Name     : hdl/ks59.v
* Module Name   : Karatsuba Multiplier
* Author        : Chester Rebeiro
* Institute     : Indian Institute of Technology, Madras
* Creation Time : 

* Comment       : Automatically generated from ks.c
********************************************************/
`ifndef __KS_59_V__
`define __KS_59_V__
`include "ks30.v"
`include "ks29.v"
module ks59(a, b, d);

input wire [58:0] a;
input wire [58:0] b;
output wire [116:0] d;

wire [56:0] m1;
wire [58:0] m2;
wire [58:0] m3;
wire [29:0] ahl;
wire [29:0] bhl;

ks30 ksm1(a[29:0], b[29:0], m2);
ks29 ksm2(a[58:30], b[58:30], m1);
assign ahl[28:0] = a[58:30] ^ a[28:0];
assign ahl[29] = a[29];
assign bhl[28:0] = b[58:30] ^ b[28:0];
assign bhl[29] = b[29];
ks30 ksm3(ahl, bhl, m3);

assign  d[00] = m2[00];   
assign  d[01] = m2[01];   
assign  d[02] = m2[02];   
assign  d[03] = m2[03];   
assign  d[04] = m2[04];   
assign  d[05] = m2[05];   
assign  d[06] = m2[06];   
assign  d[07] = m2[07];   
assign  d[08] = m2[08];   
assign  d[09] = m2[09];   
assign  d[10] = m2[10];   
assign  d[11] = m2[11];   
assign  d[12] = m2[12];   
assign  d[13] = m2[13];   
assign  d[14] = m2[14];   
assign  d[15] = m2[15];   
assign  d[16] = m2[16];   
assign  d[17] = m2[17];   
assign  d[18] = m2[18];   
assign  d[19] = m2[19];   
assign  d[20] = m2[20];   
assign  d[21] = m2[21];   
assign  d[22] = m2[22];   
assign  d[23] = m2[23];   
assign  d[24] = m2[24];   
assign  d[25] = m2[25];   
assign  d[26] = m2[26];   
assign  d[27] = m2[27];   
assign  d[28] = m2[28];   
assign  d[29] = m2[29];   
assign  d[30] = m2[30] ^ m1[00] ^ m2[00] ^ m3[00];   
assign  d[31] = m2[31] ^ m1[01] ^ m2[01] ^ m3[01];   
assign  d[32] = m2[32] ^ m1[02] ^ m2[02] ^ m3[02];   
assign  d[33] = m2[33] ^ m1[03] ^ m2[03] ^ m3[03];   
assign  d[34] = m2[34] ^ m1[04] ^ m2[04] ^ m3[04];   
assign  d[35] = m2[35] ^ m1[05] ^ m2[05] ^ m3[05];   
assign  d[36] = m2[36] ^ m1[06] ^ m2[06] ^ m3[06];   
assign  d[37] = m2[37] ^ m1[07] ^ m2[07] ^ m3[07];   
assign  d[38] = m2[38] ^ m1[08] ^ m2[08] ^ m3[08];   
assign  d[39] = m2[39] ^ m1[09] ^ m2[09] ^ m3[09];   
assign  d[40] = m2[40] ^ m1[10] ^ m2[10] ^ m3[10];   
assign  d[41] = m2[41] ^ m1[11] ^ m2[11] ^ m3[11];   
assign  d[42] = m2[42] ^ m1[12] ^ m2[12] ^ m3[12];   
assign  d[43] = m2[43] ^ m1[13] ^ m2[13] ^ m3[13];   
assign  d[44] = m2[44] ^ m1[14] ^ m2[14] ^ m3[14];   
assign  d[45] = m2[45] ^ m1[15] ^ m2[15] ^ m3[15];   
assign  d[46] = m2[46] ^ m1[16] ^ m2[16] ^ m3[16];   
assign  d[47] = m2[47] ^ m1[17] ^ m2[17] ^ m3[17];   
assign  d[48] = m2[48] ^ m1[18] ^ m2[18] ^ m3[18];   
assign  d[49] = m2[49] ^ m1[19] ^ m2[19] ^ m3[19];   
assign  d[50] = m2[50] ^ m1[20] ^ m2[20] ^ m3[20];   
assign  d[51] = m2[51] ^ m1[21] ^ m2[21] ^ m3[21];   
assign  d[52] = m2[52] ^ m1[22] ^ m2[22] ^ m3[22];   
assign  d[53] = m2[53] ^ m1[23] ^ m2[23] ^ m3[23];   
assign  d[54] = m2[54] ^ m1[24] ^ m2[24] ^ m3[24];   
assign  d[55] = m2[55] ^ m1[25] ^ m2[25] ^ m3[25];   
assign  d[56] = m2[56] ^ m1[26] ^ m2[26] ^ m3[26];   
assign  d[57] = m2[57] ^ m1[27] ^ m2[27] ^ m3[27];   
assign  d[58] = m2[58] ^ m1[28] ^ m2[28] ^ m3[28];   
assign  d[59] = m1[29] ^ m2[29] ^ m3[29];   
assign  d[60] = m1[30] ^ m2[30] ^ m3[30] ^ m1[00];   
assign  d[61] = m1[31] ^ m2[31] ^ m3[31] ^ m1[01];   
assign  d[62] = m1[32] ^ m2[32] ^ m3[32] ^ m1[02];   
assign  d[63] = m1[33] ^ m2[33] ^ m3[33] ^ m1[03];   
assign  d[64] = m1[34] ^ m2[34] ^ m3[34] ^ m1[04];   
assign  d[65] = m1[35] ^ m2[35] ^ m3[35] ^ m1[05];   
assign  d[66] = m1[36] ^ m2[36] ^ m3[36] ^ m1[06];   
assign  d[67] = m1[37] ^ m2[37] ^ m3[37] ^ m1[07];   
assign  d[68] = m1[38] ^ m2[38] ^ m3[38] ^ m1[08];   
assign  d[69] = m1[39] ^ m2[39] ^ m3[39] ^ m1[09];   
assign  d[70] = m1[40] ^ m2[40] ^ m3[40] ^ m1[10];   
assign  d[71] = m1[41] ^ m2[41] ^ m3[41] ^ m1[11];   
assign  d[72] = m1[42] ^ m2[42] ^ m3[42] ^ m1[12];   
assign  d[73] = m1[43] ^ m2[43] ^ m3[43] ^ m1[13];   
assign  d[74] = m1[44] ^ m2[44] ^ m3[44] ^ m1[14];   
assign  d[75] = m1[45] ^ m2[45] ^ m3[45] ^ m1[15];   
assign  d[76] = m1[46] ^ m2[46] ^ m3[46] ^ m1[16];   
assign  d[77] = m1[47] ^ m2[47] ^ m3[47] ^ m1[17];   
assign  d[78] = m1[48] ^ m2[48] ^ m3[48] ^ m1[18];   
assign  d[79] = m1[49] ^ m2[49] ^ m3[49] ^ m1[19];   
assign  d[80] = m1[50] ^ m2[50] ^ m3[50] ^ m1[20];   
assign  d[81] = m1[51] ^ m2[51] ^ m3[51] ^ m1[21];   
assign  d[82] = m1[52] ^ m2[52] ^ m3[52] ^ m1[22];   
assign  d[83] = m1[53] ^ m2[53] ^ m3[53] ^ m1[23];   
assign  d[84] = m1[54] ^ m2[54] ^ m3[54] ^ m1[24];   
assign  d[85] = m1[55] ^ m2[55] ^ m3[55] ^ m1[25];   
assign  d[86] = m1[56] ^ m2[56] ^ m3[56] ^ m1[26];   
assign  d[87] = m2[57] ^ m3[57] ^ m1[27];   
assign  d[88] = m2[58] ^ m3[58] ^ m1[28];   
assign  d[89] = m1[29];   
assign  d[90] = m1[30];   
assign  d[91] = m1[31];   
assign  d[92] = m1[32];   
assign  d[93] = m1[33];   
assign  d[94] = m1[34];   
assign  d[95] = m1[35];   
assign  d[96] = m1[36];   
assign  d[97] = m1[37];   
assign  d[98] = m1[38];   
assign  d[99] = m1[39];   
assign  d[100] = m1[40];   
assign  d[101] = m1[41];   
assign  d[102] = m1[42];   
assign  d[103] = m1[43];   
assign  d[104] = m1[44];   
assign  d[105] = m1[45];   
assign  d[106] = m1[46];   
assign  d[107] = m1[47];   
assign  d[108] = m1[48];   
assign  d[109] = m1[49];   
assign  d[110] = m1[50];   
assign  d[111] = m1[51];   
assign  d[112] = m1[52];   
assign  d[113] = m1[53];   
assign  d[114] = m1[54];   
assign  d[115] = m1[55];   
assign  d[116] = m1[56];   
endmodule
`endif
