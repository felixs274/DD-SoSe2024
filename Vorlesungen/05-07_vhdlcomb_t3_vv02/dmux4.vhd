library ieee;
use ieee.std_logic_1164.all;

entity dmux4 is
  port (
    S: in std_logic_vector(1 downto 0);
    X: in std_logic;
    Y: out std_logic_vector(3 downto 0)
  ) ;
end dmux4;

architecture BEHAV of dmux4 is
begin
    dmux4proc : process(S, X)
    begin
        Y <= (others => "Z"); -- Define default value
            case S is
                when "00" => Y(0) <= X;
                when "01" => Y(1) <= X;
                when "10" => Y(2) <= X;
                when "11" => Y(3) <= X;
                when others => Y <= (others => "Z");
            end case ;
    end process ; -- dmux4proc
end BEHAV ; -- BEHAV