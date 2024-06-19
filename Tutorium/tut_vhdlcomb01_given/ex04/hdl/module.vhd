library ieee;
use ieee.std_logic_1164.all;

entity MODULE is
  port(
    a: in  STD_LOGIC_VECTOR(1 downto 0);
    y: out STD_LOGIC_VECTOR(3 downto 0)
  );
end MODULE;

architecture BEHAV of MODULE is
--##INSERT YOUR CODE HERE
begin
  MODULEPROC : process(a)
  begin
    case a is 
      when "00" => Y <= "0000";
      when "01" => Y <= "0010";
      when "10" => Y <= "0100";
      when others => Y <= "1000";
    end case;
  end process ; 
--##INSERT YOUR CODE HERE END
end BEHAV;

