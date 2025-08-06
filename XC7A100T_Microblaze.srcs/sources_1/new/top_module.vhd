library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity top_module is
    Port ( 
        SYSCLK               : in STD_LOGIC;
        RESET                : in STD_LOGIC; -- active high
        
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
        JD8_I2C_SDA          : inout std_logic;
        
            -- DDR2 interface pins (external FPGA pins)
        ddr2_dq       : inout std_logic_vector(15 downto 0);
        ddr2_dqs_p    : inout std_logic_vector(1 downto 0);
        ddr2_dqs_n    : inout std_logic_vector(1 downto 0);
        ddr2_addr     : out   std_logic_vector(12 downto 0);
        ddr2_ba       : out   std_logic_vector(2 downto 0);
        ddr2_ras_n    : out   std_logic;
        ddr2_cas_n    : out   std_logic;
        ddr2_we_n     : out   std_logic;
        ddr2_ck_p     : out   std_logic_vector(0 downto 0);
        ddr2_ck_n     : out   std_logic_vector(0 downto 0);
        ddr2_cke      : out   std_logic_vector(0 downto 0);
        ddr2_cs_n     : out   std_logic_vector(0 downto 0);
        ddr2_dm       : out   std_logic_vector(1 downto 0);
        ddr2_odt      : out   std_logic_vector(0 downto 0);
        
        LED16_B       : out std_logic;
        LED16_G       : out std_logic;
        LED16_R       : out std_logic;
        
        LED17_B       : out std_logic;
        LED17_G       : out std_logic;
        LED17_R       : out std_logic

    );
end top_module;

