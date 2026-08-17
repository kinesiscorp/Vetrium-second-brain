# Vetrium — Second Brain

Base de conhecimento da Vetrium, estúdio de design e tecnologia fundado por Gabriel Antonio
(sócio, dev) e Gabriel Carvalho (sócio). Segue o mesmo estilo de Document-Driven Development do
MegaBrain pessoal do Gabriel Antonio (`~/dev/MegaBrain`): informações são fornecidas em conversa e
organizadas aqui em documentação estruturada, consultada e atualizada continuamente.

## Papel do Claude aqui

- Quando surgirem informações sobre clientes, propostas comerciais, leads, projetos próprios da
  Vetrium ou decisões de negócio, categorize e registre em arquivos Markdown na pasta apropriada.
- Antes de responder perguntas sobre a Vetrium, consulte os arquivos relevantes neste projeto.
- Documentos são a "fonte da verdade" do estado atual — mantenha-os atualizados, não como logs
  cronológicos de tudo que já foi dito. O histórico de mudanças fica no git.
- Sempre que um arquivo for criado ou atualizado, faça um commit git com mensagem descritiva.
- Não crie estrutura de pastas antecipadamente. A estrutura cresce organicamente.
- Antes de criar uma pasta/categoria nova, prefira encaixar a informação em algo já existente.
- `vetrium-lp/` e `esquadrao-do-frog/` são git submodules (código real dos projetos) — não editar
  conteúdo deles a partir daqui, apenas referenciar.
- **Nunca crie repo local sem remote, nem pasta de projeto ignorada pelo `.gitignore`.** Foi
  assim que o repo desandou antes (ver `decisions/0003`): trabalho invisível de outra máquina.
  Projeto novo entra como submodule: `git submodule add <url> <nome>`.

## Processo SDD

Trabalho de cliente/projeto passa por `specs/` → `plans/` → `decisions/`, numerados `000N`:

- `specs/` — **o que** construir e por quê (diagnóstico, requisitos, achados)
- `plans/` — **como** construir (stack, estrutura de seções, próximos passos)
- `decisions/` — decisões arquiteturais/estruturais no formato ADR, com Contexto/Decisão/
  Consequências. ADR superada não é apagada: marque `Status: Substituída por 000N`.

Diferença para os dados de cliente: o **estado atual** da relação comercial (estágio do funil,
próximo passo, bloqueios) vive no CRM em `/admin`, não em Markdown — ver `decisions/0004`.
`specs/` e `plans/` são o **processo de construção**. O mesmo cliente aparece nos dois: o CRM diz
onde a negociação está, `plans/0002` diz como o site foi construído. `clientes/arquivo/*.md` é o
estado pré-CRM, congelado — não editar.

## Sincronização (obrigatória)

O repo vive em duas máquinas. Publicar fora de ordem quebra o clone do outro lado — a raiz
apontando para um commit de submodule que não existe no remote dele.

- **Publique sempre com `sh scripts/sync.sh`**, nunca `git push` direto. Ele publica os
  submodules primeiro, rebaseia a raiz e só então faz push.
- Um hook `pre-push` (em `.githooks/`, ativo via `core.hooksPath`) bloqueia push fora de ordem
  mesmo se alguém esquecer. Só é contornável com `--no-verify`.
- Um hook `Stop` do Claude Code roda `scripts/sync.sh --auto` ao fim de cada sessão: commita a
  documentação pendente e sincroniza. Ele **não** commita nada fora das pastas de documentação —
  se você criar arquivo solto na raiz, ele avisa mas não publica.
- Clone novo: `sh scripts/bootstrap.sh` (ativa os hooks e inicializa os submodules).
- `.env.local` dos submodules não vem no clone — precisa ser recriado à mão.

## Cross-reference com o MegaBrain pessoal

O perfil pessoal do Gabriel Antonio (família, finanças pessoais, outros projetos) vive em
`~/dev/MegaBrain`. Projetos que estão sob custódia da Vetrium (BarberFlow, Salgados-Flow) têm
detalhes técnicos/pessoais lá e detalhes de negócio aqui — ver `projetos/` nos dois repositórios.

## Estrutura atual

- `vetrium-lp/` (submodule) — site institucional **e** CRM interno da Vetrium, no mesmo app
  Next.js: marketing em `/`, admin em `/admin` (auth, clientes/leads, funil, materiais e
  histórico de interações — **fonte da verdade** pra dados de cliente, substitui `clientes/*.md`,
  ver `decisions/0004-crm-substitui-clientes-md.md` e `decisions/0005-crm-integrado-ao-vetrium-lp.md`).
  Deploy via Dokku na VPS (não mais Vercel), mesmo esquema do BarberFlow — ver `DEPLOY.md` no
  submodule. Deploy em produção ainda pendente.
- `clientes/arquivo/` — `.md` de clientes/leads pré-CRM, migrados e congelados como histórico
  (frog, jjl-servicos, da-o-play, leads)
- `clientes/da-o-play/briefing.pdf` — briefing recebido do cliente Dá o Play
- `clientes/anexos/` — arquivos recebidos de cliente/prospecção (planilhas, decks)
- `projetos/vetrium-lp.md` — redesign da landing page da Vetrium
- `projetos/barberflow.md` — projeto sob custódia da Vetrium (negócio; técnico no MegaBrain)
- `projetos/salgados-flow.md` — projeto sob custódia da Vetrium (negócio; técnico no MegaBrain)
- `specs/`, `plans/`, `decisions/` — processo SDD (ver seção acima)
- `design/lp-redesign/` — imagens de referência/inspiração de design
- `frog/` — assets de marca do cliente Frog (logo, brandkit, badges)
- `scripts/`, `.githooks/` — sincronização com o GitHub (ver seção abaixo)
- `vetrium-lp/`, `esquadrao-do-frog/` — submodules com o código real dos projetos

## Convenções

- Idioma: Português (Brasil)
- Formato: Markdown
- Datas: DD/MM/AAAA
- Nomes de arquivo e pasta: minúsculo, sem acento, hífen como separador
