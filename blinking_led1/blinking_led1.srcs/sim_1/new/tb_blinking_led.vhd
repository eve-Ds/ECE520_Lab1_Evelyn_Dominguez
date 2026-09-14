----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/13/2026 10:19:02 AM
-- Design Name: 
-- Module Name: tb_blinking_led - Behavioral
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
use std.env.finish;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_blinking_led is
--  Port ( );

end tb_blinking_led;

architecture Behavioral of tb_blinking_led is

    component blinking_led is
    generic (
            CLK_CYCLES_PER_TOGGLE: integer := 62500000
    );
    
    port (
    sys_clk : in std_logic;
    rst     :  in std_logic;
    led_en  : in std_logic;
    led_out : out std_logic
    );
    end component;

-- Signals
    constant CLK_PERIOD : time    := 8 ns;  --125MHz    
    signal sys_clk_tb: std_logic;
    signal rst_tb:     std_logic;
    signal led_en_tb:  std_logic;
    signal led_out_tb:   std_logic := '0';
    
    
begin

DUT: blinking_led
    generic map (
        CLK_CYCLES_PER_TOGGLE => 10
        )
    port map(
      sys_clk   => sys_clk_tb,
      rst => rst_tb,
      led_en => led_en_tb,
      led_out => led_out_tb
      );
--------------------------------------------------------------------
-- Free-running clock
--125MHz
--------------------------------------------------------------------
  clock : process
  begin
    sys_clk_tb <='0';
    wait for CLK_PERIOD/2; --4ns
    sys_clk_tb <= '1';
    wait for CLK_PERIOD/2; --4ns
    
  end process;
---------------------------------------------------------------------
--Testbench
---------------------------------------------------------------------
test_led: process
begin

--Test Case 1- Reset Behavior
    rst_tb <= '1';
    led_en_tb <= '0';
    wait for 5 *CLK_PERIOD;
    
    
--Test Case 2-Disabled Output
    rst_tb <= '0';
    led_en_tb <= '0';
    wait for 10*CLK_PERIOD;
    
--Test Case 3-LED Toggling
    led_en_tb <= '1';
    --wait for 20*CLK_PERIOD;
    wait for 400ns; 
    
    led_en_tb <= '0';
    wait for 200ns;
    finish;
    
end process;
      
end Behavioral;

