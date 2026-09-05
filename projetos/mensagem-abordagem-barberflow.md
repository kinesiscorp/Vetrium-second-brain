# Mensagem de abordagem — WhatsApp (KR "captar leads" do BarberFlow)

Roteiro de abordagem fria pros leads de `leads-barberflow-sp.md`. Nome comercial do
app no código é **Bbrflow** (`app/src/lib/brand.ts`, `bbrflow.vercel.app`) — usar esse
nome na mensagem, não "BarberFlow" (que é só como o projeto é chamado internamente
na Vetrium).

## Princípios

- **Curta e de baixa pressão.** Mensagem fria de WhatsApp que parece script de venda
  cai como spam e aumenta risco de denúncia/ban. Uma pergunta no final convida
  resposta, não fecha venda na primeira mensagem.
- **Sem inventar prova social.** Não citar números de clientes/depoimentos que não
  existem — hoje o Bbrflow tem 1 cliente pagante (R$30/mês, ver `barberflow.md`).
  Os números abaixo (60% de faltas recuperadas, ~87% menos tempo remarcando por
  WhatsApp) vêm da lógica da calculadora de ROI do próprio produto
  (`app/src/components/landing/ROICalculator.tsx`), não de casos reais — apresentar
  como estimativa, não como resultado comprovado.
- **Sem gatilho falso de urgência/escassez.** Nada de "vaga limitada" ou
  "só até amanhã".
- **1 envio por lead por dia** (ver ritmo geral em `leads-barberflow-sp.md`) — não
  reenviar/insistir no mesmo dia.

## Mensagem padrão

Uso: leads sem sinal específico de dor (maioria da lista).

```
Oi! Vi a {NOME_BARBEARIA} aqui em São Paulo 💈

Sou o Gabriel, trabalho num app pra barbearia chamado Bbrflow — o cliente agenda
sozinho pelo link (sem trocar mensagem no WhatsApp), vocês recebem lembrete
automático de horário e tem um controle financeiro simples do dia a dia.

Pelas contas que a gente faz, dá pra recuperar boa parte das faltas com lembrete
automático e ainda preencher horário vago de noite/domingo com quem agenda sozinho
pelo link.

Faz sentido eu te mandar uma demonstração rápida (2 min) pra você dar uma olhada?
```

Essa é a única versão usada — Gabriel preferiu ela a uma variante mais específica
pra quem já agenda manualmente por WhatsApp (ex.: Barbearia Suprema, Barbearia
Expert's). Decisão tomada em 05/09/2026 pra manter só um texto.

## Se responder interessado

Enviar o link `bbrflow.vercel.app` + oferecer ligar ou mandar vídeo curto de
demonstração. Assinatura é R$30/mês (`SUBSCRIPTION_CONFIG.VALOR_MENSAL`), sem
período de teste gratuito no momento — não prometer trial que não existe.

## Execução

Disparo automatizado em `~/dev/barberflow/whatsapp-gateway/outreach/` (ver
`send-daily-lead.js`) — lê `leads.json`, manda 1 mensagem/dia pro próximo lead
pendente, detecta sozinho números sem WhatsApp (não precisa confirmar manualmente
antes) e marca o status de cada lead.
