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

-- IP VLNV: xilinx.com:ip:axi_quad_spi:3.2
-- IP Revision: 34

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY axi_quad_spi_v3_2_34;
USE axi_quad_spi_v3_2_34.axi_quad_spi;

ENTITY microblaze_axi_quad_spi_0_0 IS
  PORT (
    ext_spi_clk : IN STD_LOGIC;
    s_axi_aclk : IN STD_LOGIC;
    s_axi_aresetn : IN STD_LOGIC;
    s_axi_awaddr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    s_axi_awvalid : IN STD_LOGIC;
    s_axi_awready : OUT STD_LOGIC;
    s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_wvalid : IN STD_LOGIC;
    s_axi_wready : OUT STD_LOGIC;
    s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_bvalid : OUT STD_LOGIC;
    s_axi_bready : IN STD_LOGIC;
    s_axi_araddr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    s_axi_arvalid : IN STD_LOGIC;
    s_axi_arready : OUT STD_LOGIC;
    s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_rvalid : OUT STD_LOGIC;
    s_axi_rready : IN STD_LOGIC;
    io0_i : IN STD_LOGIC;
    io0_o : OUT STD_LOGIC;
    io0_t : OUT STD_LOGIC;
    io1_i : IN STD_LOGIC;
    io1_o : OUT STD_LOGIC;
    io1_t : OUT STD_LOGIC;
    sck_i : IN STD_LOGIC;
    sck_o : OUT STD_LOGIC;
    sck_t : OUT STD_LOGIC;
    ss_i : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    ss_o : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    ss_t : OUT STD_LOGIC;
    ip2intc_irpt : OUT STD_LOGIC
  );
END microblaze_axi_quad_spi_0_0;

