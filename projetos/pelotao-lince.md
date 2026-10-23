# Pelotão Lince (Lynx Platoon) — LP demo para streamer de PUBG

Marca **fictícia** criada em 22/10/2026 a partir da demo do Esquadrão do Frog (cliente que não
fechou contrato). Serve de modelo para oferecer a LP a outro streamer de PUBG que vende cursos.

- Código: submodule `esquadrao-do-frog/` (nome do repo/pasta mantido). Produção na Vercel: projeto
  `pelotao-lince` → https://pelotao-lince.vercel.app (renomeado em 22/10/2026; o alias antigo
  `esquadrao-do-frog.vercel.app` ainda responde com o site novo — remover do projeto quando quiser).
  Deploy automático por push no `main` funciona neste projeto e no `vetrium-lp`.
- Marca: Pelotão Lince · mentor fictício LinceOps (Tales Montrez) · slogan "Visão de lince.
  Decisão de mestre." Planos: Recruta / Operador / Comandante.
- Brandkit: verde tático `#252D21`, verde militar `#657348`, lima `#C5F368`, areia `#D8D1B8`,
  off-white `#F0F0E8`, carvão `#101411`. Títulos Barlow Condensed (equivalente livre da Raider),
  texto Inter. Emblema, ranks e mentor em SVG próprios (`public/brand/`).
- Removido: nome/fotos/vídeo do Frog, arte do PUBG/Krafton (figura e insígnias de rank).
- Mantido sem alterar: proposta comercial e diagnóstico do Frog em `vetrium-lp/` (Gabriel vai
  mexer depois); card do portfólio da Vetrium agora é "Pelotão Lince" (tipo conceito, com thumbnail nova).
- Imagens (geradas por IA, enviadas pelo Gabriel em 22/10/2026): mentor (`mentor.jpg`) e cena de
  gameplay do hero (`hero-game.jpg`, recortada para tirar o logo e os nicks do Frog).
- Pendências: assets sociais (Instagram/YouTube/Discord),
  artifact de brandkit.

- 22/10/2026: refatoração visual completa e tradução para inglês. Marca exibida como **Lynx Platoon**
  (mentor LynxOps; planos Recruit/Operator/Commander). Logo do lince redesenhado. Layout em grid de
  12 colunas, container 1200px, escala de espaçamento de 4px, seções: Hero, Method, Results, Mentor,
  Plans, FAQ, CTA. Foto do mentor agora em `lynxops.jpg` (URL nova para evitar cache de imagem).
- Card do portfólio da Vetrium ainda diz "Pelotão Lince" — atualizar para Lynx Platoon.

- 23/10/2026: camada de motion (hero com parallax/mira reativa/entrada por linha, stagger por seção,
  contadores, tabs com tinta compartilhada, FAQ e CTA animados, barra de progresso + scrollspy no header)
  e logo do lince redesenhado em SVG. Depois substituído pelo logo fornecido pelo Gabriel (original em `design/marca/lynx-platoon-logo-original.png`; recorte transparente em `public/brand/lynx-logo.png`).

- 23/10/2026: seção Results ganhou a animação de subida de rank (`rank-climb.tsx`): o badge sobe tier a tier
  com efeitos na cor do tier, a escada de ranks acende em sincronia e cada aluno/aba reproduz sua própria
  subida; botão Replay.

- 23/10/2026: cursor customizado (`cursor.tsx`, só mouse; ponto + anel que muda em links/hero/campos, ping no
  clique) e interação do mouse no hero (lanterna que revela a foto, mira com coordenadas, ping de radar no
  clique, badge inclinando em 3D).

- 23/10/2026: hero — removidos a lanterna do mouse e o ping de clique (que bugava). Agora há 3 alvos
  clicáveis (botões acessíveis, somem em 6,5s e reaparecem); cada acerto sobe um tier do badge com burst/
  faíscas/"+1 rank"; no Master aparece "See plans" e "Play again". Touch e reduced-motion mantêm a subida
  automática. Mantidos: cursor tático e linhas de mira com coordenadas.

- 23/10/2026: cursor reduzido a um ponto lima sem mola/efeitos (posição escrita direto no transform, sem
  render React); mini-game dos alvos com instrução em destaque ("Click the targets to rank up", callout
  "Click!" no primeiro alvo) e alvos renderizados no servidor (aparecem com a página).
