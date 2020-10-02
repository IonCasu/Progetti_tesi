// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Tue Aug 18 19:45:32 2020
// Host        : Ion-Notebook running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/39389/Desktop/Vivado_Workspace/PS_PL_demo_2/PS_PL_demo_2.srcs/sources_1/bd/design_1/ip/design_1_wave_gen1_0_1/design_1_wave_gen1_0_1_stub.v
// Design      : design_1_wave_gen1_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z007sclg225-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "wave_gen1,Vivado 2019.2" *)
module design_1_wave_gen1_0_1(i_clk, o_en)
/* synthesis syn_black_box black_box_pad_pin="i_clk,o_en" */;
  input i_clk;
  output o_en;
endmodule
