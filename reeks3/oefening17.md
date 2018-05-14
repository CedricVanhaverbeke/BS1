# Oefening 19 notities

- Eerst een tabel maken met een lengte van 0 tot het einde
- De waarden van de x & y cellen zijn veelvouden van 16.
- De tabel heeft een associatieve tabel met 4 elementen. Dit zijn zijn buurelementen.
    - hoe de buren aflopen? 
    - vaste volgorde: wijzerszin of tegenwijzerszin. boven, rechts, onder links dus.
    - Op basis van aantal rijen en kolommen
    - Als de cel geen buur heeft (zoals aan de rand) dan stel je de buur in op 0. in een hoekpunt heb je dus 2 buren met waarde 0
    - Print die tabel uit
- Stap 2: lijnen gaan interpreteren. Van de vorm line x1... . De lijnen hebben een begin en eindpunt.
    - Gaan zoeken door welke buren ze van elkaar worden gescheiden. (Waar staat dus een lijntje tussen twee buren)
    - Als ze dus gescheiden worden door een lijntje moet je gaan aanpassen in de oorspronkelijke tabel. Je plaatst de waarden van die buren eerst op undefined.
    - Daarna alle elementen die undef zijn verwijderen uit de tabel.

Je krijgt na het uitvoeren van deze stappen volgende output

51:     41         61

Je gaat dus de buren gaan oplijsten van elke cel zonder undefined.

## Tweede deel:

### Menselijke manier: 

- Kies altijd het rechtse pad. Als er geen pad meer beschikbaar is zaosl bij 10 in 10.svg keer je terug naar de cel waar je wel nog een alternatief had. Je keert dan dus terug naar 9

- De tabel bevat pop dit punt 1 0 waarde. Deze nulwaarde moet helemaal op het einde van op het einde

- Zo blijf je verder lopen. Je moet de tabel altij cyclisch laten doorlopen tot de voorgaande waarde op het einde zit

###  Makkelijkere manier:
- Zoek eerste de cellen die op het einde van een gang zitten (dit zijn cellen met maar 1 buur) en verwijder deze
- Daarna verwijder je de cellen die je geëlimineerd hebt als buur van de cellen die hem als buur had.
- Op deze manier krijg je heel de tijd cellen met 1 buur. Je blijft dus heel de tijd hetzelfde doen tot er geen cellen zijn met 1 buur meer zijn.
- De cellen die overblijven stellen dan het pad voor. 
- Hoe kleur je het pad? 
    - Inlezen van het bestand in schrijfmodus: $^i instellen
    - Vergelijk eens met de output svg bestanden op intranet
    - Iets met polygon
- Op het einde hebben alle cellen 2 buren.