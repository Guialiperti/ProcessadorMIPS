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
		  funct						: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
        pontosDeControle    	: OUT STD_LOGIC_VECTOR(CONTROLWORD_WIDTH-1 DOWNTO 0)
    );
end entity;

architecture bhv of uc is
	signal condJR : std_logic;
	signal condFunct : std_logic;
	signal condOpCode : std_logic;
begin
		
		with opcode select
		condOpCode <= '1' when opcodeTipoR,
					     '0' when others;
		
		with funct select
		condFunct <= '1' when functJR,
					 '0' when others;
		
		condJR <= condFunct and condOpCode;
			
	
		pontosDeControle <= ctrlTipoJR when condJR = '1' else
		ctrlTipoR when opcode = opCodeTipoR else
		ctrlTipoJ when opcode = opCodeTipoJ else
		ctrlTipoBEQ when opcode = opCodeBEQ else
		ctrlTipoLW when opcode = opCodeLW else
		ctrlTipoSW when opcode = opCodeSW else
		ctrlTipoANDI when opcode = opcodeANDI else
		ctrlTipoORI when opcode = opCodeORI else
		ctrlTipoADDI when opcode = opCodeADDI else
		ctrlTipoSLTI when opcode = opCodeSLTI else
		ctrlTipoBNE when opcode = opCodeBNE else
		ctrlTipoLUI when opcode = opCodeLUI else
		ctrlTipoJAL when opcode = opCodeJAL else
		"00000000000000000";

end bhv;