
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somador_1bit is
    Port ( entrada_1_s1bit : in  STD_LOGIC;
           entrada_2_s1bit : in  STD_LOGIC;
           cin_s1bit : in  STD_LOGIC;
           cout_s1bit : out  STD_LOGIC;
           soma_s1bit : out  STD_LOGIC);
end somador_1bit;

architecture Behavioral of somador_1bit is

begin

 cout_s1bit <= ((entrada_1_s1bit AND cin_s1bit) OR (entrada_2_s1bit AND cin_s1bit) OR (entrada_1_s1bit AND entrada_2_s1bit));
 soma_s1bit <= ((entrada_1_s1bit XOR entrada_2_s1bit) XOR cin_s1bit);

end Behavioral;
