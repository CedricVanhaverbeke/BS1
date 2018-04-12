# Hoe kun je slechts een deel van een string wijzigen ? 
# Dit kan ondermeer interessant zijn om specifieke velden 
# te wijzigen van records met vaste veldgrenzen.

#Dit kan blijkbaar met de substr functie

# substr [string] [offset] [length]
# string = de effectieve string waarvan een substring moet genomen worden
# offset = vanaf waar mag de string beginnen. Als deze negatief is telt hij vanaf achteraan
# length = de lengte van de substring. Als het negatief is neemt hij de lengte vanaf het einde

   my $s = "The black cat climbed the green tree";
    my $color  = substr $s, 4, 5;      # black
    my $middle = substr $s, 4, -11;    # black cat climbed the
    my $end    = substr $s, 14;        # climbed the green tree
    my $tail   = substr $s, -4;        # tree
    my $z      = substr $s, -4, 2;     # tr

    # Substitutie met substr
    my $name = 'fred';
    substr($name, 4) = 'dy';         # $name is now 'freddy'
    my $null = substr $name, 6, 2;   # returns "" (no warning)
    my $oops = substr $name, 7;      # returns undef, with warning
    substr($name, 7) = 'gap';        # raises an exception

    my $s = "The black cat climbed the green tree";
    my $z = substr $s, 14, 7, "jumped from";    # climbed
    # $s is now "The black cat jumped from the green tree"


