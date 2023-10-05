----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/21/2022 04:34:16 PM
-- Design Name: 
-- Module Name: Program_Counter - Behavioral
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

entity Program_Counter is
    Port ( S_in : in STD_LOGIC_VECTOR (2 downto 0):="000";
           Msel : out STD_LOGIC_VECTOR (2 downto 0):="000";
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC);
end Program_Counter;

architecture Behavioral of Program_Counter is
component D_FF 
    Port ( D : in STD_LOGIC:='0';
       Res : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Q : out STD_LOGIC:='0';
       Qbar : out STD_LOGIC);
       END COMPONENT;

signal Q0,Q1,Q2:STD_LOGIC;
begin
D_FF0:D_FF
    PORT MAP(
        D=>S_in(0),
        Res=>Res,
        Clk=>Clk,
        Q=>MSel(0));
D_FF1:D_FF
    PORT MAP(
    D=>S_in(1),
    Res=>Res,
    Clk=>Clk,
    Q=>MSel(1));

D_FF2:D_FF
    PORT MAP(
    D=>S_in(2),
    Res=>Res,
    Clk=>Clk,
    Q=>MSel(2));
    

    


end Behavioral;
