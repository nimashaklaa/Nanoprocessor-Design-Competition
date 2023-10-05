----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/19/2022 08:00:28 PM
-- Design Name: 
-- Module Name: Slow_Clk - Behavioral
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

entity Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC:='0');
end Slow_Clk;

architecture Behavioral of Slow_Clk is
signal count:integer :=1;
signal clk_status:std_logic:='0';

begin

    process (Clk_in) begin
        if (rising_edge(Clk_in)) then 
        count<=count+1;
        if (count=50000000) then --10 for simulation
            clk_status<=not clk_status;
            Clk_out<=clk_status;
          
            count<=1;
        end if;
       end if;
       end process;


end Behavioral;
