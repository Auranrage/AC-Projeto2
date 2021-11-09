LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY UC IS
	PORT(
		OPin: IN std_logic_vector(1 downto 0);
		Reset: IN std_logic;
		Clock: IN std_logic;
		UCSign: OUT std_logic_vector(3 downto 0)
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
				WHEN 0 => UCSign <= "0100";
							state <= 1;
				WHEN 1 => UCSign <= "0000";
							state <= 2;
				WHEN 2 =>
					IF OPin = "00" THEN
						UCSign <= "0000";
						state <= 3;
						ELSIF OPin = "01" THEN
							UCSign <= "0010";
							state <= 3;
						ELSIF OPin = "10" THEN
							UCSign <= "1010";
							state <= 0;
						ELSE 
							UCSign <= "0100";
						state <= 0;
					END IF;
				WHEN 3 => UCSign <= "0001";
						state <= 0;
				WHEN OTHERS => state <= 0;
			END CASE;
		END IF;
	END PROCESS;
END Behavior;

