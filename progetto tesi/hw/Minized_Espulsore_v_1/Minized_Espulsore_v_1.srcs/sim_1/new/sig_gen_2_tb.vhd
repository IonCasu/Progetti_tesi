library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity sig_gen_2_tb is
end;

architecture bench of sig_gen_2_tb is

  component sig_gen_2
      port(
        clock: in std_logic;
        resetn: in std_logic;
        i_en1: in std_logic;
        i_en2: in std_logic;
        o_en: out std_logic
    );
  end component;

  signal clock: std_logic;
  signal resetn: std_logic;
  signal i_en1: std_logic;
  signal i_en2: std_logic;
  signal o_en: std_logic:='0';

  constant clock_period: time := 2 ns;
  signal stop_the_clock: boolean;

begin


  -- Insert values for generic parameters !!
    uut: sig_gen_2 port map (clock    => clock,
                             resetn   => resetn,
                             i_en1    => i_en1,
                             i_en2    => i_en2,
                             o_en     => o_en);

  stimulus: process
  begin
  
    -- Put initialisation code here
    resetn<='0';    i_en1 <= '0';   i_en2 <= '0';   wait for 20 ns;
    resetn<='0';    i_en1 <= '1';   i_en2 <= '1';   wait for 20 ns;
    
    resetn<='1';    i_en1 <= '0';   i_en2 <= '0';   wait for 50 ns; --non succede niente
    
    resetn<='1';    i_en1 <= '1';   i_en2 <= '0';   wait for 50 ns; --non succede niente
    
    resetn<='1';    i_en1 <= '0';   i_en2 <= '1';   wait for 50 ns; --conservazione dello stato
    
    resetn<='1';    i_en1 <= '1';   i_en2 <= '1';   wait for 1600 ns; --azione
    
    resetn<='1';    i_en1 <= '0';   i_en2 <= '1';   wait for 50 ns; --conservazione dello stato
    
    
    
    -- Put test bench stimulus code here
    
    stop_the_clock <= true;
    wait;
  end process;


  clocking: process
  begin
    while not stop_the_clock loop
      clock <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;