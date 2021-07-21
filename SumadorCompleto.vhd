----------------------------------------------------------------------------------
-- Company: Universidad Autonoma Metropolitana	
-- Engineer: Juan Jesus Aleman Espriella
-- 
-- Create Date:    02:22:31 05/28/2020 
-- Design Name: Sumador Completo
-- Module Name:    SumadorCompleto - Behavioral 
-- Project Name: 
-- Target Devices: AMIBA2
-- Tool versions: 
-- Description: Codificacion VHDL de un sumador completo consturido mediante la union de
-- 				2 medios sumadores codificados anteriormente. En este sumador se integra una
-- 				nueva entrada que sera la entrada para el acarreo y una compuerta OR donde
--		 			las dos salidas de acarreo de los medios sumadores se suman para generar
-- 				un acarreo de salida general. 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SumadorCompleto is

    Port ( As : in  STD_LOGIC;
           Bs : in  STD_LOGIC;
           AcarreoIN : in  STD_LOGIC;
           SumaSC : out  STD_LOGIC;
           AcarreoSC : out  STD_LOGIC);
			  
end SumadorCompleto;

architecture Behavioral of SumadorCompleto is

	component MedioSumador is
		Port ( Ai : in STD_LOGIC;
				 Bi : in STD_LOGIC;
				 SumaMS : out STD_LOGIC;
				 AcarreoMS : out STD_LOGIC);
	end component;
	
	component or1 is
		Port ( Ao : in STD_LOGIC;
				 Bo : in STD_LOGIC;
				 Xo : out STD_LOGIC);
	end component;
	
	signal s1, c1, c2: STD_LOGIC;
	
begin

	u0: MedioSumador port map (Ai => As, Bi => Bs, SumaMs => s1, AcarreoMS => c1);
	u1: MedioSumador port map (Ai => s1, Bi => AcarreoIN, SumaMS => SumaSC, AcarreoMS => c2); 
	u2: or1 port map (Ao => c1, Bo => c2, Xo => AcarreoSC);
	
end Behavioral;

