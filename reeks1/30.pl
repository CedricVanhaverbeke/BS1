#Veronderstel dat je over twee lijsten beschikt, 
#die elk geen duplikate waarden bevatten. Bereken de intersectie-,
#de unie-, en de verschil-lijsten: elementen die in beide lijsten, 
#minstens in één van beide lijsten, of slechts in één van beide lijsten voorkomen.

#2 lijsten:

my @x = (2,4,6,8,10,3,9);
my @y = (1,3,5,7,9,11);

#Initialisatie van hash
my %H = ();

#Combineren: (de @ is belangrijk hier)
@H{$_} |= 1 for @x;
@H{$_} |= 2 for @y;

#Hier hebben we dus de or gebruikt om de eerste en/of tweede bit van de value voor een bepaalde key op 1 in te stellen

# 1) Intersectie
#-------------------------------------
#Controleren of de waarde van een key 3 is. Want zowel eerste als tweede bit moeten ingesteld zijn!
print "Intersectie : \n";
print join ", ", sort{$a <=> $b} grep {$H{$_} == 3} keys %H;
print "\n";

# 2) Unie
#---------------------------------------
#Gewoon alles printen
print "Unie: \n";
print join ",", keys %H;

# 3) Verschil lijsten
#----------------------------
# - Komt voor in beide lijsten (zie unie)
# - Komt voor in minstens 1 van beide lijsten, dus ofwel waarde is 1 of in 2

# - Komt voor in slechts één van beide lijsten. Unie nemen van waarden 1 & 2

#PS: dat gaat hier allemaal dezelfde resultaten geven ;)

