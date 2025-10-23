library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity complementTB is
end complementTB;

architecture Behavioral of complementTB is
    signal A8b: std_logic_vector(7 downto 0);
    signal B4b: std_logic_vector(3 downto 0);
    signal A_comp: std_logic_vector(7 downto 0);
    signal B_comp: std_logic_vector(3 downto 0);
begin

    A8b <= "11101100";
    B4b <= "1110";

    complement8: entity work.complement_8b(struct)
        port map(A8b,A_comp);
    
    complement4: entity work.complement_4b(struct)
        port map(B4b,B_comp);

end Behavioral;
