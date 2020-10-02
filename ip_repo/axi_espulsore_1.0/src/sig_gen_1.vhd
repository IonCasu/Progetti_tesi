--collaudato

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity sig_gen_1 is
    Port (
        clock: in std_logic;
        reset: in std_logic;
        enable: in std_logic;
        o_enable1: out std_logic;
        o_mux_sel: out std_logic;
        o_en_duty50: out std_logic;
        num_of_en_impulses: in natural
        );
end sig_gen_1;



architecture Behavioral of sig_gen_1 is

signal tmp_enable1: std_logic:='0';
signal tmp_enable1_duty50: std_logic:='0';
signal tmp_mux_sel: std_logic:='0';
signal clock_counts: unsigned(15 downto 0):=x"0000";
signal enable_counts: unsigned(11 downto 0):=x"000";


begin

   --    proc_enable1:process(clock, reset)
--    begin
--        if reset='1' then
--            clock_counts<=x"0000";
--            enable_counts<=x"000";
--        elsif rising_edge(clock) then
--            if (enable='1') then
--                clock_counts<=clock_counts+1;
--                if (clock_counts mod 10 = 1) then
--                    tmp_enable1<='1';
--                    enable_counts<=enable_counts+1;
--                    if enable_counts<16 then
--                        tmp_mux_sel<='0';
--                    elsif enable_counts<num_of_en_impulses then
--                        tmp_mux_sel<='1';
--                    else
--                        tmp_mux_sel<='0';
--                        tmp_enable1<='0';
--                    end if;
--                else
--                    tmp_enable1<='0';
--                end if;
--            else
--                tmp_enable1<='0';
--                tmp_mux_sel<='0';
--                clock_counts<=x"0000";
--                enable_counts<=x"000";
--            end if;
--        end if;
--    end process proc_enable1;
    
    proc_enable1: process (clock, reset)
    begin
        if reset = '1' then
            clock_counts<=x"0001";
            enable_counts<=x"000";
        elsif rising_edge(clock) then
            if enable = '1' then
                clock_counts<=clock_counts+1;
                if (clock_counts mod 10 = 1 and enable_counts < num_of_en_impulses) then
                    tmp_enable1 <= '1';
                    enable_counts <= enable_counts + 1;
                else
                    tmp_enable1 <= '0';
                end if;            
            else
                tmp_enable1<='0';
                clock_counts<=x"0001";
                enable_counts<=x"000";
            end if;
        end if;
    end process proc_enable1;
    
    
    proc_mux_select: process(clock, reset)
    begin
        if reset = '1' then
            tmp_mux_sel <= '0';
        elsif rising_edge(clock) then
            if (enable_counts < 16) then
                tmp_mux_sel <= '0';
            else
                tmp_mux_sel <= '1';
            end if;
        end if;    
    end process proc_mux_select;
    
    enable_duty50_proc: process (clock, reset)
    begin
        if reset='1' then
            tmp_enable1_duty50<='0';
        elsif rising_edge(clock) then
            if ((enable='1' and enable_counts<num_of_en_impulses)  or
                    (enable_counts = num_of_en_impulses and clock_counts<1+(num_of_en_impulses-1)*10+6)) then
                if ((clock_counts) mod 5 = 1) then
                    tmp_enable1_duty50<=not tmp_enable1_duty50;
                else
                    tmp_enable1_duty50<=tmp_enable1_duty50;
                end if;
            elsif (enable = '0' and enable_counts = num_of_en_impulses) then
                
                tmp_enable1_duty50<='0';
            end if;
        end if;
    end process;

o_enable1<=tmp_enable1;
o_mux_sel<=tmp_mux_sel;
o_en_duty50<=tmp_enable1_duty50;

end Behavioral;