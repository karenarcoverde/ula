library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somador_4bits is
    Port ( entrada_1_s4bits : in  STD_LOGIC_VECTOR (3 downto 0);
           entrada_2_s4bits : in  STD_LOGIC_VECTOR (3 downto 0);
           cin_s4bits : in  STD_LOGIC;
           cout_s4bits : out  STD_LOGIC;
           soma_s4bits : out  STD_LOGIC_VECTOR (3 downto 0);
           overflow_s4bits : out  STD_LOGIC;
           negativo_s4bits : out  STD_LOGIC;
           zero_s4bits : out  STD_LOGIC);
end somador_4bits;

architecture Behavioral of somador_4bits is

component somador_1bit is
     Port ( entrada_1_s1bit : in  STD_LOGIC;
           entrada_2_s1bit : in  STD_LOGIC;
           cin_s1bit : in  STD_LOGIC;
           cout_s1bit : out  STD_LOGIC;
           soma_s1bit : out  STD_LOGIC);
end component somador_1bit;

signal conexao0 , conexao1 , conexao2 , cout_aux: STD_LOGIC;
signal soma_aux	:STD_LOGIC_VECTOR (3 downto 0);



begin
label0: somador_1bit port map(entrada_1_s4bits(0),entrada_2_s4bits(0),cin_s4bits,conexao0,soma_aux(0));
label1: somador_1bit port map(entrada_1_s4bits(1),entrada_2_s4bits(1),conexao0,conexao1,soma_aux(1));
label2: somador_1bit port map(entrada_1_s4bits(2),entrada_2_s4bits(2),conexao1,conexao2,soma_aux(2));
label3: somador_1bit port map(entrada_1_s4bits(3),entrada_2_s4bits(3),conexao2,cout_aux,soma_aux(3));


overflow_s4bits <= ((conexao2)XOR(cout_aux));
negativo_s4bits <= soma_aux(3);
zero_s4bits <= '1' WHEN (soma_aux = "0000")
		ELSE '0';
cout_s4bits <= cout_aux;
soma_s4bits <= soma_aux;

end Behavioral;