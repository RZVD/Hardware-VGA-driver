--Fuca Razvan-Ionut--

library ieee;
use ieee.std_logic_1164.all;
use work.VGA_CONSTANTS.all;
entity Video_On is 
	port(
		CLK25 : in std_logic;
		Reset : in std_logic;
		hPos : in integer;
		vPos : in integer;
		videoOn : out std_logic
	);

end entity;

architecture Behavioral of Video_On is
begin			
	process(clk25, Reset, hPos, vPos)
	begin
		if Reset = '1' then
			videoOn <= '0';
		elsif clk25'event and clk25 = '1' then
			if hPos <= HD and vPos <= VD then
				videoOn <= '1';	 
			else 
				videoOn <= '0';
			end if;
		end if;
	end process;
	
end architecture;