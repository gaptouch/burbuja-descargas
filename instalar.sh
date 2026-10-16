#!/bin/bash
# Instala (o reinstala) Burbuja en Aplicaciones sin el aviso de macOS.
# Uso: curl -fsSL https://raw.githubusercontent.com/gaptouch/burbuja-descargas/main/instalar.sh | bash
set -euo pipefail

URL="https://github.com/gaptouch/burbuja-descargas/raw/main/Burbuja.dmg"
DEST="/Applications/Burbuja.app"
TMP="$(mktemp -d)"
MNT=""

limpiar() {
  [ -n "$MNT" ] && hdiutil detach "$MNT" -quiet 2>/dev/null || true
  rm -rf "$TMP"
}
trap limpiar EXIT

echo "Descargando Burbuja…"
curl -fL --progress-bar "$URL" -o "$TMP/Burbuja.dmg"

MNT="$(hdiutil attach -nobrowse -readonly "$TMP/Burbuja.dmg" | awk -F'\t' '/\/Volumes\// {print $NF}' | tail -1)"
if [ -z "$MNT" ] || [ ! -d "$MNT/Burbuja.app" ]; then
  echo "No se ha podido abrir el .dmg." >&2
  exit 1
fi

# Cierra la versión que esté abierta antes de cambiarla.
pkill -x Burbuja 2>/dev/null || true
sleep 1

echo "Instalando en Aplicaciones…"
if [ -w /Applications ]; then
  rm -rf "$DEST"
  ditto "$MNT/Burbuja.app" "$DEST"
  xattr -dr com.apple.quarantine "$DEST" 2>/dev/null || true
else
  echo "Hace falta la contraseña del Mac para escribir en Aplicaciones."
  sudo rm -rf "$DEST"
  sudo ditto "$MNT/Burbuja.app" "$DEST"
  sudo xattr -dr com.apple.quarantine "$DEST" 2>/dev/null || true
fi

echo "Listo. Abriendo Burbuja (vive en la barra de menús, arriba a la derecha)."
open "$DEST"
