----------------------------------------------------------------------------------
-- Company: Universidad Autonoma Metropolitana
-- Engineer: Juan Jesus leman Espriella
-- 
-- Create Date:    03:42:36 06/05/2020 
-- Design Name: Compuerta AND de 3 entradas
-- Module Name:    AND3IN - Behavioral 
-- Project Name: 
-- Target Devices: AMIBA2
-- Tool versions: 
-- Description: Codificacion VHDL para una compuerta AND de tres entradas contruida 
--					 a partir de 2 compuertas AND sencillas, de dos entradas, que se
--					 construyo en la primer practica y fueron instanciadas usando el
--					 estilo estructural y seniales para el manejo de salidas intermedias
--					 entre compuertas.
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

entity AND3IN is
    Port ( MSB : in  STD_LOGIC;
           Middle : in  STD_LOGIC;
           LSB : in  STD_LOGIC;
           XX : out  STD_LOGIC);
end AND3IN;

architecture Behavioral of AND3IN is

	component and1 is
		Port (Aa : in STD_LOGIC;
				Ba : in STD_LOGIC;
				Xa	: out STD_LOGIC);
		end component;
		
		signal z1: STD_LOGIC;

begin

	u0 : and1 port map (Aa => MSB, Ba => Middle, Xa => z1);
	u1 : and1 port map (Aa => z1, Ba => LSB, Xa => XX);

end Behavioral;

