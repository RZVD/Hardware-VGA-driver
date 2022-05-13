package VGA_CONSTANTS is
	constant HD : integer := 639;  -- Horizontal Display 
	constant HFP : integer := 16;  -- Front porch
	constant HSP : integer := 96;  -- Sync pulse (Retrace)
	constant HBP : integer := 48;  -- Back porch
	
	constant VD : integer := 479;  -- Vertical Display 
	constant VFP : integer := 10;  -- Front porch
	constant VSP : integer := 2;   -- Sync pulse (Retrace)
	constant VBP : integer := 33;  -- Back porch
	constant Radius: integer := 100; --Used as a radius for drawing and borders
end VGA_CONSTANTS;