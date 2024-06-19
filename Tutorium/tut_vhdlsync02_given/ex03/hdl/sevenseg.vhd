library IEEE; 
use IEEE.STD_LOGIC_1164.all;
entity sevenseg is
  port(bin: in  STD_LOGIC_VECTOR(3 downto 0);
    segments: out STD_LOGIC_VECTOR(6 downto 0)
  );
end;

architecture arch of sevenseg is
begin
  process(bin) begin
    case bin is
  --     abcdefg
      when X"0"   => segments <= "1111110";
      when X"1"   => segments <= "0110000";
      when X"2"   => segments <= "1101101";
      when X"3"   => segments <= "1111001";
      when X"4"   => segments <= "0110011";
      when X"5"   => segments <= "1011011";
      when X"6"   => segments <= "1011111";
      when X"7"   => segments <= "1110000";
      when X"8"   => segments <= "1111111";
      when X"9"   => segments <= "1110011";
      when X"A"   => segments <= "1110111";
      when X"B"   => segments <= "0011111";
      when X"C"   => segments <= "0001101";
      when X"D"   => segments <= "0111101";
      when X"E"   => segments <= "1001111";
      when X"F"   => segments <= "1000111";
      when others => segments <= "0000000";
    end case;
  end process;
end;
