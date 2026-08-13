# 0003 - Proposta comercial: Esquadrão do Frog

Spec relacionada: `specs/0002-diagnostico-esquadrao-frog.md`
Plano relacionado: `plans/0002-redesign-esquadrao-frog.md`

Este documento define **o que entra na proposta comercial** e a sequência até ela.
A peça visual (plano 0002) é insumo da proposta — não substitui a proposta.

## Princípio

A proposta é da **Vetrium**, não do Frog. Ela usa a identidade da Vetrium
(roxo/violeta sobre fundo quase-preto, Instrument Sans + Instrument Serif itálico)
e apresenta *dentro* dela as peças na identidade do Frog (verde neon).
Esse contraste é intencional: mostra que sabemos operar dentro da marca do cliente
sem diluir a nossa.

### Tokens da Vetrium (fonte: `vetrium-lp/src/app/globals.css`)

| Token | Dark (padrão da proposta) | Light |
|---|---|---|
| `--bg` | `#050509` | `#f4f3fa` |
| `--bg-elevated` | `#0c0c14` | `#ffffff` |
| `--ink` | `#f4f3fa` | `#0b0b12` |
| `--ink-dim` | `#c9c7db` | `#3a3850` |
| `--muted` | `#8b8a9e` | `#615f7a` |
| `--accent-from → --accent-to` | `#7c6cff → #b47cff` | `#5b3fe0 → #8b4fe6` |
| `--line` | `rgba(255,255,255,.12)` | `rgba(11,11,18,.12)` |

Tipografia: Instrument Sans (corpo/UI) + Instrument Serif itálico (destaques).
Gradiente de texto = utilitário `.text-metal` já existente na LP.

## Estrutura da proposta

| # | Bloco | Conteúdo | Por que existe |
|---|---|---|---|
| 1 | Capa | Logo Vetrium, "Proposta de Redesign — Esquadrão do Frog", data, validade | Enquadra como documento formal, com prazo |
| 2 | Diagnóstico resumido | Os 9 achados condensados em 4–5 bullets de impacto | Vende o problema antes da solução |
| 3 | Objetivo | A métrica-norte: captura de lead + conversão pro plano certo (Soldado) | Alinha sucesso em número, não em gosto |
| 4 | O que vamos entregar | Tabela de seções (do plano 0002) + o que muda em cada uma | Escopo explícito, sem ambiguidade |
| 5 | **Peça visual** | Hero + prova social + pricing na marca do Frog (brandkit v2) | É o que fecha venda — mostra, não descreve |
| 6 | Processo e prazo | Diagnóstico → Direção → Execução → Entrega, com semanas por fase | Reduz ansiedade de "quando fica pronto" |
| 7 | Investimento | Valor(es) + o que está incluso em cada opção | — |
| 8 | Condições comerciais | Forma de pagamento, prazo, rodadas de revisão, o que é fora de escopo | Protege dos dois lados |
| 9 | Próximo passo | Um CTA único (aceite / call) | Não terminar o documento sem ação |

## Escopo — o que está dentro e o que está fora

**Dentro:** redesign das seções listadas no plano 0002, entrega em Next.js + Tailwind,
deploy na Vercel, responsivo, integração do formulário de captura de lead.

**Fora (adicional, cobrado à parte):** produção de vídeo, fotografia, redesign de
logotipo/brandkit, gestão de tráfego, criação de conteúdo do lead magnet,
manutenção mensal após a entrega. **Checkout Kiwify não é mexido** (já resolvido).

## Condições comerciais (fechadas em 2026-08-04)

**Dois pacotes:**

| Pacote | Parcelado | À vista (−7%) | Prazo |
|---|---|---|---|
| Protótipo estratégico da LP | R$ 3.500 | R$ 3.250 | até 10 dias úteis |
| Landing page funcional | R$ 4.700 | R$ 4.370 | até 15 dias úteis |

**Pagamento (revisto em 2026-08-04):** **40% no aceite** · **60% antes da entrega**. No pacote funcional, o saldo vence antes da publicação definitiva e da transferência de arquivos e acessos.

A entrada subiu de 30% para 40% porque o protótipo já está construído: os 40% reconhecem trabalho entregue, não reservam trabalho futuro. Não faz sentido manter a parcela do meio (aprovação da direção visual) quando a direção visual já existe e o cliente navega nela antes de pagar.

**Cronograma:** quatro etapas, não seis. Aceite → aprovação e rodadas de revisão → produção → entrega. As etapas de "estrutura" e "primeira leitura visual" saíram: já foram feitas.

**Prazo** só começa a contar depois de: pagamento inicial + briefing concluído + conteúdos, imagens e acessos recebidos + escopo alinhado. Os dias de aprovação do cliente não consomem o prazo produtivo.

