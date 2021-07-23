----------------------------------------------------------------------------------
-- Company: Universidad Autonoma Metropolitana
-- Engineer: Juan Jesus Aleman Espriella
-- 
-- Create Date:    00:46:05 05/19/2020 
-- Design Name: Compuerta AND de 4 entradas
-- Module Name:    AND4IN - Behavioral 
-- Project Name: 
-- Target Devices: AMIBA2
-- Tool versions: 
-- Description: Codificacion VHDL para una compuerta AND de cuatro entradas contruida 
--					 a partir de 3 compuertas AND sencillas, de dos entradas, que se
--					 construyo en la practica anterior y fueron instanciadas usando el
--					 estilo estructural y seniales para el manejo de salidas intermedias
--					 entre compuertas.
--
-- Dependencies: 
--
-- Revision: Revisión en Visual Studio para Git
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

entity AND4IN is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           X : out  STD_LOGIC);
end AND4IN;

architecture Behavioral of AND4IN is

	component and1 is
		Port (Aa : in STD_LOGIC;
				Ba : in STD_LOGIC;
				Xa	: out STD_LOGIC);
	end component;
				 
	signal y1, y2: STD_LOGIC;

begin

	u0 : and1 port map (Aa => A, Ba => B, Xa => y1);
	u1 : and1 port map (Aa => y1, Ba => C, Xa => y2);
	u2 : and1 port map (Aa => y2, Ba => D, Xa => X);

end Behavioral;

