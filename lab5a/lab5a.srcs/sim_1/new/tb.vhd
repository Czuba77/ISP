library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_top is
-- Testbench nie ma portów
end tb_top;

architecture Behavioral of tb_top is

    -- Sygnały podłączane do testowanego układu
    signal clk_i      : std_logic := '0';
    signal RXD_i      : std_logic := '1'; -- Stan spoczynkowy linii RS232 to '1'
    signal TXD_o      : std_logic;
    signal ld0        : std_logic;
    signal led7_an_o  : std_logic_vector(3 downto 0);
    signal led7_seg_o : std_logic_vector(7 downto 0);

    -- Stałe czasowe dla zegara 100 MHz i transmisji 9600 baud
    constant CLK_PERIOD : time := 10 ns; 
    constant BIT_PERIOD : time := 10416 * CLK_PERIOD; 

begin

    -- Instancja Twojego głównego modułu (Unit Under Test)
    UUT: entity work.top
        port map (
            clk_i      => clk_i,
            RXD_i      => RXD_i,
            TXD_o      => TXD_o,
            ld0        => ld0,
            led7_an_o  => led7_an_o,
            led7_seg_o => led7_seg_o
        );

    -- Proces generujący główny zegar systemowy (100 MHz)
    clk_process: process
    begin
        clk_i <= '0';
        wait for CLK_PERIOD / 2;
        clk_i <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- Główny proces stymulujący
    stim_process: process
        
        -- Procedura symulująca wysłanie 1 bajtu z komputera do FPGA
        procedure send_uart_char(data : std_logic_vector(7 downto 0)) is
        begin
            -- Bit startu ('0')
            RXD_i <= '0';
            wait for BIT_PERIOD;

            -- 8 bitów danych (wysyłane od LSB do MSB)
            for i in 0 to 7 loop
                RXD_i <= data(i);
                wait for BIT_PERIOD;
            end loop;

            -- Bit stopu ('1')
            RXD_i <= '1';
            wait for BIT_PERIOD;
            
            -- Krótka pauza między znakami (dla czystości przebiegu)
            wait for BIT_PERIOD * 2;
        end procedure;

    begin
        -- 1. Inicjalizacja i odczekanie po "starcie" zasilania
        RXD_i <= '1';
        wait for 100 us; 

        -- 2. Wysyłamy słowo "HEJ" i Enter
        send_uart_char(x"48"); -- 'H' w kodzie ASCII
        send_uart_char(x"45"); -- 'E' w kodzie ASCII
        send_uart_char(x"4A"); -- 'J' w kodzie ASCII
        
        -- 3. Wysłanie znaku Enter (CR = 13 dziesiętnie = 0D hex)
        -- To powinno wyzwolić stan wysyłania w top.vhd
        send_uart_char(x"0D"); 

        -- 4. Czekamy, aż moduł FPGA wypchnie dane z powrotem przez TXD_o
        -- Czas ustawiony z ogromnym zapasem na analizę wykresów
        wait for 20 ms; 

        -- Zatrzymanie symulacji
        assert false report "Koniec symulacji. Mozesz analizowac wykresy!" severity failure;
    end process;

end Behavioral;