architecture Behavioral of top_module is

    component clk_wiz_0
    port (
        clk_out1 : out std_logic;  -- 200 MHz
        clk_out2 : out std_logic;  -- 100 MHz (system clock)
        reset    : in  std_logic;
        locked   : out std_logic;
        clk_in1  : in  std_logic   -- 100 MHz from E3 pin
    );
    end component;

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
      port(
        ddr2_dq                 : inout std_logic_vector(15 downto 0);
        ddr2_dqs_p              : inout std_logic_vector(1 downto 0);
        ddr2_dqs_n              : inout std_logic_vector(1 downto 0);
        ddr2_addr               : out   std_logic_vector(12 downto 0);
        ddr2_ba                 : out   std_logic_vector(2 downto 0);
        ddr2_ras_n              : out   std_logic;
        ddr2_cas_n              : out   std_logic;
        ddr2_we_n               : out   std_logic;
        ddr2_ck_p               : out   std_logic_vector(0 downto 0);
        ddr2_ck_n               : out   std_logic_vector(0 downto 0);
        ddr2_cke                : out   std_logic_vector(0 downto 0);
        ddr2_cs_n               : out   std_logic_vector(0 downto 0);
        ddr2_dm                 : out   std_logic_vector(1 downto 0);
        ddr2_odt                : out   std_logic_vector(0 downto 0);
        app_addr                : in    std_logic_vector(26 downto 0);
        app_cmd                 : in    std_logic_vector(2 downto 0);
        app_en                  : in    std_logic;
        app_wdf_data            : in    std_logic_vector(63 downto 0);
        app_wdf_end             : in    std_logic;
        app_wdf_mask            : in    std_logic_vector(7 downto 0);
        app_wdf_wren            : in    std_logic;
        app_rd_data             : out   std_logic_vector(63 downto 0);
        app_rd_data_end         : out   std_logic;
        app_rd_data_valid       : out   std_logic;
        app_rdy                 : out   std_logic;
        app_wdf_rdy             : out   std_logic;
        app_sr_req              : in    std_logic;
        app_ref_req             : in    std_logic;
        app_zq_req              : in    std_logic;
        app_sr_active           : out   std_logic;
        app_ref_ack             : out   std_logic;
        app_zq_ack              : out   std_logic;
        ui_clk                  : out   std_logic;
        ui_clk_sync_rst         : out   std_logic;
        init_calib_complete     : out   std_logic;
        sys_clk_i               : in    std_logic;
        sys_rst                 : in    std_logic
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
    
    signal s_clk_200mhz         : std_logic;
    signal s_clk_100mhz         : std_logic;
    signal s_mmcm_locked          : std_logic;

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
   
   
    -- DDR2 interface signals

    signal s_app_addr                    : std_logic_vector(26 downto 0);
    signal s_app_cmd                     : std_logic_vector(2 downto 0);
    signal s_app_en                      : std_logic;
    signal s_app_wdf_data                : std_logic_vector(63 downto 0);
    signal s_app_wdf_end                 : std_logic;
    signal s_app_wdf_mask                : std_logic_vector(7 downto 0);
    signal s_app_wdf_wren                : std_logic;
    signal s_app_rd_data                 : std_logic_vector(63 downto 0);
    signal s_app_rd_data_end             : std_logic;
    signal s_app_rd_data_valid           : std_logic;
    signal s_app_rdy                     : std_logic;
    signal s_app_wdf_rdy                 : std_logic;
    signal s_app_sr_req                  : std_logic;
    signal s_app_ref_req                 : std_logic;
    signal s_app_zq_req                  : std_logic;
    signal s_app_sr_active               : std_logic;
    signal s_app_ref_ack                 : std_logic;
    signal s_app_zq_ack                  : std_logic;
    signal s_ui_clk                      : std_logic;
    signal s_ui_clk_sync_rst             : std_logic;
    signal s_init_calib_complete         : std_logic;

    
    -- Signals for control
    signal fsm_state         : integer range 0 to 7 := 0;
    signal data_written      : std_logic_vector(63 downto 0) := x"1234567891234567";
    signal data_read         : std_logic_vector(63 downto 0);
    
    signal s_LED16_B        : std_logic := '0';
    signal s_LED16_G        : std_logic := '0';
    signal s_LED16_R        : std_logic := '0';
    
    signal s_LED17_B        : std_logic := '0';
    signal s_LED17_G        : std_logic := '0';
    signal s_LED17_R        : std_logic := '0';
    
    
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
    
    s_app_sr_req  <= '0';
    s_app_ref_req <= '0';
    s_app_zq_req  <= '0';
    
    LED16_B <= s_LED16_B;
    LED16_G <= s_LED16_G;
    LED16_R <= s_LED16_R;
    
    LED17_B <= s_LED17_B;
    LED17_G <= s_LED17_G;
    LED17_R <= s_LED17_R;
    
    
    clk_mmcm_inst : clk_wiz_0
    port map (
        clk_out1                => s_clk_200mhz,        -- Output for MIG
        clk_out2                => s_clk_100mhz,        -- New system clock
        reset                   => RESET,               -- Active high reset
        locked                  => s_mmcm_locked,
        clk_in1                 => SYSCLK               -- Input from E3 pin
    );
    
    microblaze: microblaze_wrapper
    port map (      
        clk_100MHz              => s_clk_100mhz,
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
        init_calib_complete            => s_init_calib_complete,
        ddr2_cs_n                      => ddr2_cs_n,
        ddr2_dm                        => ddr2_dm,
        ddr2_odt                       => ddr2_odt,
        -- Application interface ports
        app_addr                       => s_app_addr,
        app_cmd                        => s_app_cmd,
        app_en                         => s_app_en,
        app_wdf_data                   => s_app_wdf_data,
        app_wdf_end                    => s_app_wdf_end,
        app_wdf_wren                   => s_app_wdf_wren,
        app_rd_data                    => s_app_rd_data,
        app_rd_data_end                => s_app_rd_data_end,
        app_rd_data_valid              => s_app_rd_data_valid,
        app_rdy                        => s_app_rdy,
        app_wdf_rdy                    => s_app_wdf_rdy,
        app_sr_req                     => s_app_sr_req,
        app_ref_req                    => s_app_ref_req,
        app_zq_req                     => s_app_zq_req,
        app_sr_active                  => s_app_sr_active,
        app_ref_ack                    => s_app_ref_ack,
        app_zq_ack                     => s_app_zq_ack,
        ui_clk                         => s_ui_clk,
        ui_clk_sync_rst                => s_ui_clk_sync_rst,
        app_wdf_mask                   => s_app_wdf_mask,
      -- System Clock Ports
        sys_clk_i                      => s_clk_200mhz,
        sys_rst                        => reset_n
    );
    
    uart_tx: uart_tx_module
    port map(
        SYSCLK      => s_clk_100mhz,
        RESET       => RESET,
        UART_TX     => s_uart_rx,        
        DATA        => s_uart_tx_data,
        START_TX    => s_uart_start_tx,              
        TX_ACTIVE   => s_uart_tx_active, 
        TX_DONE     => s_uart_tx_done
    );

    uart_rx: uart_rx_module
    port map(
        SYSCLK          => s_clk_100mhz,
        RESET           => RESET,  
        UART_RX         => s_uart_tx,     
        FIFO_OUT        => s_fifo_out,
        FIFO_READ_EN    => s_fifo_read_en,
        FIFO_EMPTY      => s_fifo_empty
    );
    
    ssd : ssd_module
    PORT MAP(
        SYSCLK  => s_clk_100mhz,
        NUMBER1 => unsigned(data_read(31 downto 28)),
        NUMBER2 => unsigned(data_read(27 downto 24)),
        NUMBER3 => unsigned(data_read(23 downto 20)),
        NUMBER4 => unsigned(data_read(19 downto 16)),
        NUMBER5 => unsigned(data_read(15 downto 12)),
        NUMBER6 => unsigned(data_read(11 downto 8)),
        NUMBER7 => unsigned(data_read(7 downto 4)),
        NUMBER8 => unsigned(data_read(3 downto 0)),
        AN      => AN,
        SEG     => SEG        
    );

    process(s_clk_100mhz)
    variable new_data : std_logic := '0';
    type states is (st1, st2, st3, st4);
    variable state : states := st1;
    begin
        if rising_edge(s_clk_100mhz) then
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

        -- FSM to write and then read DDR2 memory
    process(s_ui_clk)
    begin
        if rising_edge(s_ui_clk) then
            if s_ui_clk_sync_rst = '1' or s_init_calib_complete = '0' then
                fsm_state <= 0;
                s_app_en <= '0';
                s_app_wdf_wren <= '0';
                s_app_wdf_end <= '0';
                s_app_cmd <= "000";
                s_app_addr <= (others => '0');
                s_app_wdf_data <= (others => '0');
                s_app_wdf_mask <= (others => '0');
                s_LED16_B <= '1';
                s_LED17_B <= '1';
                
            else
                case fsm_state is
                    when 0 => -- Wait for MIG calibration complete
                        if s_init_calib_complete = '1' then
                            fsm_state <= 1;
                            
                            s_LED16_B <= '0';
                            s_LED17_B <= '0';
                            s_LED16_G <= '1';
                            s_LED17_G <= '1';
                        end if;
                
                    when 1 => -- Wait until MIG is ready for write
                        if s_app_rdy = '1' and s_app_wdf_rdy = '1' then
                            s_app_addr <= (others => '0'); -- Write base addr
                            s_app_cmd  <= "000"; -- Write command
                            s_app_en   <= '1';
                            s_app_wdf_data <= data_written;
                            s_app_wdf_mask <= (others => '0');
                            s_app_wdf_wren <= '1';
                            s_app_wdf_end  <= '1';
                            fsm_state <= 2;
                            
                            s_LED16_B <= '0';
                            s_LED17_B <= '0';
                            s_LED16_G <= '0';
                            s_LED17_G <= '0';
                            s_LED16_R <= '1';
                            s_LED17_R <= '1';
                        end if;
                
                    when 2 => -- Deassert control signals after write
                        s_app_en <= '0';
                        s_app_wdf_wren <= '0';
                        s_app_wdf_end <= '0';
                        fsm_state <= 3;
                        s_LED16_R <= '0';
                        s_LED17_R <= '0';
                
                    when 3 => -- Wait a few cycles
                        fsm_state <= 4;
                        s_LED16_R <= '1';
                        s_LED17_R <= '1';
                
                    when 4 => -- Start read
                        if s_app_rdy = '1' then
                            s_app_cmd  <= "001"; -- Read command
                            s_app_addr <= (others => '0');
                            s_app_en   <= '1';
                            fsm_state  <= 5;
                            s_LED16_R <= '0';
                            s_LED17_R <= '0';
                        end if;
                
                    when 5 =>
                        s_app_en <= '0';
                        fsm_state <= 6;
                        s_LED16_R <= '1';
                        s_LED17_R <= '1';
                
                    when 6 => -- Wait for read data valid
                        if s_app_rd_data_valid = '1' then
                            data_read <= s_app_rd_data;
                            fsm_state <= 7;
                            s_LED16_R <= '0';
                            s_LED17_R <= '0';
                        end if;
                    
                    when 7 =>
                        fsm_state <= 0;

                    when others =>
                        fsm_state <= 0;
                
                end case;

            end if;
        end if;
    end process;



end Behavioral;