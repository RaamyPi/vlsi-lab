library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control is
port ( clk : in STD_LOGIC;
       ctrl_in : in STD_LOGIC_VECTOR (2 downto 0);
       output : out STD_LOGIC_VECTOR (7 downto 0);
       A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0));
end control;

architecture behavioral of control is

    component adder is 
    port ( A, B : in STD_LOGIC_VECTOR (3 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component sub is
    port ( A, B : in STD_LOGIC_VECTOR (3 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component mul is
    port ( A, B : in STD_LOGIC_VECTOR (3 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component shifter is
    port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC;
           res : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component nander is
    port ( A, B : in STD_LOGIC_VECTOR (3 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component norer is
    port ( A, B : in STD_LOGIC_VECTOR (3 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component xorer is
    port ( A, B : in STD_LOGIC_VECTOR (3 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component noter is
    port ( A: in STD_LOGIC_VECTOR (3 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    signal Ain, Bin : std_logic_vector (3 downto 0) := "0000";
    signal add_out, sub_out, mul_out, shifter_out, nand_out, nor_out, not_out, xor_out : std_logic_vector (7 downto 0) := "00000000";
    
    begin
    
        addu: adder port map(A => Ain, B =>Bin, res => add_out);
        subu: sub port map(A => Ain, B =>Bin, res => sub_out);
        mulu: mul port map(A => Ain, B =>Bin, res => mul_out);
        shiftu: shifter port map(A => Ain, sel =>Bin(0), res => shifter_out);
        nandu: nander port map(A => Ain, B =>Bin, res => nand_out);
        noru: norer port map(A => Ain, B =>Bin, res => nor_out);
        notu: noter port map(A => Ain, res => not_out);
        xoru: xorer port map(A => Ain, B => Bin, res => xor_out);
        
        process(A,B,ctrl_in,clk)
        
            begin
                
                if rising_edge(clk) then
                    Ain <= A;
                    Bin <= B;
                end if;
                
                if falling_edge(clk) then
                    case ctrl_in is
                        when "000" => output <= add_out;
                        when "001" => output <= sub_out;
                        when "010" => output <= mul_out;
                        when "011" => output <= shifter_out ;
                        when "100" => output <= nand_out ;
                        when "101" => output <= nor_out;
                        when "110" => output <= not_out;
                        when "111" => output <= xor_out;
                        when others => output <= "00000000";
                    end case;
                 end if;
        
        end process;
    
end behavioral;
