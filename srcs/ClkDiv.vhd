--Avram Alexandru-Andrei--

library IEEE;
use IEEE.std_logic_1164.all; 	
use IEEE.std_logic_unsigned.all;

entity CLK_DIV is

	port(
		Reset :  in std_logic;
		CLK_100: in std_logic;
		CLK_25: out std_logic
	);
	
end entity;

architecture Behavioral of CLK_DIV is

signal NR: integer := 1;	
signal aux: std_logic := '0'; 

begin
	process(CLK_100, Reset) is
	begin 
	--if reset is on, the clock stops--
		if Reset = '1' then aux <= '0';
		else
			if CLK_100'EVENT and CLK_100 = '1' 
				then NR <= NR + 1; 
		   	    --divides the clock by 4--
				if(NR = 2)
					then aux <= not aux;
					NR  <= 1;
				end if;
			end if;
		end if;
		
		CLK_25 <= aux;	
	
	
	end process;
end architecture;