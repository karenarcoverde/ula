library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity porta_xor is
    Port ( entrada_1_xor : in  STD_LOGIC_VECTOR (3 downto 0);
           entrada_2_xor : in  STD_LOGIC_VECTOR (3 downto 0);
           saida_xor : out  STD_LOGIC_VECTOR (3 downto 0));
end porta_xor;

architecture Behavioral of porta_xor is

begin

saida_xor <= ((entrada_1_xor)XOR(entrada_2_xor));

end Behavioral;