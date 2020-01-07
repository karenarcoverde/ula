library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity porta_and is
    Port ( entrada_1_and : in  STD_LOGIC_VECTOR (3 downto 0);
           entrada_2_and : in  STD_LOGIC_VECTOR (3 downto 0);
           resultado_and : out  STD_LOGIC_VECTOR (3 downto 0));
end porta_and;

architecture Behavioral of porta_and is

begin

resultado_and <= ((entrada_1_and)AND(entrada_2_and));

end Behavioral;
