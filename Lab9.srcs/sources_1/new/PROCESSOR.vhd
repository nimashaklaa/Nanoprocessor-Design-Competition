----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/26/2022 06:52:16 PM
-- Design Name: 
-- Module Name: PROCESSOR - Behavioral
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

entity PROCESSOR is
    Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC:='0';
           Over_f : out STD_LOGIC;
           R7_led : out STD_LOGIC_VECTOR (3 downto 0);
           R7_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           ZeroF : out STD_LOGIC;
           Anode:out std_logic_vector(3 downto 0):="0111");
end PROCESSOR;

architecture Behavioral of PROCESSOR is
    component Instruction_Decoder 
     Port (   Ins : in STD_LOGIC_VECTOR (11 downto 0);
              RegCh : in STD_LOGIC_VECTOR (3 downto 0);
              RegEN : out STD_LOGIC_VECTOR (2 downto 0);
              LSel : out STD_LOGIC;
              ImVal : out STD_LOGIC_VECTOR (3 downto 0);
              RegSel1 : out STD_LOGIC_VECTOR (2 downto 0);
              AdSel : out STD_LOGIC;
              JMPF : out STD_LOGIC;
              RCAEN:OUT STD_LOGIC:='0';
              Jmadd : out STD_LOGIC_VECTOR (2 downto 0);
              RegSel2 : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component Register_bank 
    Port (     Reg_en : in STD_LOGIC_VECTOR (2 downto 0);
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
    
    component Program_ROM
     Port ( MemSel : in STD_LOGIC_VECTOR (2 downto 0);
              Ins : out STD_LOGIC_VECTOR (11 downto 0));
    end component;
    
    component Program_Counter
    Port (     S_in : in STD_LOGIC_VECTOR (2 downto 0):="000";
               Msel : out STD_LOGIC_VECTOR (2 downto 0):="000";
               Clk : in STD_LOGIC;
               Res : in STD_LOGIC);
    end component;
    
    component RCA_4
     Port ( A :  in STD_LOGIC_VECTOR (3 downto 0);
              B :  in STD_LOGIC_VECTOR (3 downto 0);
              C_in : in STD_LOGIC;
               EN:IN STD_LOGIC:='0';
              S :  out STD_LOGIC_VECTOR (3 downto 0);
              C_out : out STD_LOGIC;
              Z:out std_logic);
    end component;
    
    component Adder_3bi
      Port ( A : in STD_LOGIC_VECTOR (2 downto 0):="000";
             S : out STD_LOGIC_VECTOR (2 downto 0):="000";
             C_out : out STD_LOGIC);
    end component;
    
    component MUX_8_to_1
      Port ( R0 : in STD_LOGIC_VECTOR (3 downto 0);
             R1 : in STD_LOGIC_VECTOR (3 downto 0);
             R2 : in STD_LOGIC_VECTOR (3 downto 0);
             R3 : in STD_LOGIC_VECTOR (3 downto 0);
             R4 : in STD_LOGIC_VECTOR (3 downto 0);
             R5 : in STD_LOGIC_VECTOR (3 downto 0);
             R6 : in STD_LOGIC_VECTOR (3 downto 0);
             R7 : in STD_LOGIC_VECTOR (3 downto 0);
             RegSel : in STD_LOGIC_VECTOR (2 downto 0);
             Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component MUX_2_to_1_3bit
     Port ( J : in STD_LOGIC_VECTOR (2 downto 0):="000";
              A : in STD_LOGIC_VECTOR (2 downto 0):="000";
              JmpF : in STD_LOGIC;
              S_out : out STD_LOGIC_VECTOR (2 downto 0):="000");
    end component;
    
    component MUX_2_to_1_4bit
       Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
            I : in STD_LOGIC_VECTOR (3 downto 0);
            LoadSel : in STD_LOGIC;
            S_out : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component LUT_16_7
      Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
             data : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    component Slow_Clk
     Port ( Clk_in : in STD_LOGIC;
              Clk_out : out STD_LOGIC);
    end component;


signal  Ins :  STD_LOGIC_VECTOR (11 downto 0);
signal ImVal,A,D_reg,A1,A2,R0,R1,R2,R3,R4,R5,R6,R7 :  STD_LOGIC_VECTOR (3 downto 0):="0000";
signal  RegEN,RegSel1,Jmadd,RegSel2,MemSel,ThAd_out:  STD_LOGIC_VECTOR (2 downto 0):="000";
signal S_outPC:STD_LOGIC_VECTOR (2 downto 0):="000";
signal LSel,AdSel,JMPF,ThAd_ov,RCAEN:std_logic;
signal Clk_slow:std_logic;

begin

Slow_Clk_0:Slow_Clk
    port map(
        Clk_in=>CLK,
        Clk_out=>Clk_slow);

Instruction_Decoder_0:Instruction_Decoder
    port map(Ins=>Ins,
             RegCh=>A1,
             ImVal=>ImVal,
             RegEN=>RegEN,
             RegSel1=>RegSel1,
             RCAEN=>RCAEN,
             Jmadd=>Jmadd,
             RegSel2=>RegSel2,
             LSel=>LSel,
             AdSel=>AdSel,
             JMPF=>JMPF);

MUX_2_to_1_4bit_0:MUX_2_to_1_4bit
    PORT MAP(
        A=>A,
        I=>ImVal,
        LoadSel=>LSel,
        S_out=>D_reg);

RCA_4_0:RCA_4
    port map(
        A=>A1,
        B=>A2,
        C_in=>AdSel,
        EN=>RCAEN,
        S=>A,
        C_out=>Over_f,
        Z=>ZeroF);

MUX_8_to_1_0:MUX_8_to_1
    PORT MAP(
        R0=>R0,
        R1=>R1,
        R2=>R2,
        R3=>R3,
        R4=>R4,
        R5=>R5,
        R6=>R6,
        R7=>R7,
        RegSel=>RegSel1,
        Y=>A1);
MUX_8_to_1_1:MUX_8_to_1
     PORT MAP(
        R0=>R0,
         R1=>R1,
         R2=>R2,
         R3=>R3,
         R4=>R4,
         R5=>R5,
         R6=>R6,
         R7=>R7,
        RegSel=>RegSel2,
        Y=>A2);

Adder_3bit:Adder_3bi
    port map(
        A=>MemSel,
        S=>ThAd_out,
        C_out=>ThAd_ov);
        
MUX_2_to_1_3bit_0:MUX_2_to_1_3bit   
    port map(
        A=>ThAd_out,
        J=>Jmadd,
        JmpF=>JMPF,
        S_out=>S_outPC);  

Program_Counter_0:Program_Counter
    PORT MAP(
        S_in=>S_outPC,
        Msel=>MemSel,
        Res=>Reset,
        Clk=>Clk_slow);
        
Program_ROM_0:Program_ROM
    port map(
        MemSel=>MemSel,
        Ins=>Ins);     
        
Register_bank_0:Register_bank
    port map(
        Reg_en=>RegEN,
        Clk=>Clk_slow,
        reset=>Reset,
        Q0=>R0,
        Q1=>R1,
        Q2=>R2,
        Q3=>R3,
        Q4=>R4,
        Q5=>R5,
        Q6=>R6,
        Q7=>R7,
        D=>D_reg);       
        
LUT_16_7_0:LUT_16_7
    PORT MAP(
        address=>R7,
        data=>R7_7Seg);        

R7_led<=R7; 

      
           
end Behavioral;
