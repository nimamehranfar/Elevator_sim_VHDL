----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:59:26 06/18/2021 
-- Design Name: 
-- Module Name:    IC74193 - Behavioral 
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
use IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IC74193 is
	port( Data: in std_logic_vector(3 downto 0);
			Load: in std_logic:='1';
			Clear: in std_logic:='0';
			Count_Up: in std_logic:='1';
			Count_Down: in std_logic:='1';
			Q: out std_logic_vector(3 downto 0):="0000";
			Carry: out std_logic:='1';
			Barrow: out std_logic:='1');
end IC74193;

architecture Behavioral of IC74193 is

signal tempQ:std_logic_vector(3 downto 0):="0000";

begin
	
	process(Count_Up,Count_Down,Load,Clear)
	variable temp:std_logic_vector(3 downto 0):="0000";
		begin
		if Clear='1' then 
			Q<="0000";
			tempQ<="0000";
			Carry<='1';
			Barrow<='1';
		elsif Load='0' then
			Q<=Data;
			tempQ<=Data;
			Carry<='1';
			Barrow<='1';
		elsif Count_Up='0' then 
			if tempQ="1111" then
				Q<="0000";
				tempQ<="0000";
				Carry<='0';
				Barrow<='1';
			else
				temp:=tempQ+'1';
				Q<=temp;
				tempQ<=temp;
				Carry<='1';
				Barrow<='1';
			end if;
		elsif Count_Down='0' then
			if tempQ="0000" then
				Q<="1111";
				tempQ<="1111";
				Barrow<='0';
				Carry<='1';
			else
				temp:=tempQ-'1';
				Q<=temp;
				tempQ<=temp;
				Carry<='1';
				Barrow<='1';
			end if;
		end if;
	end process;


end Behavioral;

