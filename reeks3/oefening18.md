# Oefening 18

## Setting
bestand met getallen. Er ontbreken een aantal getallen van. Je moet ze invullen zodat de buren een getal kleiner en een getal groter dan de cel zelf bevat.

- Rechts, links, boven & onder zijn buren. Schuin dus niet

In eerste instantie:
- Elke cel bevat kandidaatnummers. In het begin zijn dit alle nummers zonder degene die al op het bord staan.
    - Deze maak je best door een tweedimensionale array te maken
- Twee hoogste niveaus: tabellen
- Laagste niveau: hash met keys = alle kandidaatwaarden & values maakt geen zak uit volgens de Joris
- Veel kans dat we zo'n vraag krijgen op het examen! Laagste niveau is dan meestal een hash
- Joris gaf ook de hint dat het misschien gemakkelijk is om de hash in het begin al groter te maken zodat geen rekening moet gehouden worden met de logica voor de buren. Zoals bv bij linksonder zal je dan ook 4 buren hebben met gewoon geen enkele kandidaat in.

## Hoe elimineer je kandidaten?
Iteratief een criterium toepassen. Als je het genoeg herhaalt zou je een oplossing moeten uitkomen. Dit is enkel waar wanneer je criterium zeker 'straf' genoeg is. Meestal zijn het meerdere criteria.

- Pas gewoon de criteria van Joris toe. Vind er zelf geen uit :)
- Breaks & if's in lussen mag van Joris. Dat gaan we toch eens moeten melden aan Wimmeke
- Enkel code die werkt wordt gequoteerd

### Eerste criterium
Alle kandidaten (dus oorspronkelijk de lijst van alle kandidaten) gaan we gaan onderwerpen aan een criterium.

1. In de buren van de kandidaten moeten zowel 1 kleiner als 1 groter zitten. Bv: kandidaat = 4. Dan moeten er in de buren 3 & 5 zitten. Let op: buren met kandidaten tellen natuurlijk ook !

Dit schreeuwt om een exists functie & delete functie van een hash (eventjes weer checken hoe dat werkt)

2. Nu alles overlopen is moeten we deze sta opnieuw uitvoeren want jah, heel veel getallen zijn verdwenen.

3. Blijven doorgaan tot er niet meer kan geëlimineerd worden

## Tweede criterium
1. Als je een cel hebt met 1 waarde in een cel weet je dat die cel op de juiste plaats staat.

2. Vergeet niet dat deze cijfers dus verwijderd mogen worden uit de kandidatenlijst van de anderen.

3. Daarna mag je weer criterium 1 toepassen




## Derde criterium
Zoek getallen die enkel in 1 cel kandidaat is. Je kan de andere kandidaten verwijderen uit de lijst 

## Algemeen
Er wordt dus afgewisseld tussen criterium 1, 2 & 3 totdat er een situatie bereikt wordt waar je niet meer verder kan

## Bestandjes
- Er zijn bestanden die stap voor stap werken zodat je kan controleren.

- Volgorde van elimineren kan door elkaar gegooid worden
