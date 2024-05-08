library ieee;
use ieee.std_logic_1164.all;

entity BIN2GRAY is
  port (
    BIN: in std_logic_vector(2 downto 0);
    GRAY: out std_logic_vector(2 downto 0)
  ) ;
end BIN2GRAY;

architecture BEHAV of BIN2GRAY is
begin
    B2GPROC : process(BIN)
    begin
        case BIN is
            when "000" => GRAY <= "000";
            when "001" => GRAY <= "001";
            when "010" => GRAY <= "011";
            when "011" => GRAY <= "010";
            when "100" => GRAY <= "110";
            when "101" => GRAY <= "111";
            when "110" => GRAY <= "101";
            when "111" => GRAY <= "100";
            when others => GRAY <= "000";
        end case ;
    end process ; 
end BEHAV ;