--collaudato

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity preamble_reg is
    generic(
        N: natural;  --bit width
        reset_val: integer
    );

    port(
        clock: in std_logic;
        reset: in std_logic;
        enable: in std_logic;
        Pout: out std_logic_vector(N-1 downto 0);   --per facilitare debug
        Sout: out std_logic    
    );
end preamble_reg;

architecture Behavioral of preamble_reg is

signal reset_value: std_logic_vector(N-1 downto 0) := std_logic_vector(to_unsigned(reset_val, N));
signal tmp_signal: std_logic_vector(N-1 downto 0);

begin

    process(clock, reset) 
    begin
        if reset='1' then
            tmp_signal<=reset_value;
        elsif rising_edge(clock) then
            if enable='1' then
                tmp_signal(N-1 downto 1)<= tmp_signal(N-2 downto 0);
                tmp_signal(0) <= tmp_signal(N-1);
            end if;
        end if;
    end process;
    
Pout<=tmp_signal;   --per facilitare debug
Sout<=tmp_signal(N-1);

end Behavioral;
