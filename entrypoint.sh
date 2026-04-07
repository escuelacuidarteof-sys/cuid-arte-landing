#!/bin/sh
# Reemplaza placeholders con variables de entorno en todos los HTML
# Se ejecuta al arrancar el contenedor, antes de iniciar nginx

# Acepta tanto SUPABASE_URL como VITE_SUPABASE_URL
SB_URL="${SUPABASE_URL:-$VITE_SUPABASE_URL}"
SB_KEY="${SUPABASE_ANON_KEY:-$VITE_SUPABASE_ANON_KEY}"

for f in /usr/share/nginx/html/*.html; do
  sed -i "s|__SUPABASE_URL__|${SB_URL}|g" "$f"
  sed -i "s|__SUPABASE_ANON_KEY__|${SB_KEY}|g" "$f"
done

echo "[entrypoint] Variables inyectadas correctamente"

# Arranca nginx en primer plano
exec nginx -g 'daemon off;'
