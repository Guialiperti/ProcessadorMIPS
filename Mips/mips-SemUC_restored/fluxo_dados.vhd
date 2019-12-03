-- Design de Computadores
-- file: fluxo_dados.vhd
-- date: 18/10/2019

library ieee;
use ieee.std_logic_1164.all;
use work.constantesMIPS.all;

entity fluxo_dados is
    generic (
        larguraROM          : natural := 8 -- deve ser menor ou igual a 32
    );
	port
    (
        clk			            : IN STD_LOGIC;
        pontosDeControle        : IN STD_LOGIC_VECTOR(CONTROLWORD_WIDTH-1 DOWNTO 0);
        instrucao               : OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
		  saidaULA					  : OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
		  saidaPC					  : OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
		  saidaDadosBanco1        : OUT STD_LOGIC_VECTOR(31 downto 0);
		  saidaDadosBanco2        : OUT STD_LOGIC_VECTOR(31 downto 0);
		  saidaZULA					  : OUT STD_LOGIC;
		  escreveBanco            : OUT STD_LOGIC;
		  entradaDadosBanco       : OUT STD_LOGIC_VECTOR(31 downto 0);
		  MUX_jump, mux_beq       : OUT STD_LOGIC_VECTOR(31 downto 0);
		  enderecoA, enderecoC       : OUT STD_LOGIC_VECTOR(4 downto 0);
		  mux_bne : out std_logic
    );
end entity;

architecture estrutural of fluxo_dados is

    -- Declaração de sinais auxiliares
    
    -- Sinais auxiliar da instrução
    signal instrucao_s : std_logic_vector(DATA_WIDTH-1 downto 0);

    -- Sinais auxiliares para o banco de registradores
    signal RA, RB : std_logic_vector(DATA_WIDTH-1 downto 0);

    -- Sinais auxiliares para a ULA
    signal saida_ula : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal Z_out : std_logic;

    -- Sinais auxiliares para a lógica do 
    signal PC_s, PC_mais_4, PC_mais_4_mais_imediato, entrada_somador_beq : std_logic_vector(DATA_WIDTH-1 downto 0);

    -- Sinais auxiliares para a RAM
    signal dado_lido_mem : std_logic_vector(DATA_WIDTH-1 downto 0);

    -- Sinais auxiliares para os componentes manipuladores do imediato
    signal sinal_ext : std_logic_vector(DATA_WIDTH-1 downto 0);

    -- Sinais auxiliares para os componentes manipuladores do endereço de jump
    signal PC_4_concat_imed : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal saida_shift_jump : std_logic_vector(27 downto 0);
            
    -- Sinais auxiliares dos MUXs
    signal sel_mux_beq : std_logic;
    signal saida_mux_ula_mem, saida_mux_banco_ula, saida_mux_beq, saida_mux_jump : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal saida_mux_rd_rt : std_logic_vector(REGBANK_ADDR_WIDTH-1 downto 0);
	 signal saida_mux_bne : std_logic;
	 signal saida_mux_lui : std_logic_vector(DATA_WIDTH-1 downto 0);
	
	 signal luiBitsZero : std_logic_vector(DATA_WIDTH-1 downto 0);
	
     
    -- Controle da ULA
    signal ULActr : std_logic_vector(CTRL_ALU_WIDTH-1 downto 0);

    -- Codigos da palavra de controle:
    alias ULAop             : std_logic_vector(ALU_OP_WIDTH-1 downto 0) is pontosDeControle(16 downto 14);
	 alias seletorLUI        : std_logic is pontosDeControle(13);
	 alias seletorBNE        : std_logic is pontosDeControle(12);
	 alias seletorEstendeZero: std_logic is pontosDeControle(11);
    alias escreve_RC        : std_logic is pontosDeControle(10);
    alias escreve_RAM       : std_logic is pontosDeControle(9);
    alias leitura_RAM       : std_logic is pontosDeControle(8);
    alias sel_mux_ula_mem   : std_logic_vector is pontosDeControle(7 downto 6);
    alias sel_mux_rd_rt     : std_logic_vector is pontosDeControle(5 downto 4);
    alias sel_mux_banco_ula : std_logic is pontosDeControle(3);
    alias sel_beq           : std_logic is pontosDeControle(2);
    alias sel_mux_jump      : std_logic_vector is pontosDeControle(1 downto 0);
	 

    -- Parsing da instrucao
    alias RS_addr   : std_logic_vector(REGBANK_ADDR_WIDTH-1 downto 0) is instrucao_s(25 downto 21);
    alias RT_addr   : std_logic_vector(REGBANK_ADDR_WIDTH-1 downto 0) is instrucao_s(20 downto 16);
    alias RD_addr   : std_logic_vector(REGBANK_ADDR_WIDTH-1 downto 0) is instrucao_s(15 downto 11);
    alias funct     : std_logic_vector(FUNCT_WIDTH-1 downto 0) is  instrucao_s(5 DOWNTO 0);
    alias imediato  : std_logic_vector(15 downto 0) is instrucao_s(15 downto 0);

