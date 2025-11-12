#!/bin/bash

set -e

BASE_DIR="src/main/resources/db/migrations"
VALID_TYPES=("schema" "seed")

if [ -z "$1" ]; then
  echo "Uso: ./scripts/new_migration.sh \"descrição da migration\" [tipo]"
  echo "Tipos válidos: schema (default), seed"
  exit 1
fi

DESC_RAW="$1"
TYPE="${2:-schema}"

if [[ ! " ${VALID_TYPES[*]} " =~ " ${TYPE} " ]]; then
  echo "Tipo inválido: ${TYPE}"
  echo "Tipos válidos: ${VALID_TYPES[*]}"
  exit 1
fi

if [ "$TYPE" = "seed" ]; then
  MIGRATIONS_DIR="${BASE_DIR}/repeatable"
  PREFIX="R"
  PATTERN="s/.*${PREFIX}__([0-9]+)_.*\.sql/\1/"
else
  MIGRATIONS_DIR="${BASE_DIR}/schema"
  PREFIX="V"
  PATTERN="s/.*${PREFIX}([0-9]+)__.*\.sql/\1/"
fi

mkdir -p "$MIGRATIONS_DIR"

last=$(find "${MIGRATIONS_DIR}" -type f -name "${PREFIX}*__*.sql" 2>/dev/null \
  | sed -E "${PATTERN}" \
  | sort -n | tail -1)

if [ -z "$last" ]; then
  last=0
fi

next=$((last + 1))

if [ "$TYPE" = "seed" ]; then
  filename="${PREFIX}__${next}_$(echo "$DESC_RAW" | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | tr -cd 'a-z0-9_').sql"
else
  filename="${PREFIX}${next}__$(echo "$DESC_RAW" | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | tr -cd 'a-z0-9_').sql"
fi

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

if [ "$TYPE" = "schema" ]; then
  undo_dir="${BASE_DIR}/undo"
  mkdir -p "$undo_dir"
  undo_filename="U${next}__$(echo "$DESC_RAW" | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | tr -cd 'a-z0-9_').sql"
  undo_path="${undo_dir}/${undo_filename}"

  cat <<EOF > "$undo_path"
-- ==============================================
-- Undo Migration: ${undo_filename}
-- Referente a: ${filename}
-- Criada em: $(date '+%Y-%m-%d %H:%M:%S')
-- ==============================================

-- Escreva aqui os comandos para desfazer a migration correspondente.


EOF
  echo "Criado undo correspondente: $undo_path"
fi
