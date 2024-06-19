library ieee;
use ieee.std_logic_1164.all;

entity MODULE is
    port(x: in  STD_LOGIC_VECTOR(3 downto 0);
         y: in  STD_LOGIC_VECTOR(3 downto 0);         
         sum: out STD_LOGIC_VECTOR(3 downto 0);
         cout: out STD_LOGIC
    );
end MODULE;

architecture STRUCT of MODULE is
--##INSERT YOUR CODE HERE  
signal E00, E01, E02, E03, E10, E11, E12, E13, CIN0, CIN1, CIN2, CIN3, SUM0, SUM1, SUM2, SUM3, COUT0, COUT1, COUT2, COUT3: std_logic;

component FULLADD
    port( 
        E0, E1, CIN: in std_logic;
        SUM, COUT: out std_logic
    );
end component;
begin
    U0: FULLADD port map(E00, E10, CIN0, SUM0, COUT0);
    U1: FULLADD port map(E01, E11, CIN1, SUM1, COUT1);
    U2: FULLADD port map(E02, E12, CIN2, SUM2, COUT2);
    U3: FULLADD port map(E03, E13, CIN3, SUM3, COUT3);

    E00 <= x(0);
    E10 <= y(0);
    CIN0 <= '0';
    sum(0) <= SUM0;

    E01 <= x(1);
    E11 <= y(1);
    CIN1 <= COUT0;
    sum(1) <= SUM1;
    
    E02 <= x(2);
    E12 <= y(2);
    CIN2 <= COUT1; 
    sum(2) <= SUM2;

    E03 <= x(3);
    E13 <= y(3);
    CIN3 <= COUT2; 
    sum(3) <= SUM3;

    cout <= COUT3;
--##INSERT YOUR CODE HERE END
end STRUCT;

