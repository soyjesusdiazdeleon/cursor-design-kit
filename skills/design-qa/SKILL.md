---
name: design-qa
description: QA de diseño e implementación UI. Encadena Impeccable (critique/polish), web-design-guidelines, break-ui, review-animations, mobile-native y webapp-testing. Entrega un reporte accionable en español.
---

# design-qa

Revisión sistemática de calidad **visual, UX, accesibilidad, motion y responsive** antes de dar por cerrada una superficie.

## Cuándo usar

- Tras `design-build` o antes de merge/ release de UI.
- Cuando el usuario pida auditoría, critique, polish o “¿está listo para producción?”.

## Prerrequisitos

- `DESIGN.md` presente y la UI bajo revisión ejecutable o previsualizable.
- Skills externas instaladas vía `install.sh` cuando aplique: **impeccable**, **web-design-guidelines** (Vercel).

## Pipeline (orden recomendado)

Ejecutar cada paso y **capturar hallazgos** (severidad: bloqueante / importante / nice-to-have).

### 1. Impeccable — `critique`

- Si `impeccable` está instalado: seguir la skill y ejecutar critique sobre el target (ruta o ruta de app).
- Registrar: jerarquía, UX, copy, estados vacíos, coherencia con `DESIGN.md`.

### 2. Impeccable — `polish`

- Pasada de pulido sobre los mismos targets; priorizar issues bloqueantes del critique.

### 3. `web-design-guidelines` (Vercel)

- Aplicar la skill instalada desde `vercel-labs/agent-skills`.
- Contrastar con guidelines web modernas (layout, tipografía, performance percibida).

### 4. `break-ui`

- Buscar edge cases visuales: textos largos, i18n, datos vacíos, errores, dark mode si aplica.
- Usar catálogo de la skill según corresponda.

### 5. `review-animations`

- Auditar motion: propósito, performance, prefers-reduced-motion, estándares en `STANDARDS.md`.

### 6. `mobile-native`

- Comportamiento táctil, targets, scroll, teclado, patrones nativos esperables en web móvil.

### 7. `webapp-testing`

- Si hay app web ejecutable: automatizar smoke visual/funcional básico con los scripts/ejemplos de la skill (Playwright/servidor local según el proyecto).
- Si no hay entorno de prueba, documentar limitación y sustituir con checklist manual.

## Formato del reporte (obligatorio)

Entregar un markdown en español:

```markdown
# Reporte design-qa — [nombre superficie]

**Fecha:** …
**Referencia:** DESIGN.md
**Alcance:** rutas / componentes revisados

## Resumen ejecutivo
(3–5 bullets)

## Hallazgos por categoría
### UX y jerarquía
### Visual y DESIGN.md
### Accesibilidad
### Motion
### Responsive / móvil
### Técnico / testing

## Acciones recomendadas
| Prioridad | Acción | Skill origen |
|-----------|--------|--------------|

## Veredicto
[ ] Listo  [ ] Listo con deuda documentada  [ ] No listo — bloqueantes: …
```

## Reglas

- No omitir pasos por tiempo; si una skill no está instalada, indicarlo en el reporte y ejecutar equivalente manual.
- Los bloqueantes de accesibilidad o contraste incumpliendo `DESIGN.md` impiden veredicto “Listo”.
- Corregir código solo si el usuario lo pidió en el mismo hilo; por defecto **reporte primero**.
