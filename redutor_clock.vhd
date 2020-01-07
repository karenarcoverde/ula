library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity redutor_clock is
    Port ( entrada_clock : in  STD_LOGIC;
           reset_clock : in  STD_LOGIC;
           saida_clock : out  STD_LOGIC);
end redutor_clock;

architecture Behavioral of redutor_clock is

signal contador : integer range 0 to 100_000_000 := 0;

  

begin
	transformadorfrequencia : process (entrada_clock, reset_clock)
	begin 
		if (reset_clock = '1') then
			contador <= 0;	
		elsif (entrada_clock'event and entrada_clock = '1') then
		
			if (contador < 50_000_000) then
				saida_clock <= '0';
			else
				saida_clock <= '1';
			end if;
					
			if (contador = 100_000_000) then
				contador <= 0;
			else
				contador <= (contador + 1);
			end if;
		end if;
			
	end process; 
		
end Behavioral;