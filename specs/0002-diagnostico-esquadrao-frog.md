# 0002 - Diagnóstico: Esquadrão do Frog (potencial cliente)

## Contexto
Cliente em prospecção: comunidade de coaching de PUBG ("O Esquadrão"), do streamer/criador Frogman1 (Lucas Marques). Site atual: https://esquadraofrog.com/. O cliente identificou o design como "ruim e ultrapassado, sem estratégia". Este documento consolida a auditoria do site atual + o substrato de marca (YouTube/Instagram) para embasar a proposta de redesign.

## Substrato de marca (YouTube / Instagram)

| Canal | Dado | Observação |
|---|---|---|
| YouTube (@FROGMAN1_) | 158 mil inscritos, 2 mil vídeos, verificado | Live diária na Kick. Banner usa a mesma paleta verde-neon/roxo do site, mas com execução mais limpa: logo "F" bem construído, thumbnails de alto CTR (contraste forte, números grandes, expressão facial) |
| Instagram (@frogman1_) | 103 mil seguidores, verificado | Bio já usa a mesma copy de dor do site ("Cansado de não evoluir no PUBG?"); grid mistura clipes de gameplay, overlays de keybind e um post promocional do próprio Esquadrão reaproveitando a mensagem da landing page |

**Implicação para o redesign:** a marca (verde neon + logo "F" + tom direto/gamer) já tem reconhecimento real em 260k+ seguidores somados. O redesign não deve abandonar a identidade visual existente — deve refinar a execução (contraste, hierarquia, tipografia) mantendo o que já é reconhecível.

Imagens: `assets/esquadrao-frog/youtube-banner.jpg`, `assets/esquadrao-frog/instagram-grid.jpg`.

## Informações do cliente (conversa direta, 2026-08-03)

O Frog esclareceu por conta própria os pontos que tínhamos sinalizado como incertos:

- **350 vs 400+ não é inconsistência, são duas métricas reais diferentes:** já deu aula para 400+ pessoas ao longo do tempo; o grupo ativo hoje tem ~350, porque tem gente que entra, para de jogar ou sai com o tempo (churn natural). **Ação:** não "padronizar" o número — usar os dois corretamente rotulados (ex: "400+ alunos formados" e "350+ membros ativos hoje"), o que é inclusive uma prova social mais forte que só um número solto.
- **Descompasso de demanda:** hoje a galera procura ele muito mais para aula 1:1 direta do que para o curso — mesmo o curso sendo mais valioso pra maioria das pessoas (não escala, depende só do tempo dele). O funil atual não está direcionando bem a demanda para o produto certo.
- **Distribuição real dos planos:** ~80% assina o Recruta (acesso a conteúdo, sem aula com ele — o mais barato). O Soldado (R$247–249, experiência mais completa) é o que ele considera que "vale mais a pena" pra maioria, mas não é o mais escolhido na prática.

**Implicação direta para o redesign:** o site hoje marca "Veterano" (o mais caro) como "MAIS ESCOLHIDO" — mas isso não bate com a distribuição real (80% no Recruta). Esse selo precisa ser honesto e, mais importante, a página de preços precisa ser reestruturada para empurrar a atenção para o Soldado — que é o plano que o próprio Frog identifica como melhor custo-benefício e que hoje está sendo undersold pela forma como as opções são apresentadas.

## Estrutura atual do site
Hero (vídeo + headline "DO BRONZE AO MESTRE" + CTA) → 3 cards de dor → seção "O que é o Esquadrão" (lista de entregáveis) → bio do mentor (credenciais de campeonato) → carrossel "Resultados do Esquadrão" (prints de conversa) → pricing (3 planos: Recruta R$120, Soldado R$249, Veterano R$349) → CTA WhatsApp → footer.

A arquitetura de informação (dor → solução → autoridade → prova social → oferta em camadas) está correta. Os problemas são majoritariamente de execução visual e lacunas de conversão, não de estrutura narrativa.

## Pontos de melhoria

### Visual / Design
1. **Contraste do headline principal** — "DO BRONZE AO MESTRE" usa gradiente marrom/dourado sobre fundo escuro, quase ilegível à primeira vista. Ver `assets/esquadrao-frog/site-hero.jpg`.
2. **Paleta genérica de template gamer** — verde neon + roxo é o padrão saturado de milhares de comunidades de Discord/jogos desde ~2018. Falta um segundo elemento visual (textura, ilustração, tipografia) que diferencie a Esquadrão da concorrência.
3. **Tipografia inconsistente** — fonte "grunge/slasher" nos títulos vs. fonte pixel/mono nos botões e labels; duas vozes visuais competindo.
4. **Hierarquia de CTA nivelada por igual** — todo botão usa o mesmo verde neon saturado (hero, 3x no pricing, WhatsApp), sem diferenciação primário/secundário.

### UX
5. **Áudio/vídeo autoplay no hero** — vídeo com botão "Ativar o Som" sobreposto; ruído/fricção para quem abre em ambiente público ou silencioso.
6. **Sem captura de lead** — visitante que não converte na hora não tem para onde ir (sem e-mail, sem isca de conteúdo). É "compra agora ou sai".

### Estratégia / Conversão
7. **Prova social rasa em dados concretos** — apenas "K/D 8.3" e "350+ alunos"; falta antes/depois real de aluno (rank ganho, gameplay comparado), gatilho mais forte para esse público.
8. **Selo "MAIS ESCOLHIDO" não bate com a realidade** — está no plano Veterano (o mais caro), mas 80% dos alunos assina o Recruta (o mais barato). A página de preços precisa ser redesenhada para direcionar honestamente a atenção para o Soldado, identificado pelo próprio cliente como o de melhor custo-benefício para a maioria.
9. **Funil não resolve o descompasso de demanda** — a maior parte da procura hoje é por aula 1:1 com o Frog (não escala), quando o produto que serve mais gente é o curso/comunidade. O redesign deve deixar claro, já no hero/dor, por que o curso resolve o mesmo problema que a aula individual, sem depender do tempo limitado dele.

## Próximos passos
- [x] Escrever `plans/0002-redesign-esquadrao-frog.md` com a estrutura técnica do redesign.
- [x] Definir se a paleta verde/roxo é mantida — sim, mantida (equity de marca).
- [ ] Levantar cases reais de evolução de aluno (rank antes/depois) para a seção de prova social.
- [ ] Redesenhar a seção de pricing para refletir o Soldado como recomendação real, não o Veterano — estrutura definida no plano, falta executar.
