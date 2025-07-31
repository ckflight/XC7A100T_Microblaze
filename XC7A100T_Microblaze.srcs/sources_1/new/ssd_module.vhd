
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ssd_module is
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
end ssd_module;

architecture Behavioral of ssd_module is
    signal clock_divided_an     : std_logic := '0';
    
    -- Numbers to be displayed at 8th to 1th Seven Segment Display on Board
    signal number_current       : unsigned(3 downto 0) := to_unsigned(0,4);
    
begin
   
    
    -- One SSD at a time is on so the code shifts at 10KHz from left to right
    -- Also, at the same time(with sihft) the current number to be displayed on the specific 
    -- SSD is assigned.
    process(SYSCLK)
    variable count : natural := 0;
    variable whichSSDToLight : integer range 0 to 7 := 0;
    begin
        if rising_edge(SYSCLK) then
            if count = 10000 then
                count := 0;
                whichSSDToLight := (whichSSDToLight + 1) mod 8;
                
                case whichSSDToLight is
                when 0 =>
                    AN <= "01111111";
                    number_current <= number8;
                when 1 =>
                    AN <= "10111111";
                    number_current <= number7;
                when 2 =>
                    AN <= "11011111";
                    number_current <= number6;
                when 3 =>
                    AN <= "11101111";
                    number_current <= number5;
                when 4 =>
                    AN <= "11110111";
                    number_current <= number4;
                when 5 =>
                    AN <= "11111011";
                    number_current <= number3;                                                                                                                            
                when 6 =>
                    AN <= "11111101";
                    number_current <= number2;
                when 7 =>
                    AN <= "11111110";
                    number_current <= number1;  
                when others =>
                    AN <= "11111111";    
            end case; 
            else
                count := count + 1;
            end if;
        end if;
    end process;
     
    
    process(SYSCLK)
    begin
        if rising_edge(SYSCLK) then
            case number_current is
                when X"0" => SEG <= "11000000";
                when X"1" => SEG <= "11111001";
                when X"2" => SEG <= "10100100";
                when X"3" => SEG <= "10110000";
                when X"4" => SEG <= "10011001";
                when X"5" => SEG <= "10010010";
                when X"6" => SEG <= "10000010";
                when X"7" => SEG <= "11111000";
                when X"8" => SEG <= "10000000";
                when X"9" => SEG <= "10011000";
                when X"A" => SEG <= "10001000";
                when X"B" => SEG <= "10000011";
                when X"C" => SEG <= "11000110";
                when X"D" => SEG <= "10100001";
                when X"E" => SEG <= "10000110";
                when X"F" => SEG <= "10001110"; -- displays 'F'
                --when X"F" => SEG <= "10111111";  -- dash
                when others => SEG <= "10001110";  -- error or blank
            end case;
        end if;
    end process;

end Behavioral;