library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity complemento_2 is
    Port ( entrada_compl2 : in  STD_LOGIC_VECTOR (3 downto 0);
           saida_compl2 : out  STD_LOGIC_VECTOR (3 downto 0));
end complemento_2;

architecture Behavioral of complemento_2 is

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

signal cout_nao_usado , overflow_nao_usado , negativo_nao_usado , zero_nao_usado :STD_LOGIC ;

begin

label0: somador_4bits port map(NOT(entrada_compl2),"0001",'0',cout_nao_usado,saida_compl2,overflow_nao_usado,negativo_nao_usado,zero_nao_usado);

end Behavioral;