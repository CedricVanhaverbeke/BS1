# Op deze manier kan je een array uitprinten
my @array = qw /This is an array/;
while(<@array>){
    print $_ . "\n";
}

#Voorbeeld met een bestand uitlezen lijn per lijn met de diamond operator
open(FH, "test.txt") or die "can't open file";
while(<FH>){
    print $_ . "einde";
}


#Hoe nu rechtstreeks een bestand openen met de diamond operator
__DATA__
Dit is een 
voorbeeld
van data 
int Perl