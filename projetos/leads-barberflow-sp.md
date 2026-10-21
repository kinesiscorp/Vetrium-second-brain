# Leads BarberFlow — São Paulo

Lista de trabalho da KR "Aumentar as chances de captar leads" (ver OKR em
`barberflow.md`, dono Gabriel Furlan, prazo 08/09/2026). Objetivo: 100 barbearias de
São Paulo sem app de agendamento, para disparo de 1 mensagem/dia pelo WhatsApp do
BarberFlow (`~/dev/barberflow/whatsapp-gateway`, número já conectado), até 1% de
conversão (1 cliente).

## Metodologia

Levantamento manual via Google Maps (`google.com/maps/search/barbearia+<bairro>+Sao+Paulo`),
bairro por bairro (a busca genérica "barbearia" centrada em SP satura em ~20
resultados antes de precisar mover o mapa). Para cada resultado:

1. Descarta se a lista já mostra o selo **"Agendar on-line"** (já usa algum app de
   agendamento integrado ao Google).
2. Abre a ficha (`google.com/maps/place/?q=<nome>+<endereço>+Sao+Paulo`) e descarta se
   o campo "site" apontar pra uma plataforma de agendamento conhecida (ex.:
   `appbarber.com.br`, `avecbrasil.page.link`, marcas "by Fio Navalha") ou se as
   avaliações mencionarem agendamento via app próprio.
3. Sobrevivente = site institucional simples (ou nenhum site), Instagram/Facebook, ou
   agendamento manual por WhatsApp (`wa.me/...`) — perfil ideal pro BarberFlow.
4. Extrai telefone da ficha. Números com 8 dígitos (sem "9" na frente) são
   provavelmente **fixos** — confirmar se têm WhatsApp antes de disparar.

Bairros já cobertos (03/09/2026): Itaim Bibi, Vila Mariana/Moema, Pinheiros, Santana,
Santo Amaro. Faltam: Centro, Zona Leste (Tatuapé/Mooca), Zona Sul (Campo
Belo/Brooklin), Zona Norte (restante), Zona Oeste (Lapa/Perdizes), litoral/ABC se
expandir a região.

**Mudança de estratégia (10/09/2026, decisão do Gabriel Furlan):** sair dos bairros
badalados/centrais de SP (onde a decisão de 03/09 concentrou o levantamento) e priorizar
**periferia da capital** — bairros com barbearias mais novas e menos disputadas por apps de
agendamento concorrentes. Cidades do interior de SP ficam como opção B se a periferia não
render volume suficiente.

**Achado importante nessa tentativa:** o Google Maps **não expõe um sinal confiável de "loja
nova"**. Testado como proxy: poucas avaliações (ex.: 2-4). Resultado: várias dessas fichas têm
avaliações de 3-7 anos atrás — são barbearias antigas com pouca cultura de pedir avaliação, não
negócios recém-abertos. Sem badge "Novo" visível nesta amostra. **Critério que efetivamente
funciona pra qualificar lead** (mantido): ausência de app de agendamento (sem selo "Agendar
on-line", site não é plataforma de agendamento — ex. `topsalao.com` também entra na lista negra
agora, achado nesta rodada) — isso importa mais pro pitch do BarberFlow do que a idade real do
negócio. "Barbearia mais nova" acabou virando, na prática, **geografia menos disputada**, não um
filtro de data de abertura.

Bairros de periferia cobertos nesta rodada (10/09/2026): Cidade Ademar, Americanópolis, Vila
Marari (zona sul/extremo sul). São Mateus (zona leste) testado e **descartado por enquanto** —
os primeiros resultados já estão digitalmente maduros (4 de 5 com "Agendar on-line", inclusive
uma usando `topsalao.com`). Faltam ainda: Grajaú, Parelheiros, Cidade Tiradentes, Itaquera
(testado — cluster em torno da R. Fontoura Xavier é maduro/estabelecido, tentar ruas
secundárias), Zona Norte periferia (Brasilândia, Perus).

## Leads qualificados (13/100)

