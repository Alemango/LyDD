----------------------------------------------------------------------------------
-- Company: Universidad Autonoma Metropolitana
-- Engineer: Juan Jesus Aleman Espriella
-- 
-- Create Date:    02:03:00 05/28/2020 
-- Design Name: Medio Sumador
-- Module Name:    MedioSumador - Behavioral 
-- Project Name: 
-- Target Devices: AMIBA2
-- Tool versions: 
-- Description: Codificacion VHDL de un medio sumador codificado con una compuerta XOR para 
-- 				obtener el valor de la suma binaria de los bits de entrada y una compuerta
-- 				AND para generar el valor del bit de acarreo de la suma. Se utilizo el estilo
-- 				estructural poniendo la compuerta XOR y la compuerta AND conectadas a las
--				 	entradas Ai y Bi. 
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

entity MedioSumador is

    Port ( Ai : in  STD_LOGIC;
           Bi : in  STD_LOGIC;
           SumaMS : out  STD_LOGIC;
           AcarreoMS : out  STD_LOGIC);
			  
end MedioSumador;

architecture Behavioral of MedioSumador is
	
	component and1 is
		Port ( Aa : in STD_LOGIC;
				 Ba : in STD_LOGIC;
				 Xa : out STD_LOGIC);
	end component;
	
	component xor1 is
		Port ( Ax : in STD_LOGIC;
				 Bx : in STD_LOGIC;
				 Xx : out STD_LOGIC);
	end component;
	
begin

	u0: xor1 port map (Ax => Ai, Bx => Bi, Xx => SumaMS);
	u1: and1 port map (Aa => Ai, Ba => Bi, Xa => AcarreoMS);

end Behavioral;

