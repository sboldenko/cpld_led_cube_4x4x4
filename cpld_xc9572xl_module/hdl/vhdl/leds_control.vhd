library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

entity leds_control is
port
(
	clk	  : in  std_logic;
	reset	  : in  std_logic;
	stage   : out std_logic_vector(3 downto 0);
	lines   : out std_logic_vector(15 downto 0);
	m_sel   : in  std_logic;
	comp_en : in  std_logic;
	comp    : in  std_logic;
	status  : out std_logic
);
end entity;

architecture behavioral of leds_control is
	
	signal counter     : std_logic_vector(19 downto 0):= (others => '0');
	signal cnt_lines   : std_logic_vector(3 downto 0):= (others => '0');
	signal cnt_stage   : std_logic_vector(1 downto 0):= (others => '0');
	signal mode_select : std_logic;
	signal mode        : std_logic_vector(1 downto 0);
	signal comp_enable : std_logic;
	signal smartlight  : std_logic:= '0';
	signal stage_reg   : std_logic_vector(3 downto 0);
	signal lines_reg   : std_logic_vector(15 downto 0);
	
begin
	
	process(clk)
	begin
		if rising_edge(clk) then
			comp_enable <= comp_en;
			
			if (reset = '1') then
				smartlight <= '0';
			elsif (comp_en = '0' and comp_enable = '1') then
				smartlight <= not smartlight;
			end if;
		end if;
	end process;
	
	status <= smartlight;
	
	process(clk)
	begin
		if rising_edge(clk) then
			mode_select <= m_sel;
			
			if (reset = '1') then
				mode <= b"00";
 			elsif (m_sel = '0' and mode_select = '1') then
				mode <= mode + '1';
			end if;
		end if;
	end process;
	
	process(clk)
	begin
		if rising_edge(clk) then
			if (smartlight = '1') then
				if (comp = '1') then
					counter <= counter + '1';
				else
					counter <= (others => '0');
				end if;
			else
				counter <= counter + '1';
			end if;
			
			if (counter = x"F_FFFF") then
				cnt_lines <= cnt_lines + '1'; 
				counter <= (others => '0');
				
				if (cnt_lines = x"F") then 
					cnt_stage <= cnt_stage + '1';
				end if;
			end if;
		end if;
	end process;
	
	process(clk)
	begin
		if rising_edge(clk) then
			if (reset = '1') then
				stage <= b"0000";
				lines <= b"0000_0000_0000_0000";
			elsif (smartlight = '1' and comp = '0') then
				stage <= b"0000";
				lines <= b"0000_0000_0000_0000";
			else
				stage <= stage_reg;
				lines <= lines_reg;
			end if;
		end if;
	end process;
	
	process(clk)
	begin
		if rising_edge(clk) then
			if (mode = b"11") then
				case(cnt_stage) is
					when b"00" =>
						stage_reg <= b"0001";
					when b"01" => 
						stage_reg <= b"0010";
					when b"10" =>
						stage_reg <= b"0100";
					when b"11" => 
						stage_reg <= b"1001";
					when others => 
						null;
				end case;				
			else
				case(cnt_stage) is
					when b"00" =>
						stage_reg <= b"0001";
					when b"01" => 
						stage_reg <= b"0010";
					when b"10" =>
						stage_reg <= b"0100";
					when b"11" => 
						stage_reg <= b"1000";
					when others => 
						null;
				end case;
			end if;
		end if;
	end process;
	
	process(clk)
	begin
		if rising_edge(clk) then
			case(mode) is
				when b"00" =>
					lines_reg <= b"1111_1111_1111_1111";
				when b"01" => 
					case(cnt_stage) is
						when b"00" =>
							lines_reg <= b"1111_0000_0000_1111";
						when b"01" =>
							lines_reg <= b"0000_1111_1111_0000";
						when b"10" =>
							lines_reg <= b"1111_0000_0000_1111";
						when b"11" =>
							lines_reg <= b"0000_1111_1111_0000";				
						when others => 
							null;
					end case;
				when b"10" => 
					case(cnt_lines) is
						when x"0" =>
							lines_reg <= b"0000_0000_0000_1111";
						when x"4" =>
							lines_reg <= b"0000_0000_1111_0000";
						when x"8" =>
							lines_reg <= b"0000_1111_0000_0000";
						when x"C" =>
							lines_reg <= b"1111_0000_0000_0000";				
						when others => 
							null;
					end case;	
				when b"11" => 
						lines_reg <= b"1111_1111_1111_1111";		
				when others => 
					null;
			end case;
		end if;
	end process;
	
end behavioral;