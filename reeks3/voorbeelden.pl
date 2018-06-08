# Gewoon de declaratie van een array, niets bijzonder
@array = (7.5, 4, 3, 10, 12);

@squares = map { $_ * $_ } @array;
print join ", ", @squares;
print "
";

@juiste = grep { $_ < 100 } @squares;
print join ", ", @juiste;
print "
";

# Je kan deze zelfs combineren :)
@juiste = map { $_ * $_} grep { $_ < 100 } @array;

# Alfanumeriek gesorteerd
print join ", ", sort @squares;
print "\n";

# Gesorteerd op waarde
print join ", ", sort { $a <=> $b } @squares;

# Grep, sort & map werken dus op dezelfde manier.


