# Escuela Cuid-Arte — Prompt Optimizado para Stitch

Una landing page de acompañamiento oncológico integrativo, visualmente impactante, con calidez médica y tono de esperanza y supervivencia. Diseño mobile-first, emocional, científico y humano.

---

## DESIGN SYSTEM (REQUIRED)

- **Platform:** Web, Mobile-first
- **Theme:** Light, warm, clinical warmth, hopeful
- **Background:** Pure White (#ffffff) y Soft Mint Wash (#F0F9F0)
- **Primary Accent:** Healing Green (#6BA06B) — botones principales, iconos activos, checkmarks
- **Secondary Accent:** Warm Gold (#D4AF37) — highlights, badges, CTAs secundarios, separadores
- **Surface:** Soft Mint (#CDE8CD) — fondos de tarjetas, hover states
- **Text Primary:** Deep Navy (#2C3E50) — headings H1/H2
- **Text Secondary:** Slate (#34495E) — body text
- **Text Muted:** (#94a3b8) — labels, metadatos
- **Typography Headings:** Montserrat, bold/extrabold, tight tracking
- **Typography Body:** Open Sans, regular/medium, relaxed line-height
- **Border Radius:** 2rem para cards grandes, 1rem para inputs, pill para botones
- **Shadows:** Soft, layered — shadow-lg con color tintado (verde o dorado según contexto)
- **Icons:** Lucide React, strokeWidth 1.75, 24px

---

## PROMPT 1 — Sección de Testimonios (añadir en index.html, antes del FAQ)

Sección de testimonios emocionales de pacientes supervivientes del programa Cuid-Arte de la Dra. Odile Fernández.

**Page Structure:**
1. **Header de sección:** Badge dorado "Voces Reales", H2 "Ellas lo vivieron. Tú puedes escucharlas.", subtítulo en slate.
2. **Grid de testimonios (3 columnas desktop, 1 mobile):** Cada tarjeta incluye:
   - Foto de perfil circular con borde en `cuidarte-mint`
   - Nombre + situación (ej. "Superviviente de cáncer de mama, 2 años")
   - Quote en cursiva con comillas grandes en dorado
   - Badge de fase: "En tratamiento" / "Superviviente" / "Recién diagnosticada"
   - Estrellas doradas (5/5)
3. **Tarjeta destacada (ancho completo):** Testimonio largo con foto grande lateral, fondo menta suave, borde dorado izquierdo.
4. **CTA:** botón verde "Quiero vivir mi propia historia" con icono HeartHandshake.

**Visual style:** Cálido, emocional, fotográfico. Cards con sombra suave verde. Quote marks grandes en #D4AF37/20% opacidad como fondo decorativo.

---

## PROMPT 2 — Sección del Equipo (añadir en index.html, antes de la Carta de Odile)

Sección del equipo multidisciplinar que apoya el Método Cuid-Arte.

**Page Structure:**
1. **Header:** Badge menta "El Equipo", H2 "No estás solo/a. Tienes un equipo detrás.", subtítulo explicando el enfoque multidisciplinar.
2. **Card de Odile (destacada, más grande):** Foto con marco dorado, nombre, título "Fundadora & Médico de Familia — Superviviente", badges de credenciales.
3. **Grid del equipo (4 columnas desktop):** Cards compactas con:
   - Foto circular
   - Nombre
   - Especialidad (Nutricionista Oncológica / Fisioterapeuta / Psico-oncóloga / Coach de Bienestar)
   - Frase corta en cursiva
4. **Divider decorativo:** Línea con logo SVG centrado.

**Visual style:** Profesional pero cercano. Fotos en blanco y negro con hover a color. Fondo blanco puro con sombras muy suaves.

---

## PROMPT 3 — Sección Blog/Artículos (añadir en index.html, antes del Lead Magnet)

Preview del blog de la Dra. Odile Fernández con artículos de divulgación oncológica.

**Page Structure:**
1. **Header:** Badge verde "Ciencia & Esperanza", H2 "Aprende con Odile", subtítulo "Artículos basados en evidencia, escritos con corazón."
2. **Grid de artículos (3 columnas desktop, 1 mobile):**
   - Imagen de cabecera con overlay degradado verde
   - Categoría en badge (Nutrición / Ejercicio / Emociones / Entorno)
   - Título del artículo en Montserrat bold
   - Extracto corto (2 líneas)
   - Meta: fecha + tiempo de lectura
   - Enlace "Leer artículo →" en verde
3. **CTA secundario:** "Ver todos los artículos" en outline dorado.

**Visual style:** Editorial, limpio, médico-divulgativo. Cards con imagen superior, hover con sombra verde. Categorías coloreadas con la paleta del pilar correspondiente.

---

## PROMPT 4 — Formulario de Admisión con Webhook Real (actualizar modal en index.html)

Formulario de solicitud de entrevista de valoración conectado a GoHighLevel.

**Cambios específicos al modal existente:**
- Mantener diseño actual del modal
- Añadir campo "Mensaje breve" (textarea, opcional)
- Añadir campo "¿Cómo nos conociste?" (select: Redes sociales / Google / Recomendación de médico / Recomendación de familiar o amigo / Otro)
- Conectar `onSubmit` al webhook: `https://services.leadconnectorhq.com/hooks/i2nawUlzlu9GmdtyWjX5/webhook-trigger/963abaa9-50b7-454b-bbf7-cc8522acdcd5`
- Mostrar estado `loading` con spinner mientras envía
- Redirigir a `gracias.html` tras envío exitoso
- En caso de error: mostrar toast de error y mantener datos en el formulario

**Context:** Targeted edit. Solo modificar el modal de admisión. Preservar todos los demás elementos.

---

## PROMPT 5 — Página de Agradecimiento (nueva página: gracias.html)

Página de confirmación tras enviar la solicitud de entrevista de valoración.

**Page Structure:**
1. **Navbar simplificada:** Logo + enlace "Volver al inicio"
2. **Hero de confirmación (centrado, full-height):**
   - Icono animado de check verde grande (círculo con checkmark)
   - H1: "¡Tu solicitud ha llegado!"
   - Párrafo: "Nuestro equipo médico revisará tu situación y te contactará en menos de 24 horas. Mientras tanto, te hemos enviado un email de confirmación."
   - Badge dorado con cuenta atrás visual: "Respuesta en menos de 24h"
3. **Siguiente paso sugerido:** Card con 3 pasos numerados (Revisa tu email / Prepara tus preguntas / Descansa tranquila/o)
4. **CTA secundario:** "Descarga tu Guía de Claridad gratis" → enlace al lead magnet
5. **Footer mínimo**

**Visual style:** Celebratorio pero sereno. Fondo menta muy suave. Animación float en el icono check. Sin distracciones.

---

## PROMPT 6 — Integración Visual Instagram (añadir en index.html, antes del Footer)

Sección de feed visual de Instagram de @dra.odilemdfernandez.

**Page Structure:**
1. **Header:** Badge con icono Instagram, "Síguenos en Instagram @dra.odilemdfernandez"
2. **Mosaic grid (6 imágenes, 3x2 desktop / 2x3 mobile):**
   - Imágenes cuadradas con overlay verde al hover
   - Icono de corazón + número de likes al hover
   - Click abre Instagram en nueva pestaña
3. **CTA:** Botón pill con gradiente Instagram "Seguir en Instagram"

**Visual style:** Fotográfico, social, dinámico. Grid sin gaps (flush) con hover interactivo.

---

## PROMPT 7 — Corrección de Branding en metodo.html

Actualizar metodo.html para usar el sistema de diseño de Cuid-Arte en lugar de colores rose/red.

**Cambios específicos:**
- Reemplazar TODOS los `rose-*`, `red-*`, `emerald-*` por equivalentes de la paleta Cuid-Arte:
  - `rose-500` / `rose-600` → `cuidarte-green` (#6BA06B)
  - `rose-100` → `cuidarte-mint` (#CDE8CD)
  - `emerald-*` → `cuidarte-green*`
  - `amber-*` → `cuidarte-gold*`
- Cambiar fuentes Lora/Lato → Montserrat/Open Sans
- Añadir la config de Tailwind con los colores personalizados (igual que index.html)
- Botón "Solicitar Valoración" en verde Cuid-Arte, no rose
- Navbar con mismo estilo que index.html

**Context:** Targeted edit. Solo cambiar colores y tipografías. Preservar estructura y contenido.

---

## ORDEN DE IMPLEMENTACIÓN RECOMENDADO

1. PROMPT 7 — Corregir branding metodo.html (quick win)
2. PROMPT 4 — Formulario con webhook real (funcional crítico)
3. PROMPT 5 — Página gracias.html (complementa el formulario)
4. PROMPT 2 — Sección equipo (construye confianza)
5. PROMPT 1 — Sección testimonios (prueba social)
6. PROMPT 3 — Sección blog (contenido)
7. PROMPT 6 — Instagram (engagement)

---

💡 **Tip:** Crear un archivo DESIGN.md con el sistema de diseño usando el skill `design-md` para mantener consistencia en todas las páginas generadas.
