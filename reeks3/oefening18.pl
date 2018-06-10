# Argument instellen voor de numbrix
@ARGV = "reeks3/numbrix/A.numbrix";
@ARGV_COPY = @ARGV;

# Eerste keer doorlopen
while(<>){
    $hoogte++;
    $kolom = 1;
    while(/ ?([^\s]{3}) ?/g){
       $aantal++;
       $getallen{int $1} = {
           x => $kolom,
           y => $hoogte
       } if $1 =~ /(\d{3})/;
       $kolom++;
    }
}
# Voor de array sebietjes
$breedte = $aantal / $hoogte;

# Vind de inverse van deze getallen
# Deze hash bevat nu alle mogelijke getallen
%inverse = map {$_, undef} (1..$aantal);
# Hier verwijderen we de getallen die al in het bestand zaten
delete @inverse{keys %getallen};

# Voeg alle mogelijke buren toe behalve als het getal al in de numbrix stond
# We maken hier een uitgebreide matrix zodat we niet moeten letten op buren straks
# Extra voordeel is ook dat we gewoon kunnen werken zoals de tekening gegeven is
for my $i (0 .. $breedte + 1){
    for my $j (0 .. $hoogte + 1){ 
        if($i == 0 || $j == 0 || $j > $hoogte || $i > $breedte){
            $numbrix[$i][$j] = {-1};
        } else {
            $numbrix[$i][$j] = {%inverse};
        }
    }
}

while(($key) = each(%getallen)){
    $numbrix[$getallen{$key}->{x}][$getallen{$key}->{y}] = {$key};
}

# Criterium 1
$aantalChanges = 69;
while($aantalChanges > 0){
    $aantalChanges = 0;
    for my $i (1 .. $breedte){
        for my $j (1 .. $hoogte){
            @kandidaten = sort { $a <=> $b } keys %{$numbrix[$i][$j]};

            next if scalar @kandidaten == 1;

            @bovenbuur = sort { $a <=> $b } keys %{$numbrix[($i-1)][$j]};
            @rechterbuur = sort { $a <=> $b } keys %{$numbrix[$i][($j+1)]};
            @onderbuur = sort { $a <=> $b } keys %{$numbrix[($i+1)][$j]};
            @linkerbuur = sort { $a <=> $b } keys %{$numbrix[$i][($j-1)]};

            for $kandidaat(@kandidaten){
                @gevonden = ();
                %seen = ();

                push @gevonden, grep {$_ == $kandidaat + 1 || $_ == $kandidaat - 1 } @bovenbuur;
                push @gevonden, grep {$_ == $kandidaat + 1 || $_ == $kandidaat - 1 } @rechterbuur;
                push @gevonden, grep {$_ == $kandidaat + 1 || $_ == $kandidaat - 1 } @onderbuur;
                push @gevonden, grep {$_ == $kandidaat + 1 || $_ == $kandidaat - 1 } @linkerbuur;

                $seen{$_}++ for @gevonden;

                if(scalar keys %seen < 2) {
                    if(($kandidaat == $aantal || $kandidaat == 1) && scalar keys %seen == 1) {
                        next;
                    }

                # Als je hier komt, geen twee buren gevonden.
                delete $numbrix[$i][$j]->{$kandidaat};
                $aantalChanges++;
                print "$i.$j-$kandidaat ";
                }
            }
        }
    }

    print "\n";

    # Printen
    print "\n";
    for my $i (1 .. $breedte){
        for my $j (1 .. $hoogte){ 
        printf("cel %i.%i: ", $i, $j);
        print join " ,", sort {$a <=> $b} keys $numbrix[$i][$j];
        print "\n";
        }
    }


    if($aantalChanges > 0){
        # Terug vanaf criterium 1 starten
        next;
    }

    # Criterium 2

    # Overlopen welke cellen met 1 waarde er allemaal zijn
    @enkelingen = ();
    for my $i (1 .. $breedte){
        for my $j (1 .. $hoogte){
            if(scalar keys $numbrix[$i][$j] == 1){
                while(($key) = each($numbrix[$i][$j])){
                    push @enkelingen, $key;
                }
            }
        }
    }

    # Nu deze allemaal gaan verwijderen uit de anderen
    for my $i (1 .. $breedte){
            for my $j (1 .. $hoogte){
                if(scalar keys $numbrix[$i][$j] > 1){
                    for $enkeling (@enkelingen){
                        if(exists $numbrix[$i][$j]->{$enkeling}){
                        delete $numbrix[$i][$j]->{$enkeling};
                        $aantalChanges++; 
                    }
                }
            }
        }
    }

    if($aantalChanges > 0){
        # Terug naar criterium 1
        next;
    }

    # Criterium 3
    %enigen = undef;
    for my $i (1 .. $breedte){
        for my $j (1 .. $hoogte){
            if(scalar keys $numbrix[$i][$j] > 1){
                while(($key) = each($numbrix[$i][$j])){
                    $enigen{$key}++;
                }
            }
        }
    }

    @sologetallen =  grep {$enigen{$_} == 1} keys %enigen;
    for my $i (1 .. $breedte){
        for my $j (1 .. $hoogte){
            if(scalar keys $numbrix[$i][$j] > 1){
                for $solo (@sologetallen){
                    $aantalChanges++ if exists $numbrix[$i][$j]->{$solo};
                    $numbrix[$i][$j] = {$solo} if exists $numbrix[$i][$j]->{$solo};
                }
            }
        }
    }
}
print "\n\n\n";
print "ANTWOORD: \n";

for my $i (1 .. $breedte){
    for my $j (1 .. $hoogte){
        printf("%03s ", (keys $numbrix[$i][$j])[0]);
    }
    print "\n";
}