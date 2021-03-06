library ieee;
use ieee.std_logic_1164.all;
use work.VGA_CONSTANTS.all;

entity hCount is 
	port(
		Clk25 : in std_logic;
		Reset : in std_logic;
		hPos : inout integer;
		Carry : out std_logic
	);

end entity;					 

architecture Behavioral of hCount is


begin
	process(clk25, Reset) 	-- Coponent type : counter
	begin
		if Reset = '1' then 
			hPos <= 0;
		elsif clk25'event and clk25 = '1' then
			if hPos = (HD + HSP + HFP + HBP) then 
				hPos <= 0;
				Carry <= '1';
			else 
				hPos <= hPos + 1;
				Carry <= '0';
			end if;
		end if;
		
	end process;
	
end architecture;
	