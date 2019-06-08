# Numbrix

## Basis

Hier moeten we gewoon .txt bestanden inlezen. Bij het examen is het sowieso een warboel van SVG

Stel een rooster van 5 x 5. Alle getalle van 1 - 25 moeten daar ingevuld zijn. Sommige nummers zijn al ingevuld.
De bedoeling is dat de buren (links, boven, rechts, onder) opeenvolgende getallen zijn:

```
3 ... 1

Op de puntjes kan er dus een 2 staan
```

## Structuren

- tweedimensionale array voor het rooster en hashes in elke cel.
- hash houdt alle mogelijkehden bij.

Zorg dat we de numbrix iets groter maken. ipv 5 x 5, 7 x 7, zodat we de buren makkelijk kunnen bepalen

## In het begin

Alle kandidaten invullen behalve: - alle getallen die al vast staan in de tabel

## oplossen

Met zekerheid op het examen deze oplossingsmethode:

We gaan criteria moeten toepassen zodat de kandidatenlijst uitgedund worden tot 1 kandidaat.
Blijvend doen tot er een oplossing gevonden is of het is niet meer nuttig om het criterium uit te voeren.
Dan hebben we een deeloplossing.

Joris heeft meerdere criterium.

Deze criteria gaan we in lussen blijven uitvoeren.

Soms is het beter om in plaats van de logische volgorde: 1 --> 2 --> 3 om na criterium 2 bv 1 terug uit te voeren. Dit is enkel nuttig voor tijdsbesparing

### Criterium 1

Elke cel met meerdere kandidaten aflopen. Afvragen of die kandidaat er nog met een reden instaat?
Stel er staat in een cel een 2 ==> Kijken naar de buren om te zien of de opeenvolgende cijfers (1 en 3) in de buurcellen zit. Zo niet, mag hij verwijderd worden.

Let op: dit criterium moet dus blijven lopen want na 1 iteratie kan het zijn dat er opnieuw zaken verwijderd kunnen worden

> Je houdt hier bij hoeveel kandidaten je geëlimineerd hebt, wanneer dit getal 0 is, is het criterium niet meer nuttig, en mag je overgaan naar het tweede

### Criterium 2

Kom je cellen tegen die maar 1 kandidaat meer heeft: maak er de definitieve waarde van.

Verwijder dan de definitieve waarden die je gevonden hebt uit de andere hashes.

Zo kunnen er opnieuw definitieve waarden gevonden worden, opnieuw criterium 2 doen.

Joris zegt: doe nu opnieuw criterium 1, maar je kan ook gewoon criterium 3 doen

### Criterium 3

Loop alle overblijvende getallen af. In hoeveel cellen komt elk getal voor? Als een kandidaat nog maar op 1 plaats kandidaat is, dan is dat de definitieve waarde
voor die cel en kunnen we die waarde in elke andere cel verwijderen.
