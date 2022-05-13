library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;
use work.Utilities.all;

entity Draw is 
	port(
		CLK25 : in std_logic;
		Reset : in std_logic;
		hPos : in integer;
		vPos : in integer;
		drawEnable : in std_logic;
		Selection : in std_logic_vector(1 downto 0);
		X	: in integer;
		Y	: in integer;
		R_aux: in std_logic; 
		G_aux: in std_logic;
		B_aux: in std_logic;
		
		R	:  out std_logic;
		G	:  out std_logic;
		B	:  out std_logic
	);
end entity;


architecture Behavioral of Draw is
	constant Radius: integer := 100;
begin				
	process(clk25, Reset, Selection, hPos, vPos, drawEnable, X, Y)
	begin
		if Reset = '1' then
			R <= '1';
			G <= '1';
			B <= '1';
		elsif clk25'event and clk25 = '1' then
			if drawEnable = '1' then
				case Selection is
					when "00" =>
						if (hPos - X) ** 2 + (vPos - Y) ** 2 <= Radius**2 then
							
							R <= R_aux;
							G <= G_aux;						
							B <= B_aux; 
						else
							R <= '0';								   --Circle
							G <= '0';
							B <= '0';
						end if;
					when "01" =>
						if abs(hPos - X) < Radius and abs(vPos - Y) < Radius then
							R <= R_aux;
							G <= G_aux;								--Square
							B <= B_aux;
						else
							R <= '0';
							G <= '0';
							B <= '0';
						end if;
					when "10" =>
						if  vPos + Radius - 5 - Y >= abs(2 * (hPos - X)) and abs(hPos - X) < Radius and abs(vPos - Y) < Radius then
							R <= R_aux;
							G <= G_aux;						 		--Triangle
							B <= B_aux;
						else
							R <= '0';
							G <= '0';
							B <= '0';
						end if;
					when others =>
						if abs(hPos - X) * abs(vPos - Y) < Radius and abs(hPos - X) < Radius and abs(vPos - Y) < Radius then
						   	R <= R_aux;
							G <= G_aux;						
							B <= B_aux;							   --Cross
						else
							R <= '0';
							G <= '0';
							B <= '0';
						end if;
				end case;
			end if;
		end if;
	end process;	
end architecture;