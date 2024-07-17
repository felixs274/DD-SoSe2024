entity mux is
    port(
        A: bit_vector(1 downto 0);
        Y: bit_vector(3 downto 0);
    );
end mux;

architecture BEHAV of mux is
    begin
        case a is
            when "00" => Y <= "0001";
            when "01" => Y <= "0010";
            when "10" => Y <= "0100";
            when others => Y <= "1000";
        end case

end BEHAV;