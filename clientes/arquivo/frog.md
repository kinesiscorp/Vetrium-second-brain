> **Arquivado (15/08/2026):** dado migrado pro CRM (`vetrium-crm`). Este arquivo é
> histórico do estado pré-CRM, não é mais atualizado — ver `decisions/0004-crm-substitui-clientes-md.md`.

# Frog (streamer)

- Descrição: projeto desenvolvido pela Vetrium para o streamer Frog — código em `../../esquadrao-do-frog/` (submodule), assets de marca em `../../frog/`
- Status: projeto entregue, proposta comercial enviada — Frog ainda não respondeu
- Próximo passo: aguardando resposta; avaliando quais os próximos passos caso ele não responda

## Ajustes pós-entrega (11/08/2026)

- Removida a `SITE_KEY` que travava a raiz do site atrás de senha (`?k=`) —
  acesso público normal agora, sem restrição. `/demo` (com marca d'água)
  continua existindo pra compartilhar link rastreável quando fizer sentido.
- Favicon trocado do padrão do Next.js pro logo do Esquadrão do Frog.
- Corrigidos os 6 ranks do PUBG no card de progressão (Bronze a Mestre,
  com a arte oficial) — antes tinha ranks fictícios ("Cristal",
  "Sobrevivente") e faltava Bronze/Prata/Ouro.
- Painel de case na seção "Resultados reais" agora troca de conteúdo junto
  com o carrossel de depoimentos (antes ficava fixo em Platina→Mestre
  sempre).
