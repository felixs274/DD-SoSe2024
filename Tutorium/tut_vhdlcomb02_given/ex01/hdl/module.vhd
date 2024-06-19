library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
use ieee.std_logic_unsigned.all; 

entity module is  
  port(
    a, b: in STD_LOGIC_VECTOR(31 downto 0); 
    ALUControl: in STD_LOGIC_VECTOR(1 downto 0); --00 -> A+B, 01->A-B, 10-> AND, 11->OR
    Result:  out STD_LOGIC_VECTOR(31 downto 0); 
    ALUFlags: out STD_LOGIC_VECTOR(2 downto 0)  --(neg zero carry)
  ); 
end; 

architecture behave of module is 
  signal lResult: STD_LOGIC_VECTOR(31 downto 0);
--##INSERT YOUR CODE HERE 
  signal carry: STD_LOGIC;                      -- Carry flag
  signal sum: STD_LOGIC_VECTOR(32 downto 0);    -- Larger vector for sum and carry
  signal neg, zero: STD_LOGIC;                  -- Negative & zero flags
begin 

process(a, b, ALUControl)
begin
  case ALUControl is
    when "00" =>  -- A + B
      sum <= ('0' & a) + ('0' & b);  -- Extend with carry bit
      lResult <= sum(31 downto 0);
      carry <= sum(32);

    when "01" =>  -- A - B
      sum <= ('0' & a) + (not ('0' & b)) + '1';  
      lResult <= sum(31 downto 0);
      carry <= sum(32);

    when "10" =>  -- AND
      lResult <= a AND b;
      carry <= '0';  -- No carry in logical operations

    when "11" =>  -- OR
      lResult <= a OR b;
      carry <= '0';  

    when others =>
      lResult <= (others => '0');
      carry <= '0';
  end case;

  -- Negative flag
  neg <= lResult(31);

  -- Zero flag
  if lResult = "00000000000000000000000000000000" then
    zero <= '1';
  else
    zero <= '0';
  end if;
end process;

--##INSERT YOUR CODE HERE END 
end;
