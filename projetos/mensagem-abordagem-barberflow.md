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

## Variante — quem já agenda manualmente por WhatsApp

Uso: leads onde a ficha do Google Maps mostra `wa.me` como único canal de agendamento
(ex.: **Barbearia Suprema**, **Barbearia Expert's**) — a dor de "vida inteira no
WhatsApp remarcando" é mais direta pra esse perfil.

```
Oi! Vi a {NOME_BARBEARIA} aqui em São Paulo 💈

Vi que vocês atendem e marcam horário direto pelo WhatsApp — funciona, mas costuma
tomar um tempão do dia respondendo "tem horário às Xh?" repetidas vezes.

Trabalho num app pra barbearia, o Bbrflow: o cliente agenda sozinho pelo link (sem
precisar te mandar mensagem), vocês recebem lembrete automático e ainda dá pra
preencher horário vago à noite/domingo com quem agenda sozinho.

Faz sentido eu te mandar uma demonstração rápida (2 min)?
```

## Se responder interessado

Enviar o link `bbrflow.vercel.app` + oferecer ligar ou mandar vídeo curto de
demonstração. Assinatura é R$30/mês (`SUBSCRIPTION_CONFIG.VALOR_MENSAL`), sem
período de teste gratuito no momento — não prometer trial que não existe.

## Pendências antes de disparar em massa

- Confirmar que os telefones marcados "(fixo?)" em `leads-barberflow-sp.md`
  realmente têm WhatsApp (ligar não serve — checar se o número aparece no app antes
  de mandar).
- Definir a ordem de envio (1/dia) — sugestão: começar pelos que já demonstram dor
  clara (Suprema, Expert's, M Barbearia), depois os demais.
