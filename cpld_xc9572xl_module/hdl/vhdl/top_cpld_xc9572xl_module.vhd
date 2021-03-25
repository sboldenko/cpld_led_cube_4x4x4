library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

entity top_cpld_xc9572xl_module is
port
(
    clk_system : in  std_logic;
    aresetn    : in  std_logic;
    stage      : out std_logic_vector( 3 downto 0);
    lines      : out std_logic_vector(15 downto 0);
    m_sel      : in  std_logic;
    comp_en    : in  std_logic;
    comp       : in  std_logic;
    status     : out std_logic
);
end entity;

architecture behavioral of top_cpld_xc9572xl_module is
	
    component leds_control
    port
    (
        clk     : in  std_logic;
        reset   : in  std_logic;
        m_sel   : in  std_logic;
        comp_en : in  std_logic;
        comp    : in  std_logic;          
        stage   : out std_logic_vector( 3 downto 0);
        lines   : out std_logic_vector(15 downto 0);
        status  : out std_logic
    );
    end component;
    
    signal clk   : std_logic;
    signal reset : std_logic;
	
begin
	
    BUFG_inst : BUFG
    port map 
    (
        O => clk,     
        I => clk_system 
    );
	
	reset <= not aresetn;
	
    leds_control_inst: leds_control 
    port map
    (
        clk     => clk,
        reset   => reset,
        stage   => stage,
        lines   => lines,
        m_sel   => m_sel,
        comp_en => comp_en,
        comp    => comp,
        status  => status
    );
	
end behavioral;