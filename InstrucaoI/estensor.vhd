library ieee;
use ieee.std_logic_1164.all;

entity estensor is
    generic (
        -- Total de bits das entradas e saidas
        larguraDados    : natural  :=   16
    );
    port (
        entrada16    : in  std_logic_vector(larguraDados-1 downto 0);

        saida32   : out std_logic_vector(31 downto 0)
    );
end entity;

architecture comportamento of estensor is

signal zero :  std_logic_vector(15 downto 0);
signal um  : std_logic_vector(15 downto 0);

begin

zero <= "0000000000000000" & entrada16;
um   <= "1111111111111111" & entrada16;


saida32 <= zero when entrada16(16) = '0' else um;

end architecture;