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
-- Generated on "11/29/2019 17:37:26"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          estendeSinalGenerico
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY estendeSinalGenerico_vhd_vec_tst IS
END estendeSinalGenerico_vhd_vec_tst;
ARCHITECTURE estendeSinalGenerico_arch OF estendeSinalGenerico_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL estendeSinal_IN : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL estendeSinal_OUT : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL seletorEstendeZero : STD_LOGIC;
COMPONENT estendeSinalGenerico
	PORT (
	estendeSinal_IN : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	estendeSinal_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	seletorEstendeZero : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : estendeSinalGenerico
	PORT MAP (
-- list connections between master ports and signals
	estendeSinal_IN => estendeSinal_IN,
	estendeSinal_OUT => estendeSinal_OUT,
	seletorEstendeZero => seletorEstendeZero
	);
-- estendeSinal_IN[7]
t_prcs_estendeSinal_IN_7: PROCESS
BEGIN
	estendeSinal_IN(7) <= '1';
WAIT;
END PROCESS t_prcs_estendeSinal_IN_7;
-- estendeSinal_IN[6]
t_prcs_estendeSinal_IN_6: PROCESS
BEGIN
	estendeSinal_IN(6) <= '1';
WAIT;
END PROCESS t_prcs_estendeSinal_IN_6;
-- estendeSinal_IN[5]
t_prcs_estendeSinal_IN_5: PROCESS
BEGIN
	estendeSinal_IN(5) <= '1';
WAIT;
END PROCESS t_prcs_estendeSinal_IN_5;
-- estendeSinal_IN[4]
t_prcs_estendeSinal_IN_4: PROCESS
BEGIN
	estendeSinal_IN(4) <= '1';
WAIT;
END PROCESS t_prcs_estendeSinal_IN_4;
-- estendeSinal_IN[3]
t_prcs_estendeSinal_IN_3: PROCESS
BEGIN
	estendeSinal_IN(3) <= '1';
WAIT;
END PROCESS t_prcs_estendeSinal_IN_3;
-- estendeSinal_IN[2]
t_prcs_estendeSinal_IN_2: PROCESS
BEGIN
	estendeSinal_IN(2) <= '1';
WAIT;
END PROCESS t_prcs_estendeSinal_IN_2;
-- estendeSinal_IN[1]
t_prcs_estendeSinal_IN_1: PROCESS
BEGIN
	estendeSinal_IN(1) <= '1';
WAIT;
END PROCESS t_prcs_estendeSinal_IN_1;
-- estendeSinal_IN[0]
t_prcs_estendeSinal_IN_0: PROCESS
BEGIN
	estendeSinal_IN(0) <= '0';
WAIT;
END PROCESS t_prcs_estendeSinal_IN_0;

-- seletorEstendeZero
t_prcs_seletorEstendeZero: PROCESS
BEGIN
	seletorEstendeZero <= '1';
WAIT;
END PROCESS t_prcs_seletorEstendeZero;
END estendeSinalGenerico_arch;
