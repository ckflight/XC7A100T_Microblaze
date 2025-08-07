--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
--Date        : Thu Aug  7 13:00:06 2025
--Host        : TPC-0073 running 64-bit major release  (build 9200)
--Command     : generate_target microblaze_wrapper.bd
--Design      : microblaze_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity microblaze_wrapper is
  port (
    DDR2_0_addr : out STD_LOGIC_VECTOR ( 12 downto 0 );
    DDR2_0_ba : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR2_0_cas_n : out STD_LOGIC;
    DDR2_0_ck_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    DDR2_0_ck_p : out STD_LOGIC_VECTOR ( 0 to 0 );
    DDR2_0_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
    DDR2_0_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    DDR2_0_dm : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR2_0_dq : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    DDR2_0_dqs_n : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR2_0_dqs_p : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR2_0_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
    DDR2_0_ras_n : out STD_LOGIC;
    DDR2_0_we_n : out STD_LOGIC;
    clk_100MHz : in STD_LOGIC;
    gpio_rtl_0_tri_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gpio_rtl_1_tri_o : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gpio_rtl_2_tri_i : in STD_LOGIC_VECTOR ( 1 downto 0 );
    iic_rtl_0_scl_io : inout STD_LOGIC;
    iic_rtl_0_sda_io : inout STD_LOGIC;
    iic_rtl_1_scl_io : inout STD_LOGIC;
    iic_rtl_1_sda_io : inout STD_LOGIC;
    reset_rtl_0 : in STD_LOGIC;
    spi0_cs : out STD_LOGIC_VECTOR ( 0 to 0 );
    spi0_miso : in STD_LOGIC;
    spi0_mosi : out STD_LOGIC;
    spi0_sck : out STD_LOGIC;
    spi1_cs : out STD_LOGIC_VECTOR ( 0 to 0 );
    spi1_miso : in STD_LOGIC;
    spi1_mosi : out STD_LOGIC;
    spi1_sck : out STD_LOGIC;
    uart_rtl_0_rxd : in STD_LOGIC;
    uart_rtl_0_txd : out STD_LOGIC
  );
end microblaze_wrapper;

architecture STRUCTURE of microblaze_wrapper is
  component microblaze is
  port (
    gpio_rtl_0_tri_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gpio_rtl_1_tri_o : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gpio_rtl_2_tri_i : in STD_LOGIC_VECTOR ( 1 downto 0 );
    uart_rtl_0_rxd : in STD_LOGIC;
    uart_rtl_0_txd : out STD_LOGIC;
    iic_rtl_0_scl_i : in STD_LOGIC;
    iic_rtl_0_scl_o : out STD_LOGIC;
    iic_rtl_0_scl_t : out STD_LOGIC;
    iic_rtl_0_sda_i : in STD_LOGIC;
    iic_rtl_0_sda_o : out STD_LOGIC;
    iic_rtl_0_sda_t : out STD_LOGIC;
    iic_rtl_1_scl_i : in STD_LOGIC;
    iic_rtl_1_scl_o : out STD_LOGIC;
    iic_rtl_1_scl_t : out STD_LOGIC;
    iic_rtl_1_sda_i : in STD_LOGIC;
    iic_rtl_1_sda_o : out STD_LOGIC;
    iic_rtl_1_sda_t : out STD_LOGIC;
    DDR2_0_dq : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    DDR2_0_dqs_p : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR2_0_dqs_n : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR2_0_addr : out STD_LOGIC_VECTOR ( 12 downto 0 );
    DDR2_0_ba : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR2_0_ras_n : out STD_LOGIC;
    DDR2_0_cas_n : out STD_LOGIC;
    DDR2_0_we_n : out STD_LOGIC;
    DDR2_0_ck_p : out STD_LOGIC_VECTOR ( 0 to 0 );
    DDR2_0_ck_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    DDR2_0_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
    DDR2_0_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    DDR2_0_dm : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR2_0_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
    reset_rtl_0 : in STD_LOGIC;
    spi1_mosi : out STD_LOGIC;
    spi1_miso : in STD_LOGIC;
    spi1_sck : out STD_LOGIC;
    spi1_cs : out STD_LOGIC_VECTOR ( 0 to 0 );
    spi0_mosi : out STD_LOGIC;
    spi0_miso : in STD_LOGIC;
    spi0_sck : out STD_LOGIC;
    spi0_cs : out STD_LOGIC_VECTOR ( 0 to 0 );
    clk_100MHz : in STD_LOGIC
  );
  end component microblaze;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal iic_rtl_0_scl_i : STD_LOGIC;
  signal iic_rtl_0_scl_o : STD_LOGIC;
  signal iic_rtl_0_scl_t : STD_LOGIC;
  signal iic_rtl_0_sda_i : STD_LOGIC;
  signal iic_rtl_0_sda_o : STD_LOGIC;
  signal iic_rtl_0_sda_t : STD_LOGIC;
  signal iic_rtl_1_scl_i : STD_LOGIC;
  signal iic_rtl_1_scl_o : STD_LOGIC;
  signal iic_rtl_1_scl_t : STD_LOGIC;
  signal iic_rtl_1_sda_i : STD_LOGIC;
  signal iic_rtl_1_sda_o : STD_LOGIC;
  signal iic_rtl_1_sda_t : STD_LOGIC;
