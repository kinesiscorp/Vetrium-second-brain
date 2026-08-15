# 0004 - CRM Vetrium

## Contexto
Clientes, leads e materiais da Vetrium viviam em Markdown solto (`clientes/*.md`) — funcionava como um "CRM em texto", mas sem pipeline visual, sem lugar pra anexar materiais por cliente, e sem histórico estruturado de interações. Com dois sócios (Gabriel Antonio e Gabriel Carvalho) usando o mesmo pipeline, faltava um lugar único pra organizar isso.

## Objetivo
Ter uma aplicação web própria pra organizar clientes/leads, funil comercial, materiais e histórico de interações, substituindo `clientes/*.md` como fonte da verdade.

## Escopo
- Cadastro de clientes/leads (nome, descrição, origem, estágio, próximo passo, bloqueio).
- Pipeline/funil visual em kanban (Lead → Contato → Proposta → Negociação → Fechado → Perdido).
- Biblioteca de materiais por cliente (upload/download de arquivos).
- Histórico de interações por cliente (notas cronológicas).
- Login (conta compartilhada única por enquanto — ver `decisions/0004-crm-substitui-clientes-md.md`).
- Migração dos dados existentes de `clientes/*.md` via seed.
- Preparação de deploy (Dockerfile, docker-entrypoint, `.env.example`, `DEPLOY.md`) para a VPS compartilhada via Coolify.

## Fora de escopo
- Deploy de fato no Coolify (execução manual, depende de acesso SSH/painel — ver `DEPLOY.md` no repo `vetrium-crm`).
- Contas individuais por sócio (login é uma conta compartilhada única na v1).
- Re-anexar os arquivos que já estavam em `clientes/anexos/` e `clientes/da-o-play/briefing.pdf` como materiais no CRM (fica pra depois, manual).

## Critérios de aceite
- [x] Repositório `vetrium-crm` criado como submodule, rodando localmente com `npm run dev`.
- [x] Auth funcionando (login, sessão, troca de senha).
- [x] CRUD de clientes, kanban com persistência de estágio, upload/download de materiais, histórico de interações.
- [x] Seed migra os 6 registros de `clientes/*.md` (Frog, JJL Serviços, Dá o Play, Inergi, Tripilar, JSL Serviços) com os dados corretos.
- [x] `npm run build` sem erros de tipo.
- [x] Imagem Docker builda localmente.
- [ ] Deploy em produção no Coolify (manual, fora de escopo desta spec).
