library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- MUX 4 to 1
-- Truth table:
-- Sel1     Sel2    output
--   0       0       IN0
--   0       1       IN2
--   1       0       IN1
--   1       1       IN3
entity MUX4to1 is
    port(
        IN0, IN1, IN2, IN3: in std_logic;
        Sel1, Sel2: in std_logic;
        OUTPUT: out std_logic
    );
end MUX4to1;

architecture struct of MUX4to1 is
    signal signalMUX1, signalMUX2: std_logic;
begin
    MUX1: entity work.MUX2to1(struct)
        port map(IN0, IN1, Sel1, signalMUX1);
    MUX2: entity work.MUX2to1(struct)
        port map(IN2, IN3, Sel1, signalMUX2);
    MUX3: entity work.MUX2to1(struct)
        port map(signalMUX1, signalMUX2, Sel2, OUTPUT);
end ;
