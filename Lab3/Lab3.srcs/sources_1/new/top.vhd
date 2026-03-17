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
     btn_i : in STD_LOGIC_VECTOR (3 downto 0);
     sw_i : in STD_LOGIC_VECTOR (7 downto 0);
     led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
     led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
     
end top;


architecture Behavioral of top is
     signal digit_i : std_logic_vector(31 downto 0) := (others => '1');  
     signal clk_div : std_logic := '0';
     signal rst_i : std_logic := '0';
     signal q : std_logic_vector(17 downto 0) := (others => '0');  
    function seven_seg(data_in: std_logic_vector(3 downto 0)) return std_logic_vector is
        variable tmp : std_logic_vector(6 downto 0);      
    begin
    --      0
    --     --- 
    --  5 |   | 1
    --     ---   <- 6
    --  4 |   | 2
    --     ---
    --      3
    case data_in is 
       when "0001" => tmp := "1111001";   --1
       when "0010" => tmp := "0100100";   --2
       when "0011" => tmp := "0110000";   --3
       when "0100" => tmp := "0011001";   --4
       when "0101" => tmp := "0010010";   --5
       when "0110" => tmp := "0000010";   --6
       when "0111" => tmp := "1111000";   --7
       when "1000" => tmp := "0000000";   --8
       when "1001" => tmp := "0010000";   --9
       when "1010" => tmp := "0001000";   --A
       when "1011" => tmp := "0000011";   --b
       when "1100" => tmp := "1000110";   --C
       when "1101" => tmp := "0100001";   --d
       when "1110" => tmp := "0000110";   --E
       when "1111" => tmp := "0001110";   --F
       when others => tmp := "1000000";   --0
    end case;
    return (tmp);
    end function seven_seg;
    
    begin
    
    lightup: process(clk_div) is
        variable pick_anode : integer := 0;
    begin
    
    
    
    if rising_edge(clk_div) then
        led7_an_o <= "1111";
        led7_an_o(pick_anode) <= '0';
        led7_seg_o <= digit_i(7+pick_anode*8 downto 0+pick_anode*8);
        pick_anode := (pick_anode + 1) mod 4;
    end if;
    end process; 
    
    decode: process(btn_i) is 
    begin
    
    if btn_i(0) = '1' then digit_i(6 downto 0)   <= seven_seg(sw_i(3 downto 0)); end if;
    if btn_i(1) = '1' then digit_i(14 downto 8)  <= seven_seg(sw_i(3 downto 0)); end if;
    if btn_i(2) = '1' then digit_i(22 downto 16) <= seven_seg(sw_i(3 downto 0)); end if;
    if btn_i(3) = '1' then digit_i(30 downto 24) <= seven_seg(sw_i(3 downto 0)); end if;
    
    digit_i(7) <= not sw_i(4);
    digit_i(15) <= not sw_i(5);
    digit_i(23) <= not sw_i(6);
    digit_i(31) <= not sw_i(7);

    end process; 
    
    clock_div: process(clk_i, rst_i)
    begin
       if (rst_i = '1') then
          q <= ( others => '0');
          clk_div <= '0';
       elsif rising_edge(clk_i) then
          q <= q + 1;
          if (q = 9) then
             q <= ( others => '0');
        clk_div <= '0';
          end if;
          if (q = 4) then
             clk_div <= '1';
          end if;
       end if;
    end process;


    
end Behavioral;


