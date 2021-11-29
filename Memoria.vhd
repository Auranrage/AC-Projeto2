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
	TYPE vetor_instrucoes IS ARRAY (0 TO 12) of STD_LOGIC_VECTOR (7 DOWNTO 0);
	

	SIGNAL int_address: INTEGER RANGE 0 TO 31;
	
	CONSTANT instrucao : vetor_instrucoes:= (
		"00011011", --00000000	Add R3=R1+R2	
		"01100110", --00000001	Sub R2=R1+R2		
		"10001100", --00000010	Branch se R0=R3
		"00000000", --00000011	Endereço do Branch
		"10001000", --00000100
		"00001000",	--00000101	Endereço do Branch = 8
		"00000001",	--00000110											
		"00000010", --00000111
		"11000000", --00001000	Jump para instrucao 0
		"00000011",	--00001001
		"00000000",	--00001010
		"00000000",	--00001011
		"00000000"	--00001100
		);
	
	BEGIN
		int_address <= to_integer(signed(PC_endereco));
		instrucao_out <= instrucao(int_address);
		BEQout <= instrucao(int_address + 1);
		
END Behavior;