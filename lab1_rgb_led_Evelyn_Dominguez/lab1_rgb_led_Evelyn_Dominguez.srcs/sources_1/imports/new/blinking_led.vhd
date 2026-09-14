----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/13/2026 10:16:36 AM
-- Design Name: 
-- Module Name: blinking_led - Behavioral
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

entity blinking_led is
    generic(
        CLK_CYCLES_PER_TOGGLE: integer := 62500000
    );
    port (
    sys_clk : in std_logic;
    rst     : in std_logic;
    led_en  : in std_logic;
    
    led_out : out std_logic
    
    );

end blinking_led;

architecture Behavioral of blinking_led is
    --counter
    signal i : integer range 0 to CLK_CYCLES_PER_TOGGLE-1 := 0;
    signal led: std_logic := '0';

begin
    process (sys_clk)
    begin
        if rising_edge(sys_clk) then
        --Clear counter and output
            if rst = '1' or led_en = '0' then
                i <= 0;
                led <= '0';
        
            else
                if i = CLK_CYCLES_PER_TOGGLE-1 then
                i <=0;
            --toggle LED and clear counter
                led <= not led; 
                ---i <= 0;
            else
            --Increment counter
                i <= i + 1;
            end if;
        end if;
       end if;
 
   end process;  
   led_out <= led;             

end Behavioral;

