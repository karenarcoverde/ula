library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity contador_10bits is
    Port ( entrada_clock_contador_10bits, reset_contador_10bits : in  STD_LOGIC;
           saida_contador_10bits : out  STD_LOGIC_VECTOR (9 downto 0));
end contador_10bits;

architecture Behavioral of contador_10bits is
signal contador: INTEGER := 0;

begin

	contagem_10bits: process(entrada_clock_contador_10bits)

	begin 
	
		if (reset_contador_10bits = '1') then
			contador <= 0;
		elsif (entrada_clock_contador_10bits'event and  entrada_clock_contador_10bits = '1') then
			if (contador = 1023) then
				contador <= 0;
			else
				contador <= contador + 1;
			end if;
		end if; 	
		saida_contador_10bits <= STD_LOGIC_VECTOR(to_unsigned(contador,10));
	
	end process;
	
end Behavioral;