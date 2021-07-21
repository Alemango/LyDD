----------------------------------------------------------------------------------
-- Company: Universidad Autonoma Metropolitana
-- Engineer: Juan Jesus Aleman Espriella
-- 
-- Create Date:    03:25:40 06/05/2020 
-- Design Name: Decodificador
-- Module Name:    Decodificador - Behavioral 
-- Project Name: 
-- Target Devices: AMIBA2
-- Tool versions: 
-- Description: Codificacion VHDL del modulo encargado de decodificar la entrada de 
--					 valores en el sistema binario para pasarla a valores hexadecimales,
--					 mostrandolos mediante el envio de valores a cada segmento del display.
--					 Se inicio creando una entidad con 4 entradas, las cuales serian los
--					 cuatro interruptores, y 7 salidas, las cuales seria los 7 segmentos del
--					 display elegido. Todas estas entradas y salidas son de tipo logico estandar.
--					 Se instanciaron 5 componentes los cuales son: 
--						La compuerta AND de 4 entradas que se disenio en modulos inferiores 
--               la cual lleva por nombre: AND4IN
--						La compuerta AND de 3 entradas que se disenio en modulos inferiores 
--               la cual lleva por nombre: AND3IN
--						La compuerta NOT de la primer practica: notA
--						La compuerta OR de la primer practica: or1
--						La compuerta AND de la primer practica: and1
--
--					 Junto con esos componentes se declararon seniales suficientes para conectar 
--					 todas las compuertas, asi como para la facil identificacion de los productos.
--
--					 Se inicio haciendo la negacion de cada una de las 4 entradas y guardando
--					 esa informacion en seniales, para poder tener los valores de entrada normales
--					 y los negados, para poder hacer facil su utilizacion.
--
--					 Se utilizaron los diagramas extraidos de los mapas de Karnaugh de las tablas de
--					 verdad de cada segmento, que son suma de productos, para la optimizacion del uso
-- 				 de compuertas en cada circuito logico. Se reutilizaron los productos repetidos.
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

entity Decodificador is
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
end Decodificador;

architecture Behavioral of Decodificador is

	component AND4IN is
		Port ( A : in STD_LOGIC;
				 B : in STD_LOGIC;
				 C : in STD_LOGIC;
				 D : in STD_LOGIC;
				 X : out STD_LOGIC );
	end component;
	
	component AND3IN is
		Port ( MSB : in STD_LOGIC;
				 Middle : in STD_LOGIC;
				 LSB : in STD_LOGIC;
				 XX : out STD_LOGIC );
	end component;
	
	component and1 is
		Port (Aa : in STD_LOGIC;
				Ba : in STD_LOGIC;
				Xa	: out STD_LOGIC);
	end component;
				 
	component notA is
		Port ( An : in STD_LOGIC;
				 Xn : out STD_LOGIC);
	end component;
	
	component or1 is
		Port ( Ao : in STD_LOGIC;
				 Bo : in STD_LOGIC;
				 Xo : out STD_LOGIC);
		end component;

	signal noA, noB, noC, noD, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21: STD_LOGIC;
	
begin

--Entradas Negadas
	
	u0: notA port map (An => entA, Xn => noA);
	u1: notA port map (An => entB, Xn => noB);
	u2: notA port map (An => entC, Xn => noC);
	u3: notA port map (An => entD, Xn => noD);
	
--Segmento a

	u4: AND4IN port map (A => noA, B => entB, C => noC, D => noD, X => p1);
	u5: AND4IN port map (A => noA, B => noB, C => noC, D => entD, X => p2);
	u6: AND4IN port map (A => entA, B => entB, C => noC, D => entD, X => p3);
	u7: AND4IN port map (A => entA, B => noB, C => entC, D => entD, X => p4);
	u8: or1 port map (Ao => p1, Bo => p2, Xo => s1);
	u9: or1 port map (Ao => s1, Bo => p3, Xo => s2);
	u10: or1 port map (Ao => s2, Bo => p4, Xo => SalSegA);
	
--Segmento b

	u11: AND4IN port map (A => noA, B => entB, C => noC, D => entD, X => p5);
	u12: AND3IN port map (MSB => entB, Middle => entC, LSB => noD, XX => p6);
	u13: AND3IN port map (MSB => entA, Middle => entB, LSB => noD, XX => p7);
	u14: AND3IN port map (MSB => entA, Middle => entC, LSB => entD, XX => p8);
	u15: or1 port map (Ao => p5, Bo => p6, Xo => s3);
	u16: or1 port map (Ao => s3, Bo => p7, Xo => s4);
	u17: or1 port map (Ao => s4, Bo => p8, Xo => SalSegB);
	
--Segmento c
	
	u18: AND4IN port map (A => noA, B => noB, C => entC, D => noD, X => p9);
	u19: AND3IN port map (MSB => entA, Middle => entB, LSB => entC, XX => p10);
	u20: or1 port map (Ao => p9, Bo => p10, Xo => s5);
	u21: or1 port map (Ao => s5, Bo => p7, Xo => SalSegC);
	
--Segmento d
	
	u22: AND4IN port map (A => entA, B => noB, C => entC, D => noD, X => p11);
	u23: AND3IN port map (MSB => entB, Middle => entC, LSB => entD, XX => p12);
	u25: or1 port map (Ao => s1, Bo => p11, Xo => s6);
	u26: or1 port map (Ao => s6, Bo => p12, Xo => SalSegD);
	
--Segmento e
	
	u27: AND3IN port map (MSB => noB, Middle => noC, LSB => entD, XX => p13);
	u28: AND3IN port map (MSB => noA, Middle => entB, LSB => noC, XX => p14);
	u29: and1 port map (Aa => noA, Ba => entD, Xa => p15);
	u30: or1 port map (Ao => p13, Bo => p14, Xo => s7);
	u31: or1 port map (Ao => s7, Bo => p15, Xo => SalSegE);
	
--Segmento f
	
	u32: AND3IN port map (MSB => noA, Middle => entC, LSB => entD, XX => p17);
	u33: AND3IN port map (MSB => noA, Middle => noB, LSB => entD, XX => p18);
	u34: AND3IN port map (MSB => noA, Middle => noB, LSB => entC, XX => p19);
	u35: or1 port map (Ao => p3, Bo => p17, Xo => s8);
	u36: or1 port map (Ao => s8, Bo => p18, Xo => s9);
	u37: or1 port map (Ao => s9, Bo => p19, Xo => SalSegF);
	
--Segmento g

	u38: AND4IN port map (A => noA, B => entB, C => entC, D => entD, X => p16);
	u39: AND4IN port map (A => entA, B => entB, C => noC, D => noD, X => p20);
	u40: AND3IN port map (MSB => noA, Middle => noB, LSB => noC, XX => p21);
	u41: or1 port map (Ao => p20, Bo => p16, Xo => s10);
	u42: or1 port map (Ao => s10, Bo => p21, Xo => SalSegG);
	
end Behavioral;

