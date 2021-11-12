LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--- Unidade que realiza Jump
ENTITY Jumper IS
PORT(
	PCmsb			: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
	instadd		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
	newpc			: OUT STD_LOGIC_VECTOR (7 downto 0)
);
END ENTITY;

ARCHITECTURE Behavior OF Jumper IS
BEGIN

	newpc(7 downto 6) <= PCmsb;
	newpc(5 downto 0) <= instadd;
	
END ARCHITECTURE;