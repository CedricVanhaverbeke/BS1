# Schrijf een programma dat alle tabs in a string converteert in een aantal spaties. 
# Hierbij mag verondersteld worden dat alle tab stops zich op een veelvoud van 8 bevinden.

# Hier staat een overzciht van system variables in Perl:
# http://www.perlmonks.org/?node_id=353259

my $string = "Een   Twee        Derde       Vierde";

while ($string =~ s/\s+/$`/e) {
    # spin in empty loop until substitution finally fails
}

print $string;
