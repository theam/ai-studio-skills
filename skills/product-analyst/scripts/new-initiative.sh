#!/usr/bin/env bash
set -euo pipefail

# Crea una nueva carpeta de iniciativa con plantillas copiadas.
# Uso:
#   ./scripts/new-initiative.sh "nombre-iniciativa" [ruta_destino]
#
# Ejemplo:
#   ./scripts/new-initiative.sh "activation-search" ./initiatives

NAME="${1:-}"
DEST="${2:-./initiatives}"

if [[ -z "$NAME" ]]; then
  echo "Usage: $0 "initiative-name" [dest]"
  exit 1
fi

TARGET="$DEST/$NAME"
mkdir -p "$TARGET"

cp -n assets/templates/product-brief.md "$TARGET/product-brief.md" || true
cp -n assets/templates/hypothesis-and-metrics.md "$TARGET/hypothesis-and-metrics.md" || true
cp -n assets/templates/data-plan.md "$TARGET/data-plan.md" || true
cp -n assets/templates/execution-plan.md "$TARGET/execution-plan.md" || true
cp -n assets/templates/decision-log.md "$TARGET/decision-log.md" || true
cp -n assets/templates/weekly-sync.md "$TARGET/weekly-sync.md" || true

echo "Created initiative folder: $TARGET"
echo "Next: fill the templates and commit them."
