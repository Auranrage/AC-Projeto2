--- Unidade básica de soma
LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
ENTITY ripple_carry IS
	GENERIC ( n : INTEGER := 8 ) ;
	
PORT ( Rj, Rk: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0) ;
		Ri	 	: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
		) ;
END ripple_carry ;


ARCHITECTURE Structure OF ripple_carry IS
	
	SIGNAL C : STD_LOGIC_VECTOR(0 TO n) ;
	
	COMPONENT full_adder
		PORT ( Cin, x, y 	: IN STD_LOGIC ;
				s, Cout 		: OUT STD_LOGIC) ;
	END COMPONENT ;
	
BEGIN
	C(0) <= '0';
	
	
	Generate_label:
	FOR i IN 0 TO n-1 GENERATE
		stage: full_adder PORT MAP ( C(i), Rj(i), Rk(i), Ri(i), C(i+1) ) ;
	END GENERATE ;
	
END Structure ;