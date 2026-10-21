# LP da Vetrium

- Código: `../vetrium-lp/` (submodule) · Live: `https://www.vetrium.space`
- Status (21/10/2026): **no ar em https://www.vetrium.space** (Vercel, projeto
  `vetrium-lp`). O deploy automático da `main` **não disparou** no push de 21/10 —
  publicado via CLI (`vercel deploy --prod` a partir de `git archive` do commit `6d83cbc`,
  conta `kinesiscorp`). Reconectar o Git no painel da Vercel. Cases: thumbnails de case
  study em `public/portfolio/{frog,bbrflow}-case.jpg` (16:9); Bbrflow aponta pra
  `bbrflow.com/landingpage`. Tema escuro como
  padrão + seletor, paleta de produção, padrões gráficos no lugar de imagens.
  `/orcamento` (21/10/2026): **WhatsApp (17) 93630-9413 é o envio padrão** — o botão final abre a
  conversa com a mensagem completa e o POST no CRM roda em segundo plano, sem erro visível. O
  projeto da Vercel **não tem nenhuma env var** (sem `DATABASE_URL`), então hoje os leads só
  chegam pelo WhatsApp e o CRM não grava; configurar o banco quando for usar o CRM em produção.

## Posicionamento da LP (definido em 20/10/2026)

Depois de 4 rodadas de estética sem encaixar (surrealismo, busto 3D, Verdane
escuro, Grécia clara), o Gabriel definiu a base estratégica — o visual sai
daqui, não o contrário:

- **Cliente ideal:** donos de negócios locais (barbearias, clínicas, serviços).
- **Sensação em 5 s:** criatividade — "que site diferente, quero um assim".
- **Preço percebido:** acessível e de qualidade.
- **Conceito clássico (estátuas/Grécia/mármore):** abandonado.
- Estrutura de conteúdo atual (hero → manifesto → serviços → projetos → 3
  passos → dúvidas → CTA) aprovada; só o layout/design system muda.

