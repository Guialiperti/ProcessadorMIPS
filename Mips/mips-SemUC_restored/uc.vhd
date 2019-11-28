-- Design de Computadores
-- file: uc.vhd
-- date: 18/10/2019

library ieee;
use ieee.std_logic_1164.all;
use work.constantesMIPS.all;

entity uc is
	port
    (
        opcode              	: IN STD_LOGIC_VECTOR(OPCODE_WIDTH-1 DOWNTO 0);
        pontosDeControle    	: OUT STD_LOGIC_VECTOR(CONTROLWORD_WIDTH-1 DOWNTO 0)
    );
end entity;

architecture bhv of uc is
begin
	
		pontosDeControle <= ctrlTipoR when opcode = opCodeTipoR else
		ctrlTipoJ when opcode = opCodeTipoJ else
		ctrlTipoBEQ when opcode = opCodeBEQ else
		ctrlTipoLW when opcode = opCodeLW else
		ctrlTipoSW when opcode = opCodeSW else
		"00000000000";

end bhv;