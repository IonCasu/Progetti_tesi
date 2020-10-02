--Generatore di enable con debouncer

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sig_gen_2 is
    port(
        clock: in std_logic;
        reset: in std_logic;
        i_to_debounce: in std_logic;
        o_debounced: out std_logic    
    );
end entity sig_gen_2;

architecture structural of sig_gen_2 is

    component debouncer is
        Port(
        clock: in std_logic;
        reset: in std_logic;
        deb_in: in std_logic;
        deb_out: out std_logic
        );
    end component debouncer;

    signal i_to_debounce_neg: std_logic;
    signal from_debouncer: std_logic;
    signal from_debouncer_neg: std_logic;
    signal to_deb_out: std_logic;
    
begin

    deb1: debouncer
        port map(
            clock=>clock,
            reset=>reset,
            deb_in=>i_to_debounce,
            deb_out=>from_debouncer
        );
        
    deb2: debouncer
        port map(
            clock=>clock,
            reset=>reset,
            deb_in=>i_to_debounce_neg,
            deb_out=>from_debouncer_neg
        );


i_to_debounce_neg<=not i_to_debounce; --ingresso negato

o_debounced<=from_debouncer or from_debouncer_neg;

end structural;