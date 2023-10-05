----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/21/2022 04:48:26 PM
-- Design Name: 
-- Module Name: PC_dummy - Behavioral
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

entity PC_dummy is
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           S_in : in STD_LOGIC_VECTOR (2 downto 0);
           Msel : out STD_LOGIC_VECTOR (2 downto 0));
end PC_dummy;

architecture Behavioral of PC_dummy is
component Program_Counter
    Port ( S_in : in STD_LOGIC_VECTOR (2 downto 0);
       Msel : out STD_LOGIC_VECTOR (2 downto 0);
       Clk : in STD_LOGIC;
       Res : in STD_LOGIC);
       end component;
 component Slow_Clk
     Port ( Clk_in : in STD_LOGIC;
        Clk_out : out STD_LOGIC);
        end component;

signal Clk_slow:std_logic;
signal M:std_logic_vector(2 downto 0);
begin
Slow_clk0:Slow_Clk
Port MAP(
    Clk_in=>Clk,
    Clk_out=>Clk_slow);
    
programcounter0:Program_Counter
Port map(
        S_in=>S_in,
        Res=>Res,
        Clk=>Clk_slow,
        Msel=>M);

Msel<=M;
end Behavioral;
