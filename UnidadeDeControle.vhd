--- Recebe o sinal de OP e traduz esse sinal para todos os sinais de controle usados na CPU
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY UC IS
	PORT(
		OPin				: IN std_logic_vector(1 downto 0);
		Clock				: IN std_logic;
		Reset, SetTest	: OUT std_logic;
		UCSign			: OUT std_logic_vector(5 downto 0)
		);
END ENTITY;

Architecture Behavior OF UC IS

SIGNAL state: integer := 0;

BEGIN
	PROCESS (Clock)
	BEGIN
		IF Clock'EVENT AND Clock = '0' THEN
	
			CASE state IS
				-- Reset nos registradores.
				WHEN 0 => UCSign <= "000000";
							Reset <= '1';
							SetTest <= '0';
							state <= 1;
				
				-- Set dos valores iniciais do registradores.
				WHEN 1 => UCSign <= "000001";
							Reset <= '0';
							SetTest <= '1';
							state <= 2;
				
				-- Fetch
				WHEN 2 => UCSign <= "010000";
							SetTest <= '0';
							state <= 3;
				-- Decode		
				WHEN 3 => UCSign <= "000000";
							state <= 4;
				-- Execute
				WHEN 4 =>
					IF OPin = "00" THEN
						UCSign <= "000000";
						state <= 5;
						ELSIF OPin = "01" THEN
							UCSign <= "000010";
							state <= 5;
						ELSIF OPin = "10" THEN
							UCSign <= "101010";
							state <= 2;
						ELSE 
							UCSign <= "010100";
							state <= 2;
					END IF;
				
				-- Write Back
				WHEN 5 => UCSign <= "000001";
						state <= 2;
						
				WHEN OTHERS => state <= 2;
			END CASE;
		END IF;
	END PROCESS;
END Behavior;

