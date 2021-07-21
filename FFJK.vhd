----------------------------------------------------------------------------------
-- Company: Universidad Autonoma Metropolitana
-- Engineer: Juan Jesus Aleman Espriella
-- 
-- Create Date:    15:59:25 06/17/2020 
-- Design Name: Flip Flop JK
-- Module Name:    FFJK - Behavioral 
-- Project Name: 
-- Target Devices: AMIBA2
-- Tool versions: 
-- Description: Codificacion VHDL de un flip flop de tipo JK de 3 entradas y dos salidas.
-- 				Se utiliza una entrada clock con la que generaremos una entrada secuencial,
--					y cada combinacion de las entradas JK nos dara distinta salida.
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

entity FFJK is
    Port ( J : in  STD_LOGIC;
           K : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           QN : out  STD_LOGIC);
end FFJK;

architecture Behavioral of FFJK is

	signal QS : STD_LOGIC := '0';

begin

	process (CLK)
	begin
		if (CLK'event and CLK='1') then -- si hay un flanco de subida
			if (J='0' and K='0') then -- sin cambio de estado
				QS<=QS;
			elsif (J='1' and K='0') then -- poner en SET
				QS<='1';
			elsif (J='0' and K='1') then -- poner en RESET
				QS<='0';
			elsif (J='1' and K='1') then -- conmutar la salida
				QS<=not QS;
			end if;
		end if;
	end process;
	
	Q<=QS; -- se asignan las señales a las salidas reales
	QN<= not QS;

end Behavioral;

