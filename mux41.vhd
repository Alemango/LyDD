----------------------------------------------------------------------------------
-- Company: Universidad Autonoma Metropolitana
-- Engineer: Juan Jesus Aleman Espriella
-- 
-- Create Date:    01:59:33 06/10/2020 
-- Design Name: Multiplexor 4 a 1 de 4 bits
-- Module Name:    mux41 - Behavioral 
-- Project Name: 
-- Target Devices: AMIBA2
-- Tool versions: 
-- Description: 
--
-- Dependencies: Codificacion VHDL para un multiplexor 4 a 1 construido con 3 multiplexores 2 a 1, contiene 4 entradas y una unica salida, todas de tipo vector y dos entradas de seleccion la cual permitira escoger entre las 4 entradas. Los multiplexores se acomodaran de manera que 2 son independientes con una entrada de selección comun, y el otro multiplexor se compondra de las salidas de los anteriores y una entrada de seleccion distinta a la anterior, la cual nos dara una unica salida de seleccion de 4 bits.
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

entity mux41 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           C : in  STD_LOGIC_VECTOR (3 downto 0);
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           sel0 : in  STD_LOGIC;
           sel1 : in  STD_LOGIC;
           Salida41 : out  STD_LOGIC_VECTOR (3 downto 0));
end mux41;

architecture Behavioral of mux41 is

    component mux214bit is
	     Port ( A4b : in  STD_LOGIC_VECTOR (3 downto 0);
               B4b : in  STD_LOGIC_VECTOR (3 downto 0);
               sel4b : in  STD_LOGIC;
               Sal4b : out  STD_LOGIC_VECTOR (3 downto 0));
	 end component;
	 
	 signal Y0, Y1: STD_LOGIC_VECTOR (3 downto 0);

begin

    u0: mux214bit port map (A4b => A, B4b => B, sel4b => sel0, Sal4b => Y0);
	 u1: mux214bit port map (A4b => C, B4b => D, sel4b => sel0, Sal4b => Y1);
	 
	 u2: mux214bit port map (A4b => Y0, B4b => Y1, sel4b => sel1, Sal4b => Salida41);	 

end Behavioral;

