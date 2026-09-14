----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/13/2026 01:42:40 PM
-- Design Name: 
-- Module Name: rgb_led_top - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rgb_led_top is
--  Port ( );
generic (
    CLK_CYCLES_PER_TOGGLE : integer := 62500000
    );
port (
    sys_clk : in std_logic;
    rst     : in std_logic;
    sw      : in std_logic_vector(2 downto 0); --width 3
    
    rgb_out : out std_logic_vector(2 downto 0) --width 3
);
end rgb_led_top;

architecture Behavioral of rgb_led_top is
component blinking_led is 
    generic(
        CLK_CYCLES_PER_TOGGLE: integer := 62500000
    );
    port (
    sys_clk : in std_logic;
    rst     : in std_logic;
    led_en  : in std_logic;
    
    led_out : out std_logic
    );
 end component;

 signal red_led, green_led, blue_led : std_logic;


begin

process (sw)
    begin 
        case sw is
            --RED
            when "001" => 
                red_led <=  '1';
                green_led <= '0';
                blue_led <= '0';
                
            --Green
             when "010" =>
                red_led <=  '0';
                green_led <= '1';
                blue_led <= '0';
                
            --Blue
             when "100" =>
                red_led <=  '0';
                green_led <= '0';
                blue_led <= '1';
            --Any other case   
             when others =>
                red_led <=  '0';
                green_led <= '0';
                blue_led <= '0';
                
        end case;
       end process;
                


--Red LED: SW0, rgb_out[0]
red : blinking_led
    generic map (
         CLK_CYCLES_PER_TOGGLE => CLK_CYCLES_PER_TOGGLE
    )
    port map(
        sys_clk => sys_clk,
        rst => rst,
        led_en => red_led,
        led_out => rgb_out(0)
    );
    
--Green LED: SW1, rgb_out(1)
green : blinking_led
    generic map (
        CLK_CYCLES_PER_TOGGLE => CLK_CYCLES_PER_TOGGLE
    )
    port map(
        sys_clk => sys_clk,
        rst => rst,
        led_en => green_led,
        led_out => rgb_out(1)
    );        

--Blue LED: SW2, rgb_out(2)
blue : blinking_led
    generic map (
        CLK_CYCLES_PER_TOGGLE => CLK_CYCLES_PER_TOGGLE
    )
    port map(
        sys_clk => sys_clk,
        rst => rst,
        led_en => blue_led,
        led_out => rgb_out(2)
    );   


end Behavioral;