begin
	
	 luiBitsZero <= imediato & "0000000000000000";
		
    instrucao <= instrucao_s;

    sel_mux_beq <= (sel_beq or seletorBNE) AND saida_mux_bne;

    -- Ajuste do PC para jump (concatena com imediato multiplicado por 4)
    PC_4_concat_imed <= PC_mais_4(31 downto 28) & saida_shift_jump;

    -- Banco de registradores
     BR: entity work.bancoRegistradores 
        generic map (
            larguraDados => DATA_WIDTH, 
            larguraEndBancoRegs => 5
        )
        port map (
            enderecoA => RS_addr,
            enderecoB => RT_addr,
            enderecoC => saida_mux_rd_rt,
            clk          => clk,
            dadoEscritaC => saida_mux_lui, 
            escreveC     => escreve_RC,
            saidaA       => RA,
            saidaB       => RB
        );
    
    -- ULA
     ULA: entity work.ULA
        generic map (
            NUM_BITS => DATA_WIDTH
        )
		port map (
            A   => RA,
            B   => saida_mux_banco_ula,
            ctr => ULActr,
            C   => saida_ula,
            Z   => Z_out
        );
    
    UCULA : entity work.uc_ula 
        port map
        (
            funct  => funct,
            ALUop  => ULAop,
            ALUctr => ULActr
        );
     
    -- PC e somadores
     PC: entity work.Registrador
        generic map (
            NUM_BITS => DATA_WIDTH
        )
		port map (
            data_out => PC_s,
            data_in  => saida_mux_jump,
            clk      => clk,
            enable   => '1',
            reset    => '1' -- reset negado
        );
    
     Somador_imediato: entity work.somador 
        generic map (
            larguraDados => DATA_WIDTH
        )
		port map (
            entradaA => entrada_somador_beq,
            entradaB => PC_mais_4,
            saida    => PC_mais_4_mais_imediato
        );
    
     Somador: entity work.soma4
        generic map (
            larguraDados => DATA_WIDTH
        )
		port map (
            entrada => PC_s,
            saida   => PC_mais_4
        ); 

    -- ROM
    ROM: entity work.ROM 
        generic map (
            dataWidth => DATA_WIDTH, 
            addrWidth => larguraROM
        ) 
		port map (
            endereco => PC_s(larguraROM-1 downto 0),
            dado     => instrucao_s
        );
    
    -- RAM: escreve valor lido no registrador B no endereço de memória de acordo com a saída da ULA
     RAM: entity work.single_port_RAM 
        generic map (
            dataWidth => DATA_WIDTH, 
            addrWidth => ADDR_WIDTH
        )
		port map (
            endereco    => saida_ula, 
            we          => escreve_RAM,
            re          => leitura_RAM,
            clk         => clk,
            dado_write  => RB,
            dado_read   => dado_lido_mem
        ); 

     -- Componentes manipuladores do imediato
     extensor: entity work.estendeSinalGenerico 
        generic map (
            larguraDadoEntrada => 16,
            larguraDadoSaida   => DATA_WIDTH
        )
		port map (
				seletorEstendeZero => seletorEstendeZero,
            estendeSinal_IN  => imediato,
            estendeSinal_OUT => sinal_ext 
        ); 

     shift: entity work.shift2_imediato 
        generic map (
            larguraDado => DATA_WIDTH
        )
		port map (
            shift_IN  => sinal_ext,
            shift_OUT => entrada_somador_beq
        );
    
    -- Componentes manipuladores do endereço de jump
     shift_jump: entity work.shift2 
        generic map (
            larguraDado => 26
        )
		port map (
            shift_IN  => instrucao_s(25 downto 0),
            shift_OUT => saida_shift_jump
        );
    
    -- MUXs
     mux_Ula_Memoria: entity work.muxGenerico4 
        generic map (
            larguraDados => DATA_WIDTH
        )
		port map (
            entradaA => saida_ula, 
            entradaB => dado_lido_mem, 
				entradaC => PC_mais_4,
            seletor  => sel_mux_ula_mem,
            saida    => saida_mux_ula_mem
        );
	  
	  	 
     mux_Rd_Rt: entity work.muxGenerico4
        generic map (
            larguraDados => REGBANK_ADDR_WIDTH
        )
		port map (
            entradaA => RT_addr, 
            entradaB => RD_addr,
				entradaC => "11111",
            seletor  => sel_mux_rd_rt,
            saida    => saida_mux_rd_rt
        );
	
     mux_Banco_Ula: entity work.muxGenerico2 
        generic map (
            larguraDados => DATA_WIDTH
        )
		port map (
            entradaA => RB, 
            entradaB => sinal_ext,  
            seletor  => sel_mux_banco_ula,
            saida    => saida_mux_banco_ula
        );
		
     mux_beq2: entity work.muxGenerico2 
        generic map (
            larguraDados => DATA_WIDTH
        )
		port map (
            entradaA => PC_mais_4,
            entradaB => PC_mais_4_mais_imediato,
            seletor  => sel_mux_beq,
            saida    => saida_mux_beq
        );
		 
		
     mux_jump2: entity work.muxGenerico4 
        generic map (
            larguraDados => DATA_WIDTH
        )
		port map (
            entradaA => saida_mux_beq,
            entradaB => PC_4_concat_imed,
				entradaC => RA,
            seletor  => sel_mux_jump,
            saida    => saida_mux_jump
        );
	  
	   mux_bne2: entity work.muxGenerico2_1bit 
        generic map (
            larguraDados => 1
        )
		port map (
            entradaA => Z_out,
            entradaB => not(Z_out),
            seletor  => seletorBNE,
            saida    => saida_mux_bne
        );
		
		mux_lui: entity work.muxGenerico2 
        generic map (
            larguraDados => DATA_WIDTH
        )
		port map (
            entradaA => saida_mux_ula_mem,
            entradaB => luiBitsZero,
            seletor  => seletorLUI,
            saida    => saida_mux_lui
        );
		  
		saidaULA <= saida_ula;
		saidaPC  <= PC_s;
		saidaZULA <= Z_out;
		
		saidaDadosBanco1 <= RA;
		saidaDadosBanco2 <= RB;
		entradaDadosBanco <= saida_mux_lui;
		escreveBanco <= escreve_RC;
		
		MUX_jump <= saida_mux_jump;
		mux_beq  <= saida_mux_beq;
		mux_bne	<= saida_mux_bne;
		
		enderecoA <= RS_addr;
		enderecoC <= saida_mux_rd_rt;

end architecture;
