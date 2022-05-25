--Fuca Razvan-Ionut--

library ieee;
use ieee.std_logic_1164.all; 
use work.VGA_CONSTANTS.ALL;

entity Move is 
	port(
		Clk25 : in std_logic;
		Reset : in std_logic;
		Up	 : in std_logic;
		Down : in std_logic;
		Left : in std_logic;
		Right: in std_logic;
	    X	 : inout integer;
		Y	 : inout integer 
	);	
end entity;


architecture Behavioral of Move is
signal previousUp, previousDown, previousLeft, previousRight : std_logic := '0';

begin
	process(clk25, UP, DOWN, LEFT, RIGHT, X, Y, reset)	
	begin
	
	--reset moves the shapes to center--
	
	    if Reset = '1' then
			X <= 320;
			Y <= 240;
		end if;
	
		if(clk25'event and clk25 = '1')then
	
			if(UP = '1' and previousUP = '0') then 	  --if the up button is pushed--
						
				if(Y > Radius) then                   --and the shape is within bounds--
					Y <= Y - 5;	                      --update Y coordinate--
				else
					Y <= Radius;                      --otherwise, remain stationary--
				end if;
				
			elsif (DOWN = '1' and previousDOWN = '0') then --if the down button is pushed--
				
				 if(Y < VD - Radius) then                  --and the shape is within bounds--
					Y <= Y + 5;	                           --update Y coordinate--
				else
					Y <= VD - Radius;                      --otherwise, remain stationary--
				end if;
				
			elsif (LEFT = '1' and previousLEFT = '0') then --if the left button is pushed--
				
				 if(X > Radius) then                       --and the shape is within bounds--
					X <= X - 5;	                           --update X coordinate--
				else
					X <= Radius;                           --otherwise, remain stationary--
				end if;
				
			elsif(RIGHT = '1' and previousRIGHT = '0') then  --if the right button is pushed--
				
				if(X < HD - Radius) then                     --and the shape is within bounds--
					X <= X + 5;	                             --update X coordinate--
				else
					X <= HD - Radius;                        --otherwise, remain stationary--
				end if;
				
			end if;
			
			previousUP <= UP;
			previousDOWN <= DOWN;
			previousLEFT <= LEFT;
			previousRIGHT <= RIGHT;
		end if;
	end process;
end architecture;