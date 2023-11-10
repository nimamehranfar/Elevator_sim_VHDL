----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:38:26 06/18/2021 
-- Design Name: 
-- Module Name:    IC7485 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IC7485 is
	port( A: in std_logic_vector(3 downto 0);
			B: in std_logic_vector(3 downto 0);
			Cascade_AgtB: in std_logic:='0';
			Cascade_AeqB: in std_logic:='0';
			Cascade_AltB: in std_logic:='0';
			AgtB: out std_logic:='0';
			AeqB: out std_logic:='0';
			AltB: out std_logic:='0');

end IC7485;

architecture Behavioral of IC7485 is
	
begin
	
	process(A,B)
	begin
		if(Cascade_AgtB='1' or Cascade_AeqB='1' or Cascade_AltB='1') then
			if(Cascade_AgtB='1') then
				AgtB<='1';
			end if;
			if(Cascade_AeqB='1') then
				AeqB<='1';
			end if;
			if(Cascade_AltB='1') then
				AltB<='1';
			end if;
		
		elsif(A>B) then
			AgtB<='1';
			AeqB<='0';
			AltB<='0';
		elsif(A<B) then
			AgtB<='0';
			AeqB<='0';
			AltB<='1';
		elsif(A=B) then
			AgtB<='0';
			AeqB<='1';
			AltB<='0';
		else
			AgtB<='0';
			AeqB<='0';
			AltB<='0';
		end if;
	end process;
end Behavioral;

