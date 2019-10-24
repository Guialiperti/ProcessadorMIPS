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
		OP	: in std_logic;

		-- Output ports
		S	: out std_logic_vector(larguraBarramentoDados-1 DOWNTO 0)
	);
end entity;


architecture functions of ULA is

signal soma : std_logic_vector(larguraBarramentoDados-1 downto 0);
signal subtracao : std_logic_vector(larguraBarramentoDados-1 downto 0);

begin
			
	soma <= std_logic_vector(unsigned(A) + unsigned(B));
	subtracao <= std_logic_vector(unsigned(A) - unsigned(B));
	
	with OP select
	S <= soma when '0',
			subtracao when '1';
	
	
	
end architecture;
