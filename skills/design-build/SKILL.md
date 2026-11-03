---
name: design-build
description: Implementa UI respetando DESIGN.md con shadcn/ui y Motion Primitives. Usar cuando haya que construir pantallas, componentes o flujos visuales ya definidos en dirección de diseño.
---

# design-build

Construye interfaz **production-ready** alineada con `DESIGN.md`. No redefinir la dirección visual aquí; si falta contexto, volver a `design-direction`.

## Cuándo usar

- Implementar páginas, layouts, componentes o flujos acordados.
- Extender un design system existente dentro de las reglas del proyecto.

## Antes de codificar

1. Leer `DESIGN.md` y las reglas en `.cursor/rules/` (especialmente `design-md-first`, `shadcn-ui`, `motion-primitives-version`).
2. Verificar stack del repo (React/Next, Tailwind, etc.).
3. Si shadcn/ui no está inicializado:

```bash
npx shadcn@latest init
```

Añadir componentes solo los necesarios:

```bash
npx shadcn@latest add button card input ...
```

## Stack de UI del kit

### shadcn/ui

- Preferir componentes de shadcn como base; personalizar con tokens de `DESIGN.md` (CSS variables, `tailwind.config`).
- No mezclar librerías de componentes competidoras sin motivo documentado.

### Motion Primitives (beta)

- Instalar motion: `npm install motion`
- Añadir primitivos con la versión fijada en reglas del proyecto (p. ej. CLI `motion-primitives@0.1.0`).
- Tratar la API como inestable: encapsular primitivos en componentes propios cuando el cambio upstream sea probable.

### `emil-design-eng`

- Consultar al definir interacción, estados hover/focus, y performance de animaciones.

## Proceso

1. **Mapear** la pantalla o feature a componentes shadcn + composiciones propias.
2. **Aplicar tokens** de `DESIGN.md` (color, tipo, spacing, radius, shadow) antes de estilos ad hoc.
3. **Motion**: solo movimiento con propósito (feedback, jerarquía, transición de estado); evitar entradas genéricas en cada sección.
4. **Accesibilidad**: foco visible, contraste según tokens, labels en formularios, roles ARIA cuando el primitivo no lo cubra.
5. **Responsive**: breakpoints acordados en `DESIGN.md`; probar al menos móvil y desktop.

## Entregables

- Código implementado y coherente con `DESIGN.md`.
- Nota breve de desviaciones (si alguna limitación técnica obligó a cambiar un token).
- Lista de componentes shadcn añadidos y primitivos Motion usados.

## Reglas

- No ignorar `DESIGN.md` “por velocidad”.
- No introducir gradientes, fuentes o layouts “AI slop” no reflejados en `DESIGN.md`.
- Texto visible al usuario: idioma del producto (a menudo español si el proyecto lo indica); identificadores de código en inglés.
