LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY ripple_carry IS
	GENERIC ( n : INTEGER := 4 ) ;
	
PORT ( CinR : IN STD_LOGIC; 
		X, Y 	: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0) ;
		S	 	: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0) ;
		Cout 	: OUT STD_LOGIC ) ;
END ripple_carry ;


ARCHITECTURE Structure OF ripple_carry IS
	SIGNAL C : STD_LOGIC_VECTOR(0 TO n) ;
	COMPONENT full_adder
		PORT ( Cin, x, y 	: IN STD_LOGIC ;
				s, Cout 		: OUT STD_LOGIC) ;
	END COMPONENT ;
	
BEGIN
	C(0) <= CinR ;
	
	
	Generate_label:
	FOR i IN 0 TO n-1 GENERATE
		stage: full_adder PORT MAP ( C(i), X(i), Y(i), S(i), C(i+1) ) ;
	END GENERATE ;
	
	Cout <= C(4) ;
END Structure ;