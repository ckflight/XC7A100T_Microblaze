-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:ip:lmb_v10:3.0
-- IP Revision: 15

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY lmb_v10_v3_0_15;
USE lmb_v10_v3_0_15.lmb_v10;

ENTITY microblaze_ilmb_v10_0 IS
  PORT (
    LMB_Clk : IN STD_LOGIC;
    SYS_Rst : IN STD_LOGIC;
    LMB_Rst : OUT STD_LOGIC;
    M_ABus : IN STD_LOGIC_VECTOR(0 TO 31);
    M_ReadStrobe : IN STD_LOGIC;
    M_WriteStrobe : IN STD_LOGIC;
    M_AddrStrobe : IN STD_LOGIC;
    M_DBus : IN STD_LOGIC_VECTOR(0 TO 31);
    M_BE : IN STD_LOGIC_VECTOR(0 TO 3);
    Sl_DBus : IN STD_LOGIC_VECTOR(0 TO 31);
    Sl_Ready : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    Sl_Wait : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    Sl_UE : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    Sl_CE : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    LMB_ABus : OUT STD_LOGIC_VECTOR(0 TO 31);
    LMB_ReadStrobe : OUT STD_LOGIC;
    LMB_WriteStrobe : OUT STD_LOGIC;
    LMB_AddrStrobe : OUT STD_LOGIC;
    LMB_ReadDBus : OUT STD_LOGIC_VECTOR(0 TO 31);
    LMB_WriteDBus : OUT STD_LOGIC_VECTOR(0 TO 31);
    LMB_Ready : OUT STD_LOGIC;
    LMB_Wait : OUT STD_LOGIC;
    LMB_UE : OUT STD_LOGIC;
    LMB_CE : OUT STD_LOGIC;
    LMB_BE : OUT STD_LOGIC_VECTOR(0 TO 3)
  );
END microblaze_ilmb_v10_0;

