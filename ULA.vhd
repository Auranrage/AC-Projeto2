LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY ULA IS
	PORT(
		A: IN std_logic_vector (7 downto 0);
		B: IN std_logic_vector (7 downto 0);
		ALUop: IN std_logic;
		clk: IN BIT;
		Result: OUT std_logic_vector (7 downto 0);
		Zero: OUT std_logic
		);
END ENTITY;

ARCHITECTURE ULA_arch of ULA IS
	COMPONENT ripple_carry
		PORT(
			Rj: IN std_logic_vector (7 downto 0);
			Rk: IN std_logic_vector (7 downto 0);
			Ri: OUT std_logic_vector (7 downto 0)
		);
	END COMPONENT;
		
	SIGNAL Bsig: std_logic_vector (7 downto 0);
	SIGNAL Sgen: std_logic_vector (7 downto 0);
	
BEGIN

	PROCESS(clk) IS BEGIN
		IF clk'EVENT AND clk = '1' THEN
			IF ALUop = '1' THEN
				Bsig <= std_logic_vector( unsigned(NOT B) + 1);
			ELSE
				Bsig <= B;
			END IF;
		END IF;
	END PROCESS;
	Zero <= (NOT (Sgen(0) OR Sgen(1) OR Sgen(2) OR Sgen(3) OR Sgen(4) OR Sgen(5) OR Sgen(6) OR Sgen(7)));
	Result <= Sgen;
	SOMADOR1: ripple_carry PORT MAP(A,Bsig,Sgen);
END ARCHITECTURE;