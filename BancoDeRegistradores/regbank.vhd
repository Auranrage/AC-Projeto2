LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY regbank IS
PORT(
		regwrite: IN STD_LOGIC;
		clk,Resetn,load: IN STD_LOGIC;
		REGISTER1: IN STD_LOGIC_VECTOR(1 downto 0);
		REGISTER2: IN STD_LOGIC_VECTOR(1 downto 0);
		WREGISTER: IN STD_LOGIC_VECTOR(1 downto 0);
		WDATA: IN STD_LOGIC_VECTOR(7 downto 0);
		RDATA1: OUT STD_LOGIC_VECTOR(7 downto 0);
		RDATA2: OUT STD_LOGIC_VECTOR(7 downto 0)
		);
END ENTITY;

ARCHITECTURE regbank_arch OF regbank IS
	COMPONENT reg8 
		PORT(
			D: IN STD_LOGIC_VECTOR(7 downto 0);
			Resetn,clk,load : IN STD_LOGIC;
			Q: OUT STD_LOGIC_VECTOR(7 downto 0)
			);
	END COMPONENT;
	
	SIGNAL D0,D1,D2,D3,Q0,Q1,Q2,Q3: STD_LOGIC_VECTOR(7 downto 0);
BEGIN
	PROCESS (clk) BEGIN
		IF clk' EVENT AND clk = '1' THEN
			IF regwrite = '1' THEN
				IF WREGISTER = "00" THEN
					D0 <= WDATA;
				ELSIF WREGISTER = "01" THEN
					D1 <= WDATA;
				ELSIF WREGISTER = "10" THEN
					D2 <= WDATA;
				ELSE
					D3 <= WDATA;
				END IF;
			ELSIF regwrite = '0' THEN
				CASE REGISTER1 IS
					WHEN "00" => RDATA1 <= Q0;
					WHEN "01" => RDATA1 <= Q1;
					WHEN "10" => RDATA1 <= Q2;
					WHEN OTHERS => RDATA1 <= Q3;
					END CASE;
				CASE REGISTER2 IS 
					WHEN "00" => RDATA2 <= Q0;
					WHEN "01" => RDATA2 <= Q1;
					WHEN "10" => RDATA2 <= Q2;
					WHEN OTHERS => RDATA2 <= Q3;
					END CASE;
			END IF;
		END IF;
	END PROCESS;
			
	R0: reg8 PORT MAP(D0,Resetn,clk,load,Q0);
	R1: reg8 PORT MAP(D1,Resetn,clk,load,Q1);
	R2: reg8 PORT MAP(D2,Resetn,clk,load,Q2);
	R3: reg8 PORT MAP(D3,Resetn,clk,load,Q3);
	
END ARCHITECTURE;