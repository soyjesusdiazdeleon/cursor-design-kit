# DESIGN.md

<!--
  Plantilla Cursor Design Kit — completa cada sección antes de implementar UI.
  Borra comentarios HTML cuando el documento esté listo para el equipo.
  Nombres de tokens en inglés; explicaciones pueden estar en español.
-->

## Producto y modo

<!-- ¿Qué es el producto y qué debe lograr la interfaz en esta superficie? -->
- **Producto:**
- **Modo de superficie:** Persuade | Operate | Read | Experience
- **Audiencia principal:**
- **Plataformas:** web desktop / web móvil / nativo (especificar)

## Dirección visual (POV)

<!-- Una frase memorable + 3 adjetivos. Evita clichés no pedidos en el brief. -->
- **Statement:**
- **Adjetivos:**
- **Referencias (opcional):** enlaces o mood, no copiar literalmente

## Paleta

<!-- Valores concretos (hex/hsl). Incluye estados semánticos. -->
| Token | Uso | Valor |
| --- | --- | --- |
| `background` | Fondo principal | |
| `foreground` | Texto principal | |
| `primary` | Acción principal | |
| `primary-foreground` | Texto sobre primary | |
| `muted` | Superficies secundarias | |
| `muted-foreground` | Texto secundario | |
| `accent` | Acento / highlight | |
| `destructive` | Error / peligro | |
| `border` | Bordes | |
| `ring` | Foco | |

**Contraste:** objetivo WCAG 2.1 AA mínimo.

## Tipografía

<!-- Familias, escalas, pesos. Preferir 1–2 familias. -->
| Rol | Familia | Tamaño / peso / interlineado |
| --- | --- | --- |
| Display | | |
| Body | | |
| Label / UI | | |

**Longitud de línea:** ~45–75 caracteres en body (ajustar serif vs sans).

## Espaciado y layout

<!-- Base unit (p. ej. 4px), grid, breakpoints -->
- **Unidad base:**
- **Escala:** (ej. 4, 8, 12, 16, 24, 32, 48, 64)
- **Contenedor max-width:**
- **Breakpoints:** sm / md / lg / xl

## Radios y bordes

| Token | Valor | Uso |
| --- | --- | --- |
| `radius-sm` | | chips, inputs |
| `radius-md` | | cards |
| `radius-lg` | | modals, hero |

## Sombras y elevación

<!-- Pocas sombras nombradas; evitar sombras arbitrarias por componente -->
| Token | Valor | Uso |
| --- | --- | --- |
| `shadow-sm` | | |
| `shadow-md` | | |

## Motion

<!-- Alineado con emil-design-eng y review-animations -->
- **Duraciones:** (ej. fast 150ms, normal 250ms, slow 400ms)
- **Easings:** (ej. ease-out para entradas, spring para feedback)
- **Reglas:** un momento orquestado por vista vs. micro-animaciones dispersas
- **Reduced motion:** qué se desactiva o sustituye
- **Motion Primitives aprobados:** (lista; CLI fijado a `motion-primitives@0.1.0`)

## Tono y voz

<!-- Cómo habla la UI: formal, cercano, técnico… -->
- **Tono:**
- **Persona:**
- **Microcopy:** errores, vacíos, CTA

## Componentes clave

<!-- Mapeo a shadcn/ui + composiciones propias -->
| Componente | Base (shadcn) | Notas |
| --- | --- | --- |
| Button | `button` | |
| Card | `card` | |
| Form fields | `input`, `label`, … | |

## Accesibilidad

- Foco visible:
- Tamaño mínimo táctil (44px donde aplique):
- Idioma del contenido (`lang`):

## Fuera de alcance / deuda conocida

<!-- Temas pospuestos explícitamente -->

---

_Última actualización: YYYY-MM-DD — responsable:_
