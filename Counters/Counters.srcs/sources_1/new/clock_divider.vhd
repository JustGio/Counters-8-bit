


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divider is
  Port ( clk: in std_logic;
         rst: in std_logic;
         clk_out: out std_logic );
end clock_divider;

architecture Behavioral of clock_divider is
signal count: integer:=0;
signal clk_temp: std_logic:='0';
begin

process (clk)
begin
    if (rising_edge(clk)) then
        if (rst = '1') then
            count <= 0;
            clk_temp<='0';
        elsif (count > 1) then
            count <= 0;
            clk_temp <= not clk_temp;
        else
            count <= count + 1;
        end if;
    end if;
end process;

clk_out <= clk_temp;
end Behavioral;
