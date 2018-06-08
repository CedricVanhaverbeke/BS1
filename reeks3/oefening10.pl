# Lees eerst alle info uit uit het csv bestand in, lijn per lijn & steek alles in een anonieme tabel
# Steek al die info in een hash met als sleutel de naam en key een referente naar de tabel die je net gemaakt hebt.
# De ouders worden opgeslagen als referenties

while(<DATA>){
    chomp; # Om lege lijnen weg te werken
    ($regio, $ouder, $population, $area) = split(";");
    $hash{$regio} = {
        regio => $regio,
        ouder => $hash{$ouder},
        kinderen => [], # Anonieme array voor kinderen
        population => $population ? $population : 0,
        area => $area ? $area : 0
    };
    # Aangezien de kinderen allemaal na de ouder komen kan je ze hier al toevoegen
    $ouderhash = $hash{$ouder};
    push @{$ouderhash->{kinderen}}, $regio;

    $thishash = $hash{$regio};
        while(exists($thishash->{ouder})){
            $thishash->{ouder}{population} += $population;
            $thishash = $thishash->{ouder};
        }
}

# print
 while(($key, $value) = each(%hash)){
     print "$key met kinderen ";
     print join ", ", @{$value->{kinderen}};
     print "en populatie ". $value->{population};
     print "\n";
 }





__DATA__
Belgie;;;
Vlaanderen;Belgie;;
Limburg;Vlaanderen;;
Arr.Hasselt;Limburg;;
As;Arr.Hasselt;7488;22.07
Beringen;Arr.Hasselt;40930;78.30