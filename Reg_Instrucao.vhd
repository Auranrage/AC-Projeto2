--Funcionamento:
-- Quebra a instrucao em OP, RS, RT e RD. Sinal "load" precisa ser 1 pra receber uma nova instrucao.
-- Entrada instrucao, load / Saida OP, RS, RT, RD

LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
use ieee.numeric_std.all;

ENTITY Reg_Instrucao IS
	PORT ( 	instrucao 				: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
				load, Clock				: IN STD_LOGIC ;
				OP, RS, RT, RD 		: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			) ;
END Reg_Instrucao ;


ARCHITECTURE Behavior OF Reg_Instrucao IS
BEGIN
		
		OP <=	instrucao ( 7 downto 6 );
		RS	<=	instrucao ( 5 downto 4 );
		RT <=	instrucao ( 3 downto 2 );
		RD <=	instrucao ( 1 downto 0 );
		
	END PROCESS ;
END Behavior ;