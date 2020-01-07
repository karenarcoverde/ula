library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity operacao_incremento is
    Port ( entrada_incremento : in  STD_LOGIC_VECTOR (3 downto 0);
           saida_incremento : out  STD_LOGIC_VECTOR (3 downto 0);
           negativo_incremento : out  STD_LOGIC;
           overflow_incremento : out  STD_LOGIC;
           zero_incremento : out  STD_LOGIC;
           cout_incremento : out  STD_LOGIC);
end operacao_incremento;

architecture Behavioral of operacao_incremento is

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


begin

label0: somador_4bits port map(entrada_incremento,"0001",'0',cout_incremento,saida_incremento,overflow_incremento,negativo_incremento,zero_incremento);

end Behavioral;