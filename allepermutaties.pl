use Data::Dumper;


my @permutaties = ();
my $teller = 0;
sub stelPermutatiesOp {
    my $lengte = shift;
    push @permutaties , "$_" for (0 .. 9);
    @newPermutaties = ();

    for (1 .. $lengte - 1){

        
        foreach $i (@permutaties) {
            push @newPermutaties, $i for (0 .. 8)
        }

        push @permutaties, @newPermutaties;
        @permutaties = sort {sprintf("%i",$a) <=> sprintf("%i",$b)} @permutaties;

        my $teller = 0;
        foreach(@permutaties){
            $_ .= ($teller % 10);
            $teller++;
        }
    }

    @permutaties = grep(/.{$lengte}/, @permutaties);
}

sub stelPermutatiesVanRange0tot3Op {
    my $lengte = shift;
    push @permutaties , "$_" for (0 .. 3);
    @newPermutaties = ();

    for (1 .. $lengte - 1){

        
        foreach $i (@permutaties) {
            push @newPermutaties, $i for (0 .. 2)
        }

        push @permutaties, @newPermutaties;
        @permutaties = sort {sprintf("%i",$a) <=> sprintf("%i",$b)} @permutaties;

        my $teller = 0;
        foreach(@permutaties){
            $_ .= ($teller % 4);
            $teller++;
        }
    }

    @permutaties = grep(/.{$lengte}/, @permutaties);

    # Er zitten dubbels in for some reason
    $unique{$_} = undef foreach @permutaties;
    @permutaties = sort {sprintf("%i",$a) <=> sprintf("%i",$b)} keys %unique;
}

# Gevonden door algoritmen
sub berekenPermutatiesRecursief {
    (my $lengte, my $beginInterval, my $eindInterval) = @_;

    if(length($permutaties[0]) < $lengte ){
        my @kinderen = ($beginInterval .. $eindInterval);
        my @nieuweStap = ();

        foreach $element (@permutaties){
            foreach my $kind (@kinderen){
                push @nieuweStap, $element . $kind;
            }
        }

        @permutaties = (@nieuweStap);
        berekenPermutatiesRecursief($lengte, $beginInterval, $eindInterval);
    }
}

# Schrijf alle permutaties van een rij getallen met 
# een bepaalde lengte uit
#stelPermutatiesOp(5);
#print Dumper \@permutaties;

@permutaties = ("");

berekenPermutatiesRecursief(5, 1, 9);
print Dumper \@permutaties;
print "Aantal elementen: " . scalar @permutaties . "\n";
