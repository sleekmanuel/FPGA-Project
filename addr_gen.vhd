LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

LIBRARY work;
USE work.ALL;

ENTITY ADDR_GEN IS
  GENERIC ( C_MAX_DEPTH : INTEGER :=  1024 ;
            RST_VALUE  : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS=> '0');
            RST_INC  : INTEGER := 0);
  PORT (
        CLK         : IN STD_LOGIC;
        RST         : IN STD_LOGIC;
        EN          : IN STD_LOGIC;
        LOAD        :IN STD_LOGIC;
        LOAD_VALUE  : IN STD_LOGIC_VECTOR (31 DOWNTO 0)  := (OTHERS => '0');
        ADDR_OUT    : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)   --OUTPUT VECTOR           
  );
END ADDR_GEN;

ARCHITECTURE BEHAVIORAL OF ADDR_GEN IS
   SIGNAL ADDR_TEMP : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS =>'0');
BEGIN
   ADDR_OUT <= ADDR_TEMP;
   PROCESS(CLK)
   BEGIN
      IF(RISING_EDGE(CLK)) THEN
         IF(RST='1') THEN
    	    ADDR_TEMP<= RST_VALUE + conv_std_logic_vector(RST_INC,32 ); 
         ELSE
            IF(EN='1') THEN
               IF(LOAD='1') THEN
	              ADDR_TEMP <=LOAD_VALUE;
	           ELSE
	              IF(ADDR_TEMP = C_MAX_DEPTH-1) THEN
         	         ADDR_TEMP<= RST_VALUE + conv_std_logic_vector(RST_INC,32 );
	              ELSE
	                 ADDR_TEMP <= ADDR_TEMP + '1';
	              END IF;
	           END IF;
	        END IF;
         END IF;
      END IF;
   END PROCESS;
END ARCHITECTURE;
