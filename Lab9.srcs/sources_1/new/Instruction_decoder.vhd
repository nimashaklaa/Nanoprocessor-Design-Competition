----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/23/2022 04:30:58 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);--
      
           RegCh : in STD_LOGIC_VECTOR (3 downto 0);--
           RegEN : out STD_LOGIC_VECTOR (2 downto 0);--
           LSel : out STD_LOGIC:='0';
           ImVal : out STD_LOGIC_VECTOR (3 downto 0);--
           RegSel1 : out STD_LOGIC_VECTOR (2 downto 0);--
           AdSel : out STD_LOGIC;
           JMPF : out STD_LOGIC:='0';
           RCAEN:OUT STD_LOGIC:='0';
           Jmadd : out STD_LOGIC_VECTOR (2 downto 0):="000";--
           RegSel2 : out STD_LOGIC_VECTOR (2 downto 0));--
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is
signal I:std_logic_vector(1 downto 0);
begin
    case1:process(Ins)
    begin
            case Ins(11 downto 10) is
                when "10"=>
                    RegEN<=Ins( 9 downto 7);
                    ImVal<=Ins( 3 downto 0);
                    LSel<='1';
                when "00"=>
                    RegSel1<=Ins(9 downto 7);
                    RegSel2<=Ins(6 downto 4);
                    AdSel<='0';
                    RegEN<=Ins(9 downto 7);
                    LSel<='0';
                    RCAEN<='1';
                    
                when "01"=>
                    RegSel1<=Ins(9 downto 7);
                    RegEN<=Ins(9 downto 7);
                    RegSel2<="000";
                    AdSel<='1';
                    LSel<='0';
                
                 when "11"=>
                    RegSel1<=Ins(9 downto 7);
                    if (RegCh="0000") then
                        JMPF<='1';
                        Jmadd<=Ins(2 downto 0);
                    end if;
                 when others=>
                    
            end case;
            
           
        
       
        end process case1;

end Behavioral;
