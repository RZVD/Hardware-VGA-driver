--Avram Alexandru-Andrei--
--Fuca Razvan-Ionut--

library IEEE;
use IEEE.std_logic_1164.all;
entity VGA_Driver is
	
	port(
		CLK100 : in std_logic; --the natural clock from the board
		Reset : in std_logic;
		
		HSYNCport: inout std_logic;
		VSYNCport: inout std_logic;
		
		Up	 : in std_logic;
		Down : in std_logic;
		Left : in std_logic;
		Right: in std_logic;
		
		Selection : in std_logic_vector(1 downto 0);
		Color : in std_logic_vector(1 downto 0);

		R : out std_logic;
		G : out std_logic;
		B : out std_logic
	);

end entity;

architecture Structural of VGA_Driver is

signal CLK25 : std_logic := '0';
signal hPos : integer range 0 to 800 := 320;
signal vPos : integer range 0 to 524 := 240;
signal vEnable : std_logic;
signal vidOn : std_logic;
signal X : integer := 320;
signal Y : integer := 240;
signal R_aux, G_aux, B_aux : std_logic;
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
			Reset : in std_logic;
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

begin

	C1 : CLK_DIV port map(
		Reset, 
		CLK100, 
		CLK25
	);
	
	C2 : hCount port map(
		CLK25,
		Reset, 
		hPos, 
		vEnable
	);	
	
	C3 : vCount port map(
		CLK25,
		Reset, 
		vEnable,
		vPos
	);
	
	C4 : hSync port map(
		CLK25,
		Reset, 
		hPos, 
		HSYNCport
	);
	C5 : vSync port map(
		CLK25, 
		Reset, 
		vPos, 
		VSYNCport
	);	
	C6 : Video_On port map(
		CLK25,
		Reset,
		hPos,
		vPos,
		vidOn
	);
	C7 : colorSet port map(
		CLK100,
		Color,
		R_aux,
		G_aux,
		B_aux
	);
	C8 : Move port map(CLK100,
	    Reset,
		UP,
		DOWN,
		LEFT,
		RIGHT,
		X,
		Y
	);
	C9 : Draw port map(
		CLK25,
		Reset,
		hPos,
		vPos,
		vidOn,
		Selection,
		X,
		Y,
		R_aux,
		G_aux,
		B_aux,
		R,
		G,
		B
	);
	
	
end architecture;