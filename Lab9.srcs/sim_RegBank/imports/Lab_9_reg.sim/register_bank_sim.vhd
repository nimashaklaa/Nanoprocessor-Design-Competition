----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2022 11:50:37 PM
-- Design Name: 
-- Module Name: register_bank_sim - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_bank_sim is
--  Port ( );
end register_bank_sim;

architecture Behavioral of register_bank_sim is
component Register_bank

    Port ( Reg_en : in STD_LOGIC_VECTOR (2 downto 0);
       Clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       Q0 : out STD_LOGIC_VECTOR (3 downto 0);
       Q1 : out STD_LOGIC_VECTOR (3 downto 0);
       Q2 : out STD_LOGIC_VECTOR (3 downto 0);
       Q3 : out STD_LOGIC_VECTOR (3 downto 0);
       Q4 : out STD_LOGIC_VECTOR (3 downto 0);
       Q5 : out STD_LOGIC_VECTOR (3 downto 0);
       Q6 : out STD_LOGIC_VECTOR (3 downto 0);
       Q7 : out STD_LOGIC_VECTOR (3 downto 0);
       D : in STD_LOGIC_VECTOR (3 downto 0));


end component;

signal reset,clk:std_logic:='0';
signal q0,q1,q2,q3,q4,q5,q6,q7,d:std_logic_vector(3 downto 0);
signal reg_en:std_logic_vector(2 downto 0);

begin

UUT :Register_bank
port map(
    Reg_en=>reg_en,
    Q0=>q0,
    Q1=>q1,
    Q2=>q2,
    Q3=>q3,
    Q4=>q4,
    Q5=>q5,
    Q6=>q6,
    Q7=>q7,
    D=>d,
    reset=>reset,
    Clk=>clk
);
process 
begin
Clk <= not(Clk);
wait for 2ns;

end process;

process
begin

reg_en<="000";
d<="1110";   ---200163E=>1101 1110 0011
wait for 100ns;

reg_en<="001";
d<="1110";
wait for 100ns;

reg_en<="010";
d<="1101";
wait for 100ns;

reg_en<="011";
d<="1110";
wait for 100ns;

d<="0011";
wait for 100ns;

reg_en<="111";
d<="1110";
wait for 100ns;

reset<='1';
wait;





end process;
end Behavioral;
