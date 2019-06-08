# Indien een functie (stat bijvoorbeeld) een lijst met meerdere elementen
# als terugkeerwaarde heeft, hoe kun je dan slechts met een beperkt
# aantal van deze elementen expliciet rekening houden, 
# en de andere elementen negeren ?


# stat toont de status info van een bestand

@array = (0, 1, 2, 3, 4, 5, 6);

# toont nu enkel de eerste 3 elementen
($x, $y, $z) = (@array)[0,3];
print "$x $y $z";