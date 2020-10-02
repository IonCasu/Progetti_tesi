-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Tue Aug 18 19:45:32 2020
-- Host        : Ion-Notebook running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/39389/Desktop/Vivado_Workspace/PS_PL_demo_2/PS_PL_demo_2.srcs/sources_1/bd/design_1/ip/design_1_wave_gen1_0_1/design_1_wave_gen1_0_1_sim_netlist.vhdl
-- Design      : design_1_wave_gen1_0_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z007sclg225-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wave_gen1_0_1_wave_gen1 is
  port (
    o_en : out STD_LOGIC;
    i_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_wave_gen1_0_1_wave_gen1 : entity is "wave_gen1";
end design_1_wave_gen1_0_1_wave_gen1;

architecture STRUCTURE of design_1_wave_gen1_0_1_wave_gen1 is
  signal data0 : STD_LOGIC_VECTOR ( 30 downto 1 );
  signal \^o_en\ : STD_LOGIC;
  signal output1 : STD_LOGIC;
  signal output1_i_1_n_0 : STD_LOGIC;
  signal output1_i_2_n_0 : STD_LOGIC;
  signal output1_i_3_n_0 : STD_LOGIC;
  signal output1_i_4_n_0 : STD_LOGIC;
  signal output1_i_5_n_0 : STD_LOGIC;
  signal output1_i_6_n_0 : STD_LOGIC;
  signal output1_i_7_n_0 : STD_LOGIC;
  signal output1_i_8_n_0 : STD_LOGIC;
  signal tmp : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal \tmp0_carry__0_n_0\ : STD_LOGIC;
  signal \tmp0_carry__0_n_1\ : STD_LOGIC;
  signal \tmp0_carry__0_n_2\ : STD_LOGIC;
  signal \tmp0_carry__0_n_3\ : STD_LOGIC;
  signal \tmp0_carry__1_n_0\ : STD_LOGIC;
  signal \tmp0_carry__1_n_1\ : STD_LOGIC;
  signal \tmp0_carry__1_n_2\ : STD_LOGIC;
  signal \tmp0_carry__1_n_3\ : STD_LOGIC;
  signal \tmp0_carry__2_n_0\ : STD_LOGIC;
  signal \tmp0_carry__2_n_1\ : STD_LOGIC;
  signal \tmp0_carry__2_n_2\ : STD_LOGIC;
  signal \tmp0_carry__2_n_3\ : STD_LOGIC;
  signal \tmp0_carry__3_n_0\ : STD_LOGIC;
  signal \tmp0_carry__3_n_1\ : STD_LOGIC;
  signal \tmp0_carry__3_n_2\ : STD_LOGIC;
  signal \tmp0_carry__3_n_3\ : STD_LOGIC;
  signal \tmp0_carry__4_n_0\ : STD_LOGIC;
  signal \tmp0_carry__4_n_1\ : STD_LOGIC;
  signal \tmp0_carry__4_n_2\ : STD_LOGIC;
  signal \tmp0_carry__4_n_3\ : STD_LOGIC;
  signal \tmp0_carry__5_n_0\ : STD_LOGIC;
  signal \tmp0_carry__5_n_1\ : STD_LOGIC;
  signal \tmp0_carry__5_n_2\ : STD_LOGIC;
  signal \tmp0_carry__5_n_3\ : STD_LOGIC;
  signal \tmp0_carry__6_n_3\ : STD_LOGIC;
  signal tmp0_carry_n_0 : STD_LOGIC;
  signal tmp0_carry_n_1 : STD_LOGIC;
  signal tmp0_carry_n_2 : STD_LOGIC;
  signal tmp0_carry_n_3 : STD_LOGIC;
  signal tmp_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_tmp0_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_tmp0_carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of output1_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \tmp[0]_i_1\ : label is "soft_lutpair0";
begin
  o_en <= \^o_en\;
output1_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0001"
    )
        port map (
      I0 => tmp(0),
      I1 => output1_i_2_n_0,
      I2 => output1_i_3_n_0,
      I3 => output1_i_4_n_0,
      I4 => \^o_en\,
      O => output1_i_1_n_0
    );
