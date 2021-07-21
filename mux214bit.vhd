----------------------------------------------------------------------------------
-- Company: Universidad Autonoma Metropolitana
-- Engineer: Juan Jesus Aleman Espriella
-- 
-- Create Date:    01:29:21 06/10/2020 
-- Design Name: Multiplexor 2 a 1 de 4 bits
-- Module Name:    mux214bit - Behavioral 
-- Project Name: 
-- Target Devices: AMIBA2
-- Tool versions: 
-- Description: Codificacion VHDL para un multiplexor 2 a 1 de 4 bits a traves de la cual se integraran 2 entradas de 4 bits cada una y dara una salida igualmente de 4 bits, esto se hara a traves de 4 multiplexores 2 a 1 de un bit, en los cuales se acomodaran las entradas tipo vector, de acuerdo a su posicion para asi lograr la salida, igual en tipo vector, con los datos acomodados de manera correcta. Se usara otra entrada de seleccion y esta sera comun para todos los elementos.
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

entity mux214bit is
    Port ( A4b : in  STD_LOGIC_VECTOR (3 downto 0);
           B4b : in  STD_LOGIC_VECTOR (3 downto 0);
           sel4b : in  STD_LOGIC;
           Sal4b : out  STD_LOGIC_VECTOR (3 downto 0));
end mux214bit;

architecture Behavioral of mux214bit is

    component mux21 is
	       Port ( i0 : in  STD_LOGIC;
                 i1 : in  STD_LOGIC;
		      	  sel : in STD_LOGIC;
                 salida : out  STD_LOGIC);
	 end component;

begin

    u0: mux21 port map (i0 => A4b(0), i1 => B4b(0), sel => sel4b, salida => Sal4b(0));
	 u1: mux21 port map (i0 => A4b(1), i1 => B4b(1), sel => sel4b, salida => Sal4b(1));
    u2: mux21 port map (i0 => A4b(2), i1 => B4b(2), sel => sel4b, salida => Sal4b(2));
	 u3: mux21 port map (i0 => A4b(3), i1 => B4b(3), sel => sel4b, salida => Sal4b(3));
	 
end Behavioral;

