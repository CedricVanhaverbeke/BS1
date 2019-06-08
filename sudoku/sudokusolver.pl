use Data::Dumper;

my $bodyCheck = 0;
my @cells = ();
my $size = 0;
my $aantal = 0;

@ARGV_COPY = @ARGV;

sub readSudoku {
    while(<>){
        chomp($_);

        # Skip css
        $bodyCheck = 1 if $_ =~ /<table id="grid">/;

        # Only take useful information
        next if $bodyCheck == 0;
        # No empty lines
        next if $_ =~ /^$/;
        last if $_ =~ /<\/table>/;

        $size += 1 if $_ =~ /<tr>/;

        # Here we read the columns
        if($_ =~ /td/){
            if($_ =~ /<td><.*value=\"(.*)\".*><\/td>/){
                push @cells, $1;
            } else {
                push @cells, -1;
            }
        }
    }
}

sub toHtml {
    my $sudoku = shift;
    my $index = 0;
    while(<>){
        chomp($_);

        # Here we read the columns
        if($_ =~ /<td><input id=\"(.*)\"/){
            my $row = sprintf("%i", $index / $size);
            print "<td><input id=\"$1\" type=\"text\" value=\"" .  $sudoku->[$row][$index - $size*$row]{value}  . "\" disabled /></td>\n";
            $index += 1;
        } else {
            print $_ . "\n";
        }
    }
}

sub fillSudoku {
    my $sudoku = [];
    for my $i (0 .. $size - 1){
        for my $j (0 .. $size - 1){
            my $index = $j + $i *$size;
            $sudoku->[$i][$j]{value} = $cells[$index];
            $sudoku->[$i][$j]{vast} = 1 if $cells[$index] != -1;
        }
    }
    return $sudoku
}

sub fillPossibilities {
    my $sudoku = shift;
    for my $i (0 .. $size - 1){
        for my $j (0 .. $size - 1){
            my $possibilities = findPossibleEntriesForEmptyCell($i, $j, $sudoku);
            $sudoku->[$i][$j]{possibilities} = $possibilities if !defined($sudoku->[$i][$j]{vast});
        }
    }
}

sub printSudoku {
    my $sudoku = shift;
    for $i (0 .. $size - 1){
        for $j (0 .. $size - 1){
            printf("%-4s", $sudoku->[$i][$j]{value} != -1 ? $sudoku->[$i][$j]{value} : "_");
        }
        print("\n");
    }
}

sub EveryValueFilledIn {
    my $sudoku = shift;
    for my $i (0 .. $size - 1){
        for my $j (0 .. $size - 1){
            return 0 if $sudoku->[$i][$j]{value} == -1;
        }
    }
    return 1;
}

sub findPossibleEntriesForEmptyCell {
    (my $i, my $j, my $sudoku) = @_;
    my %possibilities;

    $possibilities{$_} = undef foreach (1 .. $size);

    # Checking for row possibilities
    # Horizontal
    for my $x (0 .. $size-1){
        delete $possibilities{$sudoku->[$i][$x]{value}};
    }

    # Vertical
    for my $y (0 .. $size-1){
        delete $possibilities{$sudoku->[$y][$j]{value}};
    }

    # Checking for square possibilities

    # First we need to know in what square we are located
    (my $x, my $y) = findSquare($i,$j,$sudoku);

    # Now go through every value and delete possibilities
    # when they're already in the square
    my $sizeSquare = sqrt($size);


    for my $a ($sizeSquare * $x .. $sizeSquare * $x + $sizeSquare - 1){
        for my $b ($sizeSquare * $y .. $sizeSquare * $y + $sizeSquare - 1){
            delete $possibilities{$sudoku->[$a][$b]{value}};
        }
    }

    return \%possibilities
}

sub findSquare {
    (my $j, my $i, my $sudoku) = @_;
    my $sizeSquare = sqrt($size);

    my $returnJ = $j / $sizeSquare - 0.2;
    my $returnI = $i / $sizeSquare - 0.2;

    return (sprintf("%i",$returnJ) , sprintf("%i",$returnI));

}

sub findFirstVacantSpot {
    my $sudoku = shift;
    for my $i (0 .. $size - 1){
        for my $j (0 .. $size - 1){
            return($i,$j) if $sudoku->[$i][$j]{value} == -1;
        }
    }
}

sub solveSudoku {
    my $sudoku = shift;
    # When the board is full we can stop the algorithm
    if(EveryValueFilledIn($sudoku)){
        printSudoku($sudoku);
        return;
    } else {
        # Find first spot that can be tried
        (my $i, my $j) = findFirstVacantSpot($sudoku);
        foreach(keys $sudoku->[$i][$j]{possibilities}){
            $sudoku->[$i][$j]{value} = $_;
            # TODO:  Check if value valid, else delete from possibilities
            solveSudoku($sudoku);
        }
        # backtrack if no possibilities found
        $sudoku->[$i][$j]{value} = -1;
    }
}

# main program:
die if scalar @ARGV == 0;

# STEP 1: read sudoku
# Dont add sudokufile as parameter. 
# <> uses @ARGV
readSudoku();
$bodyCheck = 0;
my $sudoku = fillSudoku();


# STEP 2: fill in all possible values for a cell
# so we can keep track of them, and delete them where
# necessary

fillPossibilities($sudoku);

# STEP 2: Solve sudoku: doesn't work for some reason now
# I stop after 20 times now
printSudoku($sudoku);
print "\n\n";
solveSudoku($sudoku);

printSudoku($sudoku);
# STEP 3: print in html file
#$^I = ".bak";
#@ARGV = @ARGV_COPY;

#toHtml($sudoku);
