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
		  KEY						   : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7			: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		  LEDR						: OUT STD_LOGIC_VECTOR(CONTROLWORD_WIDTH-1 DOWNTO 0);
		  LEDG						: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		  entradaBanco, saidaBanco1, saidaBanco2,saidaPC, saidaULA          : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		  saidaZULA, escreveBanco : OUT std_logic;
		  MUX_jump, mux_beq        : OUT STD_LOGIC_VECTOR(31 downto 0);
		  enderecoA, enderecoC       : OUT STD_LOGIC_VECTOR(4 downto 0);
		  mux_bne : out std_logic

    );
end entity;

architecture estrutural of mips is

	-- Declaração de sinais auxiliares
    signal pontosDeControle     : STD_LOGIC_VECTOR(CONTROLWORD_WIDTH-1 DOWNTO 0);
    signal instrucao            : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
    signal ALUop                : STD_LOGIC_VECTOR(ALU_OP_WIDTH-1 DOWNTO 0);
    signal ALUctr               : STD_LOGIC_VECTOR(CTRL_ALU_WIDTH-1 DOWNTO 0);
	 signal saidaBotao			  : STD_LOGIC;
	 
	 signal saidaPCS				  : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 signal saidaULAS				  : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 signal saidaBanco1S			  : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 signal saidaBanco2S			  : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 signal entradaBancoS			  : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 signal saidaZULAS				  : std_logic;
	 signal escreveBancoS			  : std_logic;
    -- Sinal de clock auxiliar para simulação
    -- signal clk  : STD_LOGIC;
	 
	signal conectaClock : std_logic;

    alias opcode : std_logic_vector(OPCODE_WIDTH-1 downto 0) is instrucao(31 DOWNTO 26);
	 alias funct  : std_logic_vector(5 DOWNTO 0) is instrucao(5 downto 0);
begin

    -- CLOCK generator auxiliar para simulação
    -- CG : entity work.clock_generator port map (clk	=> clk);

    FD : entity work.fluxo_dados 
	port map
	(
        clk	                    => saidaBotao,
        pontosDeControle        => pontosDeControle,
        instrucao               => instrucao,
		  saidaPC					  => saidaPCS,
		  saidaUla					  => saidaULAS,
		  saidaDadosBanco1        => saidaBanco1S,
		  saidaDadosBanco2        => saidaBanco2S,
		  escreveBanco            => escreveBancoS,
		  saidaZULA					  => saidaZULAS,
		  entradaDadosBanco        => entradaBancoS,
		  MUX_jump => MUX_jump,
		  mux_beq  => mux_beq,
		  mux_bne	=> mux_bne,
		  enderecoA => enderecoA,
		  enderecoC => enderecoC
		  
    );

    UC : entity work.uc 
	port map
	(
        opcode              	=> opcode,
		  funct						=> funct,
        pontosDeControle    	=> pontosDeControle
    );
	 
	 registradorClock : entity work.registradorClock 
	port map
	(
        clock             	=> KEY(0),
		  Q						=> conectaClock,
        reset            	=> KEY(2)
    );
	 

	
	 detectorDescida : entity work.edgeDetector 
	port map
	(
        clk							=> CLOCK_50,
        entrada					=> conectaClock,
		  saida						=> saidaBotao
    );
	 
	 conersortHex7segPC : entity work.conversorHex7Seg
	port map
	(
		 clk						 => CLOCK_50,
		 dadoHex					 => saidaBanco1(7 DOWNTO 0) & saidaPC(7 DOWNTO 0),
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
		 dadoHex					 => saidaULAS(15 DOWNTO 0),
		 enable					 => '1',
		 saida7seg0				 => HEX4,
		 saida7seg1           => HEX5,
		 saida7seg2				 => HEX6,
		 saida7seg3           => HEX7
	 );
	 
	 LEDG(0) <= saidaZULA;
	 LEDR(CONTROLWORD_WIDTH-1 downto 0) <= pontosDeControle;
	 
	 saidaULA <= saidaULAS;
	 entradaBanco <= entradaBancoS;
	 saidaBanco1 <= saidaBanco1S;
	 saidaBanco2 <= saidaBanco2S;
	 escreveBanco <= escreveBancoS;
	 saidaZULA <= saidaZULAS;
	 saidaPC <= saidaPCS;
	

end architecture;