Três direções apresentadas (painel em
https://claude.ai/artifact/8HnQpJNKDFNwF4XBzupeLN): Letreiro, Antes e depois,
Recorte. **Escolha: só a paleta "Antes e depois"** (branco #FFFFFF, tinta
#10162B, cobalto #2B46FF, laranja #FF7A1A, névoa #EEF0F6), mantendo a
estrutura e o layout atuais. Imagens gregas trocadas por céu neutro e campos
de cor (commit `f163163` na branch). `design/lp-redesign/prompts-imagens.md`
ficou desatualizado (ainda fala de Grécia) — reescrever se for gerar imagens.

**Atualização (20/10/2026):** voltou para a **paleta de produção** (Deep
Charcoal/Graphite/Off-White/Electric Violet/Soft Lilac) com **tema escuro como
padrão e seletor claro/escuro**; imagens de fundo trocadas por **padrões
gráficos** (grade, pontos, diagonais, anéis). Projetos: só Esquadrão do Frog e
Bbr Flow.

## Redesign "Classic Surrealism × Digital Performance" (19/10/2026)

Pedido do Gabriel: site mais simples para cliente leigo + novo design system
baseado no brandkit (escultura clássica com bolha rosa, marfim/obsidiana,
Playfair/Inter/JetBrains Mono). Briefing completo veio em 3 prompts (master
prompt, design system, módulo de orçamento).

- Home: hero → o que fazemos → projetos → como funciona (3 passos) → dúvidas
  (SEO/GEO e garantias moram aqui) → CTA final.
- `/orcamento`: formulário de 3 etapas que grava o pedido como **LEAD no CRM**
  (`/admin`, origem "Site — formulário de orçamento"). Não manda e-mail/aviso
  — alguém precisa olhar o CRM, ou plugar uma notificação depois.
- `/privacidade` (LGPD, sem razão social/CNPJ — revisar), `/creditos`, 404,
  sitemap, robots, OG, JSON-LD.
- Hero (20/10/2026): busto 3D em three.js ("Marble Bust 01", Poly Haven, CC0)
  com bolha de chiclete que infla; home cortada para 5 blocos curtos depois da
  revisão com a skill impeccable (Gabriel achou que tinha informação demais).
- Saiu da home: calculadora de preço (régua parcialmente extrapolada), projetos
  do template (Master Crypto, Achievo etc.) e **Respawn** (a imagem mostra a
  marca "Impacto Paintball" — confirmar se é cliente antes de voltar).

Pendências para publicar: confirmar que `contato@vetrium.com.br` recebe e-mail
(o domínio é vetrium.space); decidir se Respawn volta como case de cliente;
revisar a política de privacidade; merge na `main` + deploy no Dokku.
- O mesmo repo também hospeda páginas de outbound por cliente:
  `/diagnostico/[cliente]` + `/proposta-comercial/[cliente]` — já usado pro
  Frog e pra JJL Serviços. Vira um playbook repetível pros próximos leads
  (Inergi, Tripilar — ver `clientes/leads.md`).

## Refino da hero sobrepôs a refatoração do Gabriel Carvalho (12/08/2026)

Gabriel pediu uma refinada na LP no mesmo dia em que o Gabriel Carvalho, sem coordenar, também subiu uma refatoração grande pro `main` (commit `76871b8`/`6066e0d`, 10:47) — quebrou `page.tsx` em componentes (`src/components/home/*`), deu nova hero (headline "Transformamos negócios em marcas e produtos digitais desejáveis" + V de cristal com os 3 pilares orbitando), portfólio com filtro/modal/paginação, e trouxe um toolkit de design (`.claude/skills/impeccable`).

Depois de alinhar com o Gabriel Carvalho, o Gabriel confirmou pra sobrescrever: fiz `git reset --hard` + `push --force-with-lease` do `main` pro commit `e1d7aa1` (o refino desta conversa), substituindo o trabalho dele no remoto. A refatoração dele (componentização, filtro/modal/paginação do portfólio, toolkit `.claude/skills/impeccable`) saiu do `main` — se for recuperar algo de lá depois, o commit `6066e0d` ainda existe no reflog local até essa máquina rodar um gc, mas não tem branch/tag apontando pra ele.

O que ficou no ar agora:

- **Hero nova**: sem mockup literal esquerda/direita, headline despojado ("Menos enfeite. Mais resultado.") + glifo cristalino wireframe flutuante (`OrbShard` em `orbs.tsx`), no espírito do hero da Trionn.
- **Seção "Como pensamos"**: bento grid estilo Delucks com 3 pilares (Estratégia, Design, Tecnologia).
- **Calculadora de investimento** (`pricing-calculator.tsx`): 4 seletores (tipo/tamanho/estilo/prazo) geram faixa de preço em R$ + prazo. Valores ancorados nas propostas reais já enviadas — ver tabela abaixo. Aba "Recorrente" não tem número, só CTA, porque a Vetrium ainda não fechou um plano de recorrência.

**Pendente**: a componentização, o filtro/modal/paginação do portfólio e o toolkit de design que o Gabriel Carvalho tinha montado não estão mais no `main` — se alguma dessas partes ainda for útil, precisa ser refeita ou recuperada do commit `6066e0d` antes que se perca de vez.

### Régua de preço usada na calculadora

Vem de 3 pontos reais (não inventados): Frog/JJL (`proposal-frog/content.ts`, `proposal-jjl/content.ts`) e Dá o Play (wireframe R$700 + identidade R$1.100, combo R$1.600 com 10% off).

| Categoria | Pequeno | Médio | Grande |
|---|---|---|---|
| Redesign / Landing page | R$700–1.400 *(real: Dá o Play)* | R$3.500–4.700 *(real: Frog/JJL)* | R$5.500–7.500 *(extrapolado)* |
| Identidade visual | R$1.100–1.600 *(real: Dá o Play)* | R$2.000–2.800 *(extrapolado)* | R$3.500–5.000 *(extrapolado)* |
| Produto digital | R$2.500–4.000 *(extrapolado)* | R$6.000–9.000 *(extrapolado)* | R$10.000–15.000 *(extrapolado)* |

Produto digital inteiro é extrapolado — ninguém fechou esse tipo de projeto ainda. Vale revisar essa régua com o Gabriel Carvalho antes de considerar definitiva.

## Pendências encontradas (11/08/2026)

- **Links sociais mortos**: Instagram/LinkedIn/Behance/Dribbble no rodapé
  apontam pra `href="#"` — falta colocar os handles reais ou remover os que
  não existem ainda.
- **Portfólio misto**: parece ter cases reais (Bbr Flow, Respawn, Flow
  Pedidos — adicionados depois, commit "Adiciona 3 projetos reais") junto
  com nomes que parecem ter vindo do template original (Master Crypto,
  Achievo, Memory it, Cycleit, Gatômetro, Layerio) — não achei esses nomes em
  nenhum lugar do second-brain como cliente de verdade. Vale confirmar com o
  Gabriel se são projetos reais que faltou eu registrar, ou placeholder do
  template que devia sair/ser trocado antes de mandar o link pra um lead.
