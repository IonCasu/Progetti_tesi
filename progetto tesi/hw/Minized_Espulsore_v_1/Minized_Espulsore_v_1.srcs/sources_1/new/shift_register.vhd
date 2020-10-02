--collaudato

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity shift_register is
    generic(
        N: natural  --bit width
    );

    port(
        clock: in std_logic;
        reset: in std_logic;
        enable: in std_logic;
        load: in std_logic;
        Sin: in std_logic;
        Pin: in std_logic_vector(N-1 downto 0);
        Pout: out std_logic_vector(N-1 downto 0);
        Sout: out std_logic    
    );
end shift_register;

architecture Behavioral of shift_register is

signal tmp_sig: std_logic_vector(N-1 downto 0);

begin

    process(clock,reset)
    begin
        if reset='1' then 
            tmp_sig<=(others=> '0');
        elsif rising_edge(clock) then
            if (enable='1') then
                if (load='1') then 
                    tmp_sig<=Pin;
                else
                    tmp_sig(N-1 downto 1)<= tmp_sig(N-2 downto 0);
                    tmp_sig(0)<=Sin;
                end if;
            end if;
        end if;
    end process;
    
Pout<=tmp_sig;
Sout<=tmp_sig(N-1);

end Behavioral;





