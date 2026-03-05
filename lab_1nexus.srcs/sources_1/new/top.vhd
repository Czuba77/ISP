----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2026 17:45:04
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is

    Port ( sw_i : in STD_LOGIC_VECTOR (7 downto 0);

           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);

           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));

end top;

architecture Behavioral of top is
    type s_int is range 0 to 15;
    signal numOfOnes : s_int;
begin
    led7_an_o(3) <= '0';
    led7_an_o(2 downto 0) <= "111";
    
    bit_counter: process (sw_i) is  -- licznik jedynek w słowie s
    variable num_bits:s_int;  -- atrybut
    begin							 -- LENGTH
        num_bits := 0;
    L1:	for i in sw_i'range loop       -- atrybut RANGE
            if sw_i(i) = '1' then
                num_bits := num_bits + 1;
            end if;
           end loop L1;
        numOfOnes <= num_bits;
    end process bit_counter;
    
    priority_encoder: process (numOfOnes) is
    begin
        if numOfOnes mod 2 = 0 then
            led7_seg_o <= "01100000";
        else
            led7_seg_o <= "00000010";
        end if;
    end process priority_encoder;
    
end Behavioral;


