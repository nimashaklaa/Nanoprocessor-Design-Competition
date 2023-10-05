----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/21/2022 05:01:20 PM
-- Design Name: 
-- Module Name: PC_sim - Behavioral
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

entity PC_sim is
--  Port ( );
end PC_sim;

architecture Behavioral of PC_sim is
component PC_dummy
    Port ( Clk : in STD_LOGIC;
       Res : in STD_LOGIC;
       S_in : in STD_LOGIC_VECTOR (2 downto 0);
       Msel : out STD_LOGIC_VECTOR (2 downto 0));
       end component;

signal Clk:std_logic:='0';
signal Res:std_logic;
signal S_in,Msel:std_logic_vector(2 downto 0);
begin
uut:PC_dummy
    PORT MAP(
        Clk=>Clk,
        Res=>Res,
        S_in=>S_in,
        Msel=>Msel);

    process
        begin
            wait for 5ns;
            Clk<=not Clk;
    end process;
    
    process
        begin
            Res<='1';
            wait for 50ns;
            
            Res<='0';
            S_in<="001";
            
            wait for 50ns;
            S_in<="111";
            
            wait for 100ns;
            Res<='1';
            
            wait for 50ns;
            S_in<="101";
            
            wait;
            end process;
            

end Behavioral;
