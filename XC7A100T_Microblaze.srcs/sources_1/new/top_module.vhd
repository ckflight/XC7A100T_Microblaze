library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity top_module is
    Port ( 
        SYSCLK               : in STD_LOGIC;
        RESET                : in STD_LOGIC;
        
        LED                  : out std_logic_vector(15 downto 0);
        
        SPI0_CLK             : out std_logic;
        SPI0_MISO            : in std_logic;
        SPI0_MOSI            : out std_logic;
        SPI0_CS              : out  STD_LOGIC_VECTOR ( 0 to 0 );
        
        SEG                  : out std_logic_vector(7 downto 0);
        AN                   : out std_logic_vector(7 downto 0);
        
        JC1_SPI1_MOSI        : out std_logic;
        JC2_SPI1_MISO        : in std_logic;
        JC3_SPI1_CLK         : out std_logic;
        JC4_SPI1_CS          : out std_logic_vector(0 to 0);
                
        USB_UART_TX          : out std_logic; -- connected to ft2232h's uart rxd pin on board
        
        I2C_SCL              : inout std_logic;
        I2C_SDA              : inout std_Logic;
        
        JD_GPIO1_OUT         : out std_logic_vector(1 downto 0);
        JD_GPIO2_IN          : in std_logic_vector(1 downto 0);
        
        JD7_I2C_SCL          : inout std_logic;
        JD8_I2C_SDA          : inout std_logic

    );
end top_module;

