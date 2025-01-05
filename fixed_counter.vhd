```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fixed_counter is
  port (
    clk : in std_logic;
    rst : in std_logic;
    count : out integer range 0 to 15
  );
end entity fixed_counter;

architecture behavioral of fixed_counter is
  signal internal_count : unsigned(3 downto 0) := (others => '0'); -- Use unsigned type
begin
  process (clk, rst)
  begin
    if rst = '1' then
      internal_count <= (others => '0');
    elsif rising_edge(clk) then
      if internal_count = to_unsigned(15,4) then  -- Check for maximum value using unsigned comparison
          internal_count <= (others => '0');
      else
        internal_count <= internal_count + 1;
      end if;
    end if;
  end process;
  count <= to_integer(internal_count); -- Convert back to integer for output
end architecture; 
```