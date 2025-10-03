-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sumador_tb is
end sumador_tb;

architecture bench of sumador_tb is

    component sumador 
        port( 
            x, y, cin : in bit;
            s, ssal   : out bit
        );
    end component;

    signal x, y, cin : bit;
    signal s, ssal   : bit;

begin

    -- Instancia del sumador
    uut: sumador port map (
        x    => x,
        y    => y,
        cin  => cin,
        s    => s,
        ssal => ssal
    );

    -- Estímulos
    stimulus: process
    begin
        -- caso 0 + 0 + 0
        x <= '0'; y <= '0'; cin <= '0';
        wait for 10 ns;

        -- caso 0 + 1 + 0
        x <= '0'; y <= '1'; cin <= '0';
        wait for 10 ns;

        -- caso 1 + 1 + 0
        x <= '1'; y <= '1'; cin <= '0';
        wait for 10 ns;

        -- caso 1 + 1 + 1
        x <= '1'; y <= '1'; cin <= '1';
        wait for 10 ns;

        wait; -- termina la simulación
    end process;

end architecture bench;
