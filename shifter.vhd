library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shifter is
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       sel : in STD_LOGIC;
       res : out STD_LOGIC_VECTOR (7 downto 0));
end shifter;

architecture behavioral of shifter is

    begin
        res <= (7 downto 4 => '0') & std_logic_vector(shift_left(unsigned(A),1));

end behavioral;
