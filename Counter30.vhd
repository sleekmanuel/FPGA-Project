LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
LIBRARY XilinxCoreLib;
-- synthesis translate_on
ENTITY counter30 IS
  PORT (
    clk : IN STD_LOGIC;
    q : OUT STD_LOGIC_VECTOR(29 DOWNTO 0)
  );
END counter30;

ARCHITECTURE counter30_a OF counter30 IS
-- synthesis translate_off
COMPONENT wrapped_counter30
  PORT (
    clk : IN STD_LOGIC;
    q : OUT STD_LOGIC_VECTOR(29 DOWNTO 0)
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_counter30 USE ENTITY XilinxCoreLib.c_counter_binary_v11_0(behavioral)
    GENERIC MAP (
      c_ainit_val => "0",
      c_ce_overrides_sync => 0,
      c_count_by => "1",
      c_count_mode => 0,
      c_count_to => "1",
      c_fb_latency => 0,
      c_has_ce => 0,
      c_has_load => 0,
      c_has_sclr => 0,
      c_has_sinit => 0,
      c_has_sset => 0,
      c_has_thresh0 => 0,
      c_implementation => 0,
      c_latency => 1,
      c_load_low => 0,
      c_restrict_count => 0,
      c_sclr_overrides_sset => 1,
      c_sinit_val => "0",
      c_thresh0_value => "1",
      c_verbosity => 0,
      c_width => 30,
      c_xdevicefamily => "spartan3e"
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_counter30
  PORT MAP (
    clk => clk,
    q => q
  );
-- synthesis translate_on

END counter30_a;
