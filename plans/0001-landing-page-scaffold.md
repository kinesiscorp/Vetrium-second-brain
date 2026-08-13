# 0001 - Landing Page da Vetrium

Spec relacionada: `specs/0001-landing-page-scaffold.md`, substrato em `specs/0003-referencias-portfolio.md`. Empresa renomeada de Achievo para Vetrium em 2026-08-03 (`decisions/0002-renomeacao-para-vetrium.md`) — as seções abaixo marcadas historicamente ficam registradas para contexto; a seção **"Identidade Vetrium (atual)"** é a que vale para o trabalho em andamento.

## Stack
Next.js (App Router) + Tailwind v4, já scaffoldado em `vetrium-lp/`. Deploy: Vercel (zero-config para Next.js). Sem CMS, sem backend — página estática simples.

## Referência de estrutura: Insany (insany.com.br)
Usada como referência de **estrutura e confiança tipográfica**, não de execução literal (Insany usa renders 3D customizados — fora do escopo "simples" pedido):
- Seções full-bleed alternando escuro/claro.
- Título de seção grande e ousado, com um "." no final (ex: "Serviços.") e contador entre parênteses.
- Peso misto no headline (parte em preto/branco forte, parte em cinza) para hierarquia dentro da mesma frase.
- Botão CTA em formato pill, consistente em todo o site.
- Nav simples e fixo.

## Decisões de identidade visual (histórico Achievo — substituído, ver seção abaixo)
- ~~Padrão dark + 1 acento âmbar/dourado (`#E8A94A`) sobre grafite quase preto (`#0B0B0C`)~~ — substituído pela identidade Vetrium.
- Sem ilustração 3D/animação custom nessa primeira versão — **essa parte continua valendo**.

## Identidade Vetrium (atual)

Conceito: **minério raro e misterioso** (o sufixo "-ium" do nome remete a elementos/metais), acabamento metálico, tom azul levemente arroxeado — não é mais o "dark + acento quente" da Achievo.

- **Tema padrão escuro, com alternância para claro.** Ao contrário da v1 (Achievo), a apresentação inteira é dark-first, não só o hero — inclusive as seções que antes eram claras (Serviços, CTA) viram variações mais escuras/elevadas da mesma paleta. Um toggle no nav permite trocar para o tema claro, persistido em `localStorage`.
- **Cor:** azul-violeta metálico como acento único, ajustado por tema:
  - Dark: fundo `#0A0B12` (quase preto, leve tom azul-violeta — "rocha bruta"), superfície elevada `#14151F`, acento `#6C7BFF`→`#8B5CF6` (gradiente azul→violeta usado em wordmark/CTA, como "brilho de minério polido").
  - Light: fundo `#F1F0F8` (pedra polida clara, mesmo viés azul-violeta), acento sólido mais escuro `#4C3FE0` para manter contraste.
- **Tipografia:** mantém uma única família (Manrope) — decisão de simplicidade que independe do rebrand.
- **Toggle de tema:** ícone sol/lua no nav, classe `dark` no `<html>` (Tailwind v4 `@custom-variant dark`), script inline no `<head>` pra aplicar o tema salvo antes da hidratação (evita flash).

## Estrutura de seções (v2 — elaborada, ver atualização abaixo)
1. **Nav** — logo "Vetrium", links (Serviços, Projetos, Como trabalhamos, Contato), toggle de tema, CTA pill.
2. **Hero** — headline + tagline + CTA, gradiente metálico no destaque, 2 glows animados (`ore-glow`, respeitando `prefers-reduced-motion`), estatísticas (6+ produtos, 3 etapas, 1 time).
3. **Marquee de stack** — faixa com scroll infinito em CSS (Figma, Next.js, TypeScript, Tailwind, React, Vercel, Design Systems, UI/UX).
4. **Serviços** — 4 itens com ícone, cada um com svg inline (cor sólida do acento, não usar a classe de gradiente de texto em SVG — zera `currentColor` e o ícone some).
5. **Projetos** — grid filtrável por categoria (Todos/App/Web/Landing Page) com 6 cases reais do portfólio do Gabriel Carvalho (Master Crypto, Achievo, Memory it, Cycleit, Gatômetro, Layerio), imagens em `public/portfolio/` capturadas do Figma de cada projeto.
6. **Como trabalhamos** — 3 passos com linha conectora.
7. **CTA final / Contato** — card elevado com glow, chamada + contato (e-mail/WhatsApp).
8. **Footer** — 4 colunas (marca, navegação, contato, redes).

