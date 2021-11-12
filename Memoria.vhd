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
		BEQout			: OUT STD_LOGIC_VECTOR (7 downto 0)
	);
END Memoria;
	
ARCHITECTURE Behavior OF Memoria IS
	TYPE vetor_instrucoes IS ARRAY (0 TO 6) of STD_LOGIC_VECTOR (7 DOWNTO 0);
	
	SIGNAL int_address: INTEGER RANGE 0 TO 6;
	
	CONSTANT instrucao : vetor_instrucoes:= ("10000000" ,"00000011", "00000000","01000110", "00000011", "00110000", "00000000");
	
	
			
BEGIN
	int_address <= to_integer(signed(PC_endereco));
	instrucao_out <= instrucao(int_address);
	BEQout <= instrucao(int_address + 1);
END Behavior;