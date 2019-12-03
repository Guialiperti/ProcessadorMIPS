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
-- Generated on "11/29/2019 18:44:16"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ROM
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ROM_vhd_vec_tst IS
END ROM_vhd_vec_tst;
ARCHITECTURE ROM_arch OF ROM_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Dado : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL Endereco : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT ROM
	PORT (
	Dado : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	Endereco : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : ROM
	PORT MAP (
-- list connections between master ports and signals
	Dado => Dado,
	Endereco => Endereco
	);
-- Endereco[31]
t_prcs_Endereco_31: PROCESS
BEGIN
	Endereco(31) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_31;
-- Endereco[30]
t_prcs_Endereco_30: PROCESS
BEGIN
	Endereco(30) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_30;
-- Endereco[29]
t_prcs_Endereco_29: PROCESS
BEGIN
	Endereco(29) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_29;
-- Endereco[28]
t_prcs_Endereco_28: PROCESS
BEGIN
	Endereco(28) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_28;
-- Endereco[27]
t_prcs_Endereco_27: PROCESS
BEGIN
	Endereco(27) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_27;
-- Endereco[26]
t_prcs_Endereco_26: PROCESS
BEGIN
	Endereco(26) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_26;
-- Endereco[25]
t_prcs_Endereco_25: PROCESS
BEGIN
	Endereco(25) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_25;
-- Endereco[24]
t_prcs_Endereco_24: PROCESS
BEGIN
	Endereco(24) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_24;
-- Endereco[23]
t_prcs_Endereco_23: PROCESS
BEGIN
	Endereco(23) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_23;
-- Endereco[22]
t_prcs_Endereco_22: PROCESS
BEGIN
	Endereco(22) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_22;
-- Endereco[21]
t_prcs_Endereco_21: PROCESS
BEGIN
	Endereco(21) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_21;
-- Endereco[20]
t_prcs_Endereco_20: PROCESS
BEGIN
	Endereco(20) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_20;
-- Endereco[19]
t_prcs_Endereco_19: PROCESS
BEGIN
	Endereco(19) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_19;
-- Endereco[18]
t_prcs_Endereco_18: PROCESS
BEGIN
	Endereco(18) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_18;
-- Endereco[17]
t_prcs_Endereco_17: PROCESS
BEGIN
	Endereco(17) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_17;
-- Endereco[16]
t_prcs_Endereco_16: PROCESS
BEGIN
	Endereco(16) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_16;
-- Endereco[15]
t_prcs_Endereco_15: PROCESS
BEGIN
	Endereco(15) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_15;
-- Endereco[14]
t_prcs_Endereco_14: PROCESS
BEGIN
	Endereco(14) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_14;
-- Endereco[13]
t_prcs_Endereco_13: PROCESS
BEGIN
	Endereco(13) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_13;
-- Endereco[12]
t_prcs_Endereco_12: PROCESS
BEGIN
	Endereco(12) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_12;
-- Endereco[11]
t_prcs_Endereco_11: PROCESS
BEGIN
	Endereco(11) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_11;
-- Endereco[10]
t_prcs_Endereco_10: PROCESS
BEGIN
	Endereco(10) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_10;
-- Endereco[9]
t_prcs_Endereco_9: PROCESS
BEGIN
	Endereco(9) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_9;
-- Endereco[8]
t_prcs_Endereco_8: PROCESS
BEGIN
	Endereco(8) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_8;
-- Endereco[7]
t_prcs_Endereco_7: PROCESS
BEGIN
	Endereco(7) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_7;
-- Endereco[6]
t_prcs_Endereco_6: PROCESS
BEGIN
	Endereco(6) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_6;
-- Endereco[5]
t_prcs_Endereco_5: PROCESS
BEGIN
	Endereco(5) <= '1';
WAIT;
END PROCESS t_prcs_Endereco_5;
-- Endereco[4]
t_prcs_Endereco_4: PROCESS
BEGIN
	Endereco(4) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_4;
-- Endereco[3]
t_prcs_Endereco_3: PROCESS
BEGIN
	Endereco(3) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_3;
-- Endereco[2]
t_prcs_Endereco_2: PROCESS
BEGIN
	Endereco(2) <= '1';
WAIT;
END PROCESS t_prcs_Endereco_2;
-- Endereco[1]
t_prcs_Endereco_1: PROCESS
BEGIN
	Endereco(1) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_1;
-- Endereco[0]
t_prcs_Endereco_0: PROCESS
BEGIN
	Endereco(0) <= '0';
WAIT;
END PROCESS t_prcs_Endereco_0;
END ROM_arch;
