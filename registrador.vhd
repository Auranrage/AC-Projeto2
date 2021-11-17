--- Unidade básica de registrador, inicializado com 1 para testes de soma e sub
LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY registrador IS
	GENERIC ( N : INTEGER := 8 ) ;
	PORT ( 	D 							: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
				reset, load, clock	: IN STD_LOGIC ;
				Q 							: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
			) ;
END registrador ;

ARCHITECTURE Behavior OF registrador IS



BEGIN
	PROCESS (reset, load, clock )
	BEGIN
		IF clock'EVENT AND clock = '1' THEN
			IF reset = '1' THEN
				Q <= ( OTHERS => '0' );
				--Q <= "00000000";
			ELSIF load = '1' THEN
				Q <= D ;
			END IF;
			
		END IF ;
	END PROCESS ;
END Behavior ;