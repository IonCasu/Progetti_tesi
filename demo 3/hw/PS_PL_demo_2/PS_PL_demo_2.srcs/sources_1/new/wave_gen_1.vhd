library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity wave_gen1 is
    Port ( i_clk : in STD_LOGIC;
           o_en : out STD_LOGIC
           );
end wave_gen1;

architecture Behavioral of wave_gen1 is

signal output1: std_logic:='1';
signal tmp: natural:=0;

begin

    process (i_clk) 
    begin
        if rising_edge(i_clk) then
            tmp <= tmp+1;
            if (tmp=15000000) then
                output1<= not output1;
                tmp<=0;
            end if;
        end if;

    end process;
    
o_en<=output1;

end Behavioral;
