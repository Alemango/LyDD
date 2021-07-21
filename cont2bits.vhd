----------------------------------------------------------------------------------
-- Company: Universidad Autonoma Metropolitana
-- Engineer: Juan Jesus Aleman Espriella
-- 
-- Create Date:    17:39:28 06/17/2020 
-- Design Name: Contador de 2 Bits
-- Module Name:    cont2bits - Behavioral 
-- Project Name: 
-- Target Devices: AMIBA2
-- Tool versions: 
-- Description: Codificacion VHDL de un contador de dos bitscontruido con dos flip-flops
--					de tipo JK con entrada de Rejoj CLK y salidas Q0 y Q1. 
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

entity cont2bits is
    Port ( CLK0 : in  STD_LOGIC;
           Q0 : out  STD_LOGIC;
           Q1 : out  STD_LOGIC);
end cont2bits;

architecture Behavioral of cont2bits is

	component FFJK is 
		Port ( J : in  STD_LOGIC;
             K : in  STD_LOGIC;
             CLK : in  STD_LOGIC;
             Q : out  STD_LOGIC;
             QN : out  STD_LOGIC);
	end component;
	
	signal Qnn, ALTO: STD_LOGIC;
	
begin

	ALTO <= '1';
	
	u0: FFJK port map (J => ALTO, K => ALTO, CLK => CLK0, Q => Q0, QN => Qnn);
	u1: FFJK port map (J => ALTO, K => ALTO, CLK => Qnn, Q => Q1);

end Behavioral;

