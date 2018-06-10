# Hoe sorteren op achternaam in een string met zowel voor- als achternaam?
@array = ("Cedric Vanhaverbeke", "Anouk Windey", "Rudolf De Geiter");

print join " ,", sort {(split(" ", $a, 2))[1] cmp (split(" ", $b, 2))[1]} @array;