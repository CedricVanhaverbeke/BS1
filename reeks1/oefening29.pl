#Bepaal de waarden van elementen die in een eerste array voorkomen, 
#maar niet in een tweede. Pas dit toe om lijnen van een 
#bestand te filteren die niet voorkomen in een ander bestand

my @x = (2,4,6,8,10,3,9);
my @y = (1,3,5,7,9,11);
my %H = (); #initialiseer

@H{@x} = (); #Alle elementen van @x in %H zetten
delete @H{@y}; #Verwijder alle waarden die in y zitten.

print sort {$a <=> $b} keys %H;