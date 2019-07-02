library ieee;
use ieee.std_logic_1164.all;

entity led_curtain is

port(
     clk: in std_logic;
     led_0: out std_logic;
     led_1: out std_logic;
     led_2: out std_logic;
     led_3: out std_logic;
     led_4: out std_logic;
     led_5: out std_logic;
     led_6: out std_logic;
     led_7: out std_logic
     );
     
end led_curtain;

architecture behavioral of led_curtain is

signal clock_counter: integer := 0;
signal clock_number: integer := 7999999;
type direction_type is (left, right);
signal direction: direction_type := right;
signal led_number: integer range 0 to 7 := 7;
signal led_lighter: std_logic_vector (0 to 7) := "00000000";

begin
process(clk)
begin

if rising_edge(clk) then

    case direction is
    
    when left =>
    
        if led_number > 0 then
    
            if clock_counter < clock_number then
        
            clock_counter <= clock_counter + 1;
        
            else
        
            clock_counter <= 0;
            led_number <= led_number - 1;
        
            end if;
            
        else 
        
        clock_counter <= 0;
        direction <= right;
        
        end if;
        
    when right =>
    
        if led_number < 7 then
        
            if clock_counter < clock_number then
            
            clock_counter <= clock_counter + 1;
            
            else
            
            clock_counter <= 0;
            led_number <= led_number + 1;
            
            end if;
            
        else
        
        clock_counter <= 0;
        direction <= left;
        
        end if;
        
    end case;
    
    case led_number is
    
    when 0 => led_lighter <= "10000000";
    
    when 1 => led_lighter <= "01000000";
    
    when 2 => led_lighter <= "00100000";
    
    when 3 => led_lighter <= "00010000";
    
    when 4 => led_lighter <= "00001000";
    
    when 5 => led_lighter <= "00000100";
    
    when 6 => led_lighter <= "00000010";
    
    when 7 => led_lighter <= "00000001";
    
    end case;
    
led_0 <= led_lighter(0);
led_1 <= led_lighter(1);
led_2 <= led_lighter(2);
led_3 <= led_lighter(3);
led_4 <= led_lighter(4);
led_5 <= led_lighter(5);
led_6 <= led_lighter(6);
led_7 <= led_lighter(7);

end if;

end process;
end behavioral;

    
    