# Verwijder duplicaten uit een lijst waarden. Deze lijst kan bijvoorbeeld bekomen worden door een invoerbestand lijn per lijn in te lezen, 
# of door de individuele elementen van een array a priori in te vullen, of door de uitvoer van een opdracht te verwerken.

my @A = (1,1,1,5,6,8,7,9,10,10,10); #Lijst met duplicaten
my %H = (); #Maak een hash

# Dit werkt. Probleem is dat de array per keer opnieuw gevuld wordt. Da's niet de bedoeling.
$H{$_} = undef for @A;

%SH = ();
for $item (@A){
    $SH{$item} = undef unless $SH{item};
}

my @UITVOER = keys %H;
print @UITVOER; #niet gesorteerd
print "\n";
print sort {$a <=> $b} @UITVOER; #Wel gesorteerd
print "\n";

print $_ foreach keys %SH;