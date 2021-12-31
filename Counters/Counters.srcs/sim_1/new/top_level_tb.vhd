library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level_tb is
--  Port ( );
end top_level_tb;

architecture Behavioral of top_level_tb is
component top_level is
     Port (clk_top: in std_logic;
        switch_top: in std_logic_vector(3 downto 0);
        led_top: out std_logic_vector(3 downto 0));
end component top_level;
signal clk_tb: std_logic;
signal switch_top_tb, led_top_tb: std_logic_vector(3 downto 0);
begin

uut: top_level port map (clk_top=>clk_tb, switch_top=>switch_top_tb, led_top=>led_top_tb);


process
begin
clk_tb<='0';
wait for 4 ns;
clk_tb<='1';
wait for 4 ns;

end process;

process
begin
switch_top_tb<="0000";
wait for 200 ns;
switch_top_tb<="0001";
wait for 200 ns;
switch_top_tb<="0010";
wait for 200 ns;
switch_top_tb<="0100";
wait for 200 ns;
switch_top_tb<="1100";
wait;

end process;

end Behavioral;
