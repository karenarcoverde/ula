library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity porta_not is
    Port ( entrada_not : in  STD_LOGIC_VECTOR (3 downto 0);
           saida_not : out  STD_LOGIC_VECTOR (3 downto 0));
end porta_not;

architecture Behavioral of porta_not is

begin

saida_not <= NOT(entrada_not);

end Behavioral;