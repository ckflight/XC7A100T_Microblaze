
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart_rx_module is
    GENERIC(
        CLOCK_NUMBER : integer := 868 -- SYSCLK / 115200 = 868
    );
    PORT(
        SYSCLK          : in STD_LOGIC;
        RESET           : in STD_LOGIC;        
        UART_RX         : in STD_LOGIC;                     -- uart rx pin
        FIFO_OUT        : out std_logic_vector(7 downto 0);
        FIFO_READ_EN    : in std_logic;
        FIFO_EMPTY      : out std_logic
     );
end uart_rx_module;

architecture Behavioral of uart_rx_module is

    COMPONENT FIFO_MODULE
    GENERIC(
        constant FIFO_DEPTH  : integer := 256;
        constant DATA_WIDTH  : integer := 8 
    );
    PORT(
        SYSCLK        : in std_logic;
        RESET         : in std_logic;
        FIFO_WRITE_EN : in std_logic;
        FIFO_READ_EN  : in std_logic;
        FIFO_DATA_IN  : in std_logic_vector(DATA_WIDTH-1 downto 0);
        FIFO_DATA_OUT : out std_logic_vector(DATA_WIDTH-1 downto 0);
        FIFO_FULL     : out std_logic;
        FIFO_EMPTY    : out std_logic
    );
    END COMPONENT;
    
    signal s_uart_rx_meta : std_logic := '0';
    signal s_uart_rx      : std_logic := '0';
    
    signal s_data       : std_logic_vector(7 downto 0) := X"00";

    -- Fifo signals
    signal s_fifo_write_en  : std_logic := '0';
    signal s_fifo_read_en   : std_logic := '0';
    signal s_fifo_data_in   : std_logic_vector(7 downto 0) := (others => '0');
    signal s_fifo_data_out  : std_logic_vector(7 downto 0) := (others => '0');
    signal s_fifo_full      : std_logic := '0';
    signal s_fifo_empty     : std_logic := '0';

begin

    fifo : FIFO_MODULE
    PORT MAP(
        SYSCLK        => SYSCLK,
        RESET         => RESET,
        FIFO_WRITE_EN => s_fifo_write_en,
        FIFO_READ_EN  => s_fifo_read_en,
        FIFO_DATA_IN  => s_fifo_data_in,
        FIFO_DATA_OUT => s_fifo_data_out,
        FIFO_FULL     => s_fifo_full,
        FIFO_EMPTY    => s_fifo_empty       
    );

    FIFO_OUT        <= s_fifo_data_out;
    FIFO_EMPTY      <= s_fifo_empty;
    s_fifo_read_en  <= FIFO_READ_EN;

    -- Register rx to prevent metastability.
    Register_RX_Process : process(SYSCLK)
    begin
        if rising_edge(SYSCLK) then
            s_uart_rx_meta <= UART_RX;
            s_uart_rx <= s_uart_rx_meta;
        end if;
    end process;

    -- Implementation uses 1 start 1 stop 8 data bits and no parity.
    UART_RX_Process : process(SYSCLK, RESET)
    
    type states is (idle_state, start_bit_state, data_bits_state, stop_bit_state, write_fifo, last_state);
    variable state : states := idle_state;
    variable clock_counter : integer range 0 to CLOCK_NUMBER-1 := 0;
    variable bit_counter : integer range 0 to 7 := 0;
    begin
        if RESET = '1' then
            state := idle_state;
            
        elsif rising_edge(SYSCLK) then
            case state is
                when idle_state =>
                    clock_counter := 0;
                    bit_counter := 0;
                
                    if s_uart_rx = '0' then -- UART start is indicated by high to low transition
                        state := start_bit_state;
                    else
                        state := idle_state;
                    end if;
                
                -- middle of the clock will be used to sample data
                when start_bit_state =>
                    if clock_counter = (CLOCK_NUMBER-1)/2 then
                        -- check middle of start bit if it is 0
                        -- after finding middle everytime counting upto CLOCK_NUMBER 
                        -- it will be in the middle of the clock.
                        if s_uart_rx = '0' then
                            clock_counter := 0;
                            state := data_bits_state;
                        else
                            state := idle_state;
                        end if;   
                    else
                        clock_counter := clock_counter + 1;
                        state := start_bit_state;
                    end if;
                
                when data_bits_state =>                    
                    if clock_counter = CLOCK_NUMBER-1 then                    
                        clock_counter := 0;
                        s_data(bit_counter) <= s_uart_rx;-- Sample the bit                        
                        if bit_counter < 7 then
                            bit_counter := bit_counter + 1;
                            state := data_bits_state;                            
                        else
                            -- 8 bits are sampled
                            bit_counter := 0;
                            state := stop_bit_state;
                        end if;                             
                    else
                        clock_counter := clock_counter + 1;
                        state := data_bits_state;
                    end if;
                
                when stop_bit_state =>
                    if clock_counter = CLOCK_NUMBER-1 then
                        clock_counter := 0;
                        state := write_fifo;                           
                    else
                        clock_counter := clock_counter + 1;
                        state := stop_bit_state;
                    end if;
        
                when write_fifo =>
                    if s_fifo_full = '0' then
                        s_fifo_data_in <= s_data;
                        s_fifo_write_en <= '1';
                        state := last_state;
                    else
                        state := last_state;
                    end if;
                
                -- this one clock cyle is used to clear ready flag
                when last_state =>
                    s_fifo_write_en <= '0';
                    state := idle_state;
                    
                when others =>
                    state := idle_state;
                    
            end case;        
        end if;        
    end process;






end Behavioral;
