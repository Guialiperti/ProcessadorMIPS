library IEEE;
use ieee.std_logic_1164.all;

entity conversorHex7Seg is
    port
    (
        -- Input ports
		  clk		: in std_logic;
        dadoHex : in  std_logic_vector(15 downto 0);
			enable: in std_logic;
        -- Output ports
        saida7seg0 : out std_logic_vector(6 downto 0); -- := (others => '1')
		  saida7seg1 : out std_logic_vector(6 downto 0);
		  saida7seg2 : out std_logic_vector(6 downto 0);
		  saida7seg3 : out std_logic_vector(6 downto 0)
    );
end entity;

architecture comportamento of conversorHex7Seg is
   --
   --       0
   --      ---
   --     |   |
   --    5|   |1
   --     | 6 |
   --      ---
   --     |   |
   --    4|   |2
   --     |   |
   --      ---
   --       3
   --

  signal rascSaida7seg0: std_logic_vector(6 downto 0);
  signal rascSaida7seg1: std_logic_vector(6 downto 0);
  signal rascSaida7seg2: std_logic_vector(6 downto 0);
  signal rascSaida7seg3: std_logic_vector(6 downto 0);
  
  
  signal dadoHex0: std_logic_vector(3 downto 0);
  signal dadoHex1: std_logic_vector(3 downto 0);
  signal dadoHex2: std_logic_vector(3 downto 0);
  signal dadoHex3: std_logic_vector(3 downto 0);

begin
	dadoHex0 <= dadoHex(3 downto 0);
	dadoHex1 <= dadoHex(7 downto 4);
	dadoHex2 <= dadoHex(11 downto 8);
	dadoHex3 <= dadoHex(15 downto 12);
	
	
    rascSaida7seg0 <=    	 "1000000" when dadoHex0="0000" else ---0
                            "1111001" when dadoHex0="0001" else ---1
                            "0100100" when dadoHex0="0010" else ---2
                            "0110000" when dadoHex0="0011" else ---3
                            "0011001" when dadoHex0="0100" else ---4
                            "0010010" when dadoHex0="0101" else ---5
                            "0000010" when dadoHex0="0110" else ---6
                            "1111000" when dadoHex0="0111" else ---7
                            "0000000" when dadoHex0="1000" else ---8
                            "0010000" when dadoHex0="1001" else ---9
                            "0001000" when dadoHex0="1010" else ---A
                            "0000011" when dadoHex0="1011" else ---B
                            "1000110" when dadoHex0="1100" else ---C
                            "0100001" when dadoHex0="1101" else ---D
									 "0000110" when dadoHex0="1110" else ---E
                            "0001110" when dadoHex0="1111" else ---F
                            "1111111";-- Apaga todos segmentos.
									 
	rascSaida7seg1 <=    	 "1000000" when dadoHex1="0000" else ---0
                            "1111001" when dadoHex1="0001" else ---1
                            "0100100" when dadoHex1="0010" else ---2
                            "0110000" when dadoHex1="0011" else ---3
                            "0011001" when dadoHex1="0100" else ---4
                            "0010010" when dadoHex1="0101" else ---5
                            "0000010" when dadoHex1="0110" else ---6
                            "1111000" when dadoHex1="0111" else ---7
                            "0000000" when dadoHex1="1000" else ---8
                            "0010000" when dadoHex1="1001" else ---9
                            "0001000" when dadoHex1="1010" else ---A
                            "0000011" when dadoHex1="1011" else ---B
                            "1000110" when dadoHex1="1100" else ---C
                            "0100001" when dadoHex1="1101" else ---D
									 "0000110" when dadoHex1="1110" else ---E
                            "0001110" when dadoHex1="1111" else ---F
                            "1111111";-- Apaga todos segmentos.
	
	rascSaida7seg2 <=    	 "1000000" when dadoHex2="0000" else ---0
                            "1111001" when dadoHex2="0001" else ---1
                            "0100100" when dadoHex2="0010" else ---2
                            "0110000" when dadoHex2="0011" else ---3
                            "0011001" when dadoHex2="0100" else ---4
                            "0010010" when dadoHex2="0101" else ---5
                            "0000010" when dadoHex2="0110" else ---6
                            "1111000" when dadoHex2="0111" else ---7
                            "0000000" when dadoHex2="1000" else ---8
                            "0010000" when dadoHex2="1001" else ---9
                            "0001000" when dadoHex2="1010" else ---A
                            "0000011" when dadoHex2="1011" else ---B
                            "1000110" when dadoHex2="1100" else ---C
                            "0100001" when dadoHex2="1101" else ---D
									 "0000110" when dadoHex2="1110" else ---E
                            "0001110" when dadoHex2="1111" else ---F
                            "1111111";-- Apaga todos segmentos.
									 
	rascSaida7seg3 <=    	 "1000000" when dadoHex3="0000" else ---0
                            "1111001" when dadoHex3="0001" else ---1
                            "0100100" when dadoHex3="0010" else ---2
                            "0110000" when dadoHex3="0011" else ---3
                            "0011001" when dadoHex3="0100" else ---4
                            "0010010" when dadoHex3="0101" else ---5
                            "0000010" when dadoHex3="0110" else ---6
                            "1111000" when dadoHex3="0111" else ---7
                            "0000000" when dadoHex3="1000" else ---8
                            "0010000" when dadoHex3="1001" else ---9
                            "0001000" when dadoHex3="1010" else ---A
                            "0000011" when dadoHex3="1011" else ---B
                            "1000110" when dadoHex3="1100" else ---C
                            "0100001" when dadoHex3="1101" else ---D
									 "0000110" when dadoHex3="1110" else ---E
                            "0001110" when dadoHex3="1111" else ---F
                            "1111111";-- Apaga todos segmentos.
									
									 



				saida7seg0 <= rascSaida7seg0;
				saida7seg1 <= rascSaida7seg1;
				saida7seg2 <= rascSaida7seg2;
				saida7seg3 <= rascSaida7seg3;

	
end architecture;