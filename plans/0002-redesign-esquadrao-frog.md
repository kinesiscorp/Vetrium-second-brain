# 0002 - Redesign Esquadrão do Frog

Spec relacionada: `specs/0002-diagnostico-esquadrao-frog.md`.

## Objetivo (métrica-norte)
O objetivo final do Frog é conversão. Todo achado do diagnóstico mapeia pra um de dois alvos — nenhuma decisão de estrutura abaixo deve ficar solta sem servir a um deles:

1. **Captura de lead** — ninguém que visita e não compra na hora deve sair sem deixar contato.
2. **Conversão pro plano certo** — novos alunos direcionados pro Soldado (identificado pelo próprio Frog como melhor custo-benefício), não pro Recruta por omissão/default.

## Stack
Next.js 16 + Tailwind v4 + Motion, mesma base já validada na LP da Vetrium. Deploy Vercel. **Checkout continua via Kiwify** (link/redirect) — fora do escopo do redesign, não mexer nesse fluxo.

**Código em `esquadrao-do-frog/`** (submodule — ver `decisions/0003`). A peça visual em HTML solto foi descartada; a demo agora é o próprio site rodando.

Decisão do Gabriel (2026-08-04): antecipar a execução mesmo sem o job confirmado, porque uma demo publicada convence mais que um mockup. O risco continua registrado abaixo.

## Estrutura de seções (nova)

| # | Seção | Muda em relação ao site atual | Achado(s) endereçado(s) |
|---|---|---|---|
| 1 | Hero | Vídeo do canal como fundo (mudo, em loop, sem controles) atrás do headline; o play abre lightbox com som. Resolve #5 sem abrir mão do vídeo | #1, #5 |
| 2 | Dor (3 cards) | Mantém — já funciona | — |
| 3 | **Novo: "Aula com o Frog ou curso?"** | Bloco novo, logo após a dor — resolve de cara por que o curso entrega o mesmo resultado da aula 1:1 sem depender da agenda dele | #9 |
| 4 | O que é o Esquadrão | Mantém a lista de entregáveis | — |
| 5 | Mentor / autoridade | Mantém bio e credenciais | — |
| 5b | **Novo: painel de evolução** | Bloco que mostra a progressão de rank virando número, amarrado ao "incluso a partir do Soldado" — era o HUD que estava no hero | #7, #8 |
| 6 | Prova social | Números rotulados corretamente (400+ formados / 350+ ativos hoje) + espaço reservado pra case real de aluno (rank antes/depois) quando o cliente enviar | #7 |
| 7 | Pricing | Reestruturado: Soldado como recomendação visual real (não Veterano); um único CTA de destaque por vez, os outros dois em hierarquia secundária | #4, #8 |
| 8 | **Novo: captura de lead** | Bloco leve antes do footer pra quem ainda não decidiu — ex.: entrar num grupo grátis ou receber um material curto ("3 erros que travam sua evolução no Diamante") em troca de e-mail/WhatsApp | #6 |
| 9 | CTA WhatsApp + footer | Mantém | — |

## Identidade visual
Manter verde neon + logo "F" (equity de marca real em 260k+ seguidores — ver spec). Refinar execução: contraste, uma única voz tipográfica, hierarquia de CTA com um verde de destaque + variantes secundárias mais discretas (outline/ghost) em vez do mesmo verde saturado repetido 5x.

**Fonte da verdade (assets em `frog/`, fora do repo):**
- `frog/brandkit/frog-brand-kit2.png` — brandkit v2, **substitui a v1** onde houver divergência de hex ou copy (ex.: secundária `#6E2BB8`, informação `#5CA8FF`, botão de apoio "FALAR COM A EQUIPE", gradiente principal `#7CFF00 → #4DD800`, gradiente atmosférico radial verde, textura "ruído fino", step tipográfico "texto grande 20px").
- `frog/logotipo-frog.png` — lockup oficial (letreiro pincelado "ESQUADRÃO" verde + "DO FROG" branco sobre respingo preto). Usar o arquivo real, não redesenhar em SVG.
- `frog/references/` — direção estética aprovada pelo Gabriel: fundo quase-preto com atmosfera neon radial, mockup de produto grande e inclinado como protagonista do hero, grid tático no chão, cards de estatística em linha, seção final com wordmark gigante fantasma. Serve de referência de **densidade e profundidade** — a crítica à peça anterior foi "muito simples".

## Riscos / pontos em aberto
- **Cliente ainda não confirmou o job** — este plano é insumo pra proposta, não execução contratada.
- Precisa pedir ao Frog: cases reais de aluno (rank antes/depois), aval pra manter a paleta, e alinhar a ideia do material de captura de lead.
- Kiwify já resolve pagamento — não redesenhar checkout.

## Próximos passos
- [x] Site em Next.js montado em `esquadrao-do-frog/` — todas as seções da tabela acima.
      (as peças visuais em HTML — artifacts — ficaram obsoletas)
- [ ] Publicar na Vercel e mandar o link pro Frog.
- [ ] Pedir ao cliente os três placeholders marcados em `esquadrao-do-frog/src/lib/content.ts`:
      caso real de aluno, depoimento e a lista real de campeonatos do mentor.
- [ ] Apontar `CHECKOUT_URL` (Kiwify) e `WHATSAPP_URL`.
- [ ] Perguntar ao Frog: tem case de aluno pra usar como prova social? Topa manter a paleta atual? Tem ideia pro material de captura de lead?
- [ ] Aguardar resposta do Frog à mensagem já enviada antes de avançar mais.
- [ ] Montar a proposta comercial — ver `plans/0003-proposta-comercial-esquadrao-frog.md`.
