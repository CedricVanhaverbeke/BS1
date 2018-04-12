# Hoe kun je bewerkingen uitvoeren op een rij getallen, bestaande uit alle gehele getallen tussen X en Y ?

my $x = 5;
my $y = 10;

my @arrayMetGetallen = $x..$y;

# @arrayMetGetallen += 1;
foreach(@arrayMetGetallen){
    print $_;
}

