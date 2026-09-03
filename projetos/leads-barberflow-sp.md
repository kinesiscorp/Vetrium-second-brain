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

## Leads qualificados (9/100)

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

## Próximos passos

- Confirmar WhatsApp dos números marcados como "fixo" antes de incluir no disparo.
- Continuar o levantamento pelos bairros faltantes até completar 100.
- Ligar essa lista ao disparo real: script simples que lê esta tabela e chama
  `POST /send` do `whatsapp-gateway` (1 envio/dia, controle de quem já foi
  contatado).
- Escrever o roteiro/copy da mensagem de abordagem (próxima etapa da KR).
