----------------------------------------------------------------------------------
-- Company: Universidad Autonoma Metropolitana
-- Engineer: Juan Jesus Aleman Espriella
-- 
-- Create Date:    00:47:46 06/10/2020 
-- Design Name: Multiplexor 2 a 1
-- Module Name:    mux21 - Behavioral 
-- Project Name: 
-- Target Devices: AMIBA2
-- Tool versions: 
-- Description: Codificacion VHDL para un multiplexor 2 a 1, en el cual contiene 3 entradas, 2 de las cuales son las que el multiplexor habilitara o deshabilitara a través de 2 compuertas AND y otra entrada de seleccion, la salida de estas AND de habilitación se sumara en una OR que nos dara la salida final
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

entity mux21 is
    Port ( i0 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
			  sel : in STD_LOGIC;
           salida : out  STD_LOGIC);
end mux21;

architecture Behavioral of mux21 is

    component notA is
	       Port ( An : in  STD_LOGIC;
                 Xn : out  STD_LOGIC);
	 end component;
	 
	 component and1 is
	       Port ( Aa : in  STD_LOGIC;
                 Ba : in  STD_LOGIC;
                 Xa : out  STD_LOGIC);
	 end component;
	 
	 component or1 is
	       Port ( Ao : in  STD_LOGIC;
                 Bo : in  STD_LOGIC;
                 Xo : out  STD_LOGIC);
	 end component;

    signal nosel, si0, si1: STD_LOGIC;
	 
begin

    u0: notA port map (An => sel, Xn => nosel);
	 
	 u1: and1 port map (Aa => i0, Ba => nosel, Xa => si0);
    u2: and1 port map (Aa => i1, Ba => sel, Xa => si1);
	 
	 u3: or1 port map (Ao => si0, Bo => si1, Xo => salida);

end Behavioral;

