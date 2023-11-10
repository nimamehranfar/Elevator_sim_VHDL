----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:42:43 06/21/2021 
-- Design Name: 
-- Module Name:    Main - Structural 
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

entity Main is
	port( Target_Level: in std_logic_vector(3 downto 0):="0000";
			Clk: in std_logic:='0';
			LED_Up: out std_logic:='0';
			LED_Down: out std_logic:='0';
			Current_Level: out std_logic_vector(3 downto 0));
end Main;

architecture Structural of Main is
	component IC7485 is
		port( A: in std_logic_vector(3 downto 0);
				B: in std_logic_vector(3 downto 0);
				Cascade_AgtB: in std_logic:='0';
				Cascade_AeqB: in std_logic:='0';
				Cascade_AltB: in std_logic:='0';
				AgtB: out std_logic:='0';
				AeqB: out std_logic:='0';
				AltB: out std_logic:='0');

	end component;
	component IC74193 is
		port( Data: in std_logic_vector(3 downto 0);
				Load: in std_logic:='1';
				Clear: in std_logic:='0';
				Count_Up: in std_logic:='1';
				Count_Down: in std_logic:='1';
				Q: out std_logic_vector(3 downto 0):="0000";
				Carry: out std_logic:='1';
				Barrow: out std_logic:='1');
	end component;
	component IC7447 is
		port( input: in std_logic_vector(3 downto 0):="0000";
			output_integer: out std_logic_vector(3 downto 0);
			output7segment: out std_logic_vector(6 downto 0));
	end component;
	
	signal Adata: std_logic_vector(3 downto 0):="0000";
	signal up,down: std_logic:='0';
	signal upNAND,downNAND: std_logic:='1';

begin

	u1:IC7485 port map(A=>Adata,B=>Target_Level,AgtB=>down,AltB=>up);
	u2:IC74193 port map(Data=>"0000",Count_Up=>upNAND,Count_Down=>downNAND,Q=>Adata);
	u3:IC7447 port map(input=>Adata,output_integer=>Current_Level);
	upNAND<=up nand Clk;
	downNAND<=down nand Clk;
	LED_Up<=up;
	LED_Down<=down;

end Structural;

