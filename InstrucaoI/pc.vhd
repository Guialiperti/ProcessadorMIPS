library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity pc is
	generic (
		larguraBarramentoDados		: natural := 32
	);
    port(
        clk     : in  STD_LOGIC;
        input     : in  STD_LOGIC_VECTOR(larguraBarramentoDados -1 downto 0);
        output    : out STD_LOGIC_VECTOR(larguraBarramentoDados -1 downto 0)
    );
end entity;

architecture arch of pc is

begin
  process(clk) 
  begin
  
    if rising_edge(clk) then
        output <= input; 
		  
    end if;
end process;
  
  
end architecture;