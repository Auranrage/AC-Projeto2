LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY Reg_Instrucao IS
	PORT ( 	instrucao 				: IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
				reset, load, Clock	: IN STD_LOGIC ;
				OP, RS, RT, RD 		: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
			) ;
END Reg_Instrucao ;

ARCHITECTURE Behavior OF Reg_Instrucao IS
BEGIN
	PROCESS (reset, load, Clock )
	BEGIN
		IF Clock'EVENT AND Clock = '1' THEN
			IF load = '1' THEN
				OP <=	instrucao ( 7 downto 6 );
				RS	<=	instrucao ( 5 downto 4 );
				RT <=	instrucao ( 3 downto 2 );
				RD <=	instrucao ( 1 downto 0 );			
			END IF;
		END IF ;
	END PROCESS ;
END Behavior ;