library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity top is
     Port ( clk_i : in STD_LOGIC;
            RXD_i : in STD_LOGIC;
            TXD_o : out STD_LOGIC;
            ld0 : out STD_LOGIC ;
            led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
            led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is

    -- Deklaracje wygenerowanych IP Core
    COMPONENT char_mem
      PORT (
        clka : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) 
      );
    END COMPONENT;
    
    COMPONENT fifo_mem
      PORT (
        clk : IN STD_LOGIC;
        srst : IN STD_LOGIC;
        din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        wr_en : IN STD_LOGIC;
        rd_en : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        full : OUT STD_LOGIC;
        empty : OUT STD_LOGIC 
      );
    END COMPONENT;

    -- Sygnały łączące poszczególne klocki
    signal rx_data_sig : std_logic_vector(7 downto 0);
    signal rx_wr_en_sig : std_logic;
    
    signal tx_data_sig : std_logic_vector(7 downto 0) := (others => '1');
    signal tx_start_sig : std_logic := '1';
    
    signal char_addr_rom : std_logic_vector(11 downto 0) := (others => '0');
    signal char_pixel : std_logic_vector(7 downto 0) := (others => '0');
    
    signal srst_f : STD_LOGIC := '0'; 
    signal rd_f : STD_LOGIC := '0'; 
    signal empty_f : STD_LOGIC := '0'; 
    signal dout_f : std_logic_vector(7 downto 0) := (others => '0');
    
    signal ready_emitter : STD_LOGIC := '0'; 
    
    signal fifo_counter : integer;
    signal session_counter : integer := 0;
    signal p : integer;
    
    type TopStateType is (idle, send);
    signal present_state : TopStateType  := idle;
    signal next_state : TopStateType := idle;
    
begin
    comb_top: process(present_state) is
    begin
        next_state <= present_state; 
        case present_state is
            when idle =>
                if rx_data_sig = 13 or fifo_counter >= 18 then
                    session_counter <= fifo_counter mod 19;
                    next_state <= send;
                end if;
            when send =>
                if session_counter = 0 then
                    next_state <= idle;
                end if;
        end case;
    end process comb_top;

    seq_top: process(clk_i) is
    begin
        if rising_edge(clk_i) then
            present_state <= next_state;
            case present_state is
                when idle =>
                
                when send =>
                    
            end case;
        end if;
    end process seq_top;
    
    fifo_send_ctrl: process(clk_i)
    begin
        if rising_edge(clk_i) then
            rd_f <= '0';
            tx_start_sig <= '1';
            if present_state = send and ready_emitter = '1' then
                    rd_f <= '1';
                    tx_data_sig <= dout_f;
                    tx_start_sig <= '0';
                    fifo_counter <= fifo_counter -1;
                    session_counter <= session_counter -1;
            end if;
        end if;
    end process fifo_send_ctrl;
    
    char_rom_inst : char_mem
      PORT MAP (
        clka => clk_i,
        addra => char_addr_rom,
        douta => char_pixel
      );
    
    fifo_mem_inst : fifo_mem
      PORT MAP (
        clk => clk_i,
        srst => srst_f,
        din => rx_data_sig,
        wr_en => rx_wr_en_sig,
        rd_en => rd_f,
        dout => dout_f,
        full => ld0,
        empty => empty_f
      );

    --odbiornik
    rx_inst: entity work.rx_rs232
      PORT MAP (
        clk_i => clk_i,
        RXD_i => RXD_i,
        data_out => rx_data_sig,
        wr_en_o => rx_wr_en_sig,
        fifo_counter_o => fifo_counter
      );

    --nadajnik
    tx_inst: entity work.tx_rs232
      PORT MAP (
        clk_i => clk_i,
        start_trans => tx_start_sig,
        data_in => tx_data_sig,
        TXD_o => TXD_o,
        ready_o => ready_emitter
      );

    --wyswietlacz
    disp_inst: entity work.display_7seg
      PORT MAP (
        clk_i => clk_i,
        data_in => rx_data_sig,
        led7_an_o => led7_an_o,
        led7_seg_o => led7_seg_o
      );

    -- W tym miejscu pozostaje dodać Główny Kontroler (maszynę stanów drukującą z bufora)
    
end Behavioral;