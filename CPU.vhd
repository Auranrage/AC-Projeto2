LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.numeric_std.all;

ENTITY CPU IS
	GENERIC ( n : INTEGER := 8 ) ;
	PORT(
		instrucao 		: BUFFER STD_LOGIC_VECTOR (7 DOWNTO 0);
		Clock, reset	: IN STD_LOGIC
	);
		
END CPU ;


ARCHITECTURE Structure OF CPU IS
	COMPONENT registrador
		PORT ( D										: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
				reset, load, Clock				: IN STD_LOGIC ;
				Q 										: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
			) ;
	END COMPONENT;
	
	COMPONENT banco_registradores
		PORT (RegWrite, Clock, reset			: IN STD_LOGIC;
				ReadReg1, ReadReg2, WriteReg 	: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
				WriteData							: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
				ReadData1, ReadData2				: OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)
				) ;
	END COMPONENT;
	
	
	COMPONENT Memoria
		PORT (
			PC_endereco		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			instrucao_out	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			Clock				: IN STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT Reg_Instrucao
		PORT ( 
			instrucao 				: IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
			load, Clock				: IN STD_LOGIC ;
			OP, RS, RT, RD 		: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
		) ;
	END COMPONENT;
	
	COMPONENT PC
		PORT (
			PCin 						: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
			reset, PCload, Clock	: IN STD_LOGIC ;
			PCout						: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		) ;
	END COMPONENT;
	
	
	--Sinais de Somador
	--SIGNAL Ri, Rj, Rk 							: STD_LOGIC_VECTOR (n-1 DOWNTO 0);
	SIGNAL Cout										: STD_LOGIC;
	
	--Sinais de Banco de Registradores
	SIGNAL RegWrite								: STD_LOGIC;
	SIGNAL ReadReg1, ReadReg2, WriteReg 	: STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL WriteData, ReadData1, ReadData2	: STD_LOGIC_VECTOR (n-1 DOWNTO 0);
	
	--Sinais de PC
	SIGNAL PCin, PCout							: STD_LOGIC_VECTOR(n-1 DOWNTO 0) ;
	SIGNAL PCload									: STD_LOGIC;


	
	BEGIN
		--Instanciação dos componentes
		banco: banco_registradores port map (RegWrite, Clock, reset, ReadReg1, ReadReg2, WriteReg, WriteData, ReadData1, ReadData2);
		--PC_reg: PC port map (PCin, reset, PCload, Clock, PCout);
		--Reg_Instrucao: Reg_Instrucao port map ();
		--Memoria: Memoria port map();
				
		--Registradores
		--regA: registrador port map ();
		--regB: registrador port map ();
		--AluOut: registrador port map ();
		
		--ULA
		--UNIDADE DE CONTROLE
	
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