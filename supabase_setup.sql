-- MIGRACIÓN / CONFIGURACIÓN: leads_escuela_cuidarte
-- Este script crea la tabla si no existe, o añade las columnas nuevas si ya existía una versión previa.

-- 1. Crear la tabla base (si no existe)
CREATE TABLE IF NOT EXISTS public.leads_escuela_cuidarte (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email TEXT UNIQUE NOT NULL,
    nombre TEXT NOT NULL,
    telefono TEXT,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

-- 2. Añadir las nuevas columnas (una a una para evitar errores si ya existen)
DO $$ 
BEGIN 
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='leads_escuela_cuidarte' AND column_name='situacion') THEN
        ALTER TABLE public.leads_escuela_cuidarte ADD COLUMN situacion TEXT;
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='leads_escuela_cuidarte' AND column_name='tipo_cancer') THEN
        ALTER TABLE public.leads_escuela_cuidarte ADD COLUMN tipo_cancer TEXT;
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='leads_escuela_cuidarte' AND column_name='estadio') THEN
        ALTER TABLE public.leads_escuela_cuidarte ADD COLUMN estadio TEXT;
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='leads_escuela_cuidarte' AND column_name='perdida_peso') THEN
        ALTER TABLE public.leads_escuela_cuidarte ADD COLUMN perdida_peso TEXT;
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='leads_escuela_cuidarte' AND column_name='actividad_fisica') THEN
        ALTER TABLE public.leads_escuela_cuidarte ADD COLUMN actividad_fisica TEXT;
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='leads_escuela_cuidarte' AND column_name='nivel_compromiso') THEN
        ALTER TABLE public.leads_escuela_cuidarte ADD COLUMN nivel_compromiso INTEGER;
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='leads_escuela_cuidarte' AND column_name='disponibilidad') THEN
        ALTER TABLE public.leads_escuela_cuidarte ADD COLUMN disponibilidad TEXT;
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='leads_escuela_cuidarte' AND column_name='origen') THEN
        ALTER TABLE public.leads_escuela_cuidarte ADD COLUMN origen TEXT;
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='leads_escuela_cuidarte' AND column_name='preocupacion_principal') THEN
        ALTER TABLE public.leads_escuela_cuidarte ADD COLUMN preocupacion_principal TEXT;
    END IF;
END $$;

-- 3. Habilitar RLS (Seguridad de Fila)
ALTER TABLE public.leads_escuela_cuidarte ENABLE ROW LEVEL SECURITY;

-- 4. POLÍTICAS DE SEGURIDAD (Se borran y crean para asegurar que son las correctas)
DROP POLICY IF EXISTS "Permitir inserción pública" ON public.leads_escuela_cuidarte;
CREATE POLICY "Permitir inserción pública" 
ON public.leads_escuela_cuidarte 
FOR INSERT 
TO anon 
WITH CHECK (true);

DROP POLICY IF EXISTS "Permitir consulta por email" ON public.leads_escuela_cuidarte;
CREATE POLICY "Permitir consulta por email" 
ON public.leads_escuela_cuidarte 
FOR SELECT 
TO anon 
USING (true);

-- 5. Trigger para actualizar updated_at automáticamente
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

DROP TRIGGER IF EXISTS update_leads_updated_at ON public.leads_escuela_cuidarte;
CREATE TRIGGER update_leads_updated_at
    BEFORE UPDATE ON public.leads_escuela_cuidarte
    FOR EACH ROW
    EXECUTE PROCEDURE update_updated_at_column();

-- 6. Comentarios de columna
COMMENT ON TABLE public.leads_escuela_cuidarte IS 'Leads cualificados de la Escuela Cuid-Arte';
COMMENT ON COLUMN public.leads_escuela_cuidarte.perdida_peso IS 'Indicador clave de urgencia';
COMMENT ON COLUMN public.leads_escuela_cuidarte.nivel_compromiso IS 'Puntuación de intención de 1 a 10';
COMMENT ON COLUMN public.leads_escuela_cuidarte.origen IS 'Atribución de Marketing ROI';
