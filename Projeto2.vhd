LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.numeric_std.all;

ENTITY Projeto2 IS
	GENERIC ( n : INTEGER := 8 ) ;
	PORT(
		instrucao 		: BUFFER STD_LOGIC_VECTOR (7 DOWNTO 0);
		Clock, reset	: IN STD_LOGIC
	);
		
END Projeto2 ;


ARCHITECTURE Structure OF Projeto2 IS
	COMPONENT ripple_carry
		PORT ( CinR 	: IN STD_LOGIC ;
				Rj, Rk 	: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
				Ri	 		: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
				Cout 		: OUT STD_LOGIC
				) ;
	END COMPONENT ;
	
	COMPONENT banco_registradores
		PORT (RegWrite, Clock, reset			: IN STD_LOGIC;
				ReadReg1, ReadReg2, WriteReg 	: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
				WriteData							: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
				ReadData1, ReadData2				: OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)
				) ;
	END COMPONENT;
	
	COMPONENT PC
	PORT ( 	PCin 								: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0) ;
				reset, PCload, Clock			: IN STD_LOGIC ;
				PCout								: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
			) ;
	END COMPONENT;
	
	--Sinais de Somador
	--SIGNAL Ri, Rj, Rk 							: STD_LOGIC_VECTOR (n-1 DOWNTO 0);
	SIGNAL CinR, Cout								: STD_LOGIC;
	
	--Sinais de Banco de Registradores
	SIGNAL RegWrite						: STD_LOGIC;
	SIGNAL ReadReg1, ReadReg2, WriteReg 	: STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL WriteData, ReadData1, ReadData2	: STD_LOGIC_VECTOR (n-1 DOWNTO 0);
	
	--Sinais de PC
	SIGNAL PCin, PCout							: STD_LOGIC_VECTOR(n-1 DOWNTO 0) ;
	SIGNAL PCload									: STD_LOGIC;

	--Inteiro peo vetor de comandos
	SIGNAL int_PC: INTEGER RANGE 0 TO 1;
	
	--Definição do tipo vetor de comandos
	TYPE vetor_comandos IS ARRAY (0 TO 1) of STD_LOGIC_VECTOR (7 DOWNTO 0);
	
	--Definicao do vetor de comandos
	CONSTANT comandos : vetor_comandos:= ("00000000", "00000110");
	
	
	BEGIN
		--Instanciação dos componentes
		banco: banco_registradores port map (RegWrite, Clock, reset, ReadReg1, ReadReg2, WriteReg, WriteData, ReadData1, ReadData2);
		somador: ripple_carry port map (CinR, ReadData1, ReadData2, WriteData, Cout);
		PC_reg: PC port map (PCin, reset, PCload, Clock, PCout);
		
		--Toda soma começa com CinR=0
		CinR <= '0';
		
		PROCESS (Clock)
		BEGIN
			IF Clock'EVENT AND Clock = '1' THEN
				int_PC <= to_integer(signed(PCout));
				
				instrucao <= "00000000";
				
								
				IF instrucao = "00000000" THEN
					RegWrite <= '1';
					WriteReg <= "00";
					ReadReg1 <= "00";
					ReadReg2 <= "00";
					
			
				ELSIF instrucao = "00100100" THEN
					RegWrite <= '1';
					WriteReg <= "00";
					ReadReg1 <= "01";
					ReadReg2 <= "00";
					
					
				END IF;
			END IF ;
		END PROCESS ;
		
	
		
	
END Structure ;