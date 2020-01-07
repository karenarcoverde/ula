library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity modulo_ULA is
    Port ( entrada_1_ula : in  STD_LOGIC_VECTOR (3 downto 0);
           entrada_2_ula : in  STD_LOGIC_VECTOR (3 downto 0);
           selecao : in  STD_LOGIC_VECTOR (2 downto 0);
           saida_ula : out  STD_LOGIC_VECTOR (3 downto 0);
           cout_ula : out  STD_LOGIC;
           zero_ula : out  STD_LOGIC;
           negativo_ula : out  STD_LOGIC;
           overflow_ula : out  STD_LOGIC);
end modulo_ULA;

architecture Behavioral of modulo_ULA is

------------------------------- Importando as funcoes
-- selecao = 000
component porta_and is
    Port ( entrada_1_and : in  STD_LOGIC_VECTOR (3 downto 0);
           entrada_2_and : in  STD_LOGIC_VECTOR (3 downto 0);
           resultado_and : out  STD_LOGIC_VECTOR (3 downto 0));
end component porta_and;


-- selecao = 001
component porta_or is
    Port ( entrada_1_or : in  STD_LOGIC_VECTOR (3 downto 0);
           entrada_2_or : in  STD_LOGIC_VECTOR (3 downto 0);
           resultado_or : out  STD_LOGIC_VECTOR (3 downto 0));
end component porta_or;

-- selecao = 010
component porta_xor is
    Port ( entrada_1_xor : in  STD_LOGIC_VECTOR (3 downto 0);
           entrada_2_xor : in  STD_LOGIC_VECTOR (3 downto 0);
           saida_xor : out  STD_LOGIC_VECTOR (3 downto 0));
end component porta_xor;

-- selecao = 011
component porta_not is
    Port ( entrada_not : in  STD_LOGIC_VECTOR (3 downto 0);
           saida_not : out  STD_LOGIC_VECTOR (3 downto 0));
end component porta_not;

-- selecao = 100
component somador_4bits is
    Port ( entrada_1_s4bits : in  STD_LOGIC_VECTOR (3 downto 0);
           entrada_2_s4bits : in  STD_LOGIC_VECTOR (3 downto 0);
           cin_s4bits : in  STD_LOGIC;
           cout_s4bits : out  STD_LOGIC;
           soma_s4bits : out  STD_LOGIC_VECTOR (3 downto 0);
           overflow_s4bits : out  STD_LOGIC;
           negativo_s4bits : out  STD_LOGIC;
           zero_s4bits : out  STD_LOGIC);
end component somador_4bits;

-- selecao = 101
component subtrator_4bits is
    Port ( entrada_1_subt4bits : in  STD_LOGIC_VECTOR (3 downto 0);
           entrada_2_subt4bits : in  STD_LOGIC_VECTOR (3 downto 0);
           borrow_in_subt4bits : in  STD_LOGIC;
           borrow_out_subt4bits : out  STD_LOGIC;
           resultado_subt4bits : out  STD_LOGIC_VECTOR (3 downto 0);
           zero_subt4bits : out  STD_LOGIC;
           negativo_subt4bits : out  STD_LOGIC;
           overflow_subt4bits : out  STD_LOGIC);
end component subtrator_4bits;


-- selecao = 110
component complemento_2 is
    Port ( entrada_compl2 : in  STD_LOGIC_VECTOR (3 downto 0);
           saida_compl2 : out  STD_LOGIC_VECTOR (3 downto 0));
end component complemento_2;


-- selecao = 111
component operacao_incremento is
    Port ( entrada_incremento : in  STD_LOGIC_VECTOR (3 downto 0);
           saida_incremento : out  STD_LOGIC_VECTOR (3 downto 0);
           negativo_incremento : out  STD_LOGIC;
           overflow_incremento : out  STD_LOGIC;
           zero_incremento : out  STD_LOGIC;
           cout_incremento : out  STD_LOGIC);
end component operacao_incremento;

-------------------------------- Auxiliares
signal aux_and, aux_or, aux_xor, aux_not :STD_LOGIC_VECTOR(3 downto 0);
signal aux_soma, aux_sub, aux_compl_2, aux_incrm :STD_LOGIC_VECTOR(3 downto 0);
signal cout_soma, bout_sub, cout_incrm : STD_LOGIC;
signal ov_soma, ov_sub, ov_incrm : STD_LOGIC;
signal neg_soma, neg_sub, neg_incrm : STD_LOGIC;
signal zero_soma, zero_sub, zero_incrm: STD_LOGIC;

begin
-------------------------------- Calculo das saidas auxiliares
-- 000
label0: porta_and port map (entrada_1_ula , entrada_2_ula, aux_and);
-- 001
label1: porta_or port map (entrada_1_ula , entrada_2_ula, aux_or);
-- 010
label2: porta_xor port map (entrada_1_ula , entrada_2_ula, aux_xor);
-- 011
label3: porta_not port map (entrada_1_ula , aux_not);
-- 100
label4: somador_4bits port map (entrada_1_ula, entrada_2_ula, '0', 
                    cout_soma, aux_soma, ov_soma,neg_soma, zero_soma);
-- 101
label5: subtrator_4bits port map (entrada_1_ula, entrada_2_ula, '0', 
                        bout_sub, aux_sub, zero_sub, neg_sub, ov_sub);
-- 110
label6: complemento_2 port map (entrada_1_ula, aux_compl_2);
-- 111
label7: operacao_incremento port map (entrada_1_ula, aux_incrm,
                 neg_incrm, ov_incrm, zero_incrm, cout_incrm);
							

-------------------------------- selecao das saidas principais
with selecao select
           saida_ula <=         aux_and     when "000" ,
                                aux_or      when "001" ,
                                aux_xor     when "010" ,
                                aux_not	    when "011" ,
                                aux_soma    when "100" ,
                                aux_sub	    when "101" ,
                                aux_compl_2 when "110" ,
                                aux_incrm   when others;
		
with selecao select
                cout_ula <=      '0'        when "000" ,
                                 '0'        when "001" ,
                                 '0'        when "010" ,
                                 '0'        when "011" ,
                                 cout_soma  when "100" ,
                                 bout_sub   when "101" ,
                                 '0'        when "110" ,
                                 cout_incrm when others;
		

with selecao select
          zero_ula <=            '0'        when "000" ,
                                 '0'        when "001" ,
                                 '0'        when "010" ,
                                 '0'        when "011" ,
                                 zero_soma  when "100" ,
                                 zero_sub   when "101" ,
                                 '0'        when "110" ,
                                zero_incrm when others ;


with selecao select
                   negativo_ula<= '0'       when "000" ,
                                  '0'       when "001" ,
                                  '0'       when "010" ,
                                  '0'       when "011" ,
                                  neg_soma  when "100" ,
                                  neg_sub   when "101" ,
                                  '0'       when "110" ,
                                  neg_incrm when others;
											
with selecao select
                   overflow_ula <= '0'      when "000" ,
                                   '0'      when "001" ,
                                   '0'      when "010" ,
                                   '0'      when "011" ,
                                   ov_soma  when "100" ,
                                   ov_sub   when "101" ,
                                   '0'      when "110" ,
                                   ov_incrm when others ;

end Behavioral;