@ARGV = "numbrix/Z.numbrix"; # Zet dit in commentaar als je je eigen bestand via de command line wil meegeven
@ARGV_COPY = @ARGV;

sub printNumbrix {
    foreach $y (1 .. $d){
        foreach $x (1 .. $d){
            # Als je er een nul voor zet wordt hij mooi:
            printf("%03d ", join("", keys $numbrix->[$x][$y]{kandidaten})) if $numbrix->[$x][$y]{definitief} == 1;
            printf("%3s ", "...") if $numbrix->[$x][$y]{definitief} == 0;
        }
        print("\n");
    }
    print "\n\n\n";
}

sub printMogelijkheden {
    foreach $y (1 .. $d){
        foreach $x (1 .. $d){
            printf("%d.%d: %s\n", $y, $x, join(" ", sort {$a <=> $b} keys $numbrix->[$x][$y]{kandidaten})) if $numbrix->[$x][$y]{definitief} == 0;
        }
    }

    print "\n\n\n";
}

sub isOpgelost {
    $opgelost = 1;
    foreach $y (1 .. $d){
        foreach $x (1 .. $d){
            $opgelost = 0 if $numbrix->[$x][$y]{definitief} == 0;
        }
    } 
}

### CRITERIUM 1 ###

# Het blijkt niet nodig te zijn om te programmeren of het om verschillende buren gaat.
# ik heb dat eens gedaan maar de output bleef rats hetzelfde

# Ook heb ik mijn array blijkbaar omgekeerd gevuld
sub criterium1 {
    $aantalVerwijderd = 1;
    @buren = ([-1, 0], [0, 1], [1, 0], [0, -1]); # goeie manier om alle buren te overlopen
    while($aantalVerwijderd > 0){
        $aantalVerwijderd = 0;
        foreach $y (1 .. $d){
            foreach $x (1 .. $d){
                # Buren enkel controleren wanneer de waarden nog niet definitief waren
                if($numbrix->[$x][$y]{definitief} == 0){
                    # Controleren voor elk nummer of zijn opeenvolgende cijfers 
                    # wel bij de buren staan
                    foreach $nummer (sort {$a <=> $b} keys $numbrix->[$x][$y]{kandidaten}){
                        $aantalKleiner = 0; # aantal keer dat het getal kleiner voorkomt
                        $aantalGroter = 0; # aantal keer dat het getal groter voorkomt
                        $aantalKleiner += 1 if $nummer - 1 == 0; # om tegen te gaan dat 1 onterecht verwijderd wordt
                        $aantalGroter += 1 if $nummer + 1 > $d * $d; # om tegen te gaan dat 25 onterecht verwijderd wordt
                        for $buur (@buren){
                            $aantalKleiner += 1 if exists $numbrix->[$x + $buur->[0]][$y + $buur->[1]]{kandidaten}{$nummer - 1};
                            $aantalGroter += 1 if exists $numbrix->[$x + $buur->[0]][$y + $buur->[1]]{kandidaten}{$nummer + 1};
                        }

                        if($aantalKleiner == 0 || $aantalGroter == 0){
                            printf("%d.%d-%d\n", $y, $x, $nummer); # print welke woorden verwijderd zijn zoals in A.txt
                            delete $numbrix->[$x][$y]{kandidaten}{$nummer};
                            $aantalVerwijderd += 1;
                        }
                    }
                }
            }
        }
        print("\n" x 3);
    }
}

### CRITERIUM 2 ###

sub criterium2 {
    # Zoeken naar nieuwe definitieve waarden
    printf("Cel(len) met slechts 1 enkele kandidaat: ");

    $aantalDefinitieve = 1;
    while($aantalDefinitieve > 0){
        @definitieveWaarden = ();
        foreach $y (1 .. $d){
            foreach $x (1 .. $d){
                if($numbrix->[$x][$y]{definitief} == 0){ # belangrijk, anders komen ook de andere definitieve waarden er al in
                    $numbrix->[$x][$y]{definitief} = 1 if scalar keys $numbrix->[$x][$y]{kandidaten} == 1;
                    push @definitieveWaarden, keys $numbrix->[$x][$y]{kandidaten} if scalar keys $numbrix->[$x][$y]{kandidaten} == 1;
                    printf("(%d.%d=%d) ", $y, $x, join( "", keys $numbrix->[$x][$y]{kandidaten})) if scalar keys $numbrix->[$x][$y]{kandidaten} == 1;
                }
            }
        }

        # nieuwe definitieve waarden overal verwijderen, behalve op de plaats waar hij alleen voorkomt, duuh
        foreach $y (1 .. $d){
            foreach $x (1 .. $d){
                foreach(@definitieveWaarden){
                    delete $numbrix->[$x][$y]{kandidaten}{$_} if scalar keys $numbrix->[$x][$y]{kandidaten} > 1;
                }
            }
        }
        $aantalDefinitieve = scalar @definitieveWaarden;
    }
    print("\n" x 3);
}

