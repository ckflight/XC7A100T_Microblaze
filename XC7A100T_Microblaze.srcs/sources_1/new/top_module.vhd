
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top_module is
    Port ( 
        SYSCLK              : in STD_LOGIC;
        RESET               : in STD_LOGIC;
        
        LED                 : out std_logic_vector(15 downto 0);
        
        SPI_CLK             : out std_logic;
        SPI_MISO            : in std_logic;
        SPI_MOSI            : out std_logic;
        SPI_CS              : out  STD_LOGIC_VECTOR ( 0 to 0 );
        
        SEG                 : out std_logic_vector(7 downto 0);
        AN                  : out std_logic_vector(7 downto 0);
        
        JA_SPI_MOSI_DEBUG   : out std_logic;
        JA_SPI_MISO_DEBUG   : out std_logic;
        JA_SPI_CLK_DEBUG    : out std_logic;
        JA_SPI_CS_DEBUG     : out std_logic_vector(0 to 0);
        
        JD_UART_TX_DEBUG    : out std_logic;
        
        USB_UART_TX         : out std_logic -- connected to ft2232h's uart rxd pin on board
    );
end top_module;

architecture Behavioral of top_module is

    component microblaze_wrapper
    port (
        clk_100MHz          : in STD_LOGIC;
        gpio_rtl_0_tri_o    : out STD_LOGIC_VECTOR ( 15 downto 0 );
        reset_rtl_0         : in STD_LOGIC;
        spi_clk             : out STD_LOGIC;
        spi_cs              : out STD_LOGIC_VECTOR ( 0 to 0 );
        spi_miso            : in STD_LOGIC;
        spi_mosi            : out STD_LOGIC;
        uart_rtl_0_rxd      : in STD_LOGIC;
        uart_rtl_0_txd      : out STD_LOGIC
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
        SYSCLK  : in std_logic;
        NUMBER1 : in unsigned(3 downto 0);
        NUMBER2 : in unsigned(3 downto 0);
        NUMBER3 : in unsigned(3 downto 0);
        NUMBER4 : in unsigned(3 downto 0);
        NUMBER5 : in unsigned(3 downto 0);
        NUMBER6 : in unsigned(3 downto 0);
        NUMBER7 : in unsigned(3 downto 0);
        NUMBER8 : in unsigned(3 downto 0);           
        AN      : out std_logic_vector(7 downto 0);
        SEG     : out std_logic_vector(7 downto 0)
    );
    END COMPONENT;
    
    signal s_uart_rx : std_logic;
    signal s_uart_tx : std_logic;
    
    signal s_uart_tx_data   : std_logic_vector(7 downto 0) := X"00";
    signal s_uart_rx_data   : std_logic_vector(7 downto 0) := X"00";
    signal s_uart_start_tx  : std_logic;
    signal s_uart_tx_active : std_logic;
    signal s_uart_tx_done   : std_logic;    
    
    signal s_fifo_out       : std_logic_vector(7 downto 0);
    signal s_fifo_read_en   : std_logic;
    signal s_fifo_empty     : std_logic;
    
    signal reset_n          : std_logic;
    
    signal s_spi_mosi       : std_logic;
    signal s_spi_miso       : std_logic;
    signal s_spi_clk        : std_logic;
    signal s_spi_cs         : std_logic_vector(0 to 0);
    
begin 
    
    reset_n <= not RESET;
    
    JD_UART_TX_DEBUG    <= s_uart_tx;  -- send tx data sent from microblaze to debug pin on jd header
    USB_UART_TX         <= s_uart_tx;       -- send tx data sent from microblaze to nexy4 onboard f
    
    JA_SPI_MOSI_DEBUG   <= s_spi_mosi;
    JA_SPI_MISO_DEBUG   <= s_spi_miso;
    JA_SPI_CLK_DEBUG    <= s_spi_clk;
    JA_SPI_CS_DEBUG     <= s_spi_cs;
    
    SPI_MOSI            <= s_spi_mosi;
    s_spi_miso          <= SPI_MISO;
    SPI_CLK             <= s_spi_clk;
    SPI_CS              <= s_spi_cs;
    
    microblaze: microblaze_wrapper
    port map (      
        clk_100MHz          => SYSCLK,
        gpio_rtl_0_tri_o    => LED,
        reset_rtl_0         => reset_n,
        spi_clk             => s_spi_clk,
        spi_cs              => s_spi_cs,
        spi_miso            => s_spi_miso,
        spi_mosi            => s_spi_mosi,
        uart_rtl_0_rxd      => s_uart_rx,
        uart_rtl_0_txd      => s_uart_tx
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
        NUMBER7 => X"0",
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
