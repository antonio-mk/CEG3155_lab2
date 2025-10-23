library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fixedPointALU is
 Port (
    OperationSelect: in std_logic_vector(1 downto 0);
    OperandA, OperandB: in std_logic_vector(3 downto 0);
    Greset, CLK: in std_logic;
    MUXout: out std_logic_vector(7 downto 0);
    CarryOut, ZeroOut, OverflowOut: out std_logic
 );
end fixedPointALU;

architecture struct of fixedPointALU is
    signal adderOUT, subtractorOUT, signedmultiplierOUT, signeddividerOUT: std_logic_vector(7 downto 0);
    signal adderCarryout, subtractorCarryout, adderOverflowout, subtractorOverflowout: std_logic;
    signal signalMUXOUT: std_logic_vector(7 downto 0);
begin
    ADDER: entity work.adder(struct)
        port map(OperandA, OperandB, adderOUT, adderCarryout, adderOverflowout);

    SUBTRACTOR: entity work.subtractor(Struct)
        port map(OperandA, OperandB, subtractorOUT, subtractorCarryout, subtractorOverflowout);

    MULTIPLIER: entity work.signedMultiplier(struct)
        port map(OperandA, OperandB, Greset, CLK, signedmultiplierOUT);

    DIVIDER: entity work.signedDivider(struct)
        port map(OperandA, OperandB, Greset, CLK, signeddividerOUT);

    CarryOutMUX: entity work.MUX4to1(struct)
        port map(adderCarryout, '0', subtractorCarryout, '0', OperationSelect(1), OperationSelect(0), CarryOut);

    OverflowOutMUX: entity work.MUX4to1(struct)
        port map(adderOverflowout, '0', subtractorOverflowout, '0', OperationSelect(1), OperationSelect(0), OverflowOut);

    ALUOUTMUX: entity work.MUX4to1_8b(struct)
        port map(adderOUT, signedmultiplierOUT, subtractorOUT, signeddividerOUT, OperationSelect(1), OperationSelect(0), signalMUXOUT);

    ZeroOutNOR: entity work.NORGATE_8b(struct)
        port map(signalMUXOUT, ZeroOut);

    MUXout <= signalMUXOUT;

end ;