output1_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFF7"
    )
        port map (
      I0 => tmp(13),
      I1 => tmp(14),
      I2 => tmp(11),
      I3 => tmp(12),
      I4 => output1_i_5_n_0,
      O => output1_i_2_n_0
    );
output1_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFB"
    )
        port map (
      I0 => tmp(5),
      I1 => tmp(6),
      I2 => tmp(3),
      I3 => tmp(4),
      I4 => output1_i_6_n_0,
      O => output1_i_3_n_0
    );
output1_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFEFFFFFF"
    )
        port map (
      I0 => output1_i_7_n_0,
      I1 => tmp(20),
      I2 => tmp(19),
      I3 => tmp(22),
      I4 => tmp(21),
      I5 => output1_i_8_n_0,
      O => output1_i_4_n_0
    );
output1_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => tmp(15),
      I1 => tmp(16),
      I2 => tmp(18),
      I3 => tmp(17),
      O => output1_i_5_n_0
    );
output1_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => tmp(8),
      I1 => tmp(7),
      I2 => tmp(10),
      I3 => tmp(9),
      O => output1_i_6_n_0
    );
output1_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => tmp(23),
      I1 => tmp(24),
      I2 => tmp(26),
      I3 => tmp(25),
      O => output1_i_7_n_0
    );
output1_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => tmp(29),
      I1 => tmp(30),
      I2 => tmp(27),
      I3 => tmp(28),
      I4 => tmp(2),
      I5 => tmp(1),
      O => output1_i_8_n_0
    );
output1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => output1_i_1_n_0,
      Q => \^o_en\,
      R => '0'
    );
tmp0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => tmp0_carry_n_0,
      CO(2) => tmp0_carry_n_1,
      CO(1) => tmp0_carry_n_2,
      CO(0) => tmp0_carry_n_3,
      CYINIT => tmp(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3 downto 0) => tmp(4 downto 1)
    );
\tmp0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => tmp0_carry_n_0,
      CO(3) => \tmp0_carry__0_n_0\,
      CO(2) => \tmp0_carry__0_n_1\,
      CO(1) => \tmp0_carry__0_n_2\,
      CO(0) => \tmp0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3 downto 0) => tmp(8 downto 5)
    );
\tmp0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp0_carry__0_n_0\,
      CO(3) => \tmp0_carry__1_n_0\,
      CO(2) => \tmp0_carry__1_n_1\,
      CO(1) => \tmp0_carry__1_n_2\,
      CO(0) => \tmp0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3 downto 0) => tmp(12 downto 9)
    );
\tmp0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp0_carry__1_n_0\,
      CO(3) => \tmp0_carry__2_n_0\,
      CO(2) => \tmp0_carry__2_n_1\,
      CO(1) => \tmp0_carry__2_n_2\,
      CO(0) => \tmp0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(16 downto 13),
      S(3 downto 0) => tmp(16 downto 13)
    );
\tmp0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp0_carry__2_n_0\,
      CO(3) => \tmp0_carry__3_n_0\,
      CO(2) => \tmp0_carry__3_n_1\,
      CO(1) => \tmp0_carry__3_n_2\,
      CO(0) => \tmp0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(20 downto 17),
      S(3 downto 0) => tmp(20 downto 17)
    );
\tmp0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp0_carry__3_n_0\,
      CO(3) => \tmp0_carry__4_n_0\,
      CO(2) => \tmp0_carry__4_n_1\,
      CO(1) => \tmp0_carry__4_n_2\,
      CO(0) => \tmp0_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(24 downto 21),
      S(3 downto 0) => tmp(24 downto 21)
    );
\tmp0_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp0_carry__4_n_0\,
      CO(3) => \tmp0_carry__5_n_0\,
      CO(2) => \tmp0_carry__5_n_1\,
      CO(1) => \tmp0_carry__5_n_2\,
      CO(0) => \tmp0_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(28 downto 25),
      S(3 downto 0) => tmp(28 downto 25)
    );
