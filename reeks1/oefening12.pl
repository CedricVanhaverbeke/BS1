# Indien een functie (stat bijvoorbeeld) een lijst met meerdere elementen
# als terugkeerwaarde heeft, hoe kun je dan slechts met een beperkt
# aantal van deze elementen expliciet rekening houden, 
# en de andere elementen negeren ?


# stat toont de status info van een bestand

@array = stat("test.txt");

# toont nu enkel de eerste 3 elementen
($x, $y, $z) = @array;
print "$x $y $z";