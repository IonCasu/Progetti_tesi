--collaudato

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity debouncer is
    Port (
        clock: in std_logic;
        reset: in std_logic;
        deb_in: in std_logic;
        deb_out: out std_logic    
    );
end debouncer;

architecture Behavioral of debouncer is

signal internal_sig: std_logic_vector(2 downto 0);

begin
    
    ffd1_proc: process (clock, reset)
    begin
        if reset='1' then
            internal_sig(0)<='0';
        elsif rising_edge(clock) then
            internal_sig(0)<=deb_in;
        end if;
    end process ffd1_proc;

    ffd2_proc: process (clock, reset)
    begin
        if reset='1' then
            internal_sig(1)<='0';
        elsif rising_edge(clock) then
            internal_sig(1)<=internal_sig(0);
        end if;
    end process ffd2_proc;       
    
deb_out <= internal_sig(0) and (not internal_sig(1));
    
end Behavioral;