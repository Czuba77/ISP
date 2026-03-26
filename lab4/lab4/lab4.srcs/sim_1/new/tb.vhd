----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.03.2026 19:27:09
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
     rst_i : in STD_LOGIC;
     RXD_i : in STD_LOGIC;
     led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
     led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end component top;

    signal clk_i : STD_LOGIC := '0';
    signal rst_i : STD_LOGIC := '0';
    signal RXD_i : STD_LOGIC := '1';
    signal led7_an_o : STD_LOGIC_VECTOR (3 downto 0):= (others => '1');  
    signal led7_seg_o : STD_LOGIC_VECTOR (7 downto 0):= (others => '1');  
    
begin

duty: top port map (
    clk_i      => clk_i,
    rst_i      => rst_i,
    RXD_i      => RXD_i,
    led7_an_o  => led7_an_o,
    led7_seg_o => led7_seg_o
);

sim: process is
    begin
    
    wait for 10 ms;
    rst_i <= '1';
    wait for 1 ms;
    rst_i <= '0';
    
    wait for 1 ms;
    RXD_i <= '0';
    wait for 104166 ns;
    
    RXD_i <= '1';
    wait for 104166 ns;
    RXD_i <= '1';
    wait for 104166 ns;
    RXD_i <= '0';
    wait for 104166 ns;
    RXD_i <= '0';
    wait for 104166 ns;
    
    RXD_i <= '1';
    wait for 104166 ns;
    RXD_i <= '0';
    wait for 104166 ns;
    RXD_i <= '1';
    wait for 104166 ns;
    RXD_i <= '0';
    wait for 104166 ns;
    
    RXD_i <= '1';
    wait for 104166 ns;
    RXD_i <= '1';
    wait for 104166 ns;
    
    wait for 10 ms;
    rst_i <= '1';
    wait for 1 ms;
    rst_i <= '0';
    
    wait for 1 ms;
    RXD_i <= '0';
    wait for 108332 ns;
    
    RXD_i <= '1';
    wait for 108332 ns;
    RXD_i <= '1';
    wait for 108332 ns;
    RXD_i <= '0';
    wait for 108332 ns;
    RXD_i <= '0';
    wait for 108332 ns;
    
    RXD_i <= '1';
    wait for 108332 ns;
    RXD_i <= '0';
    wait for 108332 ns;
    RXD_i <= '1';
    wait for 108332 ns;
    RXD_i <= '0';
    wait for 108332 ns;
    
    RXD_i <= '1';
    wait for 108332 ns;
    RXD_i <= '1';
    wait for 108332 ns;
    
    
    wait for 10 ms;
    rst_i <= '1';
    wait for 1 ms;
    rst_i <= '0';
    
    wait for 1 ms;
    RXD_i <= '0';
    wait for 100000 ns;
    
    RXD_i <= '1';
    wait for 100000 ns;
    RXD_i <= '1';
    wait for 100000 ns;
    RXD_i <= '0';
    wait for 100000 ns;
    RXD_i <= '0';
    wait for 100000 ns;
    
    RXD_i <= '1';
    wait for 100000 ns;
    RXD_i <= '0';
    wait for 100000 ns;
    RXD_i <= '1';
    wait for 100000 ns;
    RXD_i <= '0';
    wait for 100000 ns;
    
    RXD_i <= '1';
    wait for 100000 ns;
    RXD_i <= '1';
    wait for 100000 ns;
    
end process sim;





clock: process is 
    begin
    wait for 5 ns;
    clk_i <= '0';
    wait for 5 ns;
    clk_i <= '1';
end process clock;
    
    
end Behavioral;
