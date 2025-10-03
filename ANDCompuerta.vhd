-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
-- =======================
-- Componentes básicos
-- =======================

entity miand2 is
    port (
        in1, in2 : in bit;
        out1     : out bit
    );
end entity miand2;

architecture uno of miand2 is
begin
    process(in1, in2)
    begin
        if (in1 = '0' or in2 = '0') then
            out1 <= '0';
        else
            out1 <= '1';
        end if;
    end process;
end architecture uno;


entity mixor2 is
    port (
        in1, in2 : in bit;
        out1     : out bit
    );
end entity mixor2;

architecture uno of mixor2 is
begin
    out1 <= in1 xor in2;
end architecture uno;


entity mior2 is
    port (
        in1, in2 : in bit;
        out1     : out bit
    );
end entity mior2;

architecture uno of mior2 is
begin
    out1 <= in1 or in2;
end architecture uno;


-- =======================
-- Entidad principal
-- =======================

entity sumador is 
    port( 
        x, y, cin : in bit;
        s, ssal   : out bit
    );
end sumador;

-- Arquitectura 1: directa
architecture uno of sumador is
begin
    s    <= x xor y xor cin;
    ssal <= (x and y) or (x and cin) or (y and cin);
end architecture uno;

-- Arquitectura 2: estructural con componentes
architecture dos of sumador is

    component miand2 is
        port ( in1, in2 : in bit;
               out1     : out bit );
    end component;

    component mixor2 is
        port ( in1, in2 : in bit;
               out1     : out bit );
    end component;

    component mior2 is
        port ( in1, in2 : in bit;
               out1     : out bit );
    end component;
    
    signal s1, s2, s3, s4, s5 : bit;
    
begin 
    u1 : mixor2 port map (x, y, s1);
    u2 : mixor2 port map (s1, cin, s);      -- corregido: s1 en vez de s2
    u3 : miand2 port map (x, y, s2);
    u4 : mior2  port map (s2, s4, s3);
    u5 : mior2  port map (s3, s5, ssal);
    u6 : miand2 port map (y, cin, s4);
    u7 : miand2 port map (x, cin, s5);
end architecture dos;
