# Componentes de terceros

Material incluido o instalado por el **Cursor Design Kit**. Verifica siempre la licencia upstream antes de redistribuir.

| Componente | Autor | Licencia | URL | En el kit |
| --- | --- | --- | --- | --- |
| emil-design-eng | Emil Kowalski | MIT | https://github.com/emilkowalski/skills/tree/main/skills/emil-design-eng | **Copiado** en `skills/emil-design-eng/` |
| review-animations | Emil Kowalski | MIT | https://github.com/emilkowalski/skills/tree/main/skills/review-animations | **Copiado** en `skills/review-animations/` |
| mobile-native | Emil Kowalski | MIT | https://github.com/emilkowalski/skills/tree/main/skills/mobile-native | **Copiado** en `skills/mobile-native/` |
| break-ui | Emil Kowalski | MIT | https://github.com/emilkowalski/skills/tree/main/skills/break-ui | **Copiado** en `skills/break-ui/` |
| create-design-md | Julien Thibeaut (ibelick) | MIT | https://github.com/ibelick/ui-skills/tree/main/skills/create-design-md | **Copiado** en `skills/create-design-md/` |
| stageshow | Benji Taylor | MIT | https://github.com/benjitaylor/skills/tree/main/stageshow | **Copiado** en `skills/stageshow/` |
| frontend-design | Anthropic | Apache-2.0 | https://github.com/anthropics/skills/tree/main/skills/frontend-design | **Copiado** en `skills/frontend-design/` |
| webapp-testing | Anthropic | Apache-2.0 | https://github.com/anthropics/skills/tree/main/skills/webapp-testing | **Copiado** en `skills/webapp-testing/` |
| ui-ux-pro-max | Next Level Builder | MIT | https://github.com/nextlevelbuilder/ui-ux-pro-max-skill | **Solo instalación** (`npx ui-ux-pro-max-cli init --ai cursor --global`) — bundle grande y rutas generadas por CLI |
| impeccable | Paul Bakaus | Apache-2.0 | https://github.com/pbakaus/impeccable | **Solo instalación** (`npx impeccable install`) — binario y referencias sincronizadas por upstream |
| web-design-guidelines | Vercel Labs | *Sin LICENSE en repo* | https://github.com/vercel-labs/agent-skills | **Solo instalación** (`npx skills add vercel-labs/agent-skills`) — no se copia por ausencia de licencia clara en origen |
| shadcn/ui | shadcn | MIT (por componente) | https://ui.shadcn.com | **Por proyecto** (`npx shadcn@latest init`) — no forma parte del kit global |
| Motion Primitives | ibelick | MIT (CLI 0.1.0; beta) | https://motion-primitives.com | **Por proyecto** (`npx motion-primitives@0.1.0 add …`) |

## Excluidos a propósito

| Componente | Motivo |
| --- | --- |
| getdesign.ai | Producto de pago |
| GStack | No incluido en el alcance del kit |

## Skills propias del kit (MIT, Jesús Díaz de León)

| Skill | Ruta |
| --- | --- |
| design-direction | `skills/design-direction/` |
| design-build | `skills/design-build/` |
| design-qa | `skills/design-qa/` |

## Notas de cumplimiento

- Copias MIT/Apache incluyen `LICENSE` o `LICENSE.txt` y `ORIGIN.md` con URL y estado de modificaciones.
- Skills Apache-2.0 sin modificaciones: copia fiel; cualquier cambio futuro debe marcarse en `ORIGIN.md` según Apache-2.0.
- `web-design-guidelines` se instala en `~/.agents/skills/`; `install.sh` puede crear un enlace simbólico en `~/.cursor/skills/` para compatibilidad.
