----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2026 18:35:10
-- Design Name: 
-- Module Name: tb - Behavioral
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

entity tb is
--  Port ( );
end tb;

architecture Behavioral of tb is


component top is
     Port ( clk_i : in STD_LOGIC;
     btn_i : in STD_LOGIC_VECTOR (3 downto 0);
     sw_i : in STD_LOGIC_VECTOR (7 downto 0);
     led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
     led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
     
end component top;

signal clk_i : STD_LOGIC := '0';
signal btn_i : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal sw_i : STD_LOGIC_VECTOR (7 downto 0) := "00110001";
signal led7_an_o : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal led7_seg_o : STD_LOGIC_VECTOR (7 downto 0) := "00000000";


begin

dut: top port map (
    clk_i => clk_i,
    btn_i => btn_i,
    sw_i => sw_i,
    led7_an_o => led7_an_o,
    led7_seg_o => led7_seg_o
);

stim: process is 
    begin

    btn_i(0) <= '1';
    wait for 1 ms;
    btn_i(0) <= '0';
    sw_i(3 downto 0) <= "0100";
    wait for 2 ms;
    
    btn_i(1) <= '1';
    wait for 1 ms;
    btn_i(1) <= '0';
    sw_i(3 downto 0) <= "0110";
    wait for 2 ms;
    
    btn_i(2) <= '1';
    wait for 1 ms;
    btn_i(2) <= '0';
    sw_i(3 downto 0) <= "1110";
    wait for 2 ms;
    
    btn_i(3) <= '1';
    wait for 1 ms;
    btn_i(3) <= '0';
    sw_i(3 downto 0) <= "0101";
    wait for 2 ms;
    
    sw_i(7 downto 4) <= not sw_i(7 downto 4);

    
    end process stim;
    
clock: process is 
    begin
    wait for 10 ns;
    clk_i <= '0';
    wait for 10 ns;
    clk_i <= '1';
    end process clock;
end Behavioral;
