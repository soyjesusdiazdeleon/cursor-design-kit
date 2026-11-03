#!/usr/bin/env bash
# Cursor Design Kit — instalador idempotente (macOS/Linux)
set -euo pipefail

KIT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="${KIT_ROOT}/skills"
CURSOR_SKILLS="${HOME}/.cursor/skills"
INSTALL_EXTERNAL=1
PROJECT_DIR=""

usage() {
  cat <<'EOF'
Uso: ./install.sh [opciones]

Instala skills del kit en ~/.cursor/skills/ y skills externas vía CLI oficial.

Opciones:
  --project RUTA, -p RUTA   Copia rules/ → RUTA/.cursor/rules/ y templates/DESIGN.md → RUTA/DESIGN.md
                            (no sobrescribe DESIGN.md existente salvo --force-design)
  --force-design            Sobrescribe DESIGN.md en el proyecto destino
  --skip-external           No ejecuta uipro, impeccable ni skills add (solo copia locales)
  -h, --help                Muestra esta ayuda

Ejemplo:
  ./install.sh
  ./install.sh --project ~/dev/mi-app
EOF
}

log() {
  printf '\033[1;34m[cursor-design-kit]\033[0m %s\n' "$*"
}

warn() {
  printf '\033[1;33m[cursor-design-kit]\033[0m %s\n' "$*" >&2
}

copy_local_skills() {
  mkdir -p "${CURSOR_SKILLS}"
  local dir name
  for dir in "${SKILLS_SRC}"/*/; do
    name="$(basename "${dir}")"
    if [[ ! -f "${dir}/SKILL.md" ]]; then
      log "Omitiendo ${name}/ (sin SKILL.md; ver INSTALL.md si aplica)"
      continue
    fi
    log "Sincronizando skill: ${name}"
    mkdir -p "${CURSOR_SKILLS}/${name}"
    # shellcheck disable=SC2031
    cp -R "${dir}"* "${CURSOR_SKILLS}/${name}/"
  done
}

install_external_skills() {
  if [[ "${INSTALL_EXTERNAL}" -eq 0 ]]; then
    warn "Instalación externa omitida (--skip-external)"
    return 0
  fi

  if ! command -v npx >/dev/null 2>&1; then
    warn "npx no encontrado; instala Node.js o usa --skip-external"
    return 1
  fi

  log "Instalando UI UX Pro Max (global, Cursor)…"
  (cd "${HOME}" && npx --yes ui-ux-pro-max-cli init --ai cursor --global --force)

  log "Instalando Impeccable…"
  (cd "${HOME}" && npx --yes impeccable install </dev/null || true)

  log "Instalando Vercel agent-skills (incl. web-design-guidelines)…"
  npx --yes skills add vercel-labs/agent-skills -g -a cursor -y || warn "skills add falló; ejecuta manualmente"

  if [[ -d "${HOME}/.agents/skills/web-design-guidelines" ]] \
    && [[ ! -e "${CURSOR_SKILLS}/web-design-guidelines" ]]; then
    log "Enlace web-design-guidelines → ~/.cursor/skills/ (compatibilidad)"
    ln -s "${HOME}/.agents/skills/web-design-guidelines" "${CURSOR_SKILLS}/web-design-guidelines"
  fi
}

install_project_scaffold() {
  local dest="${1}"
  local rules_dest="${dest}/.cursor/rules"
  local design_dest="${dest}/DESIGN.md"
  local force_design="${2:-0}"

  if [[ ! -d "${dest}" ]]; then
    warn "Ruta de proyecto no existe: ${dest}"
    return 1
  fi

  mkdir -p "${rules_dest}"
  log "Copiando reglas a ${rules_dest}"
  cp -R "${KIT_ROOT}/rules/"* "${rules_dest}/"

  if [[ -f "${design_dest}" && "${force_design}" -eq 0 ]]; then
    warn "DESIGN.md ya existe en ${dest}; no se sobrescribe (usa --force-design)"
  else
    log "Copiando plantilla DESIGN.md → ${design_dest}"
    cp "${KIT_ROOT}/templates/DESIGN.md" "${design_dest}"
  fi
}

FORCE_DESIGN=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    -p | --project)
      PROJECT_DIR="${2:-}"
      shift 2
      ;;
    --force-design)
      FORCE_DESIGN=1
      shift
      ;;
    --skip-external)
      INSTALL_EXTERNAL=0
      shift
      ;;
    -h | --help)
      usage
      exit 0
      ;;
    *)
      warn "Opción desconocida: $1"
      usage
      exit 1
      ;;
  esac
done

log "Kit: ${KIT_ROOT}"
copy_local_skills
install_external_skills

if [[ -n "${PROJECT_DIR}" ]]; then
  PROJECT_DIR="$(cd "${PROJECT_DIR}" && pwd)"
  install_project_scaffold "${PROJECT_DIR}" "${FORCE_DESIGN}"
fi

log "Listo. Reinicia Cursor para recargar skills y reglas."
