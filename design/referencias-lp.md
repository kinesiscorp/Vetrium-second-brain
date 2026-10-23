# Referências para landing pages

Banco de referências da Vetrium para LPs: sites, bibliotecas, motion, ícones, tipografia e
ferramentas. Fonte da verdade — **adicione o que encontrar**, sempre com uma linha dizendo o que é.

Legenda: ✅ já usado em projeto nosso · 👀 para avaliar · 📝 observação nossa.
Itens sem ✅ vieram de menção em conversa ou de conhecimento geral e **não foram testados aqui** —
confirme versão e licença antes de usar em cliente.

---

## Sites e inspiração

| Referência | O que é | Status |
|---|---|---|
| [hairline.lucasmarkes.com/figures](https://hairline.lucasmarkes.com/figures) | Biblioteca MIT de **"figures"**: ilustrações de traço fino (hairline) animadas, em 3D, para páginas de produto/dev. 36 figuras em 8 prateleiras (Interfaces, Data, Machines, Devices, Coding, Security, Connectivity, Empty) + "Marks" (logos de marcas desenhados com a skill). Cada figura abre grande e dá o código para copiar. Vem como pacote npm (v0.5.1 em 23/10/2026) e tem a skill `/hairline-create` que desenha figuras sob medida. Seções do site: Figures, Skills, Docs, Inspo. Feito por Lucas Marques (autor do site, sem relação com o personagem fictício da demo Lynx Platoon). Boa referência para trocar imagens de banco por ilustração própria e leve. | 👀 |
| [veyra-template.modulify.website](https://veyra-template.modulify.website/) | Template que inspirou o redesign da LP do Bbrflow. | ✅ Bbrflow |
| [awwwards.com](https://www.awwwards.com/) | Vitrine de sites premiados; referência de nível visual e de motion. | 👀 |
| [godly.website](https://godly.website/) | Curadoria de sites com design forte, filtrável por estilo. | 👀 |
| [60fps.design](https://60fps.design/) | Biblioteca de microinterações e transições de apps, em vídeo. | 👀 |
| [shadertoy.com](https://www.shadertoy.com/) | Shaders de GLSL prontos para estudar e adaptar a fundos animados. | 👀 |

## Componentes e motion

| Referência | O que é | Status |
|---|---|---|
| [motion.dev](https://motion.dev/) (`motion/react`) | Animação para React: stagger, layout, `useScroll`, springs. | ✅ Lynx Platoon, Vetrium |
| [Aceternity UI](https://ui.aceternity.com/) | Componentes animados copiáveis (spotlights, cards, backgrounds). | 👀 |
| [Magic UI](https://magicui.design/) | Componentes animados para React/Tailwind (marquee, number ticker, beams). | 👀 |
| [Three.js](https://threejs.org/) | WebGL 3D no navegador; base de muitas figuras animadas. | 👀 |
| [GSAP](https://gsap.com/) + ScrollTrigger | Timeline e animação ligada ao scroll. | 👀 |
| [Lenis](https://lenis.darkroom.engineering/) | Scroll suave. | 👀 |

## Ícones e ilustração

| Referência | O que é | Status |
|---|---|---|
| [Lucide](https://lucide.dev/) | Ícones de traço, consistentes, MIT. | 👀 |
| [Phosphor](https://phosphoricons.com/) | Ícones em 6 pesos. | 👀 |
| SVG autoral | Ícones desenhados à mão com traço único de 1.6px (Method da Lynx Platoon). | ✅ |

## Tipografia

| Referência | O que é | Status |
|---|---|---|
| Barlow Condensed (Google Fonts) | Títulos condensados; substituta livre da Raider. | ✅ Lynx Platoon |
| Inter / Inter Tight | Texto e interface. | ✅ Lynx Platoon, Vetrium |
| Nunito | Fonte do app Bbrflow. | ✅ Bbrflow |

## Princípios que já adotamos (de `impeccable`)

- Sem "kicker"/eyebrow acima de título, sem texto em degradê, sem cartões idênticos como estrutura.
- Um momento de motion bem desenhado por área; o resto é resposta rápida ao ponteiro; tudo desliga
  em `prefers-reduced-motion`.
- Grid de 12 colunas, container 1200px, escala de espaçamento de 4px.

## Como acrescentar

Uma linha por item na tabela da categoria: link, o que é em uma frase e o status.
Se a referência virar projeto, troque 👀 por ✅ e escreva qual.
