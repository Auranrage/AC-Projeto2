-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "11/09/2021 09:35:09"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_101,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	UC IS
    PORT (
	OPin : IN std_logic_vector(1 DOWNTO 0);
	Reset : IN std_logic;
	Clock : IN std_logic;
	UCSign : OUT std_logic_vector(3 DOWNTO 0)
	);
END UC;

-- Design Ports Information
-- Reset	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- UCSign[0]	=>  Location: PIN_7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- UCSign[1]	=>  Location: PIN_2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- UCSign[2]	=>  Location: PIN_10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- UCSign[3]	=>  Location: PIN_11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clock	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OPin[0]	=>  Location: PIN_25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OPin[1]	=>  Location: PIN_1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF UC IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_OPin : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_Reset : std_logic;
SIGNAL ww_Clock : std_logic;
SIGNAL ww_UCSign : std_logic_vector(3 DOWNTO 0);
SIGNAL \Clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Reset~input_o\ : std_logic;
SIGNAL \UCSign[0]~output_o\ : std_logic;
SIGNAL \UCSign[1]~output_o\ : std_logic;
SIGNAL \UCSign[2]~output_o\ : std_logic;
SIGNAL \UCSign[3]~output_o\ : std_logic;
SIGNAL \Clock~input_o\ : std_logic;
SIGNAL \Clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \OPin[1]~input_o\ : std_logic;
SIGNAL \state[31]~feeder_combout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \UCSign[0]~reg0_q\ : std_logic;
SIGNAL \OPin[0]~input_o\ : std_logic;
SIGNAL \UCSign[1]~0_combout\ : std_logic;
SIGNAL \UCSign[1]~1_combout\ : std_logic;
SIGNAL \UCSign[1]~reg0_q\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \Selector1~1_combout\ : std_logic;
SIGNAL \UCSign[2]~reg0_q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \Selector0~1_combout\ : std_logic;
SIGNAL \UCSign[3]~reg0_q\ : std_logic;
SIGNAL state : std_logic_vector(31 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_OPin <= OPin;
ww_Reset <= Reset;
ww_Clock <= Clock;
UCSign <= ww_UCSign;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Clock~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y21_N9
\UCSign[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \UCSign[0]~reg0_q\,
	devoe => ww_devoe,
	o => \UCSign[0]~output_o\);

-- Location: IOOBUF_X0_Y23_N9
\UCSign[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \UCSign[1]~reg0_q\,
	devoe => ww_devoe,
	o => \UCSign[1]~output_o\);

-- Location: IOOBUF_X0_Y18_N16
\UCSign[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \UCSign[2]~reg0_q\,
	devoe => ww_devoe,
	o => \UCSign[2]~output_o\);

-- Location: IOOBUF_X0_Y18_N23
\UCSign[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \UCSign[3]~reg0_q\,
	devoe => ww_devoe,
	o => \UCSign[3]~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\Clock~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Clock,
	o => \Clock~input_o\);

-- Location: CLKCTRL_G2
\Clock~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Clock~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y23_N1
\OPin[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_OPin(1),
	o => \OPin[1]~input_o\);

-- Location: LCCOMB_X1_Y18_N18
\state[31]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state[31]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \state[31]~feeder_combout\);

-- Location: FF_X1_Y18_N19
\state[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \state[31]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => state(31));

-- Location: LCCOMB_X1_Y18_N16
\Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (((\OPin[1]~input_o\ & state(1))) # (!state(0))) # (!state(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \OPin[1]~input_o\,
	datab => state(31),
	datac => state(0),
	datad => state(1),
	combout => \Selector5~0_combout\);

-- Location: FF_X1_Y18_N17
\state[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Selector5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => state(0));

-- Location: LCCOMB_X1_Y18_N12
\Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (state(31) & ((state(0) & (!\OPin[1]~input_o\ & state(1))) # (!state(0) & ((!state(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \OPin[1]~input_o\,
	datab => state(0),
	datac => state(1),
	datad => state(31),
	combout => \Selector4~0_combout\);

-- Location: FF_X1_Y18_N13
\state[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => state(1));

-- Location: LCCOMB_X1_Y18_N24
\Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (state(31) & (state(1) & (!state(0)))) # (!state(31) & (((\UCSign[0]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => state(1),
	datab => state(0),
	datac => \UCSign[0]~reg0_q\,
	datad => state(31),
	combout => \Selector3~0_combout\);

-- Location: FF_X1_Y18_N25
\UCSign[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Selector3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UCSign[0]~reg0_q\);

-- Location: IOIBUF_X0_Y11_N22
\OPin[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_OPin(0),
	o => \OPin[0]~input_o\);

-- Location: LCCOMB_X1_Y18_N6
\UCSign[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \UCSign[1]~0_combout\ = (state(0) & (\OPin[1]~input_o\ $ (\OPin[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \OPin[1]~input_o\,
	datac => \OPin[0]~input_o\,
	datad => state(0),
	combout => \UCSign[1]~0_combout\);

-- Location: LCCOMB_X1_Y18_N30
\UCSign[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \UCSign[1]~1_combout\ = (state(31) & (state(1) & ((\UCSign[1]~0_combout\)))) # (!state(31) & (((\UCSign[1]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => state(1),
	datab => state(31),
	datac => \UCSign[1]~reg0_q\,
	datad => \UCSign[1]~0_combout\,
	combout => \UCSign[1]~1_combout\);

-- Location: FF_X1_Y18_N31
\UCSign[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \UCSign[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UCSign[1]~reg0_q\);

-- Location: LCCOMB_X1_Y18_N28
\Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = ((\OPin[1]~input_o\ & \OPin[0]~input_o\)) # (!state(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \OPin[1]~input_o\,
	datac => \OPin[0]~input_o\,
	datad => state(1),
	combout => \Selector1~0_combout\);

-- Location: LCCOMB_X1_Y18_N20
\Selector1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~1_combout\ = (state(31) & (state(0) & ((\Selector1~0_combout\)))) # (!state(31) & (((\UCSign[2]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => state(0),
	datab => state(31),
	datac => \UCSign[2]~reg0_q\,
	datad => \Selector1~0_combout\,
	combout => \Selector1~1_combout\);

-- Location: FF_X1_Y18_N21
\UCSign[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UCSign[2]~reg0_q\);

-- Location: LCCOMB_X1_Y18_N10
\Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\OPin[1]~input_o\ & (!\OPin[0]~input_o\ & state(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \OPin[1]~input_o\,
	datac => \OPin[0]~input_o\,
	datad => state(1),
	combout => \Selector0~0_combout\);

-- Location: LCCOMB_X1_Y18_N14
\Selector0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~1_combout\ = (state(31) & (state(0) & ((\Selector0~0_combout\)))) # (!state(31) & (((\UCSign[3]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => state(0),
	datab => state(31),
	datac => \UCSign[3]~reg0_q\,
	datad => \Selector0~0_combout\,
	combout => \Selector0~1_combout\);

-- Location: FF_X1_Y18_N15
\UCSign[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \UCSign[3]~reg0_q\);

-- Location: IOIBUF_X0_Y11_N15
\Reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Reset,
	o => \Reset~input_o\);

ww_UCSign(0) <= \UCSign[0]~output_o\;

ww_UCSign(1) <= \UCSign[1]~output_o\;

ww_UCSign(2) <= \UCSign[2]~output_o\;

ww_UCSign(3) <= \UCSign[3]~output_o\;
END structure;


