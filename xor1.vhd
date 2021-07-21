----------------------------------------------------------------------------------
-- Company: Universidad Autonoma Metropolitana
-- Engineer: Juan Jesus Aleman Espriella
-- 
-- Create Date:    10:20:43 05/10/2020 
-- Design Name: Compuerta XOR
-- Module Name:    xor1 - Behavioral 
-- Project Name: 
-- Target Devices: AMIBA2
-- Tool versions: 
-- Description: Codificacion VHDL para la compuerta XOR. En este modulo se crea una
--					 entidad con 2 entradas y una unica salida, tanto las entradas como la
--					 salida son logicas estandar, y en la arquitectura de la entidad se 
--					 describe su funcionamiento como una compuerta OR-exclusiva, en la cual 
--					 la salida presenta un nivel de 1 solo cuando ambas entradas son iguales,
--              dos 0 o dos 1, y un 0 cuando ambas entradas son distintas.
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

entity xor1 is
    Port ( Ax : in  STD_LOGIC;
           Bx : in  STD_LOGIC;
           Xx : out  STD_LOGIC);
end xor1;

architecture Behavioral of xor1 is

begin
	Xx <= '0' when Ax = '0' and Bx = '0' else
		   '1' when Ax = '0' and Bx = '1' else
		   '1' when Ax = '1' and Bx = '0' else
		   '0' when Ax = '1' and Bx = '1' else
		   '0';

end Behavioral;