begin
iic_rtl_0_scl_iobuf: component IOBUF
     port map (
      I => iic_rtl_0_scl_o,
      IO => iic_rtl_0_scl_io,
      O => iic_rtl_0_scl_i,
      T => iic_rtl_0_scl_t
    );
iic_rtl_0_sda_iobuf: component IOBUF
     port map (
      I => iic_rtl_0_sda_o,
      IO => iic_rtl_0_sda_io,
      O => iic_rtl_0_sda_i,
      T => iic_rtl_0_sda_t
    );
iic_rtl_1_scl_iobuf: component IOBUF
     port map (
      I => iic_rtl_1_scl_o,
      IO => iic_rtl_1_scl_io,
      O => iic_rtl_1_scl_i,
      T => iic_rtl_1_scl_t
    );
iic_rtl_1_sda_iobuf: component IOBUF
     port map (
      I => iic_rtl_1_sda_o,
      IO => iic_rtl_1_sda_io,
      O => iic_rtl_1_sda_i,
      T => iic_rtl_1_sda_t
    );
microblaze_i: component microblaze
     port map (
      DDR2_0_addr(12 downto 0) => DDR2_0_addr(12 downto 0),
      DDR2_0_ba(2 downto 0) => DDR2_0_ba(2 downto 0),
      DDR2_0_cas_n => DDR2_0_cas_n,
      DDR2_0_ck_n(0) => DDR2_0_ck_n(0),
      DDR2_0_ck_p(0) => DDR2_0_ck_p(0),
      DDR2_0_cke(0) => DDR2_0_cke(0),
      DDR2_0_cs_n(0) => DDR2_0_cs_n(0),
      DDR2_0_dm(1 downto 0) => DDR2_0_dm(1 downto 0),
      DDR2_0_dq(15 downto 0) => DDR2_0_dq(15 downto 0),
      DDR2_0_dqs_n(1 downto 0) => DDR2_0_dqs_n(1 downto 0),
      DDR2_0_dqs_p(1 downto 0) => DDR2_0_dqs_p(1 downto 0),
      DDR2_0_odt(0) => DDR2_0_odt(0),
      DDR2_0_ras_n => DDR2_0_ras_n,
      DDR2_0_we_n => DDR2_0_we_n,
      clk_100MHz => clk_100MHz,
      gpio_rtl_0_tri_o(15 downto 0) => gpio_rtl_0_tri_o(15 downto 0),
      gpio_rtl_1_tri_o(1 downto 0) => gpio_rtl_1_tri_o(1 downto 0),
      gpio_rtl_2_tri_i(1 downto 0) => gpio_rtl_2_tri_i(1 downto 0),
      iic_rtl_0_scl_i => iic_rtl_0_scl_i,
      iic_rtl_0_scl_o => iic_rtl_0_scl_o,
      iic_rtl_0_scl_t => iic_rtl_0_scl_t,
      iic_rtl_0_sda_i => iic_rtl_0_sda_i,
      iic_rtl_0_sda_o => iic_rtl_0_sda_o,
      iic_rtl_0_sda_t => iic_rtl_0_sda_t,
      iic_rtl_1_scl_i => iic_rtl_1_scl_i,
      iic_rtl_1_scl_o => iic_rtl_1_scl_o,
      iic_rtl_1_scl_t => iic_rtl_1_scl_t,
      iic_rtl_1_sda_i => iic_rtl_1_sda_i,
      iic_rtl_1_sda_o => iic_rtl_1_sda_o,
      iic_rtl_1_sda_t => iic_rtl_1_sda_t,
      reset_rtl_0 => reset_rtl_0,
      spi0_cs(0) => spi0_cs(0),
      spi0_miso => spi0_miso,
      spi0_mosi => spi0_mosi,
      spi0_sck => spi0_sck,
      spi1_cs(0) => spi1_cs(0),
      spi1_miso => spi1_miso,
      spi1_mosi => spi1_mosi,
      spi1_sck => spi1_sck,
      uart_rtl_0_rxd => uart_rtl_0_rxd,
      uart_rtl_0_txd => uart_rtl_0_txd
    );
end STRUCTURE;
