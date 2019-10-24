library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


library ieee;
use ieee.std_logic_1164.all;

entity R is 	
    generic (
        larguraBarramentoEnderecos  : natural := 32;
        larguraBarramentoDados      : natural := 32
    );
    port
    (	  
		  clk						  : IN STD_LOGIC;
		  controle				  : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		  opcode					  : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		  funct					  : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
		  
    );
end entity;

architecture estrutural of R is

    -- Declaração de sinais auxiliares
	 signal saidaULA, saidaPC, saidaINC, saidaROM, saidaBanco1, saidaBanco2 : STD_LOGIC_VECTOR(larguraBarramentoDados-1 DOWNTO 0);
     
    -- ...

begin
    -- Instanciação de Banco de Registradores
    bancoRegistradores : entity work.bancoRegistradores 
    -- generic map (
    -- );
    port map
    (	  
		  clk					=> clk,
        enderecoA       => saidaROM(25 DOWNTO 21),
        enderecoB       => saidaROM(20 DOWNTO 16),
        enderecoC       => saidaROM(15 DOWNTO 11),
        dadoEscritaC    => saidaULA,
        escreveC        => controle(0),
        saidaA          => saidaBanco1,
        saidaB          => saidaBanco2
    );
	 
	ULA : entity work.ULA
	
	port map (
		A			=> saidaBanco1,
		B			=> saidaBanco2,
		OP       => controle(2 downto 0),
		S			=> saidaULA
	);

    -- Instanciação de MUX
    ROM : entity work.romMif
   -- generic map (
	--      larguraDados    => larguraBarramentoDados
   --);
    port map
    (
        Endereco => saidaPC,
		  Dado     => saidaROM
    );
	 
	 
	 SOMADOR : entity work.somador
	 
	 port map
	 (
	
		entrada    => saidaPC,
		saida 	  => saidaINC
	 );
		
	 PC : entity work.pc
	 
	 port map
	 (
			clk 		=> clk,
			input 	=> saidaINC,
			output	=> saidaPC
	 );
	 
end architecture;