architecture Behavioral of top_module is

    component microblaze_wrapper
    port (
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
    end component;
    
    component mig_7series_0
    port (
        ddr2_dq                     : inout std_logic_vector(15 downto 0);
        ddr2_dqs_p                  : inout std_logic_vector(1 downto 0);
        ddr2_dqs_n                  : inout std_logic_vector(1 downto 0);
        ddr2_addr                   : out   std_logic_vector(12 downto 0);
        ddr2_ba                     : out   std_logic_vector(2 downto 0);
        ddr2_ras_n                  : out   std_logic;
        ddr2_cas_n                  : out   std_logic;
        ddr2_we_n                   : out   std_logic;
        ddr2_ck_p                   : out   std_logic_vector(0 downto 0);
        ddr2_ck_n                   : out   std_logic_vector(0 downto 0);
        ddr2_cke                    : out   std_logic_vector(0 downto 0);
        ddr2_cs_n                   : out   std_logic_vector(0 downto 0);
        ddr2_dm                     : out   std_logic_vector(1 downto 0);
        ddr2_odt                    : out   std_logic_vector(0 downto 0);
        app_addr                    : in    std_logic_vector(26 downto 0);
        app_cmd                     : in    std_logic_vector(2 downto 0);
        app_en                      : in    std_logic;
        app_wdf_data                : in    std_logic_vector(127 downto 0);
        app_wdf_end                 : in    std_logic;
        app_wdf_mask                : in    std_logic_vector(15 downto 0);
        app_wdf_wren                : in    std_logic;
        app_rd_data                 : out   std_logic_vector(127 downto 0);
        app_rd_data_end             : out   std_logic;
        app_rd_data_valid           : out   std_logic;
        app_rdy                     : out   std_logic;
        app_wdf_rdy                 : out   std_logic;
        app_sr_req                  : in    std_logic;
        app_ref_req                 : in    std_logic;
        app_zq_req                  : in    std_logic;
        app_sr_active               : out   std_logic;
        app_ref_ack                 : out   std_logic;
        app_zq_ack                  : out   std_logic;
        ui_clk                      : out   std_logic;
        ui_clk_sync_rst             : out   std_logic;
        init_calib_complete         : out   std_logic;
        -- System Clock Ports
        sys_clk_i                   : in    std_logic;
        -- Reference Clock Ports
        clk_ref_i                   : in    std_logic;
        sys_rst                     : in    std_logic
    );
    end component;
    
    component uart_tx_module
    PORT(
        SYSCLK      : in STD_LOGIC;
        RESET       : in STD_LOGIC;
        UART_TX     : out STD_LOGIC;                   -- uart tx line       
        DATA        : in STD_LOGIC_VECTOR(7 downto 0); -- data to be transferred over UART TX
        START_TX    : in STD_LOGIC;                
        TX_ACTIVE   : out STD_LOGIC;                  -- 1 active, 0 not active
        TX_DONE     : out STD_LOGIC                   -- 1 tx done, 0 not
    );
    end component;
    
    component uart_rx_module
    PORT(
        SYSCLK          : in STD_LOGIC;
        RESET           : in STD_LOGIC;        
        UART_RX         : in STD_LOGIC;                     -- uart rx pin
        FIFO_OUT        : out std_logic_vector(7 downto 0);
        FIFO_READ_EN    : in std_logic;
        FIFO_EMPTY      : out std_logic
     );
     end component;

    COMPONENT ssd_module
    PORT(  
        SYSCLK      : in std_logic;
        NUMBER1     : in unsigned(3 downto 0);
        NUMBER2     : in unsigned(3 downto 0);
        NUMBER3     : in unsigned(3 downto 0);
        NUMBER4     : in unsigned(3 downto 0);
        NUMBER5     : in unsigned(3 downto 0);
        NUMBER6     : in unsigned(3 downto 0);
        NUMBER7     : in unsigned(3 downto 0);
        NUMBER8     : in unsigned(3 downto 0);           
        AN          : out std_logic_vector(7 downto 0);
        SEG         : out std_logic_vector(7 downto 0)
    );
    END COMPONENT;
    
    signal s_uart_rx            : std_logic;
    signal s_uart_tx            : std_logic;
    
    signal s_uart_tx_data       : std_logic_vector(7 downto 0) := X"00";
    signal s_uart_rx_data       : std_logic_vector(7 downto 0) := X"00";
    signal s_uart_start_tx      : std_logic;
    signal s_uart_tx_active     : std_logic;
    signal s_uart_tx_done       : std_logic;    
    
    signal s_fifo_out           : std_logic_vector(7 downto 0);
    signal s_fifo_read_en       : std_logic;
    signal s_fifo_empty         : std_logic;
    
    signal reset_n              : std_logic;
    
    signal s_spi0_mosi          : std_logic;
    signal s_spi0_miso          : std_logic;
    signal s_spi0_clk           : std_logic;
    signal s_spi0_cs            : std_logic_vector(0 to 0);
    
    signal s_spi1_mosi          : std_logic;
    signal s_spi1_miso          : std_logic;
    signal s_spi1_clk           : std_logic;
    signal s_spi1_cs            : std_logic_vector(0 to 0);

begin 
    
    reset_n              <= not RESET;
    
    USB_UART_TX          <= s_uart_tx;       -- send tx data sent from microblaze to nexy4 onboard f
    
    JC1_SPI1_MOSI        <= s_spi1_mosi;
    s_spi1_miso          <= JC2_SPI1_MISO;
    JC3_SPI1_CLK         <= s_spi1_clk;
    JC4_SPI1_CS          <= s_spi1_cs;
    
    SPI0_MOSI            <= s_spi0_mosi;
    s_spi0_miso          <= SPI0_MISO;
    SPI0_CLK             <= s_spi0_clk;
    SPI0_CS              <= s_spi0_cs;


    microblaze: microblaze_wrapper
    port map (      
        clk_100MHz              => SYSCLK,
        gpio_rtl_0_tri_o        => LED,
        gpio_rtl_1_tri_o        => JD_GPIO1_OUT, 
        gpio_rtl_2_tri_i        => JD_GPIO2_IN,
        iic_rtl_0_scl_io        => I2C_SCL,
        iic_rtl_0_sda_io        => I2C_SDA,
        iic_rtl_1_scl_io        => JD7_I2C_SCL,
        iic_rtl_1_sda_io        => JD8_I2C_SDA,
        reset_rtl_0             => reset_n,
        spi0_cs                 => s_spi0_cs,
        spi0_miso               => s_spi0_miso,
        spi0_mosi               => s_spi0_mosi,
        spi0_sck                => s_spi0_clk,
        spi1_cs                 => s_spi1_cs,
        spi1_miso               => s_spi1_miso,
        spi1_mosi               => s_spi1_mosi,
        spi1_sck                => s_spi1_clk,
        uart_rtl_0_rxd          => s_uart_rx,
        uart_rtl_0_txd          => s_uart_tx 
    );
    
    u_mig_7series_0_mig : mig_7series_0
    port map (
      -- Memory interface ports
      ddr2_addr                      => ddr2_addr,
      ddr2_ba                        => ddr2_ba,
      ddr2_cas_n                     => ddr2_cas_n,
      ddr2_ck_n                      => ddr2_ck_n,
      ddr2_ck_p                      => ddr2_ck_p,
      ddr2_cke                       => ddr2_cke,
      ddr2_ras_n                     => ddr2_ras_n,
      ddr2_we_n                      => ddr2_we_n,
      ddr2_dq                        => ddr2_dq,
      ddr2_dqs_n                     => ddr2_dqs_n,
      ddr2_dqs_p                     => ddr2_dqs_p,
      init_calib_complete            => init_calib_complete,
      ddr2_cs_n                      => ddr2_cs_n,
      ddr2_dm                        => ddr2_dm,
      ddr2_odt                       => ddr2_odt,
      -- Application interface ports
      app_addr                       => app_addr,
      app_cmd                        => app_cmd,
      app_en                         => app_en,
      app_wdf_data                   => app_wdf_data,
      app_wdf_end                    => app_wdf_end,
      app_wdf_wren                   => app_wdf_wren,
      app_rd_data                    => app_rd_data,
      app_rd_data_end                => app_rd_data_end,
      app_rd_data_valid              => app_rd_data_valid,
      app_rdy                        => app_rdy,
      app_wdf_rdy                    => app_wdf_rdy,
      app_sr_req                     => app_sr_req,
      app_ref_req                    => app_ref_req,
      app_zq_req                     => app_zq_req,
      app_sr_active                  => app_sr_active,
      app_ref_ack                    => app_ref_ack,
      app_zq_ack                     => app_zq_ack,
      ui_clk                         => ui_clk,
      ui_clk_sync_rst                => ui_clk_sync_rst,
      app_wdf_mask                   => app_wdf_mask,
      -- System Clock Ports
      sys_clk_i                       => sys_clk_i,
      -- Reference Clock Ports
      clk_ref_i                      => clk_ref_i,
      sys_rst                        => sys_rst
    );
    
    uart_tx: uart_tx_module
    port map(
        SYSCLK      => SYSCLK,
        RESET       => RESET,
        UART_TX     => s_uart_rx,        
        DATA        => s_uart_tx_data,
        START_TX    => s_uart_start_tx,              
        TX_ACTIVE   => s_uart_tx_active, 
        TX_DONE     => s_uart_tx_done
    );

    uart_rx: uart_rx_module
    port map(
        SYSCLK          => SYSCLK,
        RESET           => RESET,  
        UART_RX         => s_uart_tx,     
        FIFO_OUT        => s_fifo_out,
        FIFO_READ_EN    => s_fifo_read_en,
        FIFO_EMPTY      => s_fifo_empty
    );
    
    ssd : ssd_module
    PORT MAP(
        SYSCLK  => SYSCLK,
        NUMBER1 => unsigned(s_uart_tx_data(3 downto 0)),
        NUMBER2 => unsigned(s_uart_tx_data(7 downto 4)),
        NUMBER3 => X"0",
        NUMBER4 => X"0",
        NUMBER5 => X"0",
        NUMBER6 => X"0",
        NUMBER7 => X"8",
        NUMBER8 => X"C",
        AN      => AN,
        SEG     => SEG        
    );

    process(SYSCLK)
    variable new_data : std_logic := '0';
    type states is (st1, st2, st3, st4);
    variable state : states := st1;
    begin
        if rising_edge(SYSCLK) then
            case state is
            
            when st1 =>
                if  s_fifo_empty = '0' then
                    s_fifo_read_en <= '1';
                    state := st2;
                end if;  
            
            when st2 =>
                s_fifo_read_en <= '0';
                s_uart_tx_data <= s_fifo_out;
                state := st3;
                
            when st3 =>
                if s_uart_tx_active = '0' then
                    s_uart_start_tx <= '1';
                    state := st4;                
                end if;
            
            when st4 =>
                s_uart_start_tx <= '0';
                if s_uart_tx_done = '1' then
                    state := st1;                
                end if;
                                
            end case;        
        
        end if;
    
    end process;





end Behavioral;