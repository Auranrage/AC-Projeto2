--Funcionamento
-- Nao tem entrada (só o clock). Começa com 00000000 e vai somando 00000001 a cada subida de clock.
-- Saida PCout conforme o sinal PCload (PCWrite) e o sinal PCSource.

LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_signed.all;

ENTITY PC IS
	GENERIC ( N : INTEGER := 8 ) ;
	PORT ( 	PCin,BEQin 								: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
<<<<<<< Updated upstream
				reset, PCload, Clock, NotTaken	: IN STD_LOGIC ;
=======
				reset, PCload, Clock					: IN STD_LOGIC ;
>>>>>>> Stashed changes
				PCSource									: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
				PCout										: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				PCmsb										: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
			);
END PC ;

ARCHITECTURE Behavior OF PC IS
SIGNAL intermediario: STD_LOGIC_VECTOR(N-1 DOWNTO 0) := "00000000";

BEGIN
	
	PROCESS (Clock)
	BEGIN		
		IF Clock'EVENT AND Clock = '1' THEN
			IF reset = '1' THEN
				PCout <= ( OTHERS => '0' );
			ELSIF PCload = '1' AND PCSource = "01" THEN
				intermediario <= PCin;
				PCout <= intermediario;
			ELSIF PCload = '1' AND PCSource = "00" THEN
				intermediario <= intermediario + "00000001";
				PCOut <= intermediario;
			ELSIF PCload = '1' AND PCSource = "10" THEN
				intermediario <= BEQin;
				PCout <= intermediario;
<<<<<<< Updated upstream
			ELSIF PCload = '1' AND PCSource = "10" THEN
				IF NotTaken = '0' THEN
					intermediario <= BEQin;
					PCout <= intermediario;
				ELSE
					intermediario <= intermediario + "00000010";
					PCout <= intermediario;
			END IF;
		END IF ;
=======
			ELSIF PCload = '0' AND PCsource = "10" THEN
				intermediario <= intermediario + "00000001";
				PCOut <= intermediario;
			END IF;
		END IF;
>>>>>>> Stashed changes
	END PROCESS ;
	PCmsb <= intermediario(7 downto 6);
END Behavior ;