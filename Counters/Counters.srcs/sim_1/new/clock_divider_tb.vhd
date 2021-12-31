


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divider_tb is
--  Port ( );
end clock_divider_tb;

architecture Behavioral of clock_divider_tb is
component clock_divider is
    Port ( clk: in std_logic;
         rst: in std_logic;
         clk_out: out std_logic );
end component clock_divider;
signal clk_tb, rst_tb, clk_out_tb: std_logic;


begin

uut: clock_divider port map  (clk=>clk_tb, rst=>rst_tb, clk_out=>clk_out_tb);


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


end Behavioral;
