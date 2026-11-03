---
name: design-direction
description: Orquesta la dirección visual de un producto a partir de DESIGN.md. Usar cuando haya que definir o refinar estilo, tokens, tono o sistema antes de implementar UI. Encadena frontend-design, ui-ux-pro-max y emil-design-eng.
---

# design-direction

Establece **dirección de diseño** accionable antes de escribir código de interfaz. Todo el trabajo parte de `DESIGN.md` en la raíz del proyecto (créalo con la plantilla del kit o con la skill `create-design-md` si aún no existe).

## Cuándo usar

- Nuevo producto o rediseño con brief abierto.
- El usuario pide “definir estilo”, “design system”, “look & feel” o “dirección visual”.
- Antes de `design-build`: si `DESIGN.md` está vacío o desactualizado respecto al brief.

## Prerrequisitos

1. Leer `DESIGN.md` completo. Si no existe, copiar `templates/DESIGN.md` del Cursor Design Kit o ejecutar el flujo de `create-design-md`.
2. Confirmar modo de superficie (marketing / app / docs) y restricciones (marca, accesibilidad, plataformas).

## Orquestación (orden estricto)

### 1. `frontend-design` (Anthropic)

- Leer la skill `frontend-design` y aplicar sus principios de identidad distintiva, tipografía y anti-patrones “genéricos de IA”.
- Entregar: **3 direcciones visuales** (nombre corto + paleta + tipografía + una frase de POV). No implementar aún.

### 2. `ui-ux-pro-max`

- Si la skill está instalada (`uipro init --ai cursor`), usar su flujo `--design-system` con el tipo de producto e industria del brief.
- Cruzar recomendaciones (color, tipografía, UX) con las 3 direcciones; **elegir una** o fusionar con criterio explícito documentado.
- Si no está instalada: ejecutar `npm install -g ui-ux-pro-max-cli && uipro init --ai cursor` o seguir solo con `frontend-design` y documentar la limitación.

### 3. `emil-design-eng`

- Leer `emil-design-eng` para traducir la dirección en **decisiones de ingeniería de UI**: motion, densidad, estados, feedback, performance.
- Ajustar la sección **Motion** y **Componentes** de `DESIGN.md`.

## Entregables

1. **`DESIGN.md` actualizado** con valores concretos (no placeholders genéricos): paleta, tipografía, espaciado, radios, sombras, motion, tono, componentes clave.
2. **Resumen en español** (máx. 15 líneas): dirección elegida, por qué encaja con el brief, y riesgos (p. ej. contraste, beta de Motion Primitives).
3. **Checklist de handoff** para `design-build`:
   - [ ] Tokens listos para Tailwind/CSS variables
   - [ ] Componentes shadcn/ui previstos identificados
   - [ ] Patrones Motion Primitives acordados (versión fijada en reglas del proyecto)

## Reglas

- No escribir código de producto en esta fase salvo que el usuario lo pida explícitamente.
- No sustituir el brief del usuario por estética “por defecto” (crema + serif + terracota, etc.); si el usuario lo pide, documentarlo como decisión consciente en `DESIGN.md`.
- Mantener nombres técnicos en inglés en el código futuro; la documentación humana puede estar en español.
