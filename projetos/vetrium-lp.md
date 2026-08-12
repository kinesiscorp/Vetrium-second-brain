# LP da Vetrium

- Código: `../vetrium-lp/` (submodule) · Live: `https://www.vetrium.space`
- Status: **redesign concluído e no ar** — estilo cinematográfico (hero com
  starfield/mockup 3D, seções de scroll-reveal), 4 frentes de serviço
  (Redesign, Branding, Landing pages, Produtos digitais), portfólio, processo
  em 4 passos, CTA final. Nota antiga aqui dizia "validando UI com referência"
  — desatualizada, o redesign já passou por várias iterações desde então.
- O mesmo repo também hospeda páginas de outbound por cliente:
  `/diagnostico/[cliente]` + `/proposta-comercial/[cliente]` — já usado pro
  Frog e pra JJL Serviços. Vira um playbook repetível pros próximos leads
  (Inergi, Tripilar — ver `clientes/leads.md`).

## Refino em andamento (12/08/2026)

Gabriel pediu uma refinada na LP antes de ir atrás de novos clientes, com referências (Trionn, Delucks). Feito nesta rodada, ainda não commitado pra produção nem publicado em vetrium.space:

- **Hero redesenhada**: tirou o mockup literal esquerda/direita, headline despojado ("Menos enfeite. Mais resultado.") + glifo cristalino wireframe flutuante (`OrbShard` em `orbs.tsx`), no espírito do hero da Trionn.
- **Nova seção "Como pensamos"**: bento grid estilo Delucks com 3 pilares (Estratégia, Design, Tecnologia), card do meio destacado com sublista de stack.
- **Calculadora de investimento** (`pricing-calculator.tsx`): 4 seletores (tipo/tamanho/estilo/prazo) geram faixa de preço em R$ + prazo. Valores ancorados nas propostas reais já enviadas — ver tabela abaixo. Aba "Recorrente" não tem número, só CTA, porque a Vetrium ainda não fechou um plano de recorrência.

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
