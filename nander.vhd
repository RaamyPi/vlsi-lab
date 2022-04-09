library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity nander is
port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       res : out STD_LOGIC_VECTOR (7 downto 0));
end nander;

architecture Behavioral of nander is

    begin
        res <= (7 downto 4 => '0') & (A nand B);

end Behavioral;
