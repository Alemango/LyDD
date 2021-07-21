----------------------------------------------------------------------------------
-- Company: Universidad Autonoma Metropolitana
-- Engineer: Juan Jesus Aleman Espriella
-- 
-- Create Date:    10:10:01 05/10/2020 
-- Design Name: Compuerta AND
-- Module Name:    and1 - Behavioral 
-- Project Name: 
-- Target Devices: AMIBA2
-- Tool versions: 
-- Description: Codificacion VHDL para la compuerta AND. En este modulo se crea una
--					 entidad con 2 entradas y una unica salida, tanto las entradas como la
--					 salida son logicas estandar, y en la arquitectura de la entidad se 
--					 describe su funcionamiento como una multiplicacion logica, en la cual 
--					 la salida presenta un nivel de 1 solo cuando ambas entradas son 1, y un
-- 				 0 en cualquier otro caso.
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

entity and1 is
    Port ( Aa : in  STD_LOGIC;
           Ba : in  STD_LOGIC;
           Xa : out  STD_LOGIC);
end and1;

architecture Behavioral of and1 is

begin
	Xa <= '0' when Aa = '0' and Ba = '0' else 
		   '0' when Aa = '0' and Ba = '1' else 
		   '0' when Aa = '1' and Ba = '0' else 
		   '1' when Aa = '1' and Ba = '1' else 
		   '0';

end Behavioral;