ARCHITECTURE microblaze_axi_quad_spi_0_0_arch OF microblaze_axi_quad_spi_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF microblaze_axi_quad_spi_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT axi_quad_spi IS
    GENERIC (
      Async_Clk : INTEGER;
      C_FAMILY : STRING;
      C_SELECT_XPM : INTEGER;
      C_SUB_FAMILY : STRING;
      C_INSTANCE : STRING;
      C_SPI_MEM_ADDR_BITS : INTEGER;
      C_TYPE_OF_AXI4_INTERFACE : INTEGER;
      C_XIP_MODE : INTEGER;
      C_XIP_PERF_MODE : INTEGER;
      C_BYTE_LEVEL_INTERRUPT_EN : INTEGER;
      C_UC_FAMILY : INTEGER;
      C_FIFO_DEPTH : INTEGER;
      C_SCK_RATIO : INTEGER;
      C_DUAL_QUAD_MODE : INTEGER;
      C_NUM_SS_BITS : INTEGER;
      C_NUM_TRANSFER_BITS : INTEGER;
      C_NEW_SEQ_EN : INTEGER;
      C_SPI_MODE : INTEGER;
      C_USE_STARTUP : INTEGER;
      C_USE_STARTUP_EXT : INTEGER;
      C_SPI_MEMORY : INTEGER;
      C_S_AXI_ADDR_WIDTH : INTEGER;
      C_S_AXI_DATA_WIDTH : INTEGER;
      C_S_AXI4_ADDR_WIDTH : INTEGER;
      C_S_AXI4_DATA_WIDTH : INTEGER;
      C_S_AXI4_ID_WIDTH : INTEGER;
      C_SHARED_STARTUP : INTEGER;
      C_S_AXI4_BASEADDR : STD_LOGIC_VECTOR;
      C_S_AXI4_HIGHADDR : STD_LOGIC_VECTOR;
      C_LSB_STUP : INTEGER
    );
    PORT (
      ext_spi_clk : IN STD_LOGIC;
      s_axi_aclk : IN STD_LOGIC;
      s_axi_aresetn : IN STD_LOGIC;
      s_axi4_aclk : IN STD_LOGIC;
      s_axi4_aresetn : IN STD_LOGIC;
      s_axi_awaddr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      s_axi_awvalid : IN STD_LOGIC;
      s_axi_awready : OUT STD_LOGIC;
      s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_wvalid : IN STD_LOGIC;
      s_axi_wready : OUT STD_LOGIC;
      s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_bvalid : OUT STD_LOGIC;
      s_axi_bready : IN STD_LOGIC;
      s_axi_araddr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      s_axi_arvalid : IN STD_LOGIC;
      s_axi_arready : OUT STD_LOGIC;
      s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_rvalid : OUT STD_LOGIC;
      s_axi_rready : IN STD_LOGIC;
      s_axi4_awid : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi4_awaddr : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
      s_axi4_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s_axi4_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi4_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi4_awlock : IN STD_LOGIC;
      s_axi4_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi4_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi4_awvalid : IN STD_LOGIC;
      s_axi4_awready : OUT STD_LOGIC;
      s_axi4_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi4_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi4_wlast : IN STD_LOGIC;
      s_axi4_wvalid : IN STD_LOGIC;
      s_axi4_wready : OUT STD_LOGIC;
      s_axi4_bid : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi4_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi4_bvalid : OUT STD_LOGIC;
      s_axi4_bready : IN STD_LOGIC;
      s_axi4_arid : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi4_araddr : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
      s_axi4_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s_axi4_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi4_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi4_arlock : IN STD_LOGIC;
      s_axi4_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi4_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi4_arvalid : IN STD_LOGIC;
      s_axi4_arready : OUT STD_LOGIC;
      s_axi4_rid : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi4_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi4_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi4_rlast : OUT STD_LOGIC;
      s_axi4_rvalid : OUT STD_LOGIC;
      s_axi4_rready : IN STD_LOGIC;
      io0_i : IN STD_LOGIC;
      io0_o : OUT STD_LOGIC;
      io0_t : OUT STD_LOGIC;
      io1_i : IN STD_LOGIC;
      io1_o : OUT STD_LOGIC;
      io1_t : OUT STD_LOGIC;
      io2_i : IN STD_LOGIC;
      io2_o : OUT STD_LOGIC;
      io2_t : OUT STD_LOGIC;
      io3_i : IN STD_LOGIC;
      io3_o : OUT STD_LOGIC;
      io3_t : OUT STD_LOGIC;
      io0_1_i : IN STD_LOGIC;
      io0_1_o : OUT STD_LOGIC;
      io0_1_t : OUT STD_LOGIC;
      io1_1_i : IN STD_LOGIC;
      io1_1_o : OUT STD_LOGIC;
      io1_1_t : OUT STD_LOGIC;
      io2_1_i : IN STD_LOGIC;
      io2_1_o : OUT STD_LOGIC;
      io2_1_t : OUT STD_LOGIC;
      io3_1_i : IN STD_LOGIC;
      io3_1_o : OUT STD_LOGIC;
      io3_1_t : OUT STD_LOGIC;
      spisel : IN STD_LOGIC;
      sck_i : IN STD_LOGIC;
      sck_o : OUT STD_LOGIC;
      sck_t : OUT STD_LOGIC;
      ss_i : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      ss_o : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      ss_t : OUT STD_LOGIC;
      ss_1_i : IN STD_LOGIC;
      ss_1_o : OUT STD_LOGIC;
      ss_1_t : OUT STD_LOGIC;
      cfgclk : OUT STD_LOGIC;
      cfgmclk : OUT STD_LOGIC;
      eos : OUT STD_LOGIC;
      preq : OUT STD_LOGIC;
      clk : IN STD_LOGIC;
      gsr : IN STD_LOGIC;
      gts : IN STD_LOGIC;
      keyclearb : IN STD_LOGIC;
      usrcclkts : IN STD_LOGIC;
      usrdoneo : IN STD_LOGIC;
      usrdonets : IN STD_LOGIC;
      pack : IN STD_LOGIC;
      ip2intc_irpt : OUT STD_LOGIC
    );
  END COMPONENT axi_quad_spi;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_MODE : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF ext_spi_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 spi_clk CLK";
  ATTRIBUTE X_INTERFACE_MODE OF ext_spi_clk: SIGNAL IS "slave spi_clk";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ext_spi_clk: SIGNAL IS "XIL_INTERFACENAME spi_clk, ASSOCIATED_BUSIF SPI_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF io0_i: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 IO0_I";
  ATTRIBUTE X_INTERFACE_MODE OF io0_i: SIGNAL IS "master SPI_0";
  ATTRIBUTE X_INTERFACE_PARAMETER OF io0_i: SIGNAL IS "XIL_INTERFACENAME SPI_0, BOARD.ASSOCIATED_PARAM QSPI_BOARD_INTERFACE";
  ATTRIBUTE X_INTERFACE_INFO OF io0_o: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 IO0_O";
  ATTRIBUTE X_INTERFACE_INFO OF io0_t: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 IO0_T";
  ATTRIBUTE X_INTERFACE_INFO OF io1_i: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 IO1_I";
  ATTRIBUTE X_INTERFACE_INFO OF io1_o: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 IO1_O";
  ATTRIBUTE X_INTERFACE_INFO OF io1_t: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 IO1_T";
  ATTRIBUTE X_INTERFACE_INFO OF ip2intc_irpt: SIGNAL IS "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT";
  ATTRIBUTE X_INTERFACE_MODE OF ip2intc_irpt: SIGNAL IS "master interrupt";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ip2intc_irpt: SIGNAL IS "XIL_INTERFACENAME interrupt, SENSITIVITY EDGE_RISING, PortWidth 1";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 lite_clk CLK";
  ATTRIBUTE X_INTERFACE_MODE OF s_axi_aclk: SIGNAL IS "slave lite_clk";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_aclk: SIGNAL IS "XIL_INTERFACENAME lite_clk, ASSOCIATED_BUSIF AXI_LITE, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 lite_reset RST";
  ATTRIBUTE X_INTERFACE_MODE OF s_axi_aresetn: SIGNAL IS "slave lite_reset";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_aresetn: SIGNAL IS "XIL_INTERFACENAME lite_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE AWADDR";
  ATTRIBUTE X_INTERFACE_MODE OF s_axi_awaddr: SIGNAL IS "slave AXI_LITE";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_awaddr: SIGNAL IS "XIL_INTERFACENAME AXI_LITE, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 7, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS" & 