### CRITERIUM 3 ###

sub criterium3 {
    $histogram = {};
    # Zoek alle waarden die maar 1 keer voor komen in de numbrix en hou hun plaats bij
    foreach $nummer (1 .. $d*$d){
            foreach $y (1 .. $d){
                foreach $x (1 .. $d){
                    if($numbrix->[$x][$y]{definitief} == 0){
                        $histogram->{$nummer}{x} = $x if exists $numbrix->[$x][$y]{kandidaten}{$nummer};
                        $histogram->{$nummer}{y} = $y if exists $numbrix->[$x][$y]{kandidaten}{$nummer};
                        $histogram->{$nummer}{aantal} += 1 if exists $numbrix->[$x][$y]{kandidaten}{$nummer};

                    }
                }
            }
        }
    
    # Als er nu ergens bij aantal een 1 stond, weten we zeker dat de ingevulde x & y waarden overeenkomen met de ce
    # die die waarde sowieso moet hebben.

    printf("getal(len) slechts mogelijk in 1 enkele cel: ");
    for $key (keys %$histogram){
        %teVerwijderen = ();
        # Hier nu zoeken naar de waarden die 1 hebben als aantal
        if($histogram->{$key}{aantal} == 1){
            printf("(%d.%d=%d) ", $histogram->{$key}{y}, $histogram->{$key}{x}, $key);
            # Verwijderen van alle andere waarden in de definitieve cel
            foreach(keys $numbrix->[$histogram->{$key}{x}][$histogram->{$key}{y}]{kandidaten}){
                delete $numbrix->[$histogram->{$key}{x}][$histogram->{$key}{y}]{kandidaten}{$_} if $key != $_;
            }

            # Zorgen dat de cel defintief is
            $numbrix->[$histogram->{$key}{x}][$histogram->{$key}{y}]{definitief} = 1;

            # Verwijder nu de definitieve waarde overal in de numbrix, behalve bij de definitieve waarden
            foreach $y (1 .. $d){
                foreach $x (1 .. $d){
                    delete $numbrix->[$x][$y]{kandidaten}{$key} if $numbrix->[$x][$y]{definitief} > 1; 
                }
            }
        }
    }
    print("\n" x 3);
}


### HOOFDPROGRAMMA ###

# dimensie bepalen
$d = 0;
$lijn = <>;
$d = scalar split(" ", $lijn);
while(<>){} # volledig uitlezen anders zit hij nog in de buffer voor de volgende inlezing

# Nu terug de argv instellen op het eerste zodat we nog eens kunnen overlopen
@ARGV = @ARGV_COPY;


# matrix opstellen
# steek eerst allemaal lege hashes in de multidimensionale array
for $x (0 .. $d + 1){
    for $y (0 .. $d + 1){
        $numbrix->[$x][$y]->{definitief} = 0;
        $numbrix->[$x][$y]->{kandidaten} = {};
    }
}

$y = 1;
while(<>){
    @nummers = split(" ", $_);
    foreach $x (1 .. $d){
        push @aanwezigeNummers, int($nummers[$x - 1]) if $nummers[$x - 1] ne "..."; # aanwezige nummers bijhouden
        $numbrix->[$x][$y]{kandidaten}{int($nummers[$x - 1])} = undef if $nummers[$x - 1] ne "...";
        $numbrix->[$x][$y]->{definitief} = 1 if $nummers[$x - 1] ne "...";
    }
    $y+=1;
}

# bereken beginmogelijkheden
$beginmogelijkheden{$_} = undef foreach (1..$d*$d);
delete @beginmogelijkheden{@aanwezigeNummers};

# numbrix vullen met alle mogelijke waarden
foreach $x (1 .. $d){
    foreach $y (1 .. $d){
        foreach (keys %beginmogelijkheden) {
            $numbrix->[$x][$y]{kandidaten}{$_} = undef if $numbrix->[$x][$y]{definitief} == 0;
        }
    }
}

# Aantal verwijderd instellen op 1 omdat hij groter moet zijn voor criterium 1
$opgelost = 0;
$vorigeStap = 0;
while($opgelost == 0){
    criterium1();
    printMogelijkheden();
    criterium2();
    printNumbrix();
    printMogelijkheden();
    criterium3();
    printNumbrix();
    printMogelijkheden();
    isOpgelost();
}