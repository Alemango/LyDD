----------------------------------------------------------------------------------
-- Company: Universidad Autonoma Metropolitana
-- Engineer: Juan Jesus Aleman Espriella
-- 
-- Create Date:    14:59:07 06/17/2020 
-- Design Name: Sumador Paralelo de 4 bits
-- Module Name:    SumadorParalelo - Behavioral 
-- Project Name: 
-- Target Devices: AMIBA2
-- Tool versions: 
-- Description: Sumador paralelo de 4 bits construido a partir de sumadores completos que hicimos
--					en la practica 3, uniendo los acarreos de un sumador al siguiente inmediato. 
--					Tendremos 8 entradas, 4 del numero A y 4 del numero B. Y 5 salidas que son 4 de la
--					sumatoria final y 1 para el acarreo de la sumatoria.
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

entity SumadorParalelo is
    Port ( sA1 : in  STD_LOGIC;
           sA2 : in  STD_LOGIC;
           sA3 : in  STD_LOGIC;
           sA4 : in  STD_LOGIC;
           sB1 : in  STD_LOGIC;
           sB2 : in  STD_LOGIC;
           sB3 : in  STD_LOGIC;
           sB4 : in  STD_LOGIC;
           suma41 : out  STD_LOGIC;
           suma42 : out  STD_LOGIC;
           suma43 : out  STD_LOGIC;
           suma44 : out  STD_LOGIC;
           Cout4 : out  STD_LOGIC);
end SumadorParalelo;

architecture Behavioral of SumadorParalelo is

begin


end Behavioral;

