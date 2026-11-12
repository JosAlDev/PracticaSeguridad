// Conexión del navegador con Supabase (Auth y tabla solicitudes).
// La publishable/anon key es pública: se puede subir a GitHub porque RLS controla qué puede hacer.
// Nunca pongas aquí la secret/service_role key ni la contraseña de la base.
const SUPABASE_URL = 'https://huakxbapxceqohuknxji.supabase.co';
const SUPABASE_KEY = 'sb_publishable_fafahJrUlGtzNAyRig9cog_isF4HQAv';

// Desde aquí, "supabase" es el cliente ya conectado (supabase.auth, supabase.from, ...)
window.supabase = window.supabase.createClient(SUPABASE_URL, SUPABASE_KEY);
