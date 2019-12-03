	library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registradorClock is
    generic (
        larguraDados : natural := 1
    );
    port (
      Q : out std_logic;
      clock, reset : in std_logic
        );
end entity;

architecture comportamento of registradorClock is
begin
    -- In Altera devices, register signals have a set priority.
    -- The HDL design should reflect this priority.
    process (clock, reset)
		begin
			-- Reset whenever the reset signal goes low, regardless of the clock
			if (reset = '0') then
				Q <= '0';
			-- If not resetting, update the register output on the clock's rising edge
			elsif (rising_edge(clock)) then
				Q <= '1';
			end if;
	end process;
	 
end architecture;




	