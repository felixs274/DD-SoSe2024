library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MODULE is
  port( CLK, RESET: in std_logic;
        LED0: out std_logic;
        LED1: out std_logic;
        LED2: out std_logic;
        LED3: out std_logic);
end MODULE;

architecture arch of MODULE is
--##INSERT YOUR CODE HERE 


type STATETYPE is (S0, S1, S2, S3, S4, S5);
signal state, nstate : STATETYPE;
signal ticksek : STD_LOGIC;
signal counter : INTEGER := 0;
begin

    -- Process für ticksek signal
    process(CLK, RESET)
    begin
        if RESET = '1' then
            counter <= 0;
            ticksek <= '0';
        elsif CLK = '1' and CLK'event then
            -- if counter = 100000000 - 1 then 
            if counter = 1 - 1 then  -- 1 Hz statt 100 MHz für Simulation 
                ticksek <= '1';
                counter <= 0;
            else
                ticksek <= '0';
                counter <= counter + 1;
            end if;
        end if;
    end process;


    -- Process für Register
    process(CLK, RESET)
    begin
        if RESET = '1' then
            state <= S0;
        elsif rising_edge(CLK) then
            state <= nstate;
        end if;
    end process;


    -- Process für FSM
    process(state, ticksek)
    begin
        -- Default outputs
        LED0 <= '0';
        LED1 <= '0';
        LED2 <= '0';
        LED3 <= '0';
        nstate <= state;  -- Default nstate ist aktueller state

        case state is
          when S0 => LED0 <= '1';
            if ticksek = '1' then
                nstate <= S1;
            end if;
          when S1 => LED1 <= '1';
            if ticksek = '1' then
                nstate <= S2;
            end if;
          when S2 => LED2 <= '1';
            if ticksek = '1' then
                nstate <= S3;
            end if;
          when S3 => LED3 <= '1';
            if ticksek = '1' then
                nstate <= S4;
            end if;
          when S4 => LED2 <= '1';
            if ticksek = '1' then
                nstate <= S5;
            end if;
          when S5 => LED1 <= '1';
            if ticksek = '1' then
                nstate <= S0;
            end if;
          when others =>
            nstate <= S0;
        end case;
      end process;


--##INSERT YOUR CODE HERE END
end;

