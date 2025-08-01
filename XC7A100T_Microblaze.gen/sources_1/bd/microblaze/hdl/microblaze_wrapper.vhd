--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
--Date        : Fri Aug  1 15:01:31 2025
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
    clk_100MHz : in STD_LOGIC;
    gpio_rtl_0_tri_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gpio_rtl_1_tri_o : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gpio_rtl_2_tri_i : in STD_LOGIC_VECTOR ( 1 downto 0 );
    iic_rtl_0_scl_io : inout STD_LOGIC;
    iic_rtl_0_sda_io : inout STD_LOGIC;
    iic_rtl_1_scl_io : inout STD_LOGIC;
    iic_rtl_1_sda_io : inout STD_LOGIC;
    io0_o_0 : out STD_LOGIC;
    io0_o_1 : out STD_LOGIC;
    io1_i_0 : in STD_LOGIC;
    io1_i_1 : in STD_LOGIC;
    reset_rtl_0 : in STD_LOGIC;
    sck_o_0 : out STD_LOGIC;
    sck_o_1 : out STD_LOGIC;
    ss_o_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    ss_o_1 : out STD_LOGIC_VECTOR ( 0 to 0 );
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
    reset_rtl_0 : in STD_LOGIC;
    io0_o_0 : out STD_LOGIC;
    io1_i_0 : in STD_LOGIC;
    sck_o_0 : out STD_LOGIC;
    ss_o_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    io0_o_1 : out STD_LOGIC;
    io1_i_1 : in STD_LOGIC;
    sck_o_1 : out STD_LOGIC;
    ss_o_1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    clk_100MHz : in STD_LOGIC;
    iic_rtl_1_scl_i : in STD_LOGIC;
    iic_rtl_1_scl_o : out STD_LOGIC;
    iic_rtl_1_scl_t : out STD_LOGIC;
    iic_rtl_1_sda_i : in STD_LOGIC;
    iic_rtl_1_sda_o : out STD_LOGIC;
    iic_rtl_1_sda_t : out STD_LOGIC
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
      io0_o_0 => io0_o_0,
      io0_o_1 => io0_o_1,
      io1_i_0 => io1_i_0,
      io1_i_1 => io1_i_1,
      reset_rtl_0 => reset_rtl_0,
      sck_o_0 => sck_o_0,
      sck_o_1 => sck_o_1,
      ss_o_0(0) => ss_o_0(0),
      ss_o_1(0) => ss_o_1(0),
      uart_rtl_0_rxd => uart_rtl_0_rxd,
      uart_rtl_0_txd => uart_rtl_0_txd
    );
end STRUCTURE;
