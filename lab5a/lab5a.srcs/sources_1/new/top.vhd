----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.04.2026 19:52:43
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
     RXD_i : in STD_LOGIC;
     TXD_o : out STD_LOGIC;
     ld0 : out STD_LOGIC ;
     led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
     led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end top;


architecture Behavioral of top is
     signal input_buff : std_logic_vector(7 downto 0) := (others => '1');
     signal output_buff : std_logic_vector(7 downto 0) := (others => '1');
     signal digit_i : std_logic_vector(31 downto 0) := (others => '1');  
     signal clk_div : std_logic := '0';
     signal q : std_logic_vector(17 downto 0) := (others => '0');
       
     signal rxd_sync_1 : STD_LOGIC := '1'; 
     signal rxd_sync_2 : STD_LOGIC := '1'; 
     signal p : integer range 0 to 10416 := 0;
     signal curr_bit : integer range 0 to 7 := 0;
     
     signal start_trans : STD_LOGIC := '1'; 
     signal p_out : integer range 0 to 10416 := 0;
     signal curr_bit_out : integer range 0 to 7 := 0;
     
     signal char_addr_rom : std_logic_vector(11 downto 0) := (others => '0');
     signal char_pixel : std_logic_vector(7 downto 0) := (others => '0');
      
     
     signal srst_f : STD_LOGIC := '0'; 
     signal wr_f : STD_LOGIC := '0'; 
     
     signal rd_f : STD_LOGIC := '0'; 
     signal empty_f : STD_LOGIC := '0'; 
     signal dout_f : std_logic_vector(7 downto 0) := (others => '0');
     
     signal fifo_counter : integer := 0;
     
     type StateType is (idle,start, operate, finish);
        signal present_state : StateType  := idle;
        signal next_state : StateType := idle;
        signal present_state_out : StateType  := idle;
        signal next_state_out : StateType := idle;

     
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
       when "0001" => tmp := "1001111";   --1
       when "0010" => tmp := "0010010";   --2
       when "0011" => tmp := "0000110";   --3
       when "0100" => tmp := "1001100";   --4
       when "0101" => tmp := "0100100";   --5
       when "0110" => tmp := "0100000";   --6
       when "0111" => tmp := "0001111";   --7
       when "1000" => tmp := "0000000";   --8
       when "1001" => tmp := "0000100";   --9
       when "1010" => tmp := "0001000";   --A
       when "1011" => tmp := "1100000";   --b
       when "1100" => tmp := "0110001";   --C
       when "1101" => tmp := "1000010";   --d
       when "1110" => tmp := "0110000";   --E
       when "1111" => tmp := "0111000";   --F
       when others => tmp := "0000001";   --0
    end case;
    return (tmp);
    end function seven_seg;
    
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
    
    begin
    
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
        din => input_buff,
        wr_en => wr_f,
        rd_en => rd_f,
        dout => dout_f,
        full => ld0,
        empty => empty_f
      );
    
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
    
    decode: process(clk_div) is 
    begin
    if rising_edge(clk_div) then
        digit_i(7 downto 1)   <= seven_seg(input_buff(3 downto 0));
        digit_i(15 downto 9)  <= seven_seg(input_buff(7 downto 4));     
    end if;
    end process; 
    

    process(clk_i)
    begin
        if rising_edge(clk_i) then
            rxd_sync_1 <= RXD_i;
            rxd_sync_2 <= rxd_sync_1;
        end if;
    end process;
       
       

    div_clk: process(clk_i)
    begin
       if rising_edge(clk_i) then
          q <= q + 1;
          if (q = 99999) then
             q <= ( others => '0');
        clk_div <= '0';
          end if;
          if (q = 49999) then
             clk_div <= '1';
          end if;
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
                    p_out <= 0;
                    curr_bit_out <= 0;
                    TXD_o <= '1';
                    
                when start =>
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


    fifo_write_ctrl: process(clk_i)
    begin
        if rising_edge(clk_i) then
            wr_f <= '0'; 
            if present_state = operate and p = 10416 and curr_bit = 7 and fifo_counter < 64 then
                wr_f <= '1';
                fifo_counter <= fifo_counter + 1;
            end if;
        end if;
    end process fifo_write_ctrl;
    
    
end Behavioral;