**Retorno do cliente:** até 3 dias úteis após cada apresentação, em solicitação consolidada. Passou disso, o cronograma fica suspenso e a nova data sai conforme disponibilidade da equipe.

**Revisões:** 2 rodadas inclusas — uma rodada é *um conjunto consolidado* de solicitações enviado após a apresentação da etapa. Depois disso: R$ 100/hora ou bloco de 5 horas por R$ 450 (preferir o bloco, é mais previsível). Mudança de direção em etapa já aprovada, nova seção ou alteração de escopo **não é revisão** — é orçamento à parte.

**Validade:** 15 dias corridos a partir do envio.

**Fora do escopo:** manutenção, atualização de conteúdo, novas seções, suporte contínuo, alterações pós-entrega e acompanhamento de métricas. Contratados à parte (por hora ou pacote mensal — valores a definir).

### Ressalva registrada

A diferença entre os dois pacotes é de apenas R$ 1.200 — ou seja, todo o desenvolvimento, testes, correções e publicação estão sendo vendidos por esse valor. Aceitável **como condição de projeto inicial**, não como tabela da agência. Em projetos futuros a versão funcional deve ficar acima de R$ 5.500.

Isso só se sustenta se: o desenvolvimento for simples, não houver painel administrativo, o cliente entregar textos e materiais no prazo, as integrações forem básicas, e a Vetrium tiver **autorização de uso do trabalho como case e portfólio**. A autorização precisa estar escrita na proposta.

## Formato de entrega

Duas versões, mesmo conteúdo:

1. **Artifact estático** (`claude.ai/code/artifact/...`) — página HTML publicada.
   Vantagem sobre PDF: o Frog abre pelo celular, a peça visual aparece viva (hover,
   gradiente, animação leve) em vez de achatada, e dá pra atualizar o link sem
   reenviar arquivo. Se ele pedir PDF, exporta-se via print da mesma página.
2. **App interativo** (rota `/proposta-comercial/frogman` dentro de `vetrium-lp/`) —
   mesmas 13 seções, mas com calculadora de payback ao vivo (arrasta o número de
   alunos migrando e vê o ganho mensal recalcular), seletor de pacote/forma de
   pagamento que atualiza os valores em "Pagamento" e "Prazos" e monta a mensagem
   de aceite do WhatsApp, FAQ em acordeão e índice de navegação com barra de
   progresso. Pensado para o caso de querer mandar algo que o Frog manipula, não só lê.

## Status

- [x] Site em Next.js pronto (`esquadrao-do-frog/`, submodule `kinesiscorp/esquadrao-do-frog`).
- [x] Valores e condições definidos — tabela acima.
- [x] Proposta montada: https://claude.ai/code/artifact/bf3ce0f9-35c2-469a-8912-38a7712b7a72
- [x] Site publicado na Vercel (`esquadrao-do-frog.vercel.app`) e link da demonstração apontado.
- [x] Cases da Vetrium trocados para Memoryiit, Drawincad Studio e Bbr Flow.
- [x] Folha de antes e depois do hero e o print do site atual (bloco "O site hoje") removidos
      a pedido — proposta ficou com 13 folhas, sem prints do site atual do Frog.
- [ ] Trocar o print do Memoryiit e do Drawincad pelas peças que o Gabriel mandou no chat
      (as atuais saem da capa do Figma e da pág. 4 do PDF de portfólio; os arquivos que
      ele enviou não estão em disco — salvar em `vetrium-lp/public/portfolio/`).
- [x] Versão interativa em Next.js criada — calculadora de payback, seletor de
      pacote/pagamento e FAQ em acordeão, todos funcionais. Build de produção passa limpo.
- [x] `WHATSAPP_NUMBER` em `vetrium-lp/src/lib/proposal-frog/content.ts` preenchido com o
      número real da Vetrium: (11) 94188-9077.
- [x] Publicada como rota da LP da Vetrium (`/proposta-comercial/frogman`) em vez de app
      separado na Vercel — o app standalone `proposta-frog/` que existia solto em disco era
      a versão anterior e foi arquivado (ver `decisions/0003`).
- [x] CTA "Aceitar e reservar a agenda" do Artifact estático apontado pro WhatsApp
      real: `wa.me/5511941889077`, com mensagem pré-preenchida.
- [ ] Enviar ao Frog junto da resposta da conversa em aberto.

## Pendências jurídicas / contratuais

O texto de **autorização de uso como case** está citado no card do pacote funcional, mas precisa entrar por escrito no contrato — é a condição que sustenta o preço inicial de R$ 4.700.
