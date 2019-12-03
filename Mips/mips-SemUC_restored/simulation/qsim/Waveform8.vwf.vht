-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "12/03/2019 16:51:35"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          mips
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY mips_vhd_vec_tst IS
END mips_vhd_vec_tst;
ARCHITECTURE mips_arch OF mips_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLOCK_50 : STD_LOGIC;
SIGNAL enderecoA : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL enderecoC : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL entradaBanco : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL escreveBanco : STD_LOGIC;
SIGNAL HEX0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX6 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX7 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL KEY : STD_LOGIC_VECTOR(0 DOWNTO 0);
SIGNAL LEDG : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL LEDR : STD_LOGIC_VECTOR(16 DOWNTO 0);
SIGNAL mux_beq : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL mux_bne : STD_LOGIC;
SIGNAL MUX_jump : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL saidaBanco1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL saidaBanco2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL saidaPC : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL saidaULA : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL saidaZULA : STD_LOGIC;
COMPONENT mips
	PORT (
	CLOCK_50 : IN STD_LOGIC;
	enderecoA : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	enderecoC : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	entradaBanco : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	escreveBanco : OUT STD_LOGIC;
	HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX6 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX7 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	KEY : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	LEDG : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	LEDR : OUT STD_LOGIC_VECTOR(16 DOWNTO 0);
	mux_beq : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	mux_bne : OUT STD_LOGIC;
	MUX_jump : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	saidaBanco1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	saidaBanco2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	saidaPC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	saidaULA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	saidaZULA : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : mips
	PORT MAP (
-- list connections between master ports and signals
	CLOCK_50 => CLOCK_50,
	enderecoA => enderecoA,
	enderecoC => enderecoC,
	entradaBanco => entradaBanco,
	escreveBanco => escreveBanco,
	HEX0 => HEX0,
	HEX1 => HEX1,
	HEX2 => HEX2,
	HEX3 => HEX3,
	HEX4 => HEX4,
	HEX5 => HEX5,
	HEX6 => HEX6,
	HEX7 => HEX7,
	KEY => KEY,
	LEDG => LEDG,
	LEDR => LEDR,
	mux_beq => mux_beq,
	mux_bne => mux_bne,
	MUX_jump => MUX_jump,
	saidaBanco1 => saidaBanco1,
	saidaBanco2 => saidaBanco2,
	saidaPC => saidaPC,
	saidaULA => saidaULA,
	saidaZULA => saidaZULA
	);

-- CLOCK_50
t_prcs_CLOCK_50: PROCESS
BEGIN
LOOP
	CLOCK_50 <= '0';
	WAIT FOR 2000 ps;
	CLOCK_50 <= '1';
	WAIT FOR 2000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLOCK_50;

-- KEY[0]
t_prcs_KEY_0: PROCESS
BEGIN
LOOP
	KEY(0) <= '0';
	WAIT FOR 10000 ps;
	KEY(0) <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_KEY_0;
END mips_arch;
