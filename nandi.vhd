----------------------------------------------------------------------------------
-- Company: Universidad Autonoma Metropolitana
-- Engineer: Juan Jesus Aleman Espriella
-- 
-- Create Date:    00:12:02 06/10/2020 
-- Design Name: Compuerta NAND
-- Module Name:    nandi - Behavioral 
-- Project Name: 
-- Target Devices: AMIBA2
-- Tool versions: 
-- Description: Codificacion VHDL para la compuerta NAND. En este modulo se crea una
--					 entidad con 2 entradas y una unica salida, tanto las entradas como la
--					 salida son logicas estandar, y en la arquitectura de la entidad se 
--					 describe su funcionamiento, en la cual la salida presenta un nivel de 0
--              solo cuando ambas entradas son 1, y un 1 en cualquier otro caso.
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

entity nandi is
    Port ( ant : in  STD_LOGIC;
           Bnt : in  STD_LOGIC;
           xnt : out  STD_LOGIC);
end nandi;

architecture Behavioral of nandi is

begin

    xnt <= '1' when ANT = '0' and BNT = '0' else 
		     '1' when ANT = '0' and BNT = '1' else 
		     '1' when ANT = '1' and BNT = '0' else 
		     '0' when ANT = '1' and BNT = '1' else 
		     '0';

end Behavioral;

