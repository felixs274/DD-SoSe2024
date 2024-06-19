library ieee;
use ieee.std_logic_1164.all;

entity BIN2GRAY is
    port(
        BIN: in std_logic_vector (2 downto 0);
        GRAY: out std_logic_vector (2 downto 0);
    );
end BIN2GRAY;

architecture BEHAV of BIN2GRAY is
begin
    with BIN select
    GRAY <= "000" when "000",
            "001" when "001",
            "011" when "010",
            "010" when "011",
            "110" when "100",
            "111" when "101",
            "101" when "110",
            "100" when others;
end BEHAV;
