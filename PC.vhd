LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_signed.all;

ENTITY PC IS
	GENERIC ( N : INTEGER := 8 ) ;
	PORT ( 	PCin 						: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
				reset, PCload, Clock	: IN STD_LOGIC ;
				PCout						: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
			) ;
END PC ;

ARCHITECTURE Behavior OF PC IS
SIGNAL intermediario: STD_LOGIC_VECTOR(N-1 DOWNTO 0) := "00000000";
SIGNAL Um: STD_LOGIC_VECTOR(N-1 DOWNTO 0);

BEGIN
	Um <= "00000001";
	
	
	PROCESS (Clock)
	BEGIN
		IF Clock'EVENT AND Clock = '1' THEN
			
			IF reset = '1' THEN
				PCout <= ( OTHERS => '0' );
				
			ELSIF PCload = '1' THEN
				PCout <= PCin;
			
			ELSE
				intermediario <= intermediario + "00000001";
				PCout <= intermediario;

			END IF;
		END IF ;
	END PROCESS ;
END Behavior ;