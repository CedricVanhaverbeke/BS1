use Data::Dumper;

%h = (1, 1, 3, 1);

# Alle delen van de map * 2 doen!
%gemapte = map { $_*2 } %h;

# Enkel de sleutel veranderen gaat niet zo simpel, dat moet dan met een while lus

@array = ("     string\n", "     hey\n");
#Newlines worden verwijderd!
#Check dus wat na de ; staat! Het is belangrijk om $_ te returnen als de functie destructief is
@array = map {chomp $_; $_} @array;

#Doet alle spaties weg voor elk element in een array
@array = map {s/ //g; $_} @array;


@array = ("Cedric Vanhaverbeke", "Juul Vanhaverbeke", "Cedric Pollie", "Cedric De Greave");
# Sorteer de lijst met namen enkel op achternaam zonder 'De' mee te laten tellen
@array = sort { (split(" ", $a))[-1] cmp (split(" ", $b))[-1] } @array;

# Sorteer de lijst eerst op achternaam, dan op voornaam
@array = sort { (split(" ", $a))[-1] cmp (split(" ", $b))[-1] or (split(" ", $a))[0] cmp (split(" ", $b))[0]} @array;
print join ", ", @array;
#print 00006
printf("\n%05d", 6);

#regex matcher
my $string = "<1><2>";
($twaalf = $string) =~ s/<|>//g;

print "\n$twaalf";