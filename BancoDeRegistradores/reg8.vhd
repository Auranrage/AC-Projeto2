LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reg8 IS
	PORT(
		D		: IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
		Resetn,clk,load  : IN STD_LOGIC;
		Q		: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	END reg8;
	
ARCHITECTURE reg8_arch OF reg8 IS
BEGIN
	PROCESS (Resetn, clk)
		BEGIN
			IF Resetn = '1' THEN
				Q	<= "00000000";
			ELSIF clk 'EVENT AND clk = '1' AND Load = '1' THEN
				Q <= D;
			END IF;
		END PROCESS;
END ARCHITECTURE;