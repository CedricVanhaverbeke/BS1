# Lees eerst alle info uit uit het csv bestand in, lijn per lijn & steek alles in een anonieme tabel
# Steek al die info in een hash met als sleutel de naam en key een referente naar de tabel die je net gemaakt hebt.
# De ouders worden opgeslagen als referenties

my $counter = 0;
%hash = ();

while(<>){
    ($naam, $ouder, $inwoners, $opp) = split ";", $_;
        $hash{$naam} = [$naam, $hash{$ouder}, [], $inwoners ? $inwoners : 0, $opp ? $opp : 0 ];

        #Push alle kinderen
        push @{$hash{$ouder}->[2]}, $naam if $ouder;
    
        #inwoners en oppervlakte pushen, gelukt
        $referentie = $hash{$naam}->[1];
        while($referentie){
            $hash{$referentie->[0]}->[3] += $inwoners;
            $hash{$referentie->[0]}->[4] += $opp;
            $referentie = $referentie->[1];
        }
}

$root = $hash{"Belgie"};
print $root;

#for $key (keys %hash){
#    print "naam : " . $hash{$key}->[0] . "\n";
#    print "ouder : " . $hash{$key}->[1]->[0] . "\n";
#    print "kinderen: ";
#    print join ',' , @{$hash{$key}->[2]};
#    print "\n";
#    print "inwoners : " . $hash{$key}->[3] . "\n";
#    print "oppervlakte : " . $hash{$key}->[4] . "\n";
#    print "\n";
#}


   
