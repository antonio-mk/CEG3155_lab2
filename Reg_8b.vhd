library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- input and output are 8 bit std_logic_vectors
-- LOAD is given as the EN signal for the ENDFF
entity Reg_8b is
    port(
        LOAD, CLK: in std_logic;
        INPUT: in std_logic_vector(7 downto 0);
        OUTPUT: out std_logic_vector(7 downto 0)
    );
end Reg_8b;

architecture struct OF Reg_8b is
    signal signalENDFF: std_logic_vector(7 downto 0);
begin
    ENDFF_0: entity work.ENDFF(struct)
        port map(INPUT(0), LOAD, CLK, signalENDFF(0));
     ENDFF_1: entity work.ENDFF(struct)
        port map(INPUT(1), LOAD, CLK, signalENDFF(1));
     ENDFF_2: entity work.ENDFF(struct)
        port map(INPUT(2), LOAD, CLK, signalENDFF(2));
     ENDFF_3: entity work.ENDFF(struct)
        port map(INPUT(3), LOAD, CLK, signalENDFF(3));
     ENDFF_4: entity work.ENDFF(struct)
        port map(INPUT(4), LOAD, CLK, signalENDFF(4));
     ENDFF_5: entity work.ENDFF(struct)
        port map(INPUT(5), LOAD, CLK, signalENDFF(5));
     ENDFF_6: entity work.ENDFF(struct)
        port map(INPUT(6), LOAD, CLK, signalENDFF(6));
     ENDFF_7: entity work.ENDFF(struct)
        port map(INPUT(7), LOAD, CLK, signalENDFF(7));
    OUTPUT <= signalENDFF;
end struct;