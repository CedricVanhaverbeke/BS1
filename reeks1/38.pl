# Veronderstel dat je over twee hashes beschikt. Bepaal enerzijds de indices die in beide hashes, 
# en anderzijds de indices die slechts in één van beide hashes voorkomen.

my %A = (1,2,3,4,5,6,7,8,9,10);
my %B = (1,12,13,14,2,8,17,18,19,20);

#opnieuw zelfde manier als op de vorige keren

#initialiseren
my %H = ();

@H{$_} |= 1 for keys %A;
@H{$_} |= 2 for keys %B;

#Bepaal indices die in beide voorkomen:
print "Indices die in beide voorkomen: \n";
print join ", ", sort{$a <=> $b} grep {$H{$_} == 3} keys %H;
print "\n";

#Bepaal indices die slechts in 1 van beide hashes voorkomen:
print join ", ", sort {$a <=> $b} grep {$H{$_} < 3} keys %H;