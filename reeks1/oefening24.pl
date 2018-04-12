# Achterhaal het eerste element van een array, en zijn index, dat aan een specifieke voorwaarde voldoet.

my @array = ("eerste", "tweede", "derde", "#iets");
my $teller = 0;
foreach my $x (@array) {
    $teller++;
    last if $x =~ /tw*/n;
}

print "@array[$teller], $teller";