# 0005 - CRM integrado ao vetrium-lp (não mais repo separado)

Data: 16/08/2026
Status: Ativa

## Contexto
`decisions/0004-crm-substitui-clientes-md.md` criou o CRM como repo próprio
(`vetrium-crm`, submodule separado), deploy planejado via Docker/Coolify na VPS.
Depois de construído e validado localmente, o Douglas pediu pra juntar o CRM
dentro do repo do site institucional (`vetrium-lp`), acessível em `/admin`, em
vez de manter dois repositórios/dois apps separados.

## Decisão
- Todo o código do CRM (auth, Prisma/Postgres, componentes, rotas de API) foi
  movido de `vetrium-crm` pra `vetrium-lp`, sob `src/app/admin/`. Rotas de UI
  passam a viver em `/admin/*` (`/admin/entrar`, `/admin/clientes`,
  `/admin/funil`, `/admin/conta/senha`); rotas de API continuam em `/api/*`.
- `vetrium-lp` fazia deploy automático na Vercel (site estático, sem backend).
  Com o admin dentro do mesmo app (Postgres + upload de arquivo em disco), o
  deploy migra pra Docker/Coolify na VPS compartilhada — mesmo padrão já usado
  no BarberFlow e no Salgados-Flow. `Dockerfile`, `docker-compose.yml`,
  `docker-entrypoint.sh` e `DEPLOY.md` migraram junto, sem mudança de conteúdo
  relevante (só apontam pro app unificado agora).
- Porta reservada continua `3050` em `VPS.md`, agora com a descrição atualizada
  (site + admin, não mais "CRM" isolado).
- `vetrium-lp` é um repositório **público** no GitHub. O Douglas está ciente
  de que isso deixa o código do admin (lógica de auth, schema, rotas de
  cliente) visível publicamente — os dados continuam protegidos por login,
  só o código fica exposto. Ele pretende tornar o repo privado mais adiante;
  até lá, o repo segue público por decisão dele.
- O repo `kinesiscorp/vetrium-crm` foi **deletado** do GitHub depois que o
  código foi migrado e validado no `vetrium-lp` (build, login, kanban, upload
  e seed testados de ponta a ponta antes da remoção).

## Consequências
- Um único app Next.js, um único deploy, uma única URL/domínio pro site
  público e pro admin — mais simples de operar com dois sócios.
- Perda do deploy zero-config da Vercel pro site institucional; deploy agora é
  manual via Coolify (sem CI/CD), igual aos outros projetos na VPS.
- `decisions/0004` continua válida quanto à decisão central (CRM é a fonte da
  verdade pros dados de cliente) — só a referência de repositório nela ficou
  desatualizada; esta ADR é o registro atual de onde o código mora.
- Novo trabalho de admin/CRM entra em `vetrium-lp/src/app/admin/`, não em um
  repo separado.
