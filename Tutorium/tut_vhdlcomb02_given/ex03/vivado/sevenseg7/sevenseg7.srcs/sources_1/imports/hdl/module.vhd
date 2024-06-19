library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity module is
  port(
    btn: in std_logic_vector(1 downto 0);
    segments: out std_logic_vector(6 downto 0)     
  );
end;

architecture arch of module is
--##INSERT YOUR CODE HERE 

signal data : STD_LOGIC_VECTOR(3 downto 0);

component sevenseg
  port(
    bin: in  STD_LOGIC_VECTOR(3 downto 0);
    segments: out STD_LOGIC_VECTOR(6 downto 0)
  );
end component;

begin

  U0: sevenseg port map(bin => data, segments => segments);

  process(btn)
    begin
      case btn is
        when "11" => data <= "0011";
        when "10" => data <= "0010";
        when "01" => data <= "0001";
        when others => data <= "0000";
      end case;
  end process;
--##INSERT YOUR CODE HERE END
end;
