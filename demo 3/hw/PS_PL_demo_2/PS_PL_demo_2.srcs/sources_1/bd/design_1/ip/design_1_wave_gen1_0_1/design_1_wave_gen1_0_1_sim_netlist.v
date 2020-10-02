// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Tue Aug 18 19:45:32 2020
// Host        : Ion-Notebook running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/39389/Desktop/Vivado_Workspace/PS_PL_demo_2/PS_PL_demo_2.srcs/sources_1/bd/design_1/ip/design_1_wave_gen1_0_1/design_1_wave_gen1_0_1_sim_netlist.v
// Design      : design_1_wave_gen1_0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z007sclg225-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_wave_gen1_0_1,wave_gen1,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "wave_gen1,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module design_1_wave_gen1_0_1
   (i_clk,
    o_en);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 i_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME i_clk, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input i_clk;
  output o_en;

  wire i_clk;
  wire o_en;

  design_1_wave_gen1_0_1_wave_gen1 U0
       (.i_clk(i_clk),
        .o_en(o_en));
endmodule

(* ORIG_REF_NAME = "wave_gen1" *) 
module design_1_wave_gen1_0_1_wave_gen1
   (o_en,
    i_clk);
  output o_en;
  input i_clk;

  wire [30:1]data0;
  wire i_clk;
  wire o_en;
  wire output1;
  wire output1_i_1_n_0;
  wire output1_i_2_n_0;
  wire output1_i_3_n_0;
  wire output1_i_4_n_0;
  wire output1_i_5_n_0;
  wire output1_i_6_n_0;
  wire output1_i_7_n_0;
  wire output1_i_8_n_0;
  wire [30:0]tmp;
  wire tmp0_carry__0_n_0;
  wire tmp0_carry__0_n_1;
  wire tmp0_carry__0_n_2;
  wire tmp0_carry__0_n_3;
  wire tmp0_carry__1_n_0;
  wire tmp0_carry__1_n_1;
  wire tmp0_carry__1_n_2;
  wire tmp0_carry__1_n_3;
  wire tmp0_carry__2_n_0;
  wire tmp0_carry__2_n_1;
  wire tmp0_carry__2_n_2;
  wire tmp0_carry__2_n_3;
  wire tmp0_carry__3_n_0;
  wire tmp0_carry__3_n_1;
  wire tmp0_carry__3_n_2;
  wire tmp0_carry__3_n_3;
  wire tmp0_carry__4_n_0;
  wire tmp0_carry__4_n_1;
  wire tmp0_carry__4_n_2;
  wire tmp0_carry__4_n_3;
  wire tmp0_carry__5_n_0;
  wire tmp0_carry__5_n_1;
  wire tmp0_carry__5_n_2;
  wire tmp0_carry__5_n_3;
  wire tmp0_carry__6_n_3;
  wire tmp0_carry_n_0;
  wire tmp0_carry_n_1;
  wire tmp0_carry_n_2;
  wire tmp0_carry_n_3;
  wire [0:0]tmp_0;
  wire [3:1]NLW_tmp0_carry__6_CO_UNCONNECTED;
  wire [3:2]NLW_tmp0_carry__6_O_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFE0001)) 
    output1_i_1
       (.I0(tmp[0]),
        .I1(output1_i_2_n_0),
        .I2(output1_i_3_n_0),
        .I3(output1_i_4_n_0),
        .I4(o_en),
        .O(output1_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFF7)) 
    output1_i_2
       (.I0(tmp[13]),
        .I1(tmp[14]),
        .I2(tmp[11]),
        .I3(tmp[12]),
        .I4(output1_i_5_n_0),
        .O(output1_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFB)) 
    output1_i_3
       (.I0(tmp[5]),
        .I1(tmp[6]),
        .I2(tmp[3]),
        .I3(tmp[4]),
        .I4(output1_i_6_n_0),
        .O(output1_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFEFFFFFF)) 
    output1_i_4
       (.I0(output1_i_7_n_0),
        .I1(tmp[20]),
        .I2(tmp[19]),
        .I3(tmp[22]),
        .I4(tmp[21]),
        .I5(output1_i_8_n_0),
        .O(output1_i_4_n_0));
  LUT4 #(
    .INIT(16'hFFDF)) 
    output1_i_5
       (.I0(tmp[15]),
        .I1(tmp[16]),
        .I2(tmp[18]),
        .I3(tmp[17]),
        .O(output1_i_5_n_0));
  LUT4 #(
    .INIT(16'hFFF7)) 
    output1_i_6
       (.I0(tmp[8]),
        .I1(tmp[7]),
        .I2(tmp[10]),
        .I3(tmp[9]),
        .O(output1_i_6_n_0));
  LUT4 #(
    .INIT(16'hFFFD)) 
    output1_i_7
       (.I0(tmp[23]),
        .I1(tmp[24]),
        .I2(tmp[26]),
        .I3(tmp[25]),
        .O(output1_i_7_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    output1_i_8
       (.I0(tmp[29]),
        .I1(tmp[30]),
        .I2(tmp[27]),
        .I3(tmp[28]),
        .I4(tmp[2]),
        .I5(tmp[1]),
        .O(output1_i_8_n_0));
  FDRE #(
    .INIT(1'b1)) 
    output1_reg
       (.C(i_clk),
        .CE(1'b1),
        .D(output1_i_1_n_0),
        .Q(o_en),
        .R(1'b0));
  CARRY4 tmp0_carry
       (.CI(1'b0),
        .CO({tmp0_carry_n_0,tmp0_carry_n_1,tmp0_carry_n_2,tmp0_carry_n_3}),
        .CYINIT(tmp[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(tmp[4:1]));
  CARRY4 tmp0_carry__0
       (.CI(tmp0_carry_n_0),
        .CO({tmp0_carry__0_n_0,tmp0_carry__0_n_1,tmp0_carry__0_n_2,tmp0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(tmp[8:5]));
  CARRY4 tmp0_carry__1
       (.CI(tmp0_carry__0_n_0),
        .CO({tmp0_carry__1_n_0,tmp0_carry__1_n_1,tmp0_carry__1_n_2,tmp0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(tmp[12:9]));
  CARRY4 tmp0_carry__2
       (.CI(tmp0_carry__1_n_0),
        .CO({tmp0_carry__2_n_0,tmp0_carry__2_n_1,tmp0_carry__2_n_2,tmp0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:13]),
        .S(tmp[16:13]));
  CARRY4 tmp0_carry__3
       (.CI(tmp0_carry__2_n_0),
        .CO({tmp0_carry__3_n_0,tmp0_carry__3_n_1,tmp0_carry__3_n_2,tmp0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[20:17]),
        .S(tmp[20:17]));
  CARRY4 tmp0_carry__4
       (.CI(tmp0_carry__3_n_0),
        .CO({tmp0_carry__4_n_0,tmp0_carry__4_n_1,tmp0_carry__4_n_2,tmp0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[24:21]),
        .S(tmp[24:21]));
  CARRY4 tmp0_carry__5
       (.CI(tmp0_carry__4_n_0),
        .CO({tmp0_carry__5_n_0,tmp0_carry__5_n_1,tmp0_carry__5_n_2,tmp0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[28:25]),
        .S(tmp[28:25]));
  CARRY4 tmp0_carry__6
       (.CI(tmp0_carry__5_n_0),
        .CO({NLW_tmp0_carry__6_CO_UNCONNECTED[3:1],tmp0_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_tmp0_carry__6_O_UNCONNECTED[3:2],data0[30:29]}),
        .S({1'b0,1'b0,tmp[30:29]}));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h00FE)) 
    \tmp[0]_i_1 
       (.I0(output1_i_4_n_0),
        .I1(output1_i_3_n_0),
        .I2(output1_i_2_n_0),
        .I3(tmp[0]),
        .O(tmp_0));
  LUT4 #(
    .INIT(16'h0001)) 
    \tmp[30]_i_1 
       (.I0(tmp[0]),
        .I1(output1_i_2_n_0),
        .I2(output1_i_3_n_0),
        .I3(output1_i_4_n_0),
        .O(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[0] 
       (.C(i_clk),
        .CE(1'b1),
        .D(tmp_0),
        .Q(tmp[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[10] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[10]),
        .Q(tmp[10]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[11] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[11]),
        .Q(tmp[11]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[12] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[12]),
        .Q(tmp[12]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[13] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[13]),
        .Q(tmp[13]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[14] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[14]),
        .Q(tmp[14]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[15] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[15]),
        .Q(tmp[15]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[16] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[16]),
        .Q(tmp[16]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[17] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[17]),
        .Q(tmp[17]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[18] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[18]),
        .Q(tmp[18]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[19] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[19]),
        .Q(tmp[19]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[1] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[1]),
        .Q(tmp[1]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[20] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[20]),
        .Q(tmp[20]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[21] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[21]),
        .Q(tmp[21]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[22] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[22]),
        .Q(tmp[22]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[23] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[23]),
        .Q(tmp[23]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[24] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[24]),
        .Q(tmp[24]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[25] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[25]),
        .Q(tmp[25]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[26] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[26]),
        .Q(tmp[26]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[27] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[27]),
        .Q(tmp[27]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[28] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[28]),
        .Q(tmp[28]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[29] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[29]),
        .Q(tmp[29]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[2] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[2]),
        .Q(tmp[2]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[30] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[30]),
        .Q(tmp[30]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[3] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[3]),
        .Q(tmp[3]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[4] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[4]),
        .Q(tmp[4]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[5] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[5]),
        .Q(tmp[5]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[6] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[6]),
        .Q(tmp[6]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[7] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[7]),
        .Q(tmp[7]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[8] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[8]),
        .Q(tmp[8]),
        .R(output1));
  FDRE #(
    .INIT(1'b0)) 
    \tmp_reg[9] 
       (.C(i_clk),
        .CE(1'b1),
        .D(data0[9]),
        .Q(tmp[9]),
        .R(output1));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
