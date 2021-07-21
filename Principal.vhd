----------------------------------------------------------------------------------
-- Company: Universidad Autonoma Metropolitana
-- Engineer: Juan Jesus Aleman Espriella
-- 
-- Create Date:    19:41:51 06/18/2020 
-- Design Name: Modulo Principal
-- Module Name:    Principal - Behavioral 
-- Project Name: 
-- Target Devices: AMIBA2
-- Tool versions: 
-- Description: Codificacion VHDL del modulo principal en el cual se instanciaron los modulos contruidos en la practica anterior junto con los ff y los nuevos modulos construidos para esta practica
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

entity Principal is
    Port ( PinA : in  STD_LOGIC_VECTOR (3 downto 0);
           PinB : in  STD_LOGIC_VECTOR (3 downto 0);
           Relojj : in  STD_LOGIC;
           Display : out  STD_LOGIC_VECTOR (3 downto 0);
			  otros : out  STD_LOGIC_VECTOR (3 downto 0);
           SegmA : out  STD_LOGIC;
           SegmB : out  STD_LOGIC;
           SegmC : out  STD_LOGIC;
           SegmD : out  STD_LOGIC;
           SegmE : out  STD_LOGIC;
           SegmF : out  STD_LOGIC;
           SegmG : out  STD_LOGIC);
end Principal;

architecture Behavioral of Principal is

	component Decodificador is
		Port ( entA : in  STD_LOGIC;
           entB : in  STD_LOGIC;
           entC : in  STD_LOGIC;
           entD : in  STD_LOGIC;
           SalSegA : out  STD_LOGIC;
           SalSegB : out  STD_LOGIC;
           SalSegC : out  STD_LOGIC;
           SalSegD : out  STD_LOGIC;
           SalSegE : out  STD_LOGIC;
           SalSegF : out  STD_LOGIC;
           SalSegG : out  STD_LOGIC);
	end component;
	
	component cont2bits is
		 Port ( CLK0 : in  STD_LOGIC;
           Q0 : out  STD_LOGIC;
           Q1 : out  STD_LOGIC);
	end component;
	
	component deco2a4 is
		Port ( A24 : in  STD_LOGIC;
           B24 : in  STD_LOGIC;
           SAN0 : out  STD_LOGIC;
           SAN1 : out  STD_LOGIC;
           SAN2 : out  STD_LOGIC;
           SAN3 : out  STD_LOGIC);
	end component;
	
	component mux41 is
		Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           C : in  STD_LOGIC_VECTOR (3 downto 0);
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           sel0 : in  STD_LOGIC;
           sel1 : in  STD_LOGIC;
           Salida41 : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component sumador4bits is
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
	end component;
	
	component reloj is 
		Port ( clk : in STD_LOGIC;
           reloj : out STD_LOGIC);
	end component;
	
	signal sq0, sq1, zero, rreloj: STD_LOGIC;
	signal ss4, ssal, sc4, sc, sd: STD_LOGIC_VECTOR (3 downto 0);
	
begin

	sc4(1) <= '0';
	sc4(2) <= '0';
	sc4(3) <= '0';

	otros <= "1111";

	u0: cont2bits port map (CLK0 => rreloj, Q0 => sq0, Q1 => sq1);
	u1: deco2a4 port map (A24 => sq0, B24 => sq1, SAN0 => Display(0), SAN1 => Display(1), SAN2 => Display(2), SAN3 => Display(3));
	u2: sumador4bits port map (sA1 => PinA(0), sA2 => PinA(1), sA3 => PinA(2), sA4 => PinA(3), sB1 => PinB(0), sB2 => PinB(1), sB3 => PinB(2), sB4 => PinB(3), suma41 => ss4(0), suma42 => ss4(1), suma43 => ss4(2), suma44 => ss4(3), Cout4 => sc4(0));
	u3: mux41 port map (A => ss4, B => sc4, C => sc, D => sd, sel0 => sq0, sel1 => sq1, Salida41 => ssal);
   u4: Decodificador port map (entA => ssal(3), entB => ssal(2), entC => ssal(1), entD => ssal(0), SalSegA => SegmA, SalSegB => SegmB, SalSegC => SegmC, SalSegD => SegmD, SalSegE => SegmE, SalSegF => SegmF, SalSegG => SegmG);
	u5: reloj port map (clk => Relojj, reloj => rreloj);

end Behavioral;

