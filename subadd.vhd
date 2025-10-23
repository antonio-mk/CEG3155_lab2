library ieee;
use ieee.std_logic_1164.all;

entity subadd is
	port(
	 	A, B: in std_logic_vector(3 downto 0);
        Cin: in std_logic; 
        Sub : in std_logic;
        S: out std_logic_vector(3 downto 0);
        Cout: out std_logic;
        V, Z: out std_logic
        );
	end subadd;    
	
	ARCHITECTURE structural OF subadd IS
	  -- put declarations here.
	  signal P, G: std_logic;
	  signal realB : std_logic_vector(3 downto 0);
	  signal fadderC : std_logic_vector(4 downto 0);
	  signal fadderP : std_logic_vector(3 downto 0);              
	  signal fadderG : std_logic_vector(3 downto 0);
	  signal bitsum : std_logic_vector(3 downto 0);
	  
	BEGIN
		realB(0) <= B(0) xor SUB; 
		realB(1) <= B(1) xor SUB;  
		realB(2) <= B(2) xor SUB;        
		realB(3) <= B(3) xor SUB;     
		
		FA0: entity work.FullAdder(structural)
    port map(A(0), realB(0), fadderC(0), bitsum(0), fadderC(1)); -- fadderC(1) as Cout
		FA1: entity work.FullAdder(structural)
    port map(A(1), realB(1), fadderC(1), bitsum(1), fadderC(2)); -- fadderC(2) as Cout
		FA2: entity work.FullAdder(structural)
    port map(A(2), realB(2), fadderC(2), bitsum(2), fadderC(3)); -- fadderC(3) as Cout
		FA3: entity work.FullAdder(structural)
    port map(A(3), realB(3), fadderC(3), bitsum(3), fadderC(4)); -- fadderC(4) as Cout
		LA: entity work.carrylookahead(structural)
			port map(fadderP,fadderG,Cin,P,G,fadderC);
	
	  -- put concurrent statements here.
	  S <= bitsum;
	  Cout <= fadderC(4);
	  V <= fadderC(4) xor fadderC(3);
	  Z <= not(bitsum(0)) and not(bitsum(1)) and not(bitsum(2)) and not(bitsum(3));
	END ARCHITECTURE structural; -- Of entity 4bitsubadd
	
