library ieee;
use ieee.std_logic_1164.all;
use work.VGA_CONSTANTS.all;


entity vCount is
	port(
		CLK25 : in std_logic;
		Reset : in std_logic;
		Enable : in std_logic;
		vPos : inout integer
	);

end entity;

architecture Behavioral of vCount is

begin
	process(clk25, Reset)	-- Component type : counter
	begin
		if Reset = '1' then
			vPos <= 0;
		elsif clk25'event and clk25 = '1' then
			if Enable = '1' then
				if vPos = (VD + VSP + VFP + VBP) then
					vPos <= 0;
				else
					vPos <= vPos + 1;
				end if;
			end if;
		end if;
	end process;
	
end architecture;