# BarberFlow

- Sob custódia da Vetrium desde 10/08/2026 (detalhes técnicos/pessoais em `~/dev/MegaBrain/projetos/barberflow.md`)
- Status: em produção/uso, receita atual R$49,90/mês

## OKR (alinhamento 01/09/2026, Gabriel Furlan + Gabriel Carvalho, reunião de 30 min)

**Objetivo:** Aumentar a carteira de clientes ativos do BarberFlow.

- **Key Result — Aumentar as chances de captar leads** (dono: Gabriel Furlan)
  - Objetivo: 1 cliente.
  - Automatica (automação com IA) — Gabriel Furlan: conversão média 1%, base de 100 pessoas.
  - Prazo: 7 dias. Finalização: 08/09/2026.
- **Key Result — Redes Sociais** (dono: Gabriel Carvalho)
  - Objetivo: criar e organizar o Instagram do BarberFlow.
  - Formas: post e carrossel.
  - Finalidade: demonstração visual para captação de clientes (manual e automática) do
    funcionamento do app.
  - Recursos: Figma, IA.
  - Prazo: 7 dias. Finalização: 08/09/2026.
  - Execução: lista de leads em `leads-barberflow-sp.md` (9/100 levantados em
    03/09/2026), disparo via `~/dev/barberflow/whatsapp-gateway` (número já
    conectado), 1 mensagem/dia pra evitar ban. Roteiro de abordagem em
    `mensagem-abordagem-barberflow.md`.

## Próximos passos

- Melhorar a landing page para prospectar mais clientes
- Ideia: criar um cron que busca automaticamente barbeiros da região que ainda não usam
  aplicativo de agendamento, com automação para filtrar esses leads e mandar mensagens no
  WhatsApp deles convencendo a assinar o BarberFlow
- Pedido de um cliente barbeiro: suporte a plano mensal de corte (assinatura recorrente,
  não só agendamento avulso) — o app precisa se adequar a esse modelo

## Landing page e marca (redesign 21/10/2026)

- LP em `~/dev/barberflow/lp-novo/index.html` (repo `kinesiscorp/barberflow-lp`, publicada no
  GitHub Pages). Refeita no estilo do template Veyra (modulify): hero com celular 3D e agenda
  viva, cards que se montam no scroll, 4 recursos com telas do app, linha do dia, calculadora
  de faltas, preço, dúvidas.
- Conteúdo só com fatos reais: R$ 49,90/mês por barbearia (valor da API
  `/v1/config/subscription-monthly-default`), Pix ou boleto, **sem período grátis**, sem
  depoimentos nem número de clientes (a LP antiga inventava "+350 barbearias", depoimentos,
  R$ 9,90/barbeiro e 14 dias grátis). CTA vai pra `bbrflow.vercel.app/comecar`; demonstração
  aponta pro WhatsApp da Vetrium (5511941889077).
- **Paleta aprovada: direção A "Papel e azul"** (brandkit:
  https://claude.ai/artifact/Ga96kxeAfdMadLX3d5eZzt). Mantém o azul do app.
  - Papel `#FAF9F6` · cartão `#FFFFFF` · azul bbrflow `#0095FF` · azul-noite `#0E1A2A`
    (texto, botão principal e seções escuras) · texto 2 `#56677A` · feito/verde `#2F7A4A`
  - Azul sobre fundo escuro como texto: `#4DB2FF`. Azul como texto em fundo claro: `#0066B8`.
  - Regra: nunca texto branco sobre `#0095FF` (contraste 3,1:1). Botão principal é azul-noite.
  - Fontes: Instrument Sans (títulos e texto), IBM Plex Mono (horários e números pequenos).
  - Logo: tile azul `#0095FF` com tesoura branca (mesmo do app) + "bbrflow" minúsculo. Em
    destaque grande na página (peça central da LP), usar a versão clara: tile branco com a
    tesoura azul dentro de um anel. O tile azul grande e brilhante foi rejeitado (22/10/2026).
  - O creme `#F2EFE8` foi rejeitado por parecer acinzentado; fundo ficou quase branco.
