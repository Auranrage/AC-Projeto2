--Funcionamento
-- Manda a instrução 0, 1, 2 ou N do "vetor_instrucoes" de acordo com o "to_integer" do "PC_endereco".
-- Entrada PC_endereco / Saida instrucao_out 

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY Memoria IS
	PORT (
		PC_endereco		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		instrucao_out	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		Clock				: IN STD_LOGIC
	);
END Memoria;
	
ARCHITECTURE Behavior OF Memoria IS
	TYPE vetor_instrucoes IS ARRAY (0 TO 2) of STD_LOGIC_VECTOR (7 DOWNTO 0);
	
	SIGNAL int_address: INTEGER RANGE 0 TO 2;
	
			
	CONSTANT instrucao : vetor_instrucoes:= ("00000000", "00000110", "00110000");
			
	
			
BEGIN
	
	int_address <= to_integer(signed(PC_endereco));
	
	
	
	PROCESS (Clock)
	BEGIN
		IF Clock'EVENT AND Clock = '1' THEN
			instrucao_out <= instrucao(int_address);
		END IF;
	END PROCESS;
	
END Behavior;