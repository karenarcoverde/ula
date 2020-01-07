library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity modulo_principal is
    Port ( entrada_clock_modulo_p : in  STD_LOGIC;
			  operacao_modulo_p : in STD_LOGIC_VECTOR (2 DOWNTO 0);
           saida_modulo_p : out  STD_LOGIC_VECTOR (3 DOWNTO 0);
			  saida_selecao_modulo_p : out  STD_LOGIC_VECTOR (1 DOWNTO 0));
end modulo_principal;

architecture Behavioral of modulo_principal is

component redutor_clock
    Port ( entrada_clock : in  STD_LOGIC;
           reset_clock : in  STD_LOGIC;
           saida_clock : out  STD_LOGIC);
end component;

component contador_10bits
    Port ( entrada_clock_contador_10bits, reset_contador_10bits : in  STD_LOGIC;
           saida_contador_10bits : out  STD_LOGIC_VECTOR (9 downto 0));
end component;

component modulo_ULA 
    Port ( entrada_1_ula : in  STD_LOGIC_VECTOR (3 downto 0);
           entrada_2_ula : in  STD_LOGIC_VECTOR (3 downto 0);
           selecao : in  STD_LOGIC_VECTOR (2 downto 0);
           saida_ula : out  STD_LOGIC_VECTOR (3 downto 0);
           cout_ula : out  STD_LOGIC;
           zero_ula : out  STD_LOGIC;
           negativo_ula : out  STD_LOGIC;
           overflow_ula : out  STD_LOGIC);
end component;


signal clock_reduzido : STD_LOGIC;
signal selecao_saida : STD_LOGIC_VECTOR (1 DOWNTO 0);
signal entrada_1, entrada_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
signal contador_auxiliar : STD_LOGIC_VECTOR (9 DOWNTO 0);
signal vetor_flags : STD_LOGIC_VECTOR (3 DOWNTO 0);
signal resultado_operacao : STD_LOGIC_VECTOR (3 DOWNTO 0);


begin

label0: redutor_clock port map(entrada_clock_modulo_p,'0', clock_reduzido);
label1: contador_10bits port map(clock_reduzido, '0', contador_auxiliar);

entrada_1 <= contador_auxiliar (9 downto 6);
entrada_2 <= contador_auxiliar (5 downto 2);
selecao_saida <= contador_auxiliar (1 downto 0);


label2: modulo_ULA port map (entrada_1, entrada_2, operacao_modulo_p, resultado_operacao, vetor_flags(0),
vetor_flags(1), vetor_flags(2), vetor_flags(3));

with selecao_saida select
                 saida_modulo_p<= entrada_1            when "00" ,
                                  entrada_2            when "01" ,
                                  resultado_operacao   when "10" ,
                                  vetor_flags          when others;
										

saida_selecao_modulo_p <= selecao_saida;


end Behavioral;
