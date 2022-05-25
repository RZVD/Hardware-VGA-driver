library IEEE;
use IEEE.std_logic_1164.all;
	
package Components is
	component CLK_DIV is
		port(
			Reset :  in std_logic;
			CLK_100: in std_logic;
			CLK_25: out std_logic
		);
		
	end component;	
		
	component hCount is 
		port(
			Clk25 : in std_logic;
			Reset : in std_logic;
			hPos : inout integer;
			Carry : out std_logic
		);
	
	end component;
	
	component vCount is
		port(
			CLK25 : in std_logic;
			Reset : in std_logic;
			Enable : in std_logic;
			vPos : inout integer
		);

	end	component; 
	
	component hSync is 
		port(
			Clk25 : in std_logic;
			Reset : in std_logic;
			hPos : in integer;
			HSYNC : out std_logic
		);
	
	end	component; 
	
	component vSync is
		port(
			CLK25 : in std_logic;
			Reset : in std_logic;
			vPos : in integer;
			VSYNC : out std_logic
		);

	end	component; 
	
	component Video_On is 
	port(
		CLK25 : in std_logic;
		Reset : in std_logic;
		hPos : in integer;
		vPos : in integer;
		videoOn : out std_logic
	);

	end component;
	
		
	component Move is 
		port(
			Clk25 : in std_logic;
			Up	 : in std_logic;
			Down : in std_logic;
			Left : in std_logic;
			Right: in std_logic;
		    X	 : inout integer;
			Y	 : inout integer 
		);	
	end component;	 
	
	component Draw is 
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
	end component;
	
	component colorSet is
		port(
			CLK100 : in std_logic;
			ColorSelect : in std_logic_vector (1 downto 0);
			R_aux:	out	std_logic;
			G_aux :	out	std_logic;
			B_aux:	out std_logic
		);

	end component;
end Components;	 
