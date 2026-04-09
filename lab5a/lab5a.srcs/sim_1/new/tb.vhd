library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_top is

end tb_top;

architecture Behavioral of tb_top is

    signal clk_i      : std_logic := '0';
    signal RXD_i      : std_logic := '1';
    signal TXD_o      : std_logic;
    signal ld0        : std_logic;
    signal led7_an_o  : std_logic_vector(3 downto 0);
    signal led7_seg_o : std_logic_vector(7 downto 0);

    constant CLK_PERIOD : time := 10 ns; 
    constant BIT_PERIOD : time := 10416 * CLK_PERIOD; 

begin

    UUT: entity work.top
        port map (
            clk_i      => clk_i,
            RXD_i      => RXD_i,
            TXD_o      => TXD_o,
            ld0        => ld0,
            led7_an_o  => led7_an_o,
            led7_seg_o => led7_seg_o
        );

    clk_process: process
    begin
        clk_i <= '0';
        wait for CLK_PERIOD / 2;
        clk_i <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    stim_process: process
        procedure send_uart_char(data : std_logic_vector(7 downto 0)) is
        begin
            RXD_i <= '0';
            wait for BIT_PERIOD;
            for i in 0 to 7 loop
                RXD_i <= data(i);
                wait for BIT_PERIOD;
            end loop;
            RXD_i <= '1';
            wait for BIT_PERIOD;

            wait for BIT_PERIOD * 2;
        end procedure;

    begin
        RXD_i <= '1';
        wait for 100 us; 

        send_uart_char(x"48"); -- 'H'
        send_uart_char(x"45"); -- 'E'
        send_uart_char(x"4A"); -- 'J'
        send_uart_char(x"0D"); 
        wait for 20 ms; 

        assert false report "Koniec" severity failure;
    end process;

end Behavioral;