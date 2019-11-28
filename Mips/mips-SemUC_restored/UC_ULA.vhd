	-- Design de Computadores
-- file: UC_ULA.vhd
-- date: 18/10/2019

library ieee;
use ieee.std_logic_1164.all;
use work.constantesMIPS.all;

entity UC_ULA is
	port
    (
        funct               : IN STD_LOGIC_VECTOR(FUNCT_WIDTH-1 DOWNTO 0);
        ALUop               : IN STD_LOGIC_VECTOR(ALU_OP_WIDTH-1 DOWNTO 0);
        ALUctr              : OUT STD_LOGIC_VECTOR(CTRL_ALU_WIDTH-1 DOWNTO 0)
    );
end entity;

architecture bhv of UC_ULA is	
    signal ALUfunct_s : STD_LOGIC_VECTOR(CTRL_ALU_WIDTH-1 DOWNTO 0);
	 signal ALUop_s : STD_LOGIC_VECTOR(CTRL_ALU_WIDTH-1 DOWNTO 0);
begin

with funct select
	ALUfunct_s <= ulaCtrlAdd when functADD,
					  ulaCtrlSub when functSUB,
					  ulaCtrlAnd when functAND,
					  ulaCtrlOr when functOR,
				     ulaCtrlSlt when functSLT,
					  ulaDisab when others;
					  

with ALUop select
	ALUop_s <= 	ulaCtrlAdd when aluOpAdd,
					ulaCtrlSub when aluOpSub,
					ulaCtrlAnd when aluOpAnd,
					ulaCtrlOr when aluOpOr,
				   ulaCtrlSlt when aluOpSlt,
					ulaDisab when others;
					
with ALUop select
	ALUctr <= ALUfunct_s when "000",
				 ALUop_s when others;
				 
				 


end bhv;