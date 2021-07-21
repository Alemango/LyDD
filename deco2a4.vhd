----------------------------------------------------------------------------------
-- Company: Universidad Autonoma Metropolitana
-- Engineer: Juan Jesus Aleman Espriella
-- 
-- Create Date:    22:54:20 06/08/2020 
-- Design Name: Decodificador 2 a 4
-- Module Name:    deco2a4 - Behavioral 
-- Project Name: 
-- Target Devices: AMIBA2
-- Tool versions: 
-- Description: 
--
-- Dependencies: Codificacion VHDL para un circuito logico de codificador de 2 entradas y 4 salidas, el circuito funcionara a traves de 2 entradas que generaran 4 seniales, 2 seniales directas de entrada y 2 seniales negadas para lo que se utilizara la compuerta NOT, y a traves de 4 compuertas NAND se generaran las combinaciones posibles para encender y apagar los displays.
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

entity deco2a4 is
    Port ( A24 : in  STD_LOGIC;
           B24 : in  STD_LOGIC;
           SAN0 : out  STD_LOGIC;
           SAN1 : out  STD_LOGIC;
           SAN2 : out  STD_LOGIC;
           SAN3 : out  STD_LOGIC);
end deco2a4;

architecture Behavioral of deco2a4 is

    component notA is
	       Port ( An : in  STD_LOGIC;
                 Xn : out  STD_LOGIC);
	 end component;
	 
	 component nandi is
	      Port ( ant : in  STD_LOGIC;
                Bnt : in  STD_LOGIC;
                xnt : out  STD_LOGIC);
	 end component;

    signal a1n, b1n: STD_LOGIC;
begin

    u0: notA port map (An => A24, Xn => a1n);
    u1: notA port map (An => B24, Xn => b1n);

    u2: nandi port map (ant => a1n, Bnt => b1n, xnt => SAN0);
    u3: nandi port map (ant => a1n, Bnt => B24, xnt => SAN1);	
    u4: nandi port map (ant => A24, Bnt => b1n, xnt => SAN2);	 
	 u5: nandi port map (ant => A24, Bnt => B24, xnt => SAN3);

end Behavioral;

