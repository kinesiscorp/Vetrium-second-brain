#!/bin/sh
# Prepara um clone novo deste repo. Rode uma vez por máquina:
#
#     git clone https://github.com/kinesiscorp/vetrium-second-brain.git
#     cd vetrium-second-brain && sh scripts/bootstrap.sh

set -e
cd "$(git rev-parse --show-toplevel)"

# core.hooksPath é config local — não vem no clone, precisa ser setado aqui.
git config core.hooksPath .githooks
echo "ok  hooks ativados (.githooks)"

git submodule update --init --recursive
echo "ok  submodules: vetrium-lp, esquadrao-do-frog"

cat <<'EOF'

Pronto. Falta só o que o git não carrega:

  - vetrium-lp/.env.local
  - esquadrao-do-frog/.env.local
  - npm install dentro de cada submodule

Daqui em diante, use `sh scripts/sync.sh` para publicar.
EOF
