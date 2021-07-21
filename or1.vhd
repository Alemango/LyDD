----------------------------------------------------------------------------------
-- Company: Universidad Autonoma Metropolitana
-- Engineer: Juan Jesus Aleman Espriella
-- 
-- Create Date:    10:15:54 05/10/2020 
-- Design Name: Compuerta OR
-- Module Name:    or1 - Behavioral 
-- Project Name: 
-- Target Devices: AMIBA2
-- Tool versions: 
-- Description: Codificacion VHDL para la compuerta OR. En este modulo se crea una
--					 entidad con 2 entradas y una unica salida, tanto las entradas como la
--					 salida son logicas estandar, y en la arquitectura de la entidad se
--					 describe su funcionamiento como una suma logica, en la cual
--					 la salida presenta un nivel de 0 solo cuando ambas entradas son 0, y un
--					 1 en cualquier otro caso.
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

entity or1 is
    Port ( Ao : in  STD_LOGIC;
           Bo : in  STD_LOGIC;
           Xo : out  STD_LOGIC);
end or1;

architecture Behavioral of or1 is

begin

	Xo <= '0' when Ao = '0' and Bo = '0' else
		   '1' when Ao = '0' and Bo = '1' else
		   '1' when Ao = '1' and Bo = '0' else
		   '1' when Ao = '1' and Bo = '1' else
		   '0';

end Behavioral;

