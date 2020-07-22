library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
--use ieee.std_logic_signed.all;
--use IEEE.STD_LOGIC_1164.ALL;
use WORK.constants.all;

entity MULTIPLIER_tb is
end MULTIPLIER_tb;


architecture TEST of MULTIPLIER_tb is


  constant log2numBit : integer := 3;    -- :=8  --:=16    
  constant numBit : integer := 2**log2numBit;
  --  input	 
  signal A_mp_i : std_logic_vector(numBit-1 downto 0) := (others => '0');
  signal B_mp_i : std_logic_vector(numBit-1 downto 0) := (others => '0');

  -- output
  signal Y_mp_i : std_logic_vector(2*numBit-1 downto 0);


-- MUL component declaration
--
--
component Booth_Multiplier is
    generic (--n: integer:= 8;
             n_level: integer:= 3);
    port (A: in std_logic_vector((2** n_level)-1 downto 0);
          B: in std_logic_vector((2** n_level)-1 downto 0);
          y: out std_logic_vector(2*(2** n_level)-1 downto 0));
end component;

begin

-- MUL instantiation
--
--
DUT: Booth_Multiplier generic map(log2numbit)
                      port map(A_mp_i, B_mp_i, Y_mp_i);

 --PROCESS FOR TESTING TEST - COMLETE CYCLE ---------
  test: process
  begin

    -- cycle for operand A
    NumROW : for i in 0 to 2**(NumBit)-1 loop

        -- cycle for operand B
    	NumCOL : for i in 0 to 2**(NumBit)-1 loop
	    wait for 10 ns;
	    B_mp_i <= B_mp_i + '1';
	    assert (to_integer(signed(y_mp_i)) = to_integer(signed(A_mp_i)*signed(B_mp_i))) report "Moltiplication error";
	end loop NumCOL ;
        
	A_mp_i <= A_mp_i + '1'; 	
    end loop NumROW ;

    wait;          
  end process test;

--    process
--    begin
--        A_mp_i <= "11000001";
--        B_mp_i <= "00000100";
--        wait for 10 ns;
--        A_mp_i <= "00000010";
--        --B_mp_i <= "00000101";
--        wait for 10 ns;
--        A_mp_i <= "11000000";
--        B_mp_i <= "00000110";
--        wait;
--    end process;
end TEST;
