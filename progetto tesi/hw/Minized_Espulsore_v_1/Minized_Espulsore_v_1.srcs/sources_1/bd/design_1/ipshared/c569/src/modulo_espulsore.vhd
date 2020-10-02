library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

package my_package1 is
    type std_logic_word is array (natural range <>) of std_logic_vector(31 downto 0); 
end package my_package1;

library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.my_package1.all;

entity modulo_espulsore is
    generic(
        buff_depth: natural:=32;    --numero di registri 
        bit_width: natural:=32;     --numero di bit per registro
        preamble_default_value: integer:=1
    );
    
    Port (
        clock: in std_logic;
        reset: in std_logic;
        enable: in std_logic;
        load: in std_logic;
        Pin: in std_logic_vector(bit_width-1 downto 0);   
        Sout: out std_logic;
        Sin: in std_logic;   --dati di diagnostica degli espulsori  
        tx_clock: out std_logic;
        
        --porte segnali diagnostica
        diag_reg: out std_logic_word(buff_depth-1 downto 0)        
    );
end modulo_espulsore;

architecture structural of modulo_espulsore is

    component preamble_reg
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
    end component;
    
    component shift_register
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
    end component;


    component sig_gen_1
      Port (
          clock: in std_logic;
          reset: in std_logic;
          enable: in std_logic;
          o_enable1: out std_logic;
          o_en_duty50: out std_logic;
          o_mux_sel: out std_logic;
          num_of_en_impulses: in natural
          );
    end component;
    
    subtype parallel_internal_sig is std_logic_word (buff_depth downto 0);    
--    type parallel_internal_sig is array (buff_depth downto 0) of std_logic_vector(bit_width-1 downto 0);
    
    signal s_internal_sig1: std_logic_vector(buff_depth downto 0); 
    signal p_internal_sig1: parallel_internal_sig; 
    signal s_internal_sig2: std_logic_vector(buff_depth downto 0); 
    signal p_internal_sig2: parallel_internal_sig;       
    signal internal_shr_enable: std_logic;
    signal diag_data_enable: std_logic;
    signal en_10mhz: std_logic;
    signal to_tx_clk: std_logic;
    signal internal_select: std_logic;
    signal internal_preamble_enable: std_logic;
    signal internal_preamble_output: std_logic;
    signal load_n: std_logic;
    signal internal_module_output: std_logic;   --debug
    
    
begin
    
    --nota: i bit escono dal MSB al LSB
    preable_reg_inst:preamble_reg 
                    generic map ( N     => 16,
                              reset_val => preamble_default_value)
                    port map ( clock    => clock,
                              reset     => reset,
                              enable    => internal_preamble_enable,
                              Sout      => internal_preamble_output );
                              
    
    --buffer dati espulsori
    send_data_buffer: for index in 0 to (buff_depth-1) generate
    send_reg: shift_register 
                    generic map (
                                N=>bit_width
                            )
                    port map (
                                clock=>clock,
                                reset=>reset,
                                enable=>internal_shr_enable,
                                load=>load,
                                Sin=>s_internal_sig1(index),
                                Sout=>s_internal_sig1(index+1),
                                Pin(bit_width-1 downto 0)=>p_internal_sig1(index+1)(bit_width-1 downto 0),
                                Pout=>p_internal_sig1(index)
                            ); 
    end generate send_data_buffer;
    
    --buffer dati diagnostica
    --nota: � un buffer di tipo FILO (First In Last Out)
    diag_data_buffer: for index in 0 to buff_depth-1 generate
    diag_reg: shift_register 
                    generic map (
                                N=>bit_width
                            )
                    port map (
                                clock=>clock,
                                reset=>reset,
                                enable=>diag_data_enable,
                                load=>'0',
                                Sin=>s_internal_sig2(index),
                                Sout=>s_internal_sig2(index+1),
                                Pin(bit_width-1 downto 0)=>p_internal_sig2(index)(bit_width-1 downto 0),
                                Pout=>p_internal_sig2(index+1)
                            );
    end generate diag_data_buffer;
    
     
    shr_en_mux: process (enable, en_10mhz, internal_select, load)
    begin
        case load is 
            when '1' => 
                internal_shr_enable<= enable;
            when '0' =>
                internal_shr_enable <= en_10mhz and internal_select;
            when others =>
                internal_shr_enable<= enable;
        end case;
    end process shr_en_mux;  
         
         
    out_mux: process (internal_preamble_output, s_internal_sig1(buff_depth), internal_select)
    begin
        case internal_select is 
            when '0' => 
                internal_module_output<= internal_preamble_output;
            when '1' =>
                internal_module_output <= s_internal_sig1(buff_depth);
            when others =>
                internal_module_output<= internal_preamble_output;
        end case;
    end process out_mux;     
                              


    en10mhz_gen: sig_gen_1 port map(
                               clock=>clock,
                               reset=>reset,
                               num_of_en_impulses=>16+bit_width*buff_depth,
                               enable=>load_n,
                               o_enable1=>en_10mhz,
                               o_en_duty50=>to_tx_clk,
                               o_mux_sel=>internal_select    
                             );
    


    debug_register: shift_register 
                        generic map (
                                    N=>64
                                )
                        port map (
                                    clock=>clock,
                                    reset=>reset,
                                    enable=>en_10mhz,
                                    load=>load,
                                    Sin=>internal_module_output,
                                    Pin=>(others=>'0')
                                );


p_internal_sig1(buff_depth)<=Pin;
tx_clock<=to_tx_clk;
s_internal_sig1(0)<='0';

internal_preamble_enable<=en_10mhz and (not internal_select);
diag_data_enable<=internal_select and en_10mhz;
load_n<= not load;

Sout<=internal_module_output;

--porto fuori il contenuto dei registri di diagnostica
diag_reg(buff_depth-1 downto 0)<=p_internal_sig2(buff_depth downto 1);

--collegamento uscita seriale - ingresso seriale
s_internal_sig2(0)<=internal_module_output;

end structural;