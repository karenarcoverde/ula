library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity porta_or is
    Port ( entrada_1_or : in  STD_LOGIC_VECTOR (3 downto 0);
           entrada_2_or : in  STD_LOGIC_VECTOR (3 downto 0);
           resultado_or : out  STD_LOGIC_VECTOR (3 downto 0));
end porta_or;

architecture Behavioral of porta_or is

begin

resultado_or <= ((entrada_1_or)OR(entrada_2_or));

end Behavioral;