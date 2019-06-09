use Data::Dumper;

# Beginwaarden
foreach(1 .. 9){
    push @permutaties, $_;
}

# Dan elke nieuwe waarde toevoegen
for(1 .. 4){
    # Eerst het aantal vergroten met 10 keer hetgeen erin zit
    $aantal = scalar @permutaties;
    foreach (0 .. 9){
        foreach my $i (1 .. $aantal){
            push @permutaties, "$i";
        }
    }

    $totaal = scalar @permutaties;
    @permutaties = sort { int($a) <=> int($b) } @permutaties;
    $i = 1;
    foreach(0 .. $totaal - 1){
        $i -=1;
        $i = $i % 9;
        $i += 1;
        $permutaties[$_] .= $i;
        $i += 1;
    }
}

print "Aantal mogelijkheden: ", scalar @permutaties;