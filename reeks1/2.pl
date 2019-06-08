# Hoe kun je de inhoud van twee of meer variabelen cyclisch omwisselen, zonder een intermediaire variabele te gebruiken ?.

# Antw: ($b, $a) = ($a, $b);   #swap two variables

my $a = 10;
my $b = 69;

($b, $a) = ($a, $b);

print "Waarde van a is nu 69: $a \n";
print "Waarde ban b is nu 10: $b \n";