ARCHITECTURE microblaze_ilmb_v10_0_arch OF microblaze_ilmb_v10_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF microblaze_ilmb_v10_0_arch: ARCHITECTURE IS "yes";
  COMPONENT lmb_v10 IS
    GENERIC (
      C_LMB_NUM_SLAVES : INTEGER;
      C_LMB_DWIDTH : INTEGER;
      C_LMB_AWIDTH : INTEGER;
      C_LMB_PROTOCOL : INTEGER;
      C_EXT_RESET_HIGH : INTEGER
    );
    PORT (
      LMB_Clk : IN STD_LOGIC;
      SYS_Rst : IN STD_LOGIC;
      LMB_Rst : OUT STD_LOGIC;
      M_ABus : IN STD_LOGIC_VECTOR(0 TO 31);
      M_ReadStrobe : IN STD_LOGIC;
      M_WriteStrobe : IN STD_LOGIC;
      M_AddrStrobe : IN STD_LOGIC;
      M_DBus : IN STD_LOGIC_VECTOR(0 TO 31);
      M_BE : IN STD_LOGIC_VECTOR(0 TO 3);
      Sl_DBus : IN STD_LOGIC_VECTOR(0 TO 31);
      Sl_Ready : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      Sl_Wait : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      Sl_UE : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      Sl_CE : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      LMB_ABus : OUT STD_LOGIC_VECTOR(0 TO 31);
      LMB_ReadStrobe : OUT STD_LOGIC;
      LMB_WriteStrobe : OUT STD_LOGIC;
      LMB_AddrStrobe : OUT STD_LOGIC;
      LMB_ReadDBus : OUT STD_LOGIC_VECTOR(0 TO 31);
      LMB_WriteDBus : OUT STD_LOGIC_VECTOR(0 TO 31);
      LMB_Ready : OUT STD_LOGIC;
      LMB_Wait : OUT STD_LOGIC;
      LMB_UE : OUT STD_LOGIC;
      LMB_CE : OUT STD_LOGIC;
      LMB_BE : OUT STD_LOGIC_VECTOR(0 TO 3)
    );
  END COMPONENT lmb_v10;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_MODE : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF LMB_ABus: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_Sl_0 ABUS";
  ATTRIBUTE X_INTERFACE_INFO OF LMB_AddrStrobe: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_Sl_0 ADDRSTROBE";
  ATTRIBUTE X_INTERFACE_INFO OF LMB_BE: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_Sl_0 BE";
  ATTRIBUTE X_INTERFACE_INFO OF LMB_CE: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_M CE";
  ATTRIBUTE X_INTERFACE_INFO OF LMB_Clk: SIGNAL IS "xilinx.com:signal:clock:1.0 CLK.LMB_Clk CLK";
  ATTRIBUTE X_INTERFACE_MODE OF LMB_Clk: SIGNAL IS "slave CLK.LMB_Clk";
  ATTRIBUTE X_INTERFACE_PARAMETER OF LMB_Clk: SIGNAL IS "XIL_INTERFACENAME CLK.LMB_Clk, ASSOCIATED_BUSIF LMB_Sl_0:LMB_Sl_1:LMB_Sl_2:LMB_Sl_3:LMB_Sl_4:LMB_Sl_5:LMB_Sl_6:LMB_Sl_7:LMB_Sl_8:LMB_Sl_9:LMB_Sl_10:LMB_Sl_11:LMB_Sl_12:LMB_Sl_13:LMB_Sl_14:LMB_Sl_15:LMB_M, ASSOCIATED_RESET SYS_Rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF LMB_ReadDBus: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_M READDBUS";
  ATTRIBUTE X_INTERFACE_INFO OF LMB_ReadStrobe: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_Sl_0 READSTROBE";
  ATTRIBUTE X_INTERFACE_INFO OF LMB_Ready: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_M READY";
  ATTRIBUTE X_INTERFACE_INFO OF LMB_Rst: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_Sl_0 RST, xilinx.com:interface:lmb:1.0 LMB_M RST";
  ATTRIBUTE X_INTERFACE_MODE OF LMB_Rst: SIGNAL IS "mirroredMaster LMB_M";
  ATTRIBUTE X_INTERFACE_PARAMETER OF LMB_Rst: SIGNAL IS "XIL_INTERFACENAME LMB_Sl_0, ADDR_WIDTH 32, DATA_WIDTH 32, READ_WRITE_MODE READ_WRITE, PROTOCOL STANDARD, XIL_INTERFACENAME LMB_M, ADDR_WIDTH 32, DATA_WIDTH 32, READ_WRITE_MODE READ_ONLY, PROTOCOL STANDARD";
  ATTRIBUTE X_INTERFACE_INFO OF LMB_UE: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_M UE";
  ATTRIBUTE X_INTERFACE_INFO OF LMB_Wait: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_M WAIT";
  ATTRIBUTE X_INTERFACE_INFO OF LMB_WriteDBus: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_Sl_0 WRITEDBUS";
  ATTRIBUTE X_INTERFACE_INFO OF LMB_WriteStrobe: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_Sl_0 WRITESTROBE";
  ATTRIBUTE X_INTERFACE_INFO OF M_ABus: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_M ABUS";
  ATTRIBUTE X_INTERFACE_INFO OF M_AddrStrobe: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_M ADDRSTROBE";
  ATTRIBUTE X_INTERFACE_INFO OF M_BE: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_M BE";
  ATTRIBUTE X_INTERFACE_INFO OF M_DBus: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_M WRITEDBUS";
  ATTRIBUTE X_INTERFACE_INFO OF M_ReadStrobe: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_M READSTROBE";
  ATTRIBUTE X_INTERFACE_INFO OF M_WriteStrobe: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_M WRITESTROBE";
  ATTRIBUTE X_INTERFACE_INFO OF SYS_Rst: SIGNAL IS "xilinx.com:signal:reset:1.0 RST.SYS_Rst RST";
  ATTRIBUTE X_INTERFACE_MODE OF SYS_Rst: SIGNAL IS "slave RST.SYS_Rst";
  ATTRIBUTE X_INTERFACE_PARAMETER OF SYS_Rst: SIGNAL IS "XIL_INTERFACENAME RST.SYS_Rst, POLARITY ACTIVE_HIGH, TYPE INTERCONNECT, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF Sl_CE: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_Sl_0 CE";
  ATTRIBUTE X_INTERFACE_INFO OF Sl_DBus: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_Sl_0 READDBUS";
  ATTRIBUTE X_INTERFACE_INFO OF Sl_Ready: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_Sl_0 READY";
  ATTRIBUTE X_INTERFACE_INFO OF Sl_UE: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_Sl_0 UE";
  ATTRIBUTE X_INTERFACE_INFO OF Sl_Wait: SIGNAL IS "xilinx.com:interface:lmb:1.0 LMB_Sl_0 WAIT";
BEGIN
  U0 : lmb_v10
    GENERIC MAP (
      C_LMB_NUM_SLAVES => 1,
      C_LMB_DWIDTH => 32,
      C_LMB_AWIDTH => 32,
      C_LMB_PROTOCOL => 0,
      C_EXT_RESET_HIGH => 1
    )
    PORT MAP (
      LMB_Clk => LMB_Clk,
      SYS_Rst => SYS_Rst,
      LMB_Rst => LMB_Rst,
      M_ABus => M_ABus,
      M_ReadStrobe => M_ReadStrobe,
      M_WriteStrobe => M_WriteStrobe,
      M_AddrStrobe => M_AddrStrobe,
      M_DBus => M_DBus,
      M_BE => M_BE,
      Sl_DBus => Sl_DBus,
      Sl_Ready => Sl_Ready,
      Sl_Wait => Sl_Wait,
      Sl_UE => Sl_UE,
      Sl_CE => Sl_CE,
      LMB_ABus => LMB_ABus,
      LMB_ReadStrobe => LMB_ReadStrobe,
      LMB_WriteStrobe => LMB_WriteStrobe,
      LMB_AddrStrobe => LMB_AddrStrobe,
      LMB_ReadDBus => LMB_ReadDBus,
      LMB_WriteDBus => LMB_WriteDBus,
      LMB_Ready => LMB_Ready,
      LMB_Wait => LMB_Wait,
      LMB_UE => LMB_UE,
      LMB_CE => LMB_CE,
      LMB_BE => LMB_BE
    );
END microblaze_ilmb_v10_0_arch;
