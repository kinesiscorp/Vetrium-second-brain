# 0001 - Estrutura de repositórios e processo (SDD simplificado)

Data: 2026-07-30
Status: **Substituída** por `0003-consolidacao-no-second-brain.md` (13/08/2026) — o repo
central passou a usar git submodules em vez de `.gitignore`, e o SDD migrou para dentro dele.

## Contexto
A Achievo vai lidar com múltiplos projetos (landing pages, redesigns, branding, wireframes, aplicações). Precisávamos de uma forma de centralizar documentação/processo sem misturar o código de cada projeto num único repositório.

## Decisão
- Um repositório central (`achievo/`) concentra specs, plans e decisions.
- Cada projeto vive em sua própria subpasta com repositório git independente (polyrepo), ignorado pelo `.gitignore` do repo central.
- Processo de trabalho é SDD simplificado (specs → plans → decisions em markdown), sem ferramenta externa por enquanto. Avaliar o GitHub Spec Kit no futuro caso o processo manual não seja suficiente.

## Consequências
- Repo central nunca versiona código de projeto — evita confusão de histórico e permite hospedar cada projeto separadamente (ex: repos diferentes no GitHub) sem submodules.
- Cada novo projeto precisa ser adicionado manualmente ao `.gitignore` do repo central.
- Processo depende de disciplina manual (sem automação de slash commands), aceitável para o estágio atual da empresa.
