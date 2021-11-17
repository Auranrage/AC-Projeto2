--- O banco de registradores consegue escrever e ler, manipulando qualquer um de seus 4 registradores internos.
--- R0, R1, R2, R3.

LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY banco_registradores IS 
	GENERIC ( n : INTEGER := 8 ) ;
	
	PORT (RegWrite, clock, reset		: IN STD_LOGIC;
		ReadReg1, ReadReg2, WriteReg 	: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		WriteData							: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		ReadData1, ReadData2				: OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		SetTest								: IN STD_LOGIC
		) ;
		
END banco_registradores ;


ARCHITECTURE Structure OF banco_registradores IS
	SIGNAL Q0, Q1, Q2, Q3: STD_LOGIC_VECTOR (n-1 DOWNTO 0);
	SIGNAL D0, D1, D2, D3: STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		 
	COMPONENT registrador
		PORT ( D							: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0) ;
				reset, load, Clock	: IN STD_LOGIC ;
				Q 							: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
				) ;
	END COMPONENT ;
	
	
BEGIN
	--- Instanciamento de registradores.
	R0: registrador PORT MAP (D0, reset, RegWrite, clock, Q0);
	R1: registrador PORT MAP (D1, reset, RegWrite, clock, Q1);
	R2: registrador PORT MAP (D2, reset, RegWrite, clock, Q2);
	R3: registrador PORT MAP (D3, reset, RegWrite, clock, Q3);
	

	--- Escrita dos registradores.
	-- SetTest só é usado no começo uma vez, só que WriteReg inicia com "11" quando nao é instanciado, por isso que D3 precisa de um AND a mais.
	D0	<=	WriteData WHEN RegWrite = '1' AND WriteReg = "00" ELSE
			"00000001" WHEN SetTest = '1' ELSE
			 Q0;
	D1	<=	WriteData WHEN RegWrite = '1' AND WriteReg = "01" ELSE
			"00000010" WHEN SetTest = '1' ELSE
			Q1;
	D2	<=	WriteData WHEN RegWrite = '1' AND WriteReg = "10" ELSE 
			"00000011" WHEN SetTest = '1' ELSE
			Q2;
	D3	<=	WriteData WHEN RegWrite = '1' AND WriteReg = "11" AND SetTest = '0' ELSE
			"00000100" WHEN SetTest = '1' ELSE
			Q3;
		
	--- Leitura dos registradores.
	ReadData1 <=	Q0	when ReadReg1 = "00"	else 
						Q1	when ReadReg1 = "01"	else 
						Q2	when ReadReg1 = "10"	else 
						Q3	when ReadReg1 = "11"	else
						( OTHERS => '0' ) ;
								
	ReadData2	<=	Q0	when ReadReg2 = "00"	else 
						Q1	when ReadReg2 = "01"	else 
						Q2	when ReadReg2 = "10"	else 
						Q3 when ReadReg2 = "11"	else
						( OTHERS => '0' ) ;
	
END Structure ;