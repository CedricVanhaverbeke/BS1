#Tel de lijnen in een bestand
open(my $file, "<", "input.txt") or die "Can't open < input.txt: $!";

1 while (<$file>);
close FILE;
print "Aantal lijnen: $.\n"; #aantal lijnen die ingelezen zijn

#Tel het aantal paragrafen in een bestand
local $/ = "\n\n"; #lege paragrafen zijn wel toegelaten
local $/ = ''; #lege paragrafen zijn niet toegelaten
open(my $file, "<", "input.txt") or die "Can't open < input.txt: $!";
1 while <$file>;
print "Aantal paragrafen: $.\n"; #$. = aantal lijnen die gelezen zijn