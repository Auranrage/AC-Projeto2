LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY UC IS
	PORT(
		OPin: IN std_logic_vector(1 downto 0);
		Reset: IN std_logic;
		Clock: IN std_logic;
		UCSign: OUT std_logic_vector(4 downto 0)
		);
END ENTITY;

Architecture Behavior OF UC IS

SIGNAL state: integer;

BEGIN
	PROCESS (Clock)
	BEGIN
		IF Clock'EVENT AND Clock = '1' THEN
		
			IF Reset = '0' THEN
				state <= 0;
			END IF;
	
			CASE state IS
				WHEN 0 => UCSign <= "01000";
							state <= 1;
				WHEN 1 => UCSign <= "00000";
							state <= 2;
				WHEN 2 =>
					IF OPin = "00" THEN
						UCSign <= "00000";
						state <= 3;
						ELSIF OPin = "01" THEN
							UCSign <= "00010";
							state <= 3;
						ELSIF OPin = "10" THEN
							UCSign <= "10010";
							state <= 0;
						ELSE 
							UCSign <= "01100";
						state <= 0;
					END IF;
				WHEN 3 => UCSign <= "00001";
						state <= 0;
				WHEN OTHERS => state <= 0;
			END CASE;
		END IF;
	END PROCESS;
END Behavior;

