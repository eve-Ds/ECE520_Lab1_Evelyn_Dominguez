----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/13/2026 03:25:59 PM
-- Design Name: 
-- Module Name: tb_rgb_led_top - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_rgb_led_top is
--  Port ( );
end tb_rgb_led_top;

architecture Behavioral of tb_rgb_led_top is
component rgb_led_top is
    generic (
        CLK_CYCLES_PER_TOGGLE: integer := 62500000
    );
    port (
        sys_clk : in std_logic;
        rst: in std_logic;
        sw: in std_logic_vector(2 downto 0);
        rgb_out : out std_logic_vector(2 downto 0)
    );
    end component;
    
    signal sys_clk_tb : std_logic := '0';
    signal rst_tb     : std_logic := '0';
    signal sw_tb      : std_logic_vector(2 downto 0) := (others => '0'); --width 3
    signal rgb_out_tb : std_logic_vector(2 downto 0); --width 3

begin

DUT: rgb_led_top
generic map( 
    CLK_CYCLES_PER_TOGGLE => 10
)
port map(
    sys_clk => sys_clk_tb,
    rst => rst_tb,
    sw => sw_tb,
    rgb_out => rgb_out_tb
);

--Clock
  clock : process
  begin
    sys_clk_tb <='0';
    wait for 4ns; 
    sys_clk_tb <= '1';
    wait for 4 ns;
  end process;
  
 -- Reset
 rst_button : process
 begin 
    rst_tb <= '1';
    wait for 40 ns;
    rst_tb <= '0';
    wait;
    end process;

-- Test Cases
testing_buttons: process
    begin 
    
    --Reset (btn[0])
    sw_tb <= "000";
    
    wait for 100ns;
    
    --Red
    sw_tb <= "001";
    wait for 500ns;
    
    --Green
    sw_tb <= "010";
    wait for 500ns;
    
    --Blue
    sw_tb <= "100";
    wait for 400ns;
    
    --Multiple switches on
    sw_tb <= "101";
    wait for 400ns;
    wait;
    
   end process;
  
end Behavioral;
