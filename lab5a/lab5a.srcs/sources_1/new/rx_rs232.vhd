library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity rx_rs232 is
    Port ( 
        clk_i    : in STD_LOGIC;
        RXD_i    : in STD_LOGIC;
        data_out : out STD_LOGIC_VECTOR (7 downto 0);
        wr_en_o  : out STD_LOGIC
    );
end rx_rs232;

architecture Behavioral of rx_rs232 is
    signal input_buff : std_logic_vector(7 downto 0) := (others => '1');
    signal rxd_sync_1 : STD_LOGIC := '1'; 
    signal rxd_sync_2 : STD_LOGIC := '1'; 
    signal p : integer range 0 to 10416 := 0;
    signal curr_bit : integer range 0 to 7 := 0;
    signal wr_f : STD_LOGIC := '0'; 

    type StateType is (idle,start, operate, finish);
    signal present_state : StateType  := idle;
    signal next_state : StateType := idle;

begin
    -- Wyprowadzenie sygnałów wewnętrznych na zewnątrz modułu
    data_out <= input_buff;
    wr_en_o <= wr_f;
    
    process(clk_i)
    begin
        if rising_edge(clk_i) then
            rxd_sync_1 <= RXD_i;
            rxd_sync_2 <= rxd_sync_1;
        end if;
    end process;

    comb_in: process (present_state, rxd_sync_2, p, curr_bit) is
    begin
        next_state <= present_state; 
        case present_state is
            when idle =>
                if rxd_sync_2 = '0' then
                    next_state <= start;
                end if;
            when start =>
                if p = 5208 then
                    next_state <= operate;
                end if;
            when operate =>
                if p = 10416 and curr_bit = 7 then
                    next_state <= finish;
                end if;
            when finish =>
                if p = 10416 then
                    next_state <= idle;
                end if;
        end case;
    end process comb_in;

    seq_in: process (clk_i) is
    begin
        if rising_edge(clk_i) then
            present_state <= next_state;
            case present_state is
                when idle =>
                    p <= 0;
                    curr_bit <= 0;
                when start =>
                    if p = 5208 then
                        p <= 0;
                    else
                        p <= p + 1;
                    end if;
                when operate =>
                    if p = 10416 then
                        p <= 0;
                        input_buff(curr_bit) <= rxd_sync_2;
                        if curr_bit = 7 then
                            curr_bit <= 0;
                        else
                            curr_bit <= curr_bit + 1;
                        end if;
                    else
                        p <= p + 1;
                    end if;
                when finish =>
                    if p = 10416 then
                        p <= 0;
                    else
                        p <= p + 1;
                    end if;
            end case;
        end if;
    end process seq_in;

    fifo_write_ctrl: process(clk_i)
    begin
        if rising_edge(clk_i) then
            wr_f <= '0'; 
            if present_state = operate and p = 10416 and curr_bit = 7 then
                    wr_f <= '1';
            end if;
        end if;
    end process fifo_write_ctrl;

end Behavioral;
