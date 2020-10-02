--Il blocco sig_gen_1 genera il segnale di enable a 10 MHz e il segnale di selezione per 
--il mux di uscita.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sig_gen_1 is
    Port (
        clock: in std_logic;
        reset: in std_logic;
        enable: in std_logic;
        o_enable1: out std_logic;
        o_mux_sel: out std_logic;
        num_of_en_impulses: in natural
        );
end sig_gen_1;



architecture Behavioral of sig_gen_1 is

signal tmp_enable1: std_logic:='0';
signal tmp_mux_sel: std_logic:='0';
signal clock_counts: natural:=0;
signal enable_counts: natural:=0;


begin

    proc_enable1:process(clock, reset)
    
--    variable clock_counts: natural;
--    variable enable_counts: natural;
    
    begin
        if reset='1' then
            clock_counts<=0;
            enable_counts<=0;
        elsif rising_edge(clock) then
            if (enable='1') then
                clock_counts<=clock_counts+1;
                if (clock_counts mod 10 = 1) then
                    tmp_enable1<='1';
                    enable_counts<=enable_counts+1;
                    if enable_counts<16 then
                        tmp_mux_sel<='0';
                    elsif enable_counts<num_of_en_impulses then
                        tmp_mux_sel<='1';
                        tmp_enable1<='1';
                    else
                        tmp_mux_sel<='0'; --collaudato con tmp_mux_sel<='1'
                        tmp_enable1<='0';
                    end if;
                else
                    tmp_enable1<='0';
                end if;
            else
                tmp_enable1<='0';
                tmp_mux_sel<='0';
                clock_counts<=0;
                enable_counts<=0;
            end if;
        end if;
    end process proc_enable1;

o_enable1<=tmp_enable1;
o_mux_sel<=tmp_mux_sel;

end Behavioral;