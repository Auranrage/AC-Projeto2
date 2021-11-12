LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY full_adder IS
PORT ( Cin, x, y : IN STD_LOGIC ;
		s, Cout : OUT STD_LOGIC ) ;
END full_adder ;

ARCHITECTURE LogicFunc OF full_adder IS

BEGIN
	s <= x XOR y XOR Cin ;
	Cout <= (x AND y) OR (x AND Cin) OR (y AND Cin) ;
END LogicFunc ;