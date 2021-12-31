


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counters_tb is
--  Port ( );
end counters_tb;

architecture Behavioral of counters_tb is
component counters is
      Port ( clk: in std_logic;
        rst: in std_logic;
        switch: in std_logic_vector(3 downto 0);
        led: out std_logic_vector(3 downto 0));
end component counters;
signal clk_tb, rst_tb: std_logic;
signal switch_tb, led_tb: std_logic_vector(3 downto 0);


begin
uut: counters port map( clk=>clk_tb, rst=>rst_tb, switch=>switch_tb, led=>led_tb);

process
begin
rst_tb<='1';
wait for 8 ns;
rst_tb<='0';
wait;


end process;

process
begin
clk_tb<='0';
wait for 4 ns;
clk_tb<='1';
wait for 4 ns;

end process;

process
begin
switch_tb<="0100";
wait for 24 ns;
wait;
end process;


end Behavioral;
