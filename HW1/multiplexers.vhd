-- M11007512 --
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  -- using signed/unsigned. 

entity multiplexers is -- one select, two input and one output.
port(
	S : in std_logic_vector(1 downto 0);
	A : in std_logic_vector(3 downto 0);
	B : in std_logic_vector(3 downto 0);
	Y : out std_logic_vector(7 downto 0) 
);
end multiplexers;

architecture behavior_if of multiplexers is -- using if else.
begin
	process(S, A, B) is -- S, A and B are input signal.
	begin
		if S = "00" then
			Y <= std_logic_vector(unsigned("0000"&A) and unsigned("0000"&B));
		elsif S = "01" then
			Y <= std_logic_vector(unsigned(A) * unsigned(B));
		elsif S = "10" then
			Y <= std_logic_vector(unsigned("0000"&A) + unsigned("0000"&B));
		else
			Y <= std_logic_vector(unsigned("0000"&A) / unsigned("0000"&B));
		end if;
	end process;
end behavior_if;
-- "0000"& -> A and B are 4 bit, but Y is 8 bit.

