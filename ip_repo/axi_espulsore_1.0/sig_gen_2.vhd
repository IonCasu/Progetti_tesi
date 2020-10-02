library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sig_gen_2 is
    port(
        clock: in std_logic;
        resetn: in std_logic;
        i_en1: in std_logic;
        i_en2: in std_logic;
        o_en: out std_logic
    );
end sig_gen_2;

architecture Behavioral of sig_gen_2 is

signal clock_counts: natural;
signal enable_counts: natural;
signal tmp_o_enable: std_logic:='0';

begin

    output_generation_process: process(clock, resetn)
    begin
        if resetn='0' then
            clock_counts<=0;
            enable_counts<=0;
            tmp_o_enable<='0';
        elsif (i_en1 = '0' and i_en2 = '0') then --stato finale
            clock_counts<=0;
            enable_counts<=0;
            tmp_o_enable<='0';
        elsif (i_en1 = '1' and i_en2 = '0') then  --stato iniziale; pronto per partire
            clock_counts<=clock_counts;
            enable_counts<=enable_counts;
            tmp_o_enable<='0';
        elsif (i_en1 = '1' and i_en2 = '1') then -- timer partito.
            clock_counts<=clock_counts+1;
            if (clock_counts < 10) then
                tmp_o_enable<='0';
                enable_counts<=enable_counts;
            else
                if((clock_counts-10) mod 23 = 1) then
                    if(enable_counts < 32) then
                        tmp_o_enable<='1';
                        enable_counts<=enable_counts+1;
                    else
                        tmp_o_enable<='0';
                        enable_counts<=enable_counts;
                    end if;
                else
                    tmp_o_enable<='0';
                    enable_counts<=enable_counts;
                end if;
           end if;
        else --i_en1='0' and i_en2='1'
            clock_counts<=clock_counts;
            enable_counts<=enable_counts;
            tmp_o_enable<='0';
        end if;

    end process output_generation_process;

end Behavioral;
