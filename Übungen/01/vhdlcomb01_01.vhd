entity module is
    port (
        A, B, C: in bit;
        Y: out bit;
    );
end module;

architecture BEHAV of module is
    begin
        Y <= ((not A) and (not B)) or ((not A) and b and (not C)) or (not (A or (not C)))
end BEHAV;