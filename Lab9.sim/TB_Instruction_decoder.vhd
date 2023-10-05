----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/23/2022 05:47:41 PM
-- Design Name: 
-- Module Name: TB_Instruction_decoder - Behavioral
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

entity TB_Instruction_decoder is
--  Port ( );
end TB_Instruction_decoder;

architecture Behavioral of TB_Instruction_decoder is
     component Instruction_decoder 
        Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);
           
            RegCh : in STD_LOGIC_VECTOR (3 downto 0);
            RegEN : out STD_LOGIC_VECTOR (2 downto 0);
            LSel : out STD_LOGIC;
            ImVal : out STD_LOGIC_VECTOR (3 downto 0);
            RegSel1 : out STD_LOGIC_VECTOR (2 downto 0);
            AdSel : out STD_LOGIC;
            JMPF : out STD_LOGIC;
            Jmadd : out STD_LOGIC_VECTOR (2 downto 0);
            RegSel2 : out STD_LOGIC_VECTOR (2 downto 0));     
     end component;


signal Ins : STD_LOGIC_VECTOR (11 downto 0);
signal RegCh :STD_LOGIC_VECTOR (3 downto 0);
signal RegEN :STD_LOGIC_VECTOR (2 downto 0);
signal LSel : STD_LOGIC;
signal ImVal :STD_LOGIC_VECTOR (3 downto 0);
signal RegSel1 :STD_LOGIC_VECTOR (2 downto 0);
signal AdSel :STD_LOGIC;
signal JMPF : STD_LOGIC;
signal Jmadd :STD_LOGIC_VECTOR (2 downto 0);
signal RegSel2 :STD_LOGIC_VECTOR (2 downto 0);

begin
    UUT:Instruction_decoder
        PORT MAP(
                
                Ins=>Ins,
                RegCh=>RegCh,
                RegEN=>RegEN,
                LSel=>Lsel,
                ImVal=>ImVal,
                RegSel1=>RegSel1,
                AdSel=>AdSel,
                JMPF=>JMPF,
                Jmadd=>Jmadd,
                RegSel2=>RegSel2);
         
          
          process
            begin
                Ins<="001111011111";
                wait for 200ns;
                Ins<="101111011111";
                wait for 200ns;
                 Ins<="010111011111";
                 wait for 200ns;
                                  Ins<="111001011111";
                                  RegCh<="0000";
                wait;
                
            end process;


end Behavioral;
