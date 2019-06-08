use Data::Dumper;

@ARGV = "reeks3/regios.csv";

@lines = <>;

# Omgekeerd inlezen omdat de kinderen onderaan staan

# Hoe gaan we?
# Als we een blad zijn: voeg de populatie en oppervlakte ook toe aan de hash + voeg kind toe aan ouder
# Als we hoger zijn: voeg kind toe aan ouder
# Als we een ouder zijn: voeg van al mijn kinderen die opperpvlakte en populatie toe
foreach(reverse @lines){
    chomp;
    $_ =~ /(.*);(.*);(.*);(.*)/;
    (my $naam, my $ouder, my $pop, my $opp) = ($1, $2, $3, $4);

    # We zitten bij een blad
    $regios->{$naam}{pop} =  $pop if $pop; #Want bij de hoogste leden is er geen informatie over populatie
    $regios->{$naam}{opp} = $opp if $opp; # Want bij de hoogste leden is er geen informatie over oppervlakte

    # We zitten bij een kind
    push @{$regios->{$ouder}{kinderen}}, $naam if $ouder;

    # We zitten bij een ouder
    if($regios->{$naam}{kinderen}){
        foreach (@{$regios->{$naam}{kinderen}}){
            $regios->{$naam}{pop} += $regios->{$_}{pop};
            $regios->{$naam}{opp} += $regios->{$_}{opp};
        }
    }

}

print Dumper $regios->{"Belgie"};