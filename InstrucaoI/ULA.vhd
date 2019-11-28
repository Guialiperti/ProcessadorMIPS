-- A library clause declares a name as a library.  It 
-- does not create the library; it simply forward declares 
-- it. 
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity ula is

	generic(
		larguraBarramentoDados: natural := 32
	);

	port
	(
		-- Input ports
		A	: in  std_logic_vector(larguraBarramentoDados-1 DOWNTO 0);
		B	: in   std_logic_vector(larguraBarramentoDados-1 DOWNTO 0);
		OP	: in std_logic_vector(3 DOWNTO 0);

		-- Output ports
		S	: out std_logic_vector(larguraBarramentoDados-1 DOWNTO 0);
		Z	: out std_logic
	);
end entity;


architecture functions of ULA is


--constant CMPNE : std_logic_vector(1 downto 0) := "10";
constant CMPE : std_logic_vector(3 downto 0) := "0010";

signal igual : std_logic;
signal soma : std_logic_vector(31 downto 0);
signal sub : std_logic_vector(31 downto 0);
--signal passaA : std_logic_vector(7 downto 0);
signal zero : std_logic_vector(31 downto 0);

begin

	--S <=  std_logic_vector(A) when (OP = "00") else std_logic_vector(unsigned(A) + unsigned(B)) when (OP = "01") else 
	--		"00000011" when (OP = "10") else
	--		"00000011" when (OP = "11") else "00000011";
			
	soma <= std_logic_vector(unsigned(A) + unsigned(B));
	sub <= std_logic_vector(unsigned(A) - unsigned(B));
	zero <= "00000000000000000000000000000000";
	
	with OP select
	S <= 	soma when "0000",
			sub when "0001",
			zero when others;
	
			
	--JE_JNE <= '1' when ((A /= B) and (OP = CMPNE)) OR ((A = B) and (OP = CMPE)) else '0';
	
	igual <= '1' when A=B else '0';
	
	with OP select
	Z <= igual when CMPE,
	'0' when others;
	
end architecture;
