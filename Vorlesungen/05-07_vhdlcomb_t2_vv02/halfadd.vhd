entity halfadd is
  port (
    E0: in bit;
    E1: in bit;
    COUT: out bit;
    SUM: out bit;
  ) ;
end halfadd;

architecture BEHAV of halfadd is
begin
    COUT <= E0 and E1;
    SUM <= E0 xor E1;
end BEHAV ;