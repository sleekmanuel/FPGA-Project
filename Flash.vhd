library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Flash is
	Port ( clk : in STD_LOGIC;
			 Audio : out STD_LOGIC;
			 A14   : out STD_LOGIC
			 );
end Flash;

architecture Behavioral of Flash is
COMPONENT counter30
  PORT (
    clk : IN STD_LOGIC;
    q : OUT STD_LOGIC_VECTOR(29 DOWNTO 0)
  );
END COMPONENT;

COMPONENT DCM32to24
	PORT(
		CLKIN_IN : IN std_logic;          
		CLKFX_OUT : OUT std_logic
		
		
		);
	END COMPONENT;
	
COMPONENT memory
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;

COMPONENT dac8
	PORT(
		Clk : IN std_logic;
		Data : IN std_logic_vector(7 downto 0);          
		PulseStream : out std_logic
		);
	END COMPONENT;
--clk : STD_LOGIC;	
signal count : STD_LOGIC_VECTOR(29 downto 0);
signal mem : STD_LOGIC_VECTOR(7 downto 0);
signal clkout: STD_LOGIC;
begin
	Inst_DCM32to24: DCM32to24 PORT MAP(
		CLKIN_IN =>clk ,
		CLKFX_OUT => clkout
		
	);
addr_counter : counter30
  PORT MAP (
    clk => clk,
    q => count
  );
rom_memory : memory
  PORT MAP (
    clka => clkout,
    addra => count(29 downto 20),
    douta => mem
  );

Inst_dac8: dac8 PORT MAP(
		Clk => clk,
		Data => mem,
		PulseStream => A14
	);

end Behavioral;

