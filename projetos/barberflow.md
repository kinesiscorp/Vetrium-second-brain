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
- Conteúdo segue a landing oficial em `https://www.bbrflow.com/landingpage` (22/10/2026):
  hero "Seu caderno não avisa quando o cliente vai furar" com Antes/Agora, dores ("Já passou
  por isso?"), link de agendamento (`bbrflow.com/sua-barbearia`), calculadora de furos
  (furos/semana × 4,3 × valor médio), objeções, modo "ordem de chegada" (só financeiro),
  plano único e rodapé Vetrium.
- Preço no site: **R$ 41,30/mês nos 3 primeiros meses, depois R$ 49,90/mês**. Sem taxa de
  instalação, sem fidelidade, cancela quando quiser. Contato do site: WhatsApp
  (17) 93630-9413 e gabrielcarlos1023@gmail.com. CTAs: `/comecar` (Assinar), `/auth` (Área do
  barbeiro), `/` (Agendar horário). Nada de prova social inventada.
- **Identidade visual: a mesma do app** (decisão 22/10/2026, substitui a paleta "Papel e azul"
  que tinha sido aprovada antes — o Gabriel achou que a LP não parecia o produto). Fonte da
  verdade: `~/dev/barberflow/app/src/index.css` (seção "BARBEARIA CARTOON").
  - Nunito 600–900, fundo branco, azul `#0097F5` (hsl 203 100% 48%) chapado, sombra
    `#0576BD`; verde `#21B557` para dinheiro e status ok; vermelho `#EF4444`.
  - Cards "toon": borda 2px `#DBDBDB`, raio 1.5rem, sola dura `0 5px 0 rgba(5,118,189,.22)`.
    Botões chunky com borda inferior escura. Ícones em quadradinhos coloridos com sola.
  - Listra de barbeiro (azul/branco/vermelho/índigo, -45°) no topo, nos cards de destaque e na
    faixa azul do final. Nav do app é uma pílula de vidro com cápsula azul no item ativo.
  - Logo: tile azul com tesoura branca (igual ao ícone do app).
- Para ver o painel sem logar em produção: subir `app` com `VITE_SUPABASE_URL` e
  `VITE_SERVER_URL` apontando para hosts falsos e interceptar as chamadas com dados de
  exemplo (Playwright). Nunca digitar a senha da conta de teste no bbrflow.com.
