library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity noter is
port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       res : out STD_LOGIC_VECTOR (7 downto 0));
end noter;

architecture Behavioral of noter is

    begin
        res <= (7 downto 4 => '0') & (not A);

end Behavioral;
