# 0004 - CRM substitui clientes/*.md como fonte da verdade

Data: 15/08/2026
Status: Ativa

## Contexto
`clientes/*.md` funcionava como um "CRM em texto" — status, próximo passo e bloqueios de cada cliente/lead em Markdown solto. Com dois sócios usando o mesmo pipeline e a necessidade de organizar materiais e histórico de interações por cliente, o formato Markdown deixou de ser suficiente (sem pipeline visual, sem lugar pra anexar arquivo por cliente, sem histórico estruturado). Ver `specs/0004-crm-vetrium.md` e `plans/0004-crm-vetrium.md`.

## Decisão
- O CRM (`vetrium-crm`, submodule) passa a ser a **fonte da verdade** pros dados de cliente/lead: cadastro, estágio do funil, próximo passo, bloqueio, materiais e histórico de interações.
- `clientes/frog.md`, `clientes/jjl-servicos.md`, `clientes/leads.md` e `clientes/da-o-play.md` foram migrados pro CRM via seed (`vetrium-crm/prisma/seed.ts`) e movidos pra `clientes/arquivo/` — mantidos como registro histórico do estado pré-CRM, não mais atualizados.
- `clientes/anexos/` e o briefing do Dá o Play continuam onde estão fisicamente (não são Markdown de estado, são anexos) — podem ser re-anexados como `Material` no CRM depois, manualmente.
- Login do CRM é uma conta única compartilhada (`admin@vetrium.com.br`) pros dois sócios por enquanto, não contas individuais — decisão de escopo pra v1, o schema já suporta evoluir pra contas nomeadas sem migração.

## Consequências
- Perguntas sobre status atual de cliente/lead devem ser respondidas consultando o CRM (banco de dados), não mais `clientes/*.md`.
- `clientes/arquivo/*.md` fica congelado no estado em que foi migrado — não editar, é histórico.
- Novo cliente/lead entra direto no CRM, não em `clientes/*.md`.
- Deploy do CRM em produção (Coolify) ainda não foi executado — até lá, o CRM roda localmente; `clientes/arquivo/` continua sendo a única cópia legível sem subir o projeto.
