library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

entity alu_tb is
end alu_tb;

architecture behavioral of alu_tb is

    signal clk  : std_logic := '0';
    signal ctrl_in : std_logic_vector(2 downto 0) := "000";
    signal A : std_logic_vector(3 downto 0) := "0000";
    signal B : std_logic_vector(3 downto 0) := "0000";
    signal output : std_logic_vector(7 downto 0):= "00000000";
    
    component control is
    port ( A, B : in STD_LOGIC_VECTOR (3 downto 0);
           ctrl_in : in STD_LOGIC_VECTOR (2 downto 0);
           clk : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    begin
    
        clk <= not clk after 4 ns;
        
        cut: control port map (A => A, B => B, ctrl_in => ctrl_in, clk => clk, output => output);
        
        stimulus:
        process begin
            ctrl_in <= "000"; A <= "0000"; B <= "0001"; wait for 8 ns;
            ctrl_in <= "010"; A <= "0010"; B <= "0010"; wait for 8 ns;
            ctrl_in <= "100"; A <= "0111"; B <= "1000"; wait;
        end process stimulus;

end behavioral;
