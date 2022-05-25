--Fuca Razvan-Ionut--

library ieee;
use ieee.std_logic_1164.all;
use work.VGA_CONSTANTS.all;

entity vSync is
	port(
		CLK25 : in std_logic;
		Reset : in std_logic;
		vPos : in integer;
		VSYNC : out std_logic
	);

end entity;


architecture Behavioral of vSync is

begin
	process(clk25, Reset, vPos) -- Component type : comparator
	begin
		if Reset = '1' then
			VSYNC <= '0';
		elsif clk25'event and clk25 = '1' then
		--checks if cursor is in the sync area--
			if	vPos <= (VD + VFP) or vPos > (VD + VFP + VSP) then
			--if it is, vsync is set to 1--
				VSYNC <= '1';
			else
				VSYNC <= '0';
			end if;
		end if;
	
	end process;
end architecture;