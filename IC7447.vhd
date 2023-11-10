----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:41:41 06/19/2021 
-- Design Name: 
-- Module Name:    IC7447 - Behavioral 
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
use IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IC7447 is
	port( input: in std_logic_vector(3 downto 0):="0000";
			output_integer: out std_logic_vector(3 downto 0);
			output7segment: out std_logic_vector(6 downto 0));
end IC7447;

architecture Behavioral of IC7447 is

begin
	process(input)
	begin
		case input is
		when "0000" => output7segment<="0000001";
		when "0001" => output7segment<="1001111";
		when "0010" => output7segment<="0010010";
		when "0011" => output7segment<="0000110";
		when "0100" => output7segment<="1001100";
		when "0101" => output7segment<="0100100";
		when "0110" => output7segment<="1100000";
		when "0111" => output7segment<="0001111";
		when "1000" => output7segment<="0000000";
		when "1001" => output7segment<="0001100";
		when others=> output7segment<="0000001";
		end case;
		output_integer<=input;
	end process;
	
end Behavioral;

