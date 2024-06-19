entity boolequ is
  port (
    E1: in bit;
    E2: in bit;
    E3: in bit;
    Y1: out bit;
    Y2: out bit;
  ) ;
end boolequ;

architecture BEHAV of boolequ is
begin
    Y1 <= (E1 and E2) or E3;
    Y2 <= (E1 or E2) and E3;
end BEHAV ; 