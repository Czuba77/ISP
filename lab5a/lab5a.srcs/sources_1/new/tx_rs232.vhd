library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity tx_rs232 is
    Port ( 
        clk_i       : in STD_LOGIC;
        start_trans : in STD_LOGIC;
        data_in     : in STD_LOGIC_VECTOR (7 downto 0);
        TXD_o       : out STD_LOGIC;
        ready_o     : out STD_LOGIC
    );
end tx_rs232;

architecture Behavioral of tx_rs232 is
    signal output_buff : std_logic_vector(7 downto 0) := (others => '1');
    signal p_out : integer range 0 to 10416 := 0;
    signal curr_bit_out : integer range 0 to 7 := 0;

    type StateType is (idle,start, operate, finish);
    signal present_state_out : StateType  := idle;
    signal next_state_out : StateType := idle;

begin
    output_buff <= data_in;

    comb_out: process (present_state_out, start_trans, p_out, curr_bit_out) is
    begin
        next_state_out <= present_state_out; 
        case present_state_out is
            when idle =>
                if start_trans = '0' then
                    next_state_out <= start;
                end if;
            when start =>
                if p_out = 10416 then
                    next_state_out <= operate;
                end if;
            when operate =>
                if p_out = 10416 and curr_bit_out = 7 then
                    next_state_out <= finish;
                end if;
            when finish =>
                if p_out = 10416 then
                    next_state_out <= idle;
                end if;
        end case;
    end process comb_out;

    seq_out: process (clk_i) is
    begin
        if rising_edge(clk_i) then
            present_state_out <= next_state_out;
            case present_state_out is
                when idle =>
                    ready_o <= '1';
                    p_out <= 0;
                    curr_bit_out <= 0;
                    TXD_o <= '1';
                when start =>
                    ready_o <= '0';
                    TXD_o <= '0';
                    if p_out = 10416 then
                        p_out <= 0;
                    else
                        p_out <= p_out + 1;
                    end if;
                when operate =>
                    TXD_o <= output_buff(curr_bit_out);
                    if p_out = 10416 then
                        p_out <= 0;
                        if curr_bit_out = 7 then
                            curr_bit_out <= 0;
                        else
                            curr_bit_out <= curr_bit_out + 1;
                        end if;
                    else
                        p_out <= p_out + 1;
                    end if;
                when finish =>
                    TXD_o <= '1';
                    if p_out = 10416 then
                        p_out <= 0;
                    else
                        p_out <= p_out + 1;
                    end if;
            end case;
        end if;
    end process seq_out;

end Behavioral;