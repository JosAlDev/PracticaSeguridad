-- Módulo 1 · Autenticación (E-SDA-1)
-- Pegar en el SQL Editor de Supabase y presionar Run. Se puede correr varias veces.

-- Tabla del Portal (en el Módulo 0 ya existía; aquí se crea si falta)
create table if not exists solicitudes (
    id     bigint generated always as identity primary key,
    titulo text not null,
    monto  numeric not null check (monto >= 0),
    creada timestamptz not null default now()
);

-- Paso 2 de la guía: guardar el correo de quien crea cada solicitud
alter table solicitudes add column if not exists usuario_email text;

-- Solo usuarios con sesión iniciada pueden leer y crear solicitudes.
-- Por ahora cada quien ve las de todos; separarlas por usuario llega en el Módulo 4.
alter table solicitudes enable row level security;

drop policy if exists "leer solicitudes con sesion" on solicitudes;
create policy "leer solicitudes con sesion"
on solicitudes for select
to authenticated
using (true);

drop policy if exists "crear solicitudes con sesion" on solicitudes;
create policy "crear solicitudes con sesion"
on solicitudes for insert
to authenticated
with check (usuario_email = auth.jwt() ->> 'email');
