library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity display_7seg is
    Port ( 
        clk_i      : in STD_LOGIC;
        data_in    : in STD_LOGIC_VECTOR (7 downto 0);
        led7_an_o  : out STD_LOGIC_VECTOR (3 downto 0);
        led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0)
    );
end display_7seg;

architecture Behavioral of display_7seg is
    signal digit_i : std_logic_vector(31 downto 0) := (others => '1');  
    signal clk_div : std_logic := '0';
    signal q : std_logic_vector(17 downto 0) := (others => '0');

    function seven_seg(data_in: std_logic_vector(3 downto 0)) return std_logic_vector is
        variable tmp : std_logic_vector(6 downto 0);      
    begin
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

begin
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

    decode: process(clk_div) is 
    begin
        if rising_edge(clk_div) then
            digit_i(7 downto 1)   <= seven_seg(data_in(3 downto 0));
            digit_i(15 downto 9)  <= seven_seg(data_in(7 downto 4));     
        end if;
    end process; 

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

end Behavioral;