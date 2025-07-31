
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uart_tx_module is
    GENERIC(
        CLOCK_NUMBER : integer := 868
    );
    PORT(
        SYSCLK  : in STD_LOGIC;
        RESET   : in STD_LOGIC;
        UART_TX  : out STD_LOGIC; -- uart tx line
        
        DATA     : in STD_LOGIC_VECTOR(7 downto 0); -- data to be transferred over UART TX
        START_TX : in STD_LOGIC;                
        TX_ACTIVE : out STD_LOGIC; -- 1 active, 0 not active
        TX_DONE   : out STD_LOGIC  -- 1 tx done, 0 not
    );
end uart_tx_module;

architecture Behavioral of uart_tx_module is

    signal s_tx_data : std_logic_vector(7 downto 0) := X"00";

begin

    UART_TX_Process : process(SYSCLK, RESET)
    type states is (idle_state, start_bit_state, data_bits_state, stop_bit_state, last_state);
    variable state : states := idle_state;
    variable clock_counter : integer range 0 to CLOCK_NUMBER-1 := 0;
    variable bit_counter : integer range 0 to 7 := 0;
    begin
        
        if RESET = '1' then
            state := idle_state;
            
        elsif rising_edge(SYSCLK) then
        
            case state is
                when idle_state =>
                    UART_TX <= '1'; -- UART Idle is high
                    TX_DONE <= '0';
                    TX_ACTIVE <= '0';
                    clock_counter := 0;
                    bit_counter := 0;
                    
                    if START_TX = '1' then
                        s_tx_data <= DATA;
                        state := start_bit_state;
                    else
                        state := idle_state;
                    end if;
                    
                when start_bit_state =>
                    TX_ACTIVE <= '1';
                    UART_TX <= '0'; -- send start bit
                    
                    if clock_counter < CLOCK_NUMBER - 1 then
                        clock_counter := clock_counter + 1;
                        state := start_bit_state;
                    else
                        clock_counter := 0;
                        state := data_bits_state;
                    end if;
                
                when data_bits_state =>
                    
                    UART_TX <= s_tx_data(bit_counter); -- send each bit
                    
                    if clock_counter < CLOCK_NUMBER - 1 then
                        clock_counter := clock_counter + 1;
                        state := data_bits_state;
                    else
                        clock_counter := 0;
                        
                        -- Checking if all bits are send over uart.
                        if bit_counter < 7 then
                            bit_counter := bit_counter + 1;
                            state := data_bits_state;
                         else
                            bit_counter := 0;
                            state := stop_bit_state;
                         end if;
                    end if;
                
                when stop_bit_state =>
                
                    UART_TX <= '1'; -- send stop bit
                    
                    if clock_counter < CLOCK_NUMBER - 1 then
                        clock_counter := clock_counter + 1;
                        state := stop_bit_state;
                    else
                        clock_counter := 0;                       
                        TX_DONE <= '1';
                        state := last_state;
                        
                    end if;    
                
                when last_state =>
                
                    TX_ACTIVE <= '0';
                    TX_DONE <= '1';
                    state := idle_state;
                
                when others =>
                    state := idle_state;
            
            end case;
        end if;    
    end process;

end Behavioral;











