-- Design de Computadores
-- file: mips.vhd
-- date: 18/10/2019

library ieee;
use ieee.std_logic_1164.all;
use work.constantesMIPS.all;

entity mips is
	port
    (
        CLOCK_50			      : IN  STD_LOGIC;
		  KEY						   : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7			: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		  LEDR						: OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
		  

    );
end entity;

architecture estrutural of mips is

	-- Declaração de sinais auxiliares
    signal pontosDeControle     : STD_LOGIC_VECTOR(CONTROLWORD_WIDTH-1 DOWNTO 0);
    signal instrucao            : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
    signal ALUop                : STD_LOGIC_VECTOR(ALU_OP_WIDTH-1 DOWNTO 0);
    signal ALUctr               : STD_LOGIC_VECTOR(CTRL_ALU_WIDTH-1 DOWNTO 0);
	 signal saidaBotao			  : STD_LOGIC;
	 
	 signal saidaPC				  : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 signal saidaULA				  : STD_LOGIC_VECTOR(31 DOWNTO 0);

    -- Sinal de clock auxiliar para simulação
    -- signal clk  : STD_LOGIC;

    alias opcode : std_logic_vector(OPCODE_WIDTH-1 downto 0) is instrucao(31 DOWNTO 26);
begin

    -- CLOCK generator auxiliar para simulação
    -- CG : entity work.clock_generator port map (clk	=> clk);

    FD : entity work.fluxo_dados 
	port map
	(
        clk	                    => saidaBotao,
        pontosDeControle        => pontosDeControle,
        instrucao               => instrucao,
		  saidaPC					  => saidaPC,
		  saidaUla					  => saidaULA
    );

    UC : entity work.uc 
	port map
	(
        opcode              	=> opcode,
        pontosDeControle    	=> pontosDeControle
    );
	
	 detectorDescida : entity work.edgeDetector 
	port map
	(
        clk							=> CLOCK_50,
        entrada					=> KEY(0),
		  saida						=> saidaBotao
    );
	 
	 conersortHex7segPC : entity work.conversorHex7Seg
	port map
	(
		 clk						 => CLOCK_50,
		 dadoHex					 => saidaPC(15 DOWNTO 0),
		 enable					 => '1',
		 saida7seg0				 => HEX0,
		 saida7seg1           => HEX1,
		 saida7seg2				 => HEX2,
		 saida7seg3           => HEX3
	 );
	 
	 	conersortHex7segULA : entity work.conversorHex7Seg
	port map
	(
		 clk						 => CLOCK_50,
		 dadoHex					 => saidaULA(15 DOWNTO 0),
		 enable					 => '1',
		 saida7seg0				 => HEX4,
		 saida7seg1           => HEX5,
		 saida7seg2				 => HEX6,
		 saida7seg3           => HEX7
	 );
	 
	 LEDR(CONTROLWORD_WIDTH-1 downto 0) <= pontosDeControle;

end architecture;
