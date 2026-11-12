-- Parte D · Práctica 1 IAW-1
-- Pegar en el SQL Editor de Supabase y presionar Run.

create table juegos (
    id     bigint generated always as identity primary key,
    titulo text not null,
    genero text,
    anio   int,
    rating numeric
);

insert into juegos (titulo, genero, anio, rating) values
    ('Zelda: Breath of the Wild', 'Aventura',     2017, 9.5),
    ('Minecraft',                 'Sandbox',      2011, 9.0),
    ('Hollow Knight',             'Metroidvania', 2017, 9.2),
    ('Celeste',                   'Plataformas',  2018, 9.1),
    ('Stardew Valley',            'Simulación',   2016, 8.9);

-- 1) Ver TODOS los registros
select * from juegos;

-- 2) FILTRAR: juegos del año 2017 en adelante
select titulo, anio from juegos
where anio >= 2017;

-- 3) ORDENAR: los 3 mejor calificados
select titulo, rating from juegos
order by rating desc
limit 3;

-- Extra (opcional): contar cuántos juegos hay por género
select genero, count(*) from juegos
group by genero;
