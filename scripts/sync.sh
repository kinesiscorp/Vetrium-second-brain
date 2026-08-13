#!/bin/sh
# Sincroniza o second-brain com o GitHub, submodules incluídos.
#
#   scripts/sync.sh          sincroniza e faz push do que já está commitado
#   scripts/sync.sh --check  só verifica e reporta, não escreve nada (usado pelo pre-push)
#   scripts/sync.sh --auto   commita a documentação pendente antes de sincronizar
#
# Ordem importa: submodule antes da raiz. Se a raiz for publicada apontando para um
# commit de submodule que ninguém mais consegue baixar, o clone quebra na outra máquina.

set -e

CHECK_ONLY=0
AUTO_COMMIT=0
[ "$1" = "--check" ] && CHECK_ONLY=1
[ "$1" = "--auto" ] && AUTO_COMMIT=1

ROOT=$(git rev-parse --show-toplevel)
cd "$ROOT"

say()  { printf '%s\n' "$*"; }
fail() { printf 'ERRO: %s\n' "$*" >&2; exit 1; }

# --------------------------------------------------------------------------
# 0. Auto-commit (--auto): só a documentação do second-brain.
#
# Deliberadamente restrito a estas pastas. Um `git add -A` cego aqui varreria
# arquivo solto largado na raiz, dump de cliente, .env copiado por engano —
# coisas que não dá pra despublicar depois de subirem. Submodule nunca entra:
# cada um se commita no próprio repo.
# --------------------------------------------------------------------------
DOC_PATHS="specs plans decisions clientes projetos design frog CLAUDE.md README.md"

if [ "$AUTO_COMMIT" = "1" ]; then
    EXISTENTES=""
    for p in $DOC_PATHS; do
        [ -e "$p" ] && EXISTENTES="$EXISTENTES $p"
    done

    if [ -n "$(git status --porcelain -- $EXISTENTES)" ]; then
        git add -- $EXISTENTES
        RESUMO=$(git diff --cached --name-only | sed 's|/.*||' | sort -u | tr '\n' ' ')
        git commit --quiet -m "Sync automatico da documentacao ($RESUMO)"
        say "  commit   documentação pendente: $RESUMO"
    fi

    FORA=$(git status --porcelain | grep -v -E "^.. ($(echo $DOC_PATHS | tr ' ' '|'))" || true)
    if [ -n "$FORA" ]; then
        say "  aviso    fora das pastas de documentação, NÃO commitado:"
        printf '%s\n' "$FORA" | sed 's/^/           /'
    fi
fi

# --------------------------------------------------------------------------
# 1. Submodules: cada um precisa estar publicado antes da raiz apontar pra ele
# --------------------------------------------------------------------------
PENDENTE=0

git submodule --quiet foreach 'echo "$sm_path"' | while read -r SM; do
    [ -d "$SM/.git" ] || [ -f "$SM/.git" ] || continue
    SHA=$(git -C "$SM" rev-parse HEAD)

    git -C "$SM" fetch --quiet origin || fail "não consegui alcançar o remote de $SM"

    # O commit em que o submodule está existe em alguma branch do remote dele?
    # (não dá pra assumir origin/HEAD — nem todo clone de submodule tem esse ref)
    if [ -n "$(git -C "$SM" branch -r --contains "$SHA" 2>/dev/null)" ]; then
        say "  ok       $SM ($(git -C "$SM" rev-parse --short HEAD)) publicado"
    elif [ "$CHECK_ONLY" = "1" ]; then
        say "  PENDENTE $SM está em $(git -C "$SM" rev-parse --short HEAD), commit não publicado"
        echo pendente > "$ROOT/.git/SYNC_PENDING"
    else
        BR=$(git -C "$SM" rev-parse --abbrev-ref HEAD)
        [ "$BR" = "HEAD" ] && fail "$SM está em detached HEAD — faça checkout de uma branch antes"
        say "  push     $SM -> origin/$BR"
        git -C "$SM" push origin "$BR"
    fi

    # Trabalho não commitado dentro do submodule não é sincronizado por este script.
    if [ -n "$(git -C "$SM" status --porcelain)" ]; then
        say "  aviso    $SM tem alterações não commitadas (não vão subir)"
    fi
done

if [ -f "$ROOT/.git/SYNC_PENDING" ]; then
    rm -f "$ROOT/.git/SYNC_PENDING"
    PENDENTE=1
fi

# --------------------------------------------------------------------------
# 2. Raiz: trazer o que existe no remote antes de publicar o que existe aqui
# --------------------------------------------------------------------------
BRANCH=$(git rev-parse --abbrev-ref HEAD)
[ "$BRANCH" = "HEAD" ] && fail "raiz em detached HEAD"

git fetch --quiet origin "$BRANCH" || fail "não consegui alcançar o remote da raiz"

BEHIND=$(git rev-list --count "HEAD..origin/$BRANCH")
AHEAD=$(git rev-list --count "origin/$BRANCH..HEAD")

if [ "$BEHIND" -gt 0 ]; then
    if [ "$CHECK_ONLY" = "1" ]; then
        say "  ATRASADO raiz está $BEHIND commit(s) atrás de origin/$BRANCH"
        PENDENTE=1
    elif [ -n "$(git status --porcelain --untracked-files=no)" ]; then
        fail "raiz está $BEHIND atrás mas tem alterações não commitadas — commite antes de sincronizar"
    else
        say "  rebase   raiz: $BEHIND commit(s) de origin/$BRANCH"
        git rebase "origin/$BRANCH"
    fi
else
    say "  ok       raiz em dia com origin/$BRANCH"
fi

[ "$CHECK_ONLY" = "1" ] && { [ "$PENDENTE" = "1" ] && exit 1; exit 0; }

# --------------------------------------------------------------------------
# 3. Publicar
# --------------------------------------------------------------------------
if [ "$AHEAD" -gt 0 ] || [ "$BEHIND" -gt 0 ]; then
    say "  push     raiz -> origin/$BRANCH"
    git push origin "$BRANCH"
else
    say "  nada a publicar na raiz"
fi

if [ -n "$(git status --porcelain)" ]; then
    say ""
    say "Alterações não commitadas continuam aqui (o sync não commita por você):"
    git status --short
fi
