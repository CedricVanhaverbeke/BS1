# Hoe kun je bewerkingen uitvoeren op een rij getallen, bestaande uit alle gehele getallen tussen X en Y ?

my $x = 5;
my $y = 10;

# $x en $y zijn included
foreach($x .. $y){
    print $_;
}