" 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_LITE WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF sck_i: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 SCK_I";
  ATTRIBUTE X_INTERFACE_INFO OF sck_o: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 SCK_O";
  ATTRIBUTE X_INTERFACE_INFO OF sck_t: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 SCK_T";
  ATTRIBUTE X_INTERFACE_INFO OF ss_i: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 SS_I";
  ATTRIBUTE X_INTERFACE_INFO OF ss_o: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 SS_O";
  ATTRIBUTE X_INTERFACE_INFO OF ss_t: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 SS_T";
BEGIN
  U0 : axi_quad_spi
    GENERIC MAP (
      Async_Clk => 0,
      C_FAMILY => "artix7",
      C_SELECT_XPM => 0,
      C_SUB_FAMILY => "artix7",
      C_INSTANCE => "axi_quad_spi_inst",
      C_SPI_MEM_ADDR_BITS => 24,
      C_TYPE_OF_AXI4_INTERFACE => 0,
      C_XIP_MODE => 0,
      C_XIP_PERF_MODE => 1,
      C_BYTE_LEVEL_INTERRUPT_EN => 0,
      C_UC_FAMILY => 0,
      C_FIFO_DEPTH => 16,
      C_SCK_RATIO => 8,
      C_DUAL_QUAD_MODE => 0,
      C_NUM_SS_BITS => 1,
      C_NUM_TRANSFER_BITS => 8,
      C_NEW_SEQ_EN => 1,
      C_SPI_MODE => 0,
      C_USE_STARTUP => 0,
      C_USE_STARTUP_EXT => 0,
      C_SPI_MEMORY => 1,
      C_S_AXI_ADDR_WIDTH => 7,
      C_S_AXI_DATA_WIDTH => 32,
      C_S_AXI4_ADDR_WIDTH => 24,
      C_S_AXI4_DATA_WIDTH => 32,
      C_S_AXI4_ID_WIDTH => 4,
      C_SHARED_STARTUP => 0,
      C_S_AXI4_BASEADDR => X"FFFFFFFF",
      C_S_AXI4_HIGHADDR => X"00000000",
      C_LSB_STUP => 0
    )
    PORT MAP (
      ext_spi_clk => ext_spi_clk,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi4_aclk => '0',
      s_axi4_aresetn => '0',
      s_axi_awaddr => s_axi_awaddr,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_awready => s_axi_awready,
      s_axi_wdata => s_axi_wdata,
      s_axi_wstrb => s_axi_wstrb,
      s_axi_wvalid => s_axi_wvalid,
      s_axi_wready => s_axi_wready,
      s_axi_bresp => s_axi_bresp,
      s_axi_bvalid => s_axi_bvalid,
      s_axi_bready => s_axi_bready,
      s_axi_araddr => s_axi_araddr,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_arready => s_axi_arready,
      s_axi_rdata => s_axi_rdata,
      s_axi_rresp => s_axi_rresp,
      s_axi_rvalid => s_axi_rvalid,
      s_axi_rready => s_axi_rready,
      s_axi4_awid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi4_awaddr => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 24)),
      s_axi4_awlen => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axi4_awsize => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi4_awburst => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      s_axi4_awlock => '0',
      s_axi4_awcache => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi4_awprot => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi4_awvalid => '0',
      s_axi4_wdata => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
      s_axi4_wstrb => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi4_wlast => '0',
      s_axi4_wvalid => '0',
      s_axi4_bready => '0',
      s_axi4_arid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi4_araddr => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 24)),
      s_axi4_arlen => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axi4_arsize => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi4_arburst => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      s_axi4_arlock => '0',
      s_axi4_arcache => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi4_arprot => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi4_arvalid => '0',
      s_axi4_rready => '0',
      io0_i => io0_i,
      io0_o => io0_o,
      io0_t => io0_t,
      io1_i => io1_i,
      io1_o => io1_o,
      io1_t => io1_t,
      io2_i => '0',
      io3_i => '0',
      io0_1_i => '0',
      io1_1_i => '0',
      io2_1_i => '0',
      io3_1_i => '0',
      spisel => '1',
      sck_i => sck_i,
      sck_o => sck_o,
      sck_t => sck_t,
      ss_i => ss_i,
      ss_o => ss_o,
      ss_t => ss_t,
      ss_1_i => '0',
      clk => '0',
      gsr => '0',
      gts => '0',
      keyclearb => '0',
      usrcclkts => '0',
      usrdoneo => '1',
      usrdonets => '0',
      pack => '0',
      ip2intc_irpt => ip2intc_irpt
    );
END microblaze_axi_quad_spi_0_0_arch;
