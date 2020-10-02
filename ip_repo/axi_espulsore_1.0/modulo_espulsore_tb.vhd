library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity modulo_espulsore_tb is
end;

architecture bench of modulo_espulsore_tb is

    component sig_gen_2 
        port(
        clock: in std_logic;
        resetn: in std_logic;
        i_en1: in std_logic;
        i_en2: in std_logic;
        o_en: out std_logic
    );
    end component sig_gen_2;


  component modulo_espulsore
      generic(
          buff_depth: natural:=2;
          bit_width: natural:=16;
          preamble_default_value: integer:=1
      );
      Port (
          clock: in std_logic;
          reset: in std_logic;
          enable: in std_logic;
          load: in std_logic;
          Pin: in std_logic_vector(bit_width-1 downto 0);   
          Sout: out std_logic;
          Sin: in std_logic;
          tx_clock: out std_logic;  
          debug_reg_output: out std_logic_vector(63 downto 0)  
      );
  end component;


  signal clock: std_logic;
  signal reset: std_logic;
  signal resetn: std_logic;
--  signal enable: std_logic;
--  signal load: std_logic;
  signal Pin: std_logic_vector(16-1 downto 0);
  signal Sout: std_logic;
  signal Sin: std_logic:='1';
  signal tx_clock: std_logic ;
  signal debug_reg_output: std_logic_vector(63 downto 0);

  signal to_ejector_load: std_logic;
  signal to_i_en2: std_logic;
  signal to_ejector_enable: std_logic;


  constant clock_period: time := 2 ns;
  signal stop_the_clock: boolean;

begin

        --Istanziazione del generatore di enable per l'espulsore
    enabler_espulsore: sig_gen_2 
        port map (
            clock => clock,
            resetn => resetn,
            i_en1 => to_ejector_load,
            i_en2 => to_i_en2,
            o_en => to_ejector_enable
        );

  -- Insert values for generic parameters !!
  uut: modulo_espulsore generic map ( buff_depth             => 2,
                                      bit_width              => 16,
                                      preamble_default_value => 42682 )
                           port map ( clock                  => clock,
                                      reset                  => reset,
                                      enable                 => to_ejector_enable,
                                      load                   => to_ejector_load,
                                      Pin                    => Pin,
                                      Sout                   => Sout,
                                      Sin                    => Sin,
                                      tx_clock               => tx_clock,
                                      debug_reg_output       => debug_reg_output );

  stimulus: process
  begin
  
  
--testbench senza sig_gen_2  
--    -- Put initialisation code here
--    reset <= '1';   enable <= '1';   load <= '1';   Pin<=x"0000";   wait for 5 ns;
    
--    reset <= '0';   enable <= '1';   load <= '1';   Pin<="0011001100110011";   wait for 2 ns;
--    reset <= '0';   enable <= '1';   load <= '1';   Pin<="1111000011110000";   wait for 2 ns;
--    reset <= '0';   enable <= '1';   load <= '0';   Pin<="1111000011110000";   
--    Sin<='0';   wait for 320 ns;
--    Sin<='1';   wait for 20 ns;
--    Sin<='0';   wait for 40 ns;
--    Sin<='1';   wait for 110 ns;
--    Sin<='0';   wait for 20 ns;
--    Sin<='1';   wait for 20 ns;
--    Sin<='1';   wait for 80 ns;
--    Sin<='0';   wait for 20 ns;
--    Sin<='0';   wait for 70 ns;
--    Sin<='1';   wait for 20 ns;
--    Sin<='1';   wait for 500 ns;
    
--    --secondo burst
--    reset <= '0';   enable <= '1';   load <= '1';   Pin<="0011001100110011";   wait for 2 ns;
--    reset <= '0';   enable <= '1';   load <= '1';   Pin<="1001010011110010";   wait for 2 ns;
--    load <= '0';
--    Sin<='0';   wait for 320 ns;
--    Sin<='1';   wait for 20 ns;
--    Sin<='0';   wait for 40 ns;
--    Sin<='1';   wait for 110 ns;
--    Sin<='0';   wait for 20 ns;
--    Sin<='1';   wait for 20 ns;
--    Sin<='1';   wait for 80 ns;
--    Sin<='0';   wait for 20 ns;
--    Sin<='0';   wait for 70 ns;
--    Sin<='1';   wait for 20 ns;
--    Sin<='1';   wait for 500 ns;

--    -- Put test bench stimulus code here

--testbench con sig_gen_2 
    
    reset <= '1';   to_ejector_load <= '1';     to_i_en2 <= '0';      Pin<=x"0000";   wait for 5 ns;    --sistema resettato
    
    reset <= '0';   to_ejector_load <= '1';     to_i_en2 <= '0';      Pin<="0011001100110011";   wait for 5 ns;
    
    reset <= '0';   to_ejector_load <= '1';     to_i_en2 <= '1';      wait for 1000 ns;
    
    reset <= '0';   to_ejector_load <= '0';     to_i_en2 <= '1';      wait for 1000 ns;
    
    
    
    
    
    




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


--signal assignments
resetn<=not reset;



end;