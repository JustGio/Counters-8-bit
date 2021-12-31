


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counters is
  Port ( clk: in std_logic;
--        rst: in std_logic;
        switch: in std_logic_vector(3 downto 0);
        led: out std_logic_vector(3 downto 0));
end counters;

architecture Behavioral of counters is


signal clk_1hz: std_logic:='0';
signal rst: std_logic:='0';
signal ring_en, bin_en, j_en, fib_en: std_logic:='0';
signal led_temp: std_logic_vector(3 downto 0):="0000";
signal counter: integer:=0;
signal curr_fib: std_logic_vector(3 downto 0):="0000";
signal next_fib: std_logic_vector(3 downto 0):="0001";
begin



process (clk)
begin

if (rising_edge(clk)) then
    case switch is
        when "0000" =>
            bin_en<='0';
            fib_en<='0';
            j_en<='0';
            if (ring_en='0') then
                ring_en<='1';
                led_temp<="1000";
            else
                led_temp(2)<=led_temp(3);
                led_temp(1)<=led_temp(2);
                led_temp(0)<=led_temp(1);
                led_temp(3)<=led_temp(0);
            end if;
        when "0001" =>
            fib_en<='0';
            j_en<='0';
            ring_en<='0';
            if (bin_en='0') then
                bin_en<='1';
                led_temp<="0000";
            end if;
            if (led_temp<9) then
                led_temp<=led_temp + 1;
            else
                led_temp<="0000";
            end if;

        when "0010" =>
            bin_en<='0';
            j_en<='0';
            ring_en<='0';
              if (fib_en = '0') then
                fib_en<='1';
                curr_fib <= "0000";
                next_fib <= "0001";
                led_temp<="0000";
                counter <= 0;
              end if;
              if (counter = 7) then
                    next_fib<="0001";
                    curr_fib<="0000";
                    counter <= 0;
              else
                next_fib <= curr_fib + next_fib;
                curr_fib <= next_fib;
                counter <= counter + 1;
             end if;
            led_temp<=curr_fib;
        when "0100" =>
            fib_en<='0';
            bin_en<='0';
            ring_en<='0';
            if (j_en<='0') then
                j_en<='1';
                led_temp<="0000";
            end if;
             if (counter = 8) then
                led_temp<="0000";
             else
                led_temp(3) <= not led_temp(0);
                led_temp(2) <= led_temp(3);
                led_temp(1) <= led_temp(2);
                led_temp(0)<=led_temp(1);
             end if;
        when others=>
            ring_en<='0';
            fib_en<='0';
            bin_en<='0';
            j_en<='0';
            led_temp<="1111";
        
     end case;
     
end if;     


end process;
led<=led_temp;

end Behavioral;
