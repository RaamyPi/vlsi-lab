library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity norer is
port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       res : out STD_LOGIC_VECTOR (7 downto 0));
end norer;

architecture Behavioral of norer is

    begin
        res <= (7 downto 4  => '0') & (A nor B);
        
end Behavioral;
