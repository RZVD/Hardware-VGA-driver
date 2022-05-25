--Avram Alexandru-Andrei--

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.VGA_CONSTANTS.all;

entity hSync is 
	port(
		Clk25 : in std_logic;
		Reset : in std_logic;
		hPos : in integer;
		HSYNC : out std_logic
	);

end entity;

architecture Behavioral of hSync is

begin
	process(clk25, Reset, hPos)
	begin
		if Reset = '1' then
			HSYNC <= '0';
		elsif clk25'event and clk25 = '1' then
		--checks if cursor is in the sync area--
			if hPos <= (HD + HFP) or hPos > (HD + HFP + HSP) then
			--if it is, hsync is set to 1--
				HSYNC <= '1';
			else 
				HSYNC <= '0';
			end if;
		end if;
	end process;
end architecture;