library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity modulo_espulsore is
    generic(
        buff_depth: natural:=2;    --numero di registri 
        bit_width: natural:=16;     --numero di bit per registro
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
        debug_reg_output: out std_logic_vector(63 downto 0);
        
        --porte per il prelievo dei segnali di diagnostica
        diag_reg0: out std_logic_vector(bit_width-1 downto 0);
        diag_reg1: out std_logic_vector(bit_width-1 downto 0);
        diag_reg2: out std_logic_vector(bit_width-1 downto 0);
        diag_reg3: out std_logic_vector(bit_width-1 downto 0);
        diag_reg4: out std_logic_vector(bit_width-1 downto 0);
        diag_reg5: out std_logic_vector(bit_width-1 downto 0);
        diag_reg6: out std_logic_vector(bit_width-1 downto 0);
        diag_reg7: out std_logic_vector(bit_width-1 downto 0);
        diag_reg8: out std_logic_vector(bit_width-1 downto 0);
        diag_reg9: out std_logic_vector(bit_width-1 downto 0);
        diag_reg10: out std_logic_vector(bit_width-1 downto 0);
        diag_reg11: out std_logic_vector(bit_width-1 downto 0);
        diag_reg12: out std_logic_vector(bit_width-1 downto 0);
        diag_reg13: out std_logic_vector(bit_width-1 downto 0);
        diag_reg14: out std_logic_vector(bit_width-1 downto 0);
        diag_reg15: out std_logic_vector(bit_width-1 downto 0);
        diag_reg16: out std_logic_vector(bit_width-1 downto 0);
        diag_reg17: out std_logic_vector(bit_width-1 downto 0);
        diag_reg18: out std_logic_vector(bit_width-1 downto 0);
        diag_reg19: out std_logic_vector(bit_width-1 downto 0);
        diag_reg20: out std_logic_vector(bit_width-1 downto 0);
        diag_reg21: out std_logic_vector(bit_width-1 downto 0);
        diag_reg22: out std_logic_vector(bit_width-1 downto 0);
        diag_reg23: out std_logic_vector(bit_width-1 downto 0);
        diag_reg24: out std_logic_vector(bit_width-1 downto 0);
        diag_reg25: out std_logic_vector(bit_width-1 downto 0);
        diag_reg26: out std_logic_vector(bit_width-1 downto 0);
        diag_reg27: out std_logic_vector(bit_width-1 downto 0);
        diag_reg28: out std_logic_vector(bit_width-1 downto 0);
        diag_reg29: out std_logic_vector(bit_width-1 downto 0);
        diag_reg30: out std_logic_vector(bit_width-1 downto 0);
        diag_reg31: out std_logic_vector(bit_width-1 downto 0)            
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
          o_mux_sel: out std_logic;
          num_of_en_impulses: in natural
          );
    end component;
        
    type parallel_internal_sig is array (buff_depth downto 0) of std_logic_vector(bit_width-1 downto 0);
    
    signal s_internal_sig1: std_logic_vector(buff_depth downto 0); 
    signal p_internal_sig1: parallel_internal_sig; 
    signal s_internal_sig2: std_logic_vector(buff_depth downto 0); 
    signal p_internal_sig2: parallel_internal_sig;       
    signal internal_shr_enable: std_logic;
    signal diag_data_enable: std_logic;
    signal en_10mhz: std_logic;
    signal internal_select: std_logic;
    signal internal_preamble_enable: std_logic;
    signal internal_preamble_output: std_logic;
    signal load_n: std_logic;
    signal internal_module_output: std_logic;   --debug
    
    
begin

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
                                Pin(bit_width-1 downto 0)=>p_internal_sig2(index+1)(bit_width-1 downto 0),
                                Pout=>p_internal_sig2(index)
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
                               num_of_en_impulses=>bit_width*(1+buff_depth),
                               enable=>load_n,
                               o_enable1=>en_10mhz,
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
                                    load=>'0',
                                    Sin=>internal_module_output,
                                    Pin=>(others=>'0'),
                                    Pout=>debug_reg_output
                                );


p_internal_sig1(buff_depth)<=Pin;
tx_clock<=en_10mhz;
s_internal_sig1(0)<='0';
s_internal_sig2(0)<=Sin;

internal_preamble_enable<=en_10mhz and (not internal_select);
diag_data_enable<=internal_select and en_10mhz;
load_n<= not load;

Sout<=internal_module_output;

--porto fuori il contenuto dei registri di diagnostica
        diag_reg0 <= p_internal_sig2(1);
        diag_reg1 <= p_internal_sig2(2);
        diag_reg2 <= p_internal_sig2(3);
        diag_reg3 <= p_internal_sig2(4);
        diag_reg4 <= p_internal_sig2(5);
        diag_reg5 <= p_internal_sig2(6);
        diag_reg6 <= p_internal_sig2(7);
        diag_reg7 <= p_internal_sig2(8);
        diag_reg8 <= p_internal_sig2(9);
        diag_reg9 <= p_internal_sig2(10);
        diag_reg10 <= p_internal_sig2(11);
        diag_reg11 <= p_internal_sig2(12);
        diag_reg12 <= p_internal_sig2(13);
        diag_reg13 <= p_internal_sig2(14);
        diag_reg14 <= p_internal_sig2(15);
        diag_reg15 <= p_internal_sig2(16);
        diag_reg16 <= p_internal_sig2(17);
        diag_reg17 <= p_internal_sig2(18);
        diag_reg18 <= p_internal_sig2(19);
        diag_reg19 <= p_internal_sig2(20);
        diag_reg20 <= p_internal_sig2(21);
        diag_reg21 <= p_internal_sig2(22);
        diag_reg22 <= p_internal_sig2(23);
        diag_reg23 <= p_internal_sig2(24);
        diag_reg24 <= p_internal_sig2(25);
        diag_reg25 <= p_internal_sig2(26);
        diag_reg26 <= p_internal_sig2(27);
        diag_reg27 <= p_internal_sig2(28);
        diag_reg28 <= p_internal_sig2(29);
        diag_reg29 <= p_internal_sig2(30);
        diag_reg30 <= p_internal_sig2(31);
        diag_reg31 <= p_internal_sig2(32);


end structural;