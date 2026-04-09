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
    signal actual_fifo_wr : std_logic := '0';
    
    signal fifo_counter : integer := 0;
    signal session_counter : integer := 0;
    signal p : integer;
    
    type TopStateType is (WAIT_FOR_DATA,RD_F_ON,WAIT_FOR_FIFO,
    START_SEND,WAIT_FOR_START_SEND,WAIT_FOR_DONE_SEND);
    signal present_state : TopStateType  := WAIT_FOR_DATA;
    signal next_state : TopStateType := WAIT_FOR_DATA;
    
begin
    actual_fifo_wr <= '1' when (rx_wr_en_sig = '1' and rx_data_sig /= 13) else '0';
    
    fifo_manager: process(clk_i)
    begin
        if rising_edge(clk_i) then
            -- Inicjalizacja (opcjonalna, przy resecie układu, ale my jedziemy bez resetu)
            
            -- Sytuacja 1: Wrzucamy nowy znak do FIFO (sygnał z odbiornika) i NIE wyciągamy
            if rx_wr_en_sig = '1' and rd_f = '0' then
                if rx_data_sig /= 13 and fifo_counter < 64 then  -- <== TUTAJ DODANY WARUNEK rx_data_sig /= 13
                    fifo_counter <= fifo_counter + 1;
                end if;
                
            -- Sytuacja 2: Wyciągamy znak z FIFO (sygnał do nadajnika) i nic nowego nie wpada
            elsif rd_f = '1' and rx_wr_en_sig = '0' then
                if fifo_counter > 0 then
                    fifo_counter <= fifo_counter - 1;
                end if;
                
            -- Sytuacja 3: Jednocześnie wrzucamy i wyciągamy znak (licznik pozostaje bez zmian)
            elsif rx_wr_en_sig = '1' and rd_f = '1' then
                fifo_counter <= fifo_counter; 
            end if;
            
        end if;
    end process fifo_manager;


    comb_top: process(present_state, rx_wr_en_sig, rx_data_sig, fifo_counter, ready_emitter, session_counter) is
    begin
        next_state <= present_state; 
        case present_state is
            when WAIT_FOR_DATA =>
                if (rx_wr_en_sig = '1' and rx_data_sig = 13) or (fifo_counter >= 18) then
                    next_state <= RD_F_ON;
                end if;
            when RD_F_ON =>
                    next_state <= WAIT_FOR_FIFO;
            when WAIT_FOR_FIFO =>
                    next_state <= START_SEND;
            when START_SEND =>
                next_state <= WAIT_FOR_START_SEND;
            when WAIT_FOR_START_SEND =>
                if ready_emitter = '0' then
                    next_state <= WAIT_FOR_DONE_SEND;  
                end if;
            when WAIT_FOR_DONE_SEND =>
                if ready_emitter = '1' then
                    if session_counter = 0 then
                        next_state <= WAIT_FOR_DATA;
                    else 
                        next_state <= RD_F_ON;                    
                    end if;
                end if;                 

        end case;
    end process comb_top;

    seq_top: process(clk_i) is
    begin
        if rising_edge(clk_i) then
            present_state <= next_state;
            case present_state is
                when WAIT_FOR_DATA =>
                    rd_f <= '0';
                    if (rx_wr_en_sig = '1' and rx_data_sig = 13) or (fifo_counter >= 18) then
                        session_counter <= fifo_counter;
                    end if;
                when RD_F_ON =>
                    rd_f <= '1';
                    session_counter <= session_counter -1;
                when WAIT_FOR_FIFO =>
                    rd_f <= '0';
                when WAIT_FOR_START_SEND =>
                when START_SEND =>
                    tx_data_sig <= dout_f;       
                    tx_start_sig <= '0';   
                when WAIT_FOR_DONE_SEND => 
                    tx_start_sig <= '1';                
            end case;
        end if;
    end process seq_top;
    
    
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
        wr_en => actual_fifo_wr,
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
        wr_en_o => rx_wr_en_sig
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