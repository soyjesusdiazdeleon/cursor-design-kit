# Cursor Design Kit — instalador idempotente (Windows PowerShell)
param(
    [string]$Project,
    [switch]$ForceDesign,
    [switch]$SkipExternal,
    [switch]$Help
)

$ErrorActionPreference = "Stop"
$KitRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillsSrc = Join-Path $KitRoot "skills"
$CursorSkills = Join-Path $env:USERPROFILE ".cursor\skills"

function Write-KitLog([string]$Message) {
    Write-Host "[cursor-design-kit] $Message" -ForegroundColor Cyan
}

function Write-KitWarn([string]$Message) {
    Write-Host "[cursor-design-kit] $Message" -ForegroundColor Yellow
}

if ($Help) {
    @"
Uso: .\install.ps1 [-Project RUTA] [-ForceDesign] [-SkipExternal]

Instala skills del kit en %USERPROFILE%\.cursor\skills\ y skills externas vía CLI.

-Project       Copia rules\ y templates\DESIGN.md al proyecto
-ForceDesign   Sobrescribe DESIGN.md existente
-SkipExternal  Omite uipro, impeccable y skills add
"@
    exit 0
}

Write-KitLog "Kit: $KitRoot"
New-Item -ItemType Directory -Force -Path $CursorSkills | Out-Null

Get-ChildItem -Path $SkillsSrc -Directory | ForEach-Object {
    $skillFile = Join-Path $_.FullName "SKILL.md"
    if (-not (Test-Path $skillFile)) {
        Write-KitLog "Omitiendo $($_.Name)/ (sin SKILL.md)"
        return
    }
    $dest = Join-Path $CursorSkills $_.Name
    Write-KitLog "Sincronizando skill: $($_.Name)"
    New-Item -ItemType Directory -Force -Path $dest | Out-Null
    Copy-Item -Path (Join-Path $_.FullName "*") -Destination $dest -Recurse -Force
}

if (-not $SkipExternal) {
    if (-not (Get-Command npx -ErrorAction SilentlyContinue)) {
        Write-KitWarn "npx no encontrado; usa -SkipExternal o instala Node.js"
    }
    else {
        Write-KitLog "Instalando UI UX Pro Max…"
        Push-Location $env:USERPROFILE
        npx --yes ui-ux-pro-max-cli init --ai cursor --global --force
        Pop-Location

        Write-KitLog "Instalando Impeccable…"
        Push-Location $env:USERPROFILE
        npx --yes impeccable install
        Pop-Location

        Write-KitLog "Instalando Vercel agent-skills…"
        npx --yes skills add vercel-labs/agent-skills -g -a cursor -y

        $agentsGuidelines = Join-Path $env:USERPROFILE ".agents\skills\web-design-guidelines"
        $cursorGuidelines = Join-Path $CursorSkills "web-design-guidelines"
        if ((Test-Path $agentsGuidelines) -and -not (Test-Path $cursorGuidelines)) {
            Write-KitLog "Enlace web-design-guidelines en .cursor\skills"
            New-Item -ItemType SymbolicLink -Path $cursorGuidelines -Target $agentsGuidelines | Out-Null
        }
    }
}
else {
    Write-KitWarn "Instalación externa omitida (-SkipExternal)"
}

if ($Project) {
    $Project = (Resolve-Path $Project).Path
    $rulesDest = Join-Path $Project ".cursor\rules"
    $designDest = Join-Path $Project "DESIGN.md"

    New-Item -ItemType Directory -Force -Path $rulesDest | Out-Null
    Write-KitLog "Copiando reglas a $rulesDest"
    Copy-Item -Path (Join-Path $KitRoot "rules\*") -Destination $rulesDest -Recurse -Force

    if ((Test-Path $designDest) -and -not $ForceDesign) {
        Write-KitWarn "DESIGN.md ya existe; usa -ForceDesign para sobrescribir"
    }
    else {
        Copy-Item (Join-Path $KitRoot "templates\DESIGN.md") $designDest -Force
    }
}

Write-KitLog "Listo. Reinicia Cursor para recargar skills y reglas."
