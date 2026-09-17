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
