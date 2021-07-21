----------------------------------------------------------------------------------
-- Company: Universidad Autonoma Metropolitana
-- Engineer: Juan Jesus Aleman Espriella
-- 
-- Create Date:    09:59:13 05/10/2020 
-- Design Name: Compuerta Not A
-- Module Name:    notA - Behavioral 
-- Project Name: 
-- Target Devices: AMIBA2
-- Tool versions: 
-- Description: Codificacion VHDL de la compuerta NOT. En este modulo se crea una
-- 		 	 	 entidad de una sola entrada y una unica salida,ambas logicas estandar
--					 en la cual se define su arquitectura para que su funcionamiento sea el 
--					 de cambiar el estado logico de la entrada por su opuesto para su salida
--					 es decir, pasar de 0 a 1, o de 1 a 0.
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

entity notA is
    Port ( An : in  STD_LOGIC;
           Xn : out  STD_LOGIC);
end notA;

architecture Behavioral of notA is

begin
	Xn <= '0' when An = '1' else
		   '1' when An = '0' else
		   '0';

end Behavioral;