Ainda sem case da própria Vetrium (Esquadrão do Frog está em andamento) — os projetos mostrados são do portfólio pessoal do Gabriel Carvalho, atribuídos como "trabalho do time da Vetrium".

**Scroll-reveal:** implementado com `IntersectionObserver` + fallback por `setTimeout` (nunca depender só do observer — em abas em segundo plano o Chrome pode não disparar o callback a tempo). Conteúdo acima da dobra (hero) não usa reveal — deve aparecer instantaneamente, sem depender de JS/scroll.

## v3 — direção cinematográfica (atual)

Referência aprovada pelo cliente interno: **superconscious-app.webflow.io**. A v2 (cards + marquee) foi considerada "simples demais". A v3 reconstrói a página inteira nesse registro.

**Stack de animação:** GSAP 3.15 + ScrollTrigger (gratuito desde 3.13). O motor fica em `scroll-engine.tsx` e é dirigido por `data-*` no markup, então `page.tsx` continua declarativo:
`data-anim="fade" | "assemble" | "words" | "draw" | "hero"`, `data-parallax="0.3"`.

**Elementos da direção:**
- **Campo de estrelas** em `<canvas>` (`starfield.tsx`) com cintilação e parallax contra o scroll; relê a cor no toggle de tema via `MutationObserver`.
- **Wordmark gigante** "vetrium" com uma cópia borrada (`wordmark-ghost`) atrás, criando profundidade.
- **Device 3D inclinado** com um projeto real (Master Crypto). Cada transform em seu próprio elemento — animação CSS no mesmo nó sobrescreveria o tilt estático.
- **Mandala (semente da vida)** que se desenha via `stroke-dashoffset` conforme o scroll.
- **Headline montável em seção pinada**: palavras + orbs wireframe partem espalhados/borrados e se juntam. Usa um único `fromTo` com `stagger` — montar o timeline à mão com posições fixas fazia as últimas peças nunca completarem dentro do range.
- **Parágrafo palavra-a-palavra** que acende no scrub.
- **Orbs wireframe** (`orbs.tsx`) inline dentro do headline, em SVG puro com rotação CSS.
- **Footer** com wordmark gigante sangrando na base.

**Tipografia:** Instrument Sans (corpo) + Instrument Serif itálico (palavra de destaque) — o contraste sans/serif-itálico é a assinatura tipográfica da referência.

**Salvaguarda contra tela em branco (importante):** o estado escondido (`.js-anim { opacity: 0 }`) só se aplica sob `.js-ok`, classe que o script de boot adiciona — provando que scripts rodam. O boot também agenda um timeout que adiciona `.anim-fallback` (revela tudo) se o motor não reportar `window.__vetriumAnimReady`. Nenhuma peça parte de opacidade 0 — sempre 0.14 borrada, para nunca existir tela vazia.

## Riscos / pontos de atenção
- Next.js 16 neste projeto tem mudanças de breaking change vs. treinamento do modelo — consultar `node_modules/next/dist/docs/` antes de usar APIs que possam ter mudado.
- Deploy na Vercel requer conectar a conta do usuário — não será feito sem autorização explícita nesse momento.
- As imagens de portfólio são capturas de tela do Figma (qualidade variável) — se for possível pedir export oficial (PNG 2x) direto do Figma ao Gabriel Carvalho, vale substituir por versões mais nítidas.
- **Ao depurar visualmente:** capturas de tela não renderizam elementos `position: fixed` depois de rolar a página, e tabs em segundo plano (`document.hidden`) saem totalmente pretas. Verificar estado real via DOM (`getComputedStyle`, `elementFromPoint`) antes de concluir que algo quebrou.
