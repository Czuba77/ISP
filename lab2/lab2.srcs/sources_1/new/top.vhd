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
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           led_o : out STD_LOGIC_VECTOR (2 downto 0));
end top;

architecture Behavioral of top is
    signal cnt_size: integer := 3; 
    signal int_cnt,load_in,cnt_max: std_logic_vector(2 downto 0);
    signal cnt_load: std_logic := '0';
    signal cnt_ena: std_logic := '1';
    signal cnt_down: std_logic := '0';
begin
    
    process (clk_i, rst_i) is
    begin
       if rst_i = '1' then
         int_cnt <= (others => '0');
       elsif rising_edge(clk_i) then
         if cnt_load = '1' then
           int_cnt <= load_in;
         elsif cnt_ena = '1' then
           if cnt_down = '1' then
             if int_cnt = CONV_STD_LOGIC_VECTOR(0, 2) then
               int_cnt <= cnt_max;
             else
               int_cnt <= int_cnt - 1;
             end if;
           else
             if int_cnt = cnt_max then
               int_cnt <= ( others => '0' );
             else
               int_cnt <= int_cnt + 1;
             end if;
           end if;
         end if;
       end if;
    end process;
    
    process (int_cnt) is
    begin
        led_o(0) <= int_cnt(0) xor int_cnt(1);
        led_o(1) <= int_cnt(1) xor int_cnt(2);
        led_o(2) <= int_cnt(2);
    end process;

end Behavioral;


