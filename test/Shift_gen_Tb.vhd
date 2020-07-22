----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2020 15:40:45
-- Design Name: 
-- Module Name: Shift_gen_Tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Shift_gen_Tb is
--  Port ( );
end Shift_gen_Tb;

architecture Behavioral of Shift_gen_Tb is

component Shifter_gen is
    generic (n: integer := 8;
             shift_amt: integer:= 2);
    port(A : in std_logic_vector(n-1 downto 0);
         sel: in std_logic_vector(2 downto 0);
         y : out std_logic_vector(2*n-1 downto 0));
end component;

constant nbit: integer := 8;
constant number: integer:= -5;
signal a: std_logic_vector(nbit-1 downto 0);
signal sel: std_logic_vector(2 downto 0);
signal y: std_logic_vector(2*nbit-1 downto 0);

begin
DUT : Shifter_gen generic map (nbit, 3) 
                  port map (a, sel, y);

    process
    begin
        a <= std_logic_vector (to_signed(number, nbit));
        sel <= "000";
        wait for 10 ns;
        sel <= "001";
        wait for 10 ns;
        sel <= "010";
        wait for 10 ns;
        sel <= "011";
        wait for 10 ns;
        sel <= "100";
        wait for 10 ns;
        sel <= "101";
        wait for 10 ns;
        sel <= "110";
        wait for 10 ns;
        sel <= "111";
        wait;
    end process;

end Behavioral;
