--Avram Alexandru-Andrei--

library ieee;
use ieee.std_logic_1164.all;

entity colorSet is
	port(
		CLK100 : in std_logic;
		ColorSelect : in std_logic_vector (1 downto 0);
		R_aux:	out	std_logic;
		G_aux :	out	std_logic;
		B_aux:	out std_logic
	);

end entity;

architecture Behavioral of colorSet is
begin			
	process(CLK100, ColorSelect)
	begin
	
	if(clk100'event and clk100 = '1') then
		case ColorSelect is
		--decoding the states for the color--
			when "00" 	=> 
				R_aux <= '1';
				G_aux <= '0';	-- Red
				B_aux <= '0';
			when "01" 	=>
				R_aux <= '0';
				G_aux <= '1'; 	-- Green
				B_aux <= '0'; 
			when "10" 	=>
				R_aux <= '0';
				G_aux <= '0';	-- Blue
				B_aux <= '1';	
			when others =>
				R_aux <= '0';
				G_aux <= '1';  	--Cyan
				B_aux <= '1';
		end case;
	end if;
	end process;
	
end architecture;




