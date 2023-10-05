----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/21/2022 02:35:35 PM
-- Design Name: 
-- Module Name: TB_MUX_2_to_1_3bit - Behavioral
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

entity TB_MUX_2_to_1_3bit is
--  Port ( );
end TB_MUX_2_to_1_3bit;

architecture Behavioral of TB_MUX_2_to_1_3bit is
    component MUX_2_to_1_3bit
        Port ( J : in STD_LOGIC_VECTOR (2 downto 0);
               A : in STD_LOGIC_VECTOR (2 downto 0);
               JmpF : in STD_LOGIC;
               S_out : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
signal J,A,S_out:STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL JmpF:std_logic;
begin
    UUT:MUX_2_to_1_3bit
    Port Map(J=>J,
            A=>A,
            S_out=>S_out,
            JmpF=>JmpF
        );
    
    process
        begin
            J<="101";
            A<="111";
            JmpF<='0';
            
            wait for 200ns;
            JmpF<='1';
            wait;
        end process;

end Behavioral;
