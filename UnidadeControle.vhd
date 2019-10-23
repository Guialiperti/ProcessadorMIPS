library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UnidadeControle is

    port
    (
        -- Input ports
        opcode: std_logic_vector(5 downto 0);
		  
        -- Output ports
		  hab_escrita_mem : out STD_LOGIC;
		  hab_leitura_mem: out STD_LOGIC;
		  op_ULA : out STD_LOGIC;
		  hab_escrita_reg  : out STD_LOGIC
    );
end entity;

architecture comportamento of UnidadeControle is

-- Lw =  000000
-- Sw =  000001
-- beq = 000010
	 
begin
	hab_escrita_mem <= '1' when (enable_decoder = "111") AND (enable_geral = '0') else '0';
	hab_escrita_reg <= '1' when (enable_decoder = "001") AND (enable_geral = '0') else '0';
	hab_leitura_mem <= '1' when (enable_decoder = "001") AND (enable_geral = '0') else '0';
	op_ULA <= '1' when 
	

end architecture;