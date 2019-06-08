# Initialiseer twee twee-dimensionale array's, respectievelijk met 2x3 en met 3x2 elementen. 
# Interpreteer deze twee-dimensionale array's als matrices, voer de matrix-vermenigvuldiging uit, en schrijf het resultaat uit. 
    my $x = [
           [ 3, 2, 3 ],
           [ 5, 9, 8 ],
         ];
    
    my $y = [
           [ 4, 7 ],
           [ 9, 3 ],
           [ 8, 1 ],
    ];
    
    # Voor een matrixvermenigvuldiging moeten het aantal kolommen 
    # van de eerste matrix gelijk zijn aan het aantal rijen van de tweede

    #Aantal kolommen van de eerste matrix
    $colsX = @{@{$x}[0]};

    # Makkelijker geschreven, zo moet je dat dus geen twee keer uitpakken:
    $colsX = @{$x->[0]};
    $rowsX = @{$y};

    #Aantal rijen van de tweede matrix
    $colsY = @{$x->[0]};
    $rowsY = @{$y};

    die "Count of columns of first matrix is not equal to count of rows of second" if $aantalCols != $aantalRows;

    # Deze overloopt elke rij
    foreach my $row (0..$rowsY-1){
        #Deze overloopt elke rij van Y
        foreach my $i (0..$rowsY-2){
            $som = 0;
            # Deze overloopt elke kolom van X
            foreach my $j (0..$colsX-1) {
                $som += @{$x->[$row]}[$j] * @{$y->[$j]}[$i];
            }
            push @{$z->[$row]},$som;
        }
    }

    #print the array
    for my $i (0..1){
        print join ' ', @{$z->[$i]};
        print "\n";
    }
        
    

