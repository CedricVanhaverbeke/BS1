# De lengte van deze tabel kan je op volgende manier bepalen

$y = @ingevuldearray;
print "$y \n";

# Elementen invullen:
($x,$y,$z) = @ingevuldearray; #Hier worden de eerste drie elementen van de array ingevuld in de variabelen

    # Wat als we enkel het eerste en derde element willen tonen
($x, undef, $z) = @ingevuldearray; # Met de undef operator

#localtimes van elkaar aftrekken krijgt een output in seconden