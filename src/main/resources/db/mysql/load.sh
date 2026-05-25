#!/usr/bin/env bash
# Loads the committed MySQL dump into the running shift-happens-db container.
# Usage: bash src/main/resources/db/mysql/load.sh
# Run from anywhere — the script resolves its own path.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DUMP_FILE="$SCRIPT_DIR/mysql.sql"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../../../.." && pwd)"
cd "$REPO_ROOT"

set -a; source .env; set +a

GREEN='\033[0;32m'; BOLD='\033[1m'; NC='\033[0m'

[[ -f "$DUMP_FILE" ]] || { echo "No dump found at $DUMP_FILE. Generate one with: make backup"; exit 1; }

echo "Loading MySQL dump from $DUMP_FILE..."

docker exec shift-happens-db mysql \
  -u root -p"${MYSQL_ROOT_PASSWORD}" \
  -e "DROP DATABASE IF EXISTS \`${MYSQL_DATABASE}\`; CREATE DATABASE \`${MYSQL_DATABASE}\`;" 2>/dev/null

docker exec -i shift-happens-db mysql \
  -u root -p"${MYSQL_ROOT_PASSWORD}" \
  "${MYSQL_DATABASE}" < "$DUMP_FILE" 2>/dev/null

ROW_COUNT=$(docker exec shift-happens-db mysql \
  -u root -p"${MYSQL_ROOT_PASSWORD}" -sN \
  -e "SELECT COUNT(*) FROM \`${MYSQL_DATABASE}\`.employee;" 2>/dev/null)

echo -e "${GREEN}${BOLD}MySQL loaded — $ROW_COUNT employee rows.${NC}"
