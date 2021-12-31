library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level is
  Port (clk: in std_logic;
        switch_top: in std_logic_vector(3 downto 0);
        led_top: out std_logic_vector(3 downto 0));
end top_level;

architecture Behavioral of top_level is
component clock_divider is
     Port ( clk: in std_logic;
         rst: in std_logic;
         clk_out: out std_logic );
end component clock_divider;


component counters is
  Port ( clk: in std_logic;
--        rst: in std_logic;
        switch: in std_logic_vector(3 downto 0);
        led: out std_logic_vector(3 downto 0));
end component counters;

signal clk_1hz, rst: std_logic:='0';
signal switch, led: std_logic_vector(3 downto 0);
begin

uut1: clock_divider port map(clk=>clk, rst=>rst, clk_out=>clk_1hz);
uut2: counters port map (clk=>clk_1hz, switch=>switch_top, led=>led_top);

rst<='0';
switch<=switch_top;
led_top<=led;


end Behavioral;
