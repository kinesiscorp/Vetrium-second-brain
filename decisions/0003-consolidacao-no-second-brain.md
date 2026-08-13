# 0003 - Consolidação de tudo no second-brain (submodules)

Data: 2026-08-13
Status: Aceita
Substitui: `0001-estrutura-de-repos.md`

## Contexto

A estrutura descrita em `0001` (repo central + subpastas com git próprio, ignoradas via
`.gitignore`) degradou na prática. Numa auditoria em 13/08/2026 achamos:

- O repo central existia no GitHub como `kinesiscorp/vetrium-second-brain`, mas o clone
  local apontava para o nome antigo (`vetrium--megabrain`, que o GitHub ainda redireciona)
  e estava **14 commits atrás**, parado no commit inicial. Trabalhar naquela máquina
  significava não enxergar `clientes/`, `projetos/` nem o `CLAUDE.md`.
- Os projetos tinham sido clonados **na mão** em caminhos arbitrários
  (`vetrium/landing-page`, `frog/site`) em vez dos caminhos dos submodules, então
  `git submodule` nunca via nada e os ponteiros nunca eram atualizados.
- O conteúdo de SDD (`specs/`, `plans/`, `decisions/`) vivia num repo **sem remote nenhum**.
  Seis commits de trabalho real existiam só num disco, sem backup e invisíveis de outra máquina.
- Um app Next.js completo (`proposta-frog/`) estava com **zero commits**, embora seu
  conteúdo já tivesse sido migrado para dentro da LP como `/proposta-comercial/frogman`.

A causa raiz é a mesma nos quatro casos: `.gitignore` esconde a divergência. Uma pasta
ignorada pode estar desatualizada, órfã ou duplicada sem que nada no repo central reclame.

## Decisão

- **Um único repo raiz**: `kinesiscorp/vetrium-second-brain`. É o second-brain e a raiz do
  workspace ao mesmo tempo — não existe pasta "central" separada dentro dele.
- **Código de projeto entra como git submodule na raiz**, nunca como pasta ignorada:
  `vetrium-lp/` e `esquadrao-do-frog/`. O ponteiro do submodule é commitado, então o
  second-brain sabe exatamente em que commit cada projeto estava.
- **Todo o resto vive versionado no second-brain**: `specs/`, `plans/`, `decisions/`,
  `clientes/`, `projetos/`, `design/`, `frog/` (assets de marca do cliente).
- **Nada de repo local sem remote.** Se merece um commit, merece um remote.
- **Sync antes de push**, automatizado nos dois níveis (ver `CLAUDE.md`): um hook
  `pre-push` no git e um hook de `Stop` no Claude Code.

## Consequências

- Adicionar projeto novo agora é `git submodule add <url> <nome>`, não editar `.gitignore`.
- Um `git pull --recurse-submodules` em qualquer máquina reproduz o estado inteiro —
  que era exatamente o que faltava para trabalhar de outro computador.
- Os ponteiros de submodule precisam ser commitados quando um projeto avança; se ficarem
  para trás, o second-brain aponta para um commit velho. O hook `pre-push` cobre isso.
- Submodule não segue branch automaticamente: fica preso a um commit. Para atualizar,
  `git submodule update --remote` e commitar o ponteiro novo.
- Arquivos ignorados dos projetos (`.env.local`, `.vercel/`) continuam fora do git e
  **não** vêm no clone — precisam ser recriados à mão em cada máquina.
