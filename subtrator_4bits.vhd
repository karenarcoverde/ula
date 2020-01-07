library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subtrator_4bits is
    Port ( entrada_1_subt4bits : in  STD_LOGIC_VECTOR (3 downto 0);
           entrada_2_subt4bits : in  STD_LOGIC_VECTOR (3 downto 0);
           borrow_in_subt4bits : in  STD_LOGIC;
           borrow_out_subt4bits : out  STD_LOGIC;
           resultado_subt4bits : out  STD_LOGIC_VECTOR (3 downto 0);
           zero_subt4bits : out  STD_LOGIC;
           negativo_subt4bits : out  STD_LOGIC;
           overflow_subt4bits : out  STD_LOGIC);
end subtrator_4bits;

architecture Behavioral of subtrator_4bits is


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

signal cout_aux :STD_LOGIC;

begin
label0: somador_4bits port map(entrada_1_subt4bits , NOT(entrada_2_subt4bits) , '1' , cout_aux , resultado_subt4bits , overflow_subt4bits , negativo_subt4bits , zero_subt4bits);   
borrow_out_subt4bits <= NOT(cout_aux);

end Behavioral;