| # | Nome | Telefone | Endereço | Site | Observação |
|---|------|----------|----------|------|------------|
| 1 | Barbearia Brooklyn | (11) 2594-5569 *(fixo? confirmar WhatsApp)* | Av. Padre Antônio José dos Santos, 1259 — Cidade Monções | facebook.com | — |
| 2 | Janis Bull Barbearia — Vila Mariana | (11) 98015-0754 | R. Dr. Nicolau de Sousa Queirós, 73 — Vila Mariana | instagram.com | — |
| 3 | Barbearia Moema | (11) 98730-2491 | R. Canário, 1186 — Moema | barbeariamoema.com | — |
| 4 | Barbearia da Mooca — Unidade 4 | (11) 91843-6656 | R. Itabaiana, 211 — Belenzinho | barbeariadamooca.com | Rede com múltiplas unidades |
| 5 | O Santo Barbearia Clássica — Pinheiros | (11) 3031-6348 *(fixo? confirmar WhatsApp)* | R. Cardeal Arcoverde, 1571 — Pinheiros | osantobarbearia.com.br | — |
| 6 | Barbearia Santana | (11) 95116-4747 | R. Ezequiel Freire, 332 — Santana | nenhum | Sem site — baixa maturidade digital, ótimo alvo |
| 7 | Barbearia Suprema | (11) 98376-9418 | R. Cap. Amaral, 171 — Santana | wa.me (agenda 100% manual por WhatsApp) | Perfil ideal — já depende de WhatsApp manual |
| 8 | Barbearia Expert's — Santo Amaro | (11) 98102-2267 | R. Promotor Gabriel Nettuzzi Perez, 256 — Santo Amaro | barbeariaexperts.com.br + wa.me | — |
| 9 | M Barbearia | (11) 5694-0209 *(fixo? confirmar WhatsApp)* | Rua Darwin, 590 — Jardim Santo Amaro | mbarbearia.com | Review reclama que "o processo de agendamento é tão complexo que desisti" — usar como gancho no pitch |
| 10 | Dog's Barbearia | (11) 95361-9112 | R. Baquirivu, 333 — Cidade Ademar | nenhum | Sem site, 18 avaliações recentes (3 meses–1 ano) — perfil mais promissor da rodada de periferia |
| 11 | Maxima Barbershop | (11) 96132-4941 | Av. Yervant Kissajikian, 2104 — Americanópolis | nenhum | Sem site, avaliações recentes (últimos 1-3 meses) |
| 12 | Barbearia Os Caras de Pau | (11) 93277-2805 | R. Leônidas Moreira, 17 — Cidade Ademar | facebook.com | Agenda com hora marcada (manual); avaliações antigas — negócio estabelecido, não "novo", mas perfil de maturidade digital baixa continua ideal |
| 13 | Barbearia Sr.Barbosa | (11) 95248-5386 | R. Ângelo Batista, 12c — Vila Marari | instagram.com | — |

## Descartados (já usam app de agendamento concorrente)

Barbearia Felipe Dal Ri, São Paulo Barbearia, Barbearia Hermanos, Vituri Barbearia,
Barber do Neto, Barbearia Corleone, Pico da Neblina, Barbearia itaim (AppBarber),
BUENA VISTA BARBER CLUB, Feel King Barbearia e Visagismo (app próprio de agendamento),
Barberia 53 - Jardins, Barbearia Retrô Gol, Heisenberg Barbearia, Barbearia Bearzil,
The Captain's Barber Shop, Barbearia Art Shave, Barbearia Clássica Tommy Gun,
Barbearia Black Zone República, O Barbeiro da Esquina Moema 1, Valhalla Barber Shop,
Barbearia Keeperz, Barbeiro da Esquina Pinheiros, Barbearia The Captain's Pinheiros,
LevelzCut Pinheiros ("by Fio Navalha" — marca de software de gestão), Liberty Barber
Club, Barbearia Veracruz, Piratas Barbearia, *Barber 347* (usa Avec —
avecbrasil.page.link), Barbearia 28 Santo Amaro, PIER 7 Barbearia, A Barbearia
Express. Drip & Cut Barber Co. descartada por ser rede "por assinatura" com
múltiplas unidades (já tem modelo de assinatura próprio).

**Rodada periferia (10/09/2026):** Sr.Barba Black & White e Pádua Barbearia (Cidade
Ademar, ambas com selo "Agendar on-line"); Conceito Barber, Barbearia Estação 11,
Barbearia Vision Vip's 2, Magnos Corte & Barba, Barbearia Jeziel Lima (São Mateus —
Conceito Barber usa `topsalao.com`, as outras 4 têm selo "Agendar on-line"). Rustico
Barbearia e Barbearia Ramos (Vila Santa Catarina) — perfil de baixa maturidade digital
mas **sem telefone cadastrado no Maps**, não dá pra disparar; revisitar se sobrar tempo
pra achar o número por outra via (Instagram bio, por ex.).

## Próximos passos

- Confirmar WhatsApp dos números marcados como "fixo" antes de incluir no disparo.
- Continuar o levantamento pela periferia (Grajaú, Parelheiros, Cidade Tiradentes,
  Zona Norte — Brasilândia/Perus) até completar 100. Bairros centrais já mapeados
  (03/09) ficam como reserva se a periferia não render volume.
- Ao achar candidato promissor sem telefone no Maps, checar Instagram/Facebook antes
  de descartar — às vezes o número está na bio.
- **`send-daily-lead.js` está pronto mas nunca rodou de verdade** (ver `barberflow.md`)
  — falta ligar num cron real (idealmente na VPS) antes de continuar só acumulando
  leads sem disparar nada.
