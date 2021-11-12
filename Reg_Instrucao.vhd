--Funcionamento:
-- Quebra a instrucao em OP, RS, RT e RD.
-- Entrada instrucao, clock / Saida OP, RS, RT, RD

LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
use ieee.numeric_std.all;

ENTITY Reg_Instrucao IS
	PORT ( 	instrucao 				: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
				Clock						: IN STD_LOGIC ;
				OP, RS, RT, RD 		: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
				Jumpaddres				: OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
			) ;
END Reg_Instrucao ;


ARCHITECTURE Behavior OF Reg_Instrucao IS
BEGIN

	Jumpaddres <= instrucao(5 downto 0);
	OP <=	instrucao ( 7 downto 6 );
	RS	<=	instrucao ( 5 downto 4 );
	RT <=	instrucao ( 3 downto 2 );
	RD <=	instrucao ( 1 downto 0 );

END Behavior ;