\tmp0_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \tmp0_carry__5_n_0\,
      CO(3 downto 1) => \NLW_tmp0_carry__6_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \tmp0_carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_tmp0_carry__6_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => data0(30 downto 29),
      S(3 downto 2) => B"00",
      S(1 downto 0) => tmp(30 downto 29)
    );
\tmp[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00FE"
    )
        port map (
      I0 => output1_i_4_n_0,
      I1 => output1_i_3_n_0,
      I2 => output1_i_2_n_0,
      I3 => tmp(0),
      O => tmp_0(0)
    );
\tmp[30]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => tmp(0),
      I1 => output1_i_2_n_0,
      I2 => output1_i_3_n_0,
      I3 => output1_i_4_n_0,
      O => output1
    );
\tmp_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => tmp_0(0),
      Q => tmp(0),
      R => '0'
    );
\tmp_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(10),
      Q => tmp(10),
      R => output1
    );
\tmp_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(11),
      Q => tmp(11),
      R => output1
    );
\tmp_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(12),
      Q => tmp(12),
      R => output1
    );
\tmp_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(13),
      Q => tmp(13),
      R => output1
    );
\tmp_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(14),
      Q => tmp(14),
      R => output1
    );
\tmp_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(15),
      Q => tmp(15),
      R => output1
    );
\tmp_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(16),
      Q => tmp(16),
      R => output1
    );
\tmp_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(17),
      Q => tmp(17),
      R => output1
    );
\tmp_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(18),
      Q => tmp(18),
      R => output1
    );
\tmp_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(19),
      Q => tmp(19),
      R => output1
    );
\tmp_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(1),
      Q => tmp(1),
      R => output1
    );
\tmp_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(20),
      Q => tmp(20),
      R => output1
    );
\tmp_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(21),
      Q => tmp(21),
      R => output1
    );
\tmp_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(22),
      Q => tmp(22),
      R => output1
    );
\tmp_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(23),
      Q => tmp(23),
      R => output1
    );
\tmp_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(24),
      Q => tmp(24),
      R => output1
    );
\tmp_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(25),
      Q => tmp(25),
      R => output1
    );
\tmp_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(26),
      Q => tmp(26),
      R => output1
    );
\tmp_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(27),
      Q => tmp(27),
      R => output1
    );
\tmp_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(28),
      Q => tmp(28),
      R => output1
    );
\tmp_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(29),
      Q => tmp(29),
      R => output1
    );
\tmp_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(2),
      Q => tmp(2),
      R => output1
    );
\tmp_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(30),
      Q => tmp(30),
      R => output1
    );
\tmp_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(3),
      Q => tmp(3),
      R => output1
    );
\tmp_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(4),
      Q => tmp(4),
      R => output1
    );
\tmp_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(5),
      Q => tmp(5),
      R => output1
    );
\tmp_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(6),
      Q => tmp(6),
      R => output1
    );
\tmp_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(7),
      Q => tmp(7),
      R => output1
    );
\tmp_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(8),
      Q => tmp(8),
      R => output1
    );
\tmp_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => data0(9),
      Q => tmp(9),
      R => output1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wave_gen1_0_1 is
  port (
    i_clk : in STD_LOGIC;
    o_en : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_wave_gen1_0_1 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_wave_gen1_0_1 : entity is "design_1_wave_gen1_0_1,wave_gen1,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_wave_gen1_0_1 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of design_1_wave_gen1_0_1 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of design_1_wave_gen1_0_1 : entity is "wave_gen1,Vivado 2019.2";
end design_1_wave_gen1_0_1;

architecture STRUCTURE of design_1_wave_gen1_0_1 is
  attribute x_interface_info : string;
  attribute x_interface_info of i_clk : signal is "xilinx.com:signal:clock:1.0 i_clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of i_clk : signal is "XIL_INTERFACENAME i_clk, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
begin
U0: entity work.design_1_wave_gen1_0_1_wave_gen1
     port map (
      i_clk => i_clk,
      o_en => o_en
    );
end STRUCTURE;
