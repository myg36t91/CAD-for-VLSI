-- m11007512 --
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; -- 做 mult 與 add 使用 unsigned

entity sum_of_product is -- 宣告腳位
	port(
		clk : in std_logic;
		A: in std_logic_vector(7 downto 0);
		B: in std_logic_vector(7 downto 0);
		C: out std_logic_vector(15 downto 0);
		en : in std_logic;
		input_valid: in boolean;
		output_valid: out boolean
	);
end sum_of_product;

architecture reg of sum_of_product is -- 建立 7 個 register
signal reg_1: std_logic_vector(7 downto 0); 
signal reg_2: std_logic_vector(7 downto 0);
signal reg_4: std_logic_vector(15 downto 0);
signal reg_6: std_logic_vector(15 downto 0);
signal reg_3: boolean;
signal reg_5: boolean;
signal reg_7: boolean;
begin
	process(clk, en)
	begin
		if(clk'event and clk='1') then -- rising edge
			if(en='1') then
				reg_1 <= A;
				reg_2 <= B;
				reg_4 <= reg_1 * reg_2; -- A*B
				reg_6 <= reg_4 + reg_6; -- A*B + reg_6(輸出拉回來做輸入)
				reg_3 <= input_valid;
				reg_5 <= reg_3;
				reg_7 <= reg_5;
			end if;
		end if;
	end process;
	C <= reg_6; -- 最終輸出結果
	output_valid <= reg_7;
end reg;