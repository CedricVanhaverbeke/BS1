use Data::Dumper;

# Vind alle permutaties van 5 cijfers van alfabet 3-7

# alfabet maken
foreach (3 .. 7){
    push @permutaties, "$_";
}
for(2 .. 5) { # 5 cijfers  
    # Uitbreiden
    $aantal = scalar @permutaties;
    foreach(0 .. 7 - 3 - 1){
        foreach my $i (0 .. $aantal - 1){
            push @permutaties, $permutaties[$i];
        }
    }

    @permutaties = sort {int($a) <=> int($b)} @permutaties; # permutaties sorteren
    $aantal = scalar @permutaties;
    $i = 3; # beginwaarde
    foreach(0 .. $aantal - 1){
        $permutaties[$_] .= $i;
        # I modulo'en
        $i %= 7;
        $i = 2 if $i == 0;
        $i += 1;
    }
}

print Dumper sort {int($a) <=> int($b)} @permutaties;




