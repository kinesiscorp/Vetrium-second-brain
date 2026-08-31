# 0004 - CRM Vetrium

Spec relacionada: `specs/0004-crm-vetrium.md`. Decisão de substituir `clientes/*.md`: `decisions/0004-crm-substitui-clientes-md.md`.

## Stack
Next.js 16 (App Router) + TypeScript + Tailwind v4 — mesmo padrão de `vetrium-lp`/`esquadrao-do-frog`. Prisma 7 (driver adapter `@prisma/adapter-pg`) + Postgres. Auth: NextAuth v5 (Credentials) + bcrypt, sessão JWT, sem self-signup (conta única criada via seed). Upload de materiais: Route Handler gravando em `UPLOAD_DIR` (volume persistente em produção). Kanban: `@dnd-kit/core`.

Reaproveitado de projetos irmãos: padrão de auth de `~/dev/iron-streak` (`src/lib/auth.ts`), padrão de Dockerfile multi-stage + `docker-entrypoint.sh` (migrate + seed condicional via `RUN_SEED`) + upload em diretório configurável de `~/dev/pedidos-flow`.

## Modelo de dados
```prisma
enum EstagioFunil { LEAD CONTATO PROPOSTA NEGOCIACAO FECHADO PERDIDO }

model User { id, email (unique), name, passwordHash, createdAt }
model Cliente { id, nome, descricao?, origem?, estagio, proximoPasso?, bloqueio?, createdAt, updatedAt, interacoes[], materiais[] }
model Interacao { id, clienteId → Cliente, autorId → User, nota, data }
model Material { id, clienteId → Cliente, nomeArquivo, caminho, tipo?, uploadedAt }
```

## Estrutura da aplicação
- `src/app/entrar/` — login (`LoginForm`, client component com `signIn` do `next-auth/react`).
- `src/app/(app)/` — layout protegido (checa `auth()` inline, sem `middleware.ts`), contém:
  - `clientes/` — lista, `clientes/novo/`, `clientes/[id]/` (detalhe + materiais + interações).
  - `funil/` — kanban (`KanbanBoard`, client component com `@dnd-kit/core`).
  - `conta/senha/` — trocar senha.
- `src/app/api/clientes/`, `.../materiais/`, `.../interacoes/`, `src/app/api/conta/senha/` — route handlers, cada um checando `requireUserId()` (`src/lib/require-auth.ts`).
- `src/lib/auth.ts`, `src/lib/db.ts` (Prisma client singleton com adapter `pg`), `src/lib/uploads.ts`, `src/lib/estagios.ts` (labels em pt-BR do enum).

## Autenticação — conta única (v1)
Diferente do plano original de dois usuários nomeados, o Douglas pediu uma única conta compartilhada de admin (`admin@vetrium.com.br`) pra Douglas e Gabriel Carvalho usarem por enquanto — sem self-signup, senha temporária gerada no seed e trocável em `/conta/senha`. `Interacao.autorId` continua com FK pra `User`, então dá pra evoluir pra contas individuais depois sem migração de schema.

## Seed / migração de dados
`prisma/seed.ts` (idempotente, `PrismaClient` próprio — não reaproveita `src/lib/db.ts` porque o container de produção só carrega `prisma/` + `src/generated/`, ver Dockerfile): cria o usuário admin e os 6 clientes/leads mapeados manualmente a partir de `clientes/frog.md`, `jjl-servicos.md`, `da-o-play.md`, `leads.md` (Inergi, Tripilar, JSL Serviços), cada um com uma `Interacao` inicial reproduzindo o conteúdo do `.md` original.

## Deploy (Dokku) — executado em 29/08/2026
`Dockerfile` multi-stage (`node:22-alpine`), `docker-entrypoint.sh` roda `prisma migrate deploy` sempre e `npx tsx prisma/seed.ts` só se `RUN_SEED=true`. Passo a passo completo em `vetrium-lp/DEPLOY.md` (o CRM vive dentro do `vetrium-lp` desde `decisions/0005`, não em repo próprio). Porta reservada: `3050` (ver `~/dev/VPS.md`).

O que já está de pé na VPS: app `vetrium-lp`, Postgres `vetrium-lp-db` linkado, volume montado em `/app/uploads`, `AUTH_SECRET`/`UPLOAD_DIR` setados, `RUN_SEED=false` (o seed já rodou: admin + os 6 clientes/leads criados). Container `Running: true`, Next.js respondendo na 3000 interna.

Dois obstáculos apareceram no caminho e ficaram resolvidos/registrados:

- **Build quebrava no Alpine**: o `package-lock.json` foi gerado no macOS e só registrou as variantes `darwin-arm64` de `lightningcss` e `@tailwindcss/oxide`, então o `npm ci` não baixava os `.node` de `linux-x64-musl` e o `next build` morria no `globals.css` (Tailwind v4 usa lightningcss). Corrigido no `Dockerfile`, instalando as variantes musl com a versão lida do próprio lockfile.
- **`ports:set` não expõe de verdade**: ele só cria listener no nginx do host, que o firewall descarta. Os apps que funcionam publicam a porta pelo Docker (`docker-options deploy: -p`). Exige `domains:disable` + `ports:clear` antes, senão o nginx segura a 3050 e o container não sobe.

## Bloqueio atual: firewall de borda
`http://191.241.136.77:3050/` dá **timeout de fora** — não é o app. `3030`/`3333` respondem, `3050`/`3070` não; `80`/`443` direto no IP também não (o domínio só responde via Cloudflare). É allowlist de firewall, e o usuário `dokku` não tem como mexer nela. Saídas: abrir a 3050 com quem administra a VPS, ou servir por subdomínio + Let's Encrypt na 443. Detalhes em `vetrium-lp/DEPLOY.md`.

## Próximos passos
- Destravar o acesso externo (abrir a 3050 **ou** migrar pra subdomínio + HTTPS).
- No primeiro login, trocar a senha temporária do admin em `/admin/conta/senha`.
- Avaliar contas individuais por sócio quando fizer sentido (schema já suporta).
- Re-anexar `clientes/anexos/` e `clientes/arquivo/da-o-play/briefing.pdf` como materiais no CRM.
