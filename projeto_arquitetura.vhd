LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY projeto_arquitetura IS
	GENERIC ( n : INTEGER := 4 ) ;
	
PORT (Xm, Ym 	: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0) ;
		Sm	 		: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
		) ;
		
END projeto_arquitetura ;


ARCHITECTURE Structure OF projeto_arquitetura IS
	COMPONENT ripple_carry
		PORT ( CinR 	: IN STD_LOGIC ;
				X, Y	 	: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
				S	 		: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
				Cout 		: OUT STD_LOGIC
				) ;
	END COMPONENT ;
	
BEGIN
	
	stage: ripple_carry PORT MAP ( 
	CinR => '0',
	X => Xm, 
	Y => Ym,
	S => Sm
	) ;
	
	
END Structure ;