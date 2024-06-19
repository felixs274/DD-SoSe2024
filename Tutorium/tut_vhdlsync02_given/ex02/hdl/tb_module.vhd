library ieee;
use ieee.std_logic_1164.all;

entity TB_MODULE is
end TB_MODULE;

architecture TESTBENCH of TB_MODULE is
  constant tbase: time:=10 ns;
  constant tcheck: time:=1 ns;
  signal TB_CLK: std_logic;

  component MODULE
  port( CLK, RESET: in std_logic;
        LED0: out std_logic;
        LED1: out std_logic;
        LED2: out std_logic;
        LED3: out std_logic);
  end component;
  signal TB_RESET: std_logic;
  signal TB_LED0, TB_LED1, TB_LED2, TB_LED3: std_logic;
  signal expTB_LED0, expTB_LED1, expTB_LED2, expTB_LED3: std_logic;
begin

  CLOCK: process 
    begin 
     TB_CLK <='1';
     wait for tbase/2;
     TB_CLK <='0';
     wait for tbase/2;
  end process CLOCK;

  DUT: MODULE port map(TB_CLK, TB_RESET, TB_LED0, TB_LED1, TB_LED2, TB_LED3);

  STIMULI: process 
  begin
    TB_RESET<='1','0' after 1*tbase, '0' after 2*tbase;
 
    expTB_LED0<='1', '1' after 1*tbase, '1' after 2*tbase, '0' after 3*tbase, 
          '0' after  4*tbase, '0' after  5*tbase, '0' after  6*tbase, '0' after  7*tbase,
          '0' after  8*tbase, '0' after  9*tbase, '0' after 10*tbase, '0' after 11*tbase,
          '0' after 12*tbase, '1' after 13*tbase, '1' after 14*tbase, '0' after 15*tbase; 
    expTB_LED1<='0', '0' after 1*tbase, '0' after 2*tbase, '1' after 3*tbase, 
          '1' after  4*tbase, '0' after  5*tbase, '0' after  6*tbase, '0' after  7*tbase,
          '0' after  8*tbase, '0' after  9*tbase, '0' after 10*tbase, '1' after 11*tbase,
          '1' after 12*tbase, '0' after 13*tbase, '0' after 14*tbase, '0' after 15*tbase; 
    expTB_LED2<='0', '0' after 1*tbase, '0' after 2*tbase, '0' after 3*tbase, 
          '0' after  4*tbase, '1' after  5*tbase, '1' after  6*tbase, '0' after  7*tbase,
          '0' after  8*tbase, '1' after  9*tbase, '1' after 10*tbase, '0' after 11*tbase,
          '0' after 12*tbase, '0' after 13*tbase, '0' after 14*tbase, '0' after 15*tbase; 
    expTB_LED3<='0', '0' after 1*tbase, '0' after 2*tbase, '0' after 3*tbase, 
          '0' after  4*tbase, '0' after  5*tbase, '0' after  6*tbase, '1' after  7*tbase,
          '1' after  8*tbase, '0' after  9*tbase, '0' after 10*tbase, '0' after 11*tbase,
          '0' after 12*tbase, '0' after 13*tbase, '0' after 14*tbase, '0' after 15*tbase;
    wait; -- end simulation
  end process STIMULI;  

  --simmuli templates
  --STIMULI: process 
  --begin
      --TB_A<=0', '0' after 1*tbase, '0' after 2*tbase, '0' after 3*tbase, 
      --     '0' after  4*tbase, '0' after  5*tbase, '0' after  6*tbase, '0' after  7*tbase,
      --     '1' after  8*tbase, '1' after  9*tbase, '1' after 10*tbase, '1' after 11*tbase,
      --     '1' after 12*tbase, '1' after 13*tbase, '1' after 14*tbase, '1' after 15*tbase; 
      --TB_B<='0', '0' after 1*tbase, '0' after 2*tbase, '0' after 3*tbase, 
      --     '1' after  4*tbase, '1' after  5*tbase, '1' after  6*tbase, '1' after  7*tbase,
      --     '0' after  8*tbase, '0' after  9*tbase, '0' after 10*tbase, '0' after 11*tbase,
      --     '1' after 12*tbase, '1' after 13*tbase, '1' after 14*tbase, '1' after 15*tbase;
      --TB_C<='0', '0' after 1*tbase, '1' after 2*tbase, '1' after 3*tbase, 
      --     '0' after  4*tbase, '0' after  5*tbase, '1' after  6*tbase, '1' after  7*tbase,
      --     '0' after  8*tbase, '0' after  9*tbase, '1' after 10*tbase, '1' after 11*tbase,
      --     '0' after 12*tbase, '0' after 13*tbase, '1' after 14*tbase, '1' after 15*tbase;
      --TB_D<='0', '1' after 1*tbase, '0' after 2*tbase, '1' after 3*tbase, 
      --     '0' after  4*tbase, '1' after  5*tbase, '0' after  6*tbase, '1' after  7*tbase,
      --     '0' after  8*tbase, '1' after  9*tbase, '0' after 10*tbase, '1' after 11*tbase,
      --     '0' after 12*tbase, '1' after 13*tbase, '0' after 14*tbase, '1' after 15*tbase;
      --expTB_bus<="0000", "0001" after 1*tbase, "0010" after 2*tbase, 
      --   "0011" after  3*tbase, "0100" after  4*tbase, "0101" after  5*tbase, 
      --   "0110" after  6*tbase, "0111" after  7*tbase, "1000" after  8*tbase, 
      --   "1001" after  9*tbase, "1010" after 10*tbase, "1011" after 11*tbase,
      --   "1100" after 12*tbase, "1101" after 13*tbase, "1110" after 14*tbase, 
      --   "1111" after 15*tbase;
      --expTB_buxhex<=x"0", x"1" after 1*tbase, x"2" after 2*tbase, x"3" after 3*tbase, 
      --   x"4" after  4*tbase, x"5" after  5*tbase, x"6" after  6*tbase, x"7" after  7*tbase,  
      --   x"8" after  8*tbase, x"9" after  9*tbase, x"A" after 10*tbase, x"B" after 11*tbase,
      --   x"C" after 12*tbase, x"D" after 13*tbase, x"E" after 14*tbase, x"F" after 15*tbase;
  --end process STIMULI;  

end TESTBENCH;
