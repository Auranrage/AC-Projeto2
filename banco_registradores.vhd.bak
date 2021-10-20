LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY banco_registradores IS
	GENERIC ( n : INTEGER := 8 ) ;
	
	PORT (RegWrite, Clock, reset		: IN STD_LOGIC;
		ReadReg1, ReadReg2, WriteReg 	: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		WriteData							: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		ReadData1, ReadData2				: OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)
				
		) ;
		
END banco_registradores ;


ARCHITECTURE Structure OF banco_registradores IS
	SIGNAL D0, D1, D2, D3: STD_LOGIC_VECTOR (n-1 DOWNTO 0);
	SIGNAL Q0, Q1, Q2, Q3: STD_LOGIC_VECTOR (n-1 DOWNTO 0);
	
	
	COMPONENT registrador
		PORT ( D							: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0) ;
				reset, load, Clock		: IN STD_LOGIC ;
				Q 							: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
				) ;
	END COMPONENT ;
	
BEGIN
	
	R0: registrador PORT MAP (D0, reset, RegWrite, Clock, Q0);
	R1: registrador PORT MAP (D1, reset, RegWrite, Clock, Q1);
	R2: registrador PORT MAP (D2, reset, RegWrite, Clock, Q2);
	R3: registrador PORT MAP (D3, reset, RegWrite, Clock, Q3);
	
	D0	<=	WriteData WHEN RegWrite = '1' AND WriteReg = "00";
	D1	<=	WriteData WHEN RegWrite = '1' AND WriteReg = "01";
	D2	<=	WriteData WHEN RegWrite = '1' AND WriteReg = "10";
	D3	<=	WriteData WHEN RegWrite = '1' AND WriteReg = "11";
		
		
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