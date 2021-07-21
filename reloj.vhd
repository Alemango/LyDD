----------------------------------------------------------------------------------
-- Company: UAM Iztapalapa 
-- Engineer: Juan Ramon Jimenez
-- 
-- Create Date: 06/16/2020 05:26:58 PM
-- Design Name: 
-- Module Name: reloj - Behavioral
-- Project Name: 
-- Target Devices: Cualquiera
-- Tool Versions: 
-- Description: Modulo para dividir la frecuencia del reloj de la tarjeta del FPGA 
--              en una frecuencia en función de la señal contador, a mayor valor
--              menor frecuencia. La señal contador cuenta los pulsos del reloj de la
--              tarjeta, es decir cuenta periodos=1/frecuencia. El valor de contador
--					 multiplicado por el periodo de la señal de reloj = 1/2 del periodo de
--              la frecuencia de salida.
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reloj is
    Port ( clk : in STD_LOGIC;
           reloj : out STD_LOGIC);
end reloj;

architecture Behavioral of reloj is
    signal contador : STD_LOGIC_VECTOR (31 downto 0);
    signal salida   : STD_LOGIC;
    
begin
    reloj <= salida;

	process (clk)
	begin
		if clk'event and clk='1' then -- el periodo del reloj es de 10 ns para CLK=100 MHz
			contador<=contador + '1'; -- 5000000 cuentas corresponden
			if contador=50000 then -- con el transcurso de 0.05 s
				salida<=not salida;
				contador<=(others=>'0');
			end if;
		end if;
	end process;

end Behavioral;
