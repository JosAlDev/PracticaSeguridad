import postgres from 'postgres';

// GET /api/juegos — corre en Cloudflare, no en el navegador.
// DATABASE_URL es un secreto de Cloudflare (o .dev.vars en local); nunca va en el código.
export async function onRequestGet({ env, waitUntil }) {
    if (!env.DATABASE_URL) {
        return Response.json({ error: 'Falta la variable DATABASE_URL' }, { status: 500 });
    }

    let sql;
    try {
        // prepare: false es necesario con el Transaction pooler de Supabase (puerto 6543)
        sql = postgres(env.DATABASE_URL, { prepare: false });
        const juegos = await sql`
            select titulo, genero, anio, rating
            from juegos
            order by rating desc
        `;
        return Response.json(juegos);
    } catch (error) {
        console.error(error);
        return Response.json({ error: 'No se pudo consultar la base de datos' }, { status: 500 });
    } finally {
        if (sql) waitUntil(sql.end());
    }
}
