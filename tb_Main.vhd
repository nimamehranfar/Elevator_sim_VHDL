--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:19:58 06/24/2021
-- Design Name:   
-- Module Name:   C:/Users/NM/Documents/ISE/Elevator/tb_Main.vhd
-- Project Name:  Elevator
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Main
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_Main IS
END tb_Main;
 
ARCHITECTURE behavior OF tb_Main IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Main
    PORT(
         Target_Level : IN  std_logic_vector(3 downto 0);
         Clk : IN  std_logic;
         LED_Up : OUT  std_logic;
         LED_Down : OUT  std_logic;
         Current_Level : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Target_Level : std_logic_vector(3 downto 0) := (others => '0');
   signal Clk : std_logic := '0';

 	--Outputs
   signal LED_Up : std_logic;
   signal LED_Down : std_logic;
   signal Current_Level : std_logic_vector(3 downto 0);

   -- Clock period definitions
   --constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Main PORT MAP (
          Target_Level => Target_Level,
          Clk => Clk,
          LED_Up => LED_Up,
          LED_Down => LED_Down,
          Current_Level => Current_Level
        );

   Clk<= not Clk after 10 ns;
	Target_Level<="0011" after 10 ns, "0001" after 100 ns, "0010" after 200 ns, "0000" after 300 ns;

END;
