#!/bin/bash

set -e

BASE_DIR="db/migrations"
VALID_TYPES=("migration" "undo" "repair")

if [ -z "$1" ]; then
  echo "Uso: ./scripts/new_migration.sh \"descrição da migration\" [tipo]"
  echo "Tipos válidos: migration (default), undo, repair"
  exit 1
fi

DESC_RAW="$1"
TYPE="${2:-migration}"

if [[ ! " ${VALID_TYPES[*]} " =~ " ${TYPE} " ]]; then
  echo "Tipo inválido: ${TYPE}"
  echo "Tipos válidos: ${VALID_TYPES[*]}"
  exit 1
fi

MIGRATIONS_DIR="${BASE_DIR}/${TYPE}"
mkdir -p "$MIGRATIONS_DIR"

if [ "$TYPE" = "migration" ]; then
  last=$(ls "${BASE_DIR}/migration"/V*__*.sql 2>/dev/null | sed 's/^.*V\([0-9]*\)__.*$/\1/' | sort -n | tail -1)
else
  last=$(ls "$MIGRATIONS_DIR"/V*__*.sql 2>/dev/null | sed 's/^.*V\([0-9]*\)__.*$/\1/' | sort -n | tail -1)
fi
if [ -z "$last" ]; then
  last=0
fi
next=$((last + 1))

desc=$(echo "$DESC_RAW" | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | tr -cd 'a-z0-9_')
filename="V${next}__${desc}.sql"

filepath="${MIGRATIONS_DIR}/${filename}"

cat <<EOF > "$filepath"
-- ==============================================
-- Migration: ${filename}
-- Tipo: ${TYPE}
-- Criada em: $(date '+%Y-%m-%d %H:%M:%S')
-- ==============================================

-- Escreva seus comandos SQL abaixo:


EOF

echo "Criado: $filepath"

if [ "$TYPE" = "migration" ]; then
  undo_dir="${BASE_DIR}/undo"
  mkdir -p "$undo_dir"
  undo_path="${undo_dir}/${filename}"
  cat <<EOF > "$undo_path"
-- ==============================================
-- Migration: ${filename}
-- Tipo: undo (gerado automaticamente)
-- Criada em: $(date '+%Y-%m-%d %H:%M:%S')
-- ==============================================

-- Escreva aqui os comandos para desfazer a migration correspondente.


EOF
  echo "Criado undo correspondente: $undo_path"
fi
