LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.numeric_std.all;

ENTITY CPU IS
	GENERIC ( n : INTEGER := 8 ) ;
	PORT(
		-- Usar wave.do para instaciar o clock.
		clock											: IN STD_LOGIC;	-- Lembrar: Clock precisa começar com 1. Unico sinal que precisa por pra CPU rodar.
		setTeste										: IN STD_LOGIC
	);
		
END CPU ;

ARCHITECTURE Structure OF CPU IS

--- Instanciamento de componentes
	COMPONENT registrador
		PORT ( D										: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
				reset, load, clock				: IN STD_LOGIC ;
				Q 										: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
			) ;
	END COMPONENT;
	
	COMPONENT banco_registradores
		PORT (RegWrite, clock, reset			: IN STD_LOGIC;
				ReadReg1, ReadReg2, WriteReg 	: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
				WriteData							: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
				ReadData1, ReadData2				: OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0);
				SetTest								: IN STD_LOGIC --Para iniciar valores dos regs
				) ;
	END COMPONENT;
	
	COMPONENT Memoria
		PORT (
			PC_endereco								: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			instrucao_out							: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			BEQout									: OUT STD_LOGIC_VECTOR (7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Reg_Instrucao
		PORT ( 
			instrucao 								: IN STD_LOGIC_VECTOR(7 DOWNTO 0) ;
			clock										: IN STD_LOGIC ;
			Jumpin									: OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
			OP, RS, RT, RD 						: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
		) ;
	END COMPONENT;
	
	COMPONENT PC
		PORT (
			PCin,BEQin 								: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
			reset, PCload, Clock					: IN STD_LOGIC ;
			PCSource									: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			PCout										: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			PCmsb										: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
		) ;
	END COMPONENT;
	
	COMPONENT ULA
		PORT(
			A											: IN std_logic_vector (7 downto 0);
			B											: IN std_logic_vector (7 downto 0);
			ALUop										: IN std_logic;
			Result									: OUT std_logic_vector (7 downto 0);
			Zero										: OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT UC
		PORT(
			OPin										: IN std_logic_vector(1 downto 0);
			Clock										: IN std_logic;
			reset, SetTest							: OUT std_logic;
			UCSign									: OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Jumper
		PORT(
		PCmsb											: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		instadd										: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		newpc											: OUT STD_LOGIC_VECTOR (7 downto 0)
	);
	END COMPONENT;

	--Sinais de PC
	SIGNAL PCWrite									: STD_LOGIC;
	SIGNAL PCout									: STD_LOGIC_VECTOR(n-1 DOWNTO 0) ;
	SIGNAL PCmsb									: STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL Jumpin									: STD_LOGIC_VECTOR(5 DOWNTO 0);
	
	
	--Sinais de Memoria
	--Pega o PCout de PC, usa o valor de indice em Vetor[i], e manda o conteudo para reg_int pelo sinal instrucao.
	
	--Sinais do Registrador de Instrução
	SIGNAL RegIntLoad								: STD_LOGIC ;
	SIGNAL instrucao 								: STD_LOGIC_VECTOR(n-1 DOWNTO 0) ;
	SIGNAL OP, RS, RT, RD 						: STD_LOGIC_VECTOR(1 DOWNTO 0) ;
	SIGNAL ENDtoPC									: STD_LOGIC_VECTOR(n-1 downto 0);
	SIGNAL BEQ										: STD_LOGIC_VECTOR (n-1 downto 0);
	
	--Sinais de Banco de Registradores
	SIGNAL RegWrite								: STD_LOGIC;
	SIGNAL WriteData, ReadData1, ReadData2	: STD_LOGIC_VECTOR (n-1 DOWNTO 0);
	
	--Sinais da ULA
	SIGNAL AluOp 									: STD_LOGIC ;
	SIGNAL Zero 									: STD_LOGIC ;
	SIGNAL A, B, result							: STD_LOGIC_VECTOR (n-1 downto 0);
	
	--Registradores
	--SIGNAL loadA, loadB, loadALUout			: STD_LOGIC;
	
	-- UC
	SIGNAL UCout									: STD_LOGIC_VECTOR(5 downto 0);
	SIGNAL PCWriteCond, reset					: STD_LOGIC;
	SIGNAL PCSource								: STD_LOGIC_VECTOR(1 downto 0);
	SIGNAL SetTest									: STD_LOGIC;
	
	
	BEGIN
		--- Separa os sinais que saem da unidade de controle.
		PCWriteCond <= UCout(5);
		PCWrite <= UCout(4) OR (PCWriteCond AND zero);
		PCSource <= UCout(3 downto 2);
		Aluop <= UCout(1);
		RegWrite <= UCout(0);
		
		--Instanciação dos componentes

		PC_reg: PC port map (ENDtoPC, BEQ, reset, PCWrite, clock, PCSource, PCout, PCmsb); 
			--PCout = PCin se PCload=1, se não PCout = valor anterior + 1
		
		Mem: Memoria port map (Pcout, instrucao,BEQ); 
			--Pega o valor de PC, transforma num int, e busca a instrucao num vetor pra mandar pro reg_int
		
		reg_int: Reg_Instrucao port map (instrucao, clock, Jumpin, OP, RS, RT, RD);
			--Pega a instrucao da memoria e quebra ela em 4 sinais de 2 bits cada

			
		banco: banco_registradores port map (RegWrite, clock, reset, RS, RT, RD, WriteData, ReadData1, ReadData2, SetTest);
			--ReadReg1 = RS / ReadReg2 = RT / WriteReg = RD
			--Usa os sinais do Reg_Int para saber os valores de quais registradores vão pra ULA ou são editados
		
		ULA1: ULA port map (A, B, AluOp, result, zero);
			--Recebe os valores do RegA e RegB e soma eles ou subtrai, de acordo com AluOp.
			--Resultado sai pelo sinal result
				
		Jump: Jumper port map (PCmsb, Jumpin, ENDTOPC);
		--Registradores
		
		Aluout: registrador port map (result, reset, '1', clock, WriteData);
		regA: registrador port map (ReadData1, reset, '1', clock, A);
		regB: registrador port map (ReadData2, reset, '1', clock, B);
			--Pega os valores de RS e RT.
			--Obs: load no reg A, B e no Aluout são sempre 1.
			
		Control: UC port map (OP, clock, reset, SetTest, UCOut);
			-- Manda os sinais de controle pros outros componentes pelo UCout
			-- Decide que sinais vai mandar pelo OP que recebe
			-- Manda o sinal de reset para os outros componentes
			-- SetTest é só pra iniciar valores nos registradores
	
END Structure ;