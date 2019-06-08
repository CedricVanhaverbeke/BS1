use Data::Dumper;

@ARGV = "310.svg";
@ARGV_COPY = @ARGV;

%reverseDirections = (
    above => under,
    right => left,
    left => right,
    under => above
);

$neighbours = {
    above => [0, -1],
    under => [0, 1],
    right => [1, 0],
    left => [-1, 0]
};

# Prints all fields with their walls
sub printField {
    foreach my $y (0 .. $length - 1){
        foreach my $x (0 .. $width - 1){
            printf("cell %-4d: %s \n", $field->[$x][$y]{number}, join ", ", grep {$field->[$x][$y]{$_} == 1 && $_ ne number} sort keys $field->[$x][$y]);
        }
    }
    print "\n\n";
}

sub printPath {
    my @path = ();
    foreach my $y (0 .. $length - 1){
        foreach my $x (0 .. $width - 1){
            push(@path, $field->[$x][$y]{number}) if countNeighbours($x, $y) < 4;
        }
    }
    print "Path contains following cells: ",  join(" ,", sort {$a <=> $b} @path);
}

sub countNeighbours {
    (my $x, my $y) = @_;
    return scalar grep {$field->[$x][$y]{$_} == 1 && $_ ne number} keys $field->[$x][$y];
}

sub deleteCellsWithOnlyOneNeighbour {
    foreach my $x (0 .. $width - 1){
        foreach my $y (0 .. $length - 1){
            if(countNeighbours($x, $y) == 3){
                # If you want to print the cell that has too many neighbours
                #printf("Cell %-3d: has 3 neighbours ... Deleting\n", $field->[$x][$y]{number});
                
                # Find out which neighbour is not taken
                %allDirections = (left, undef, above, undef, right, undef, under, undef);
                delete @allDirections{grep {$field->[$x][$y]{$_} == 1 && $_ ne number} keys $field->[$x][$y]};
                $direction = (keys %allDirections)[0];

                # Add the direction in this cell and the one on the other side
                $field->[$x][$y]{$direction} = 1;
                $field->[$neighbours->{$direction}[0] + $x][$neighbours->{$direction}[1] + $y]{$reverseDirections{$direction}} = 1;
                $changed += 1; # To count the amount of changed cells
            }
        }
    }
    #print "\n\n";
}

# Read the original file
while(<>){
    chomp $_;
    if($_ =~ /<title>/){
        ($width, $length) = ($_ =~ /.*<title>(\d+) by (\d+)/);
        
        # Create field
        foreach my $x (0 .. $width - 1){
            foreach my $y (0 .. $length - 1){
                $field->[$x][$y] = {number, $y*($width) + $x + 1  ,left, 0, above, 0, right, 0, under, 0};
            }
        }
    }
    
    # only interpret lines, numbers don't need to be known
    if(/.*<g fill="none"/ ... /<\/g>/){

        if($_ =~ /<line/){
            ($x1, $y1, $x2, $y2) = ($_ =~ /<.*x1="(.*?)".*y1="(.*?)".*x2="(.*?)".*y2="(.*?)"/);
            ($x1, $y1, $x2, $y2) = (($x1 / 16), ($y1 / 16), ($x2 / 16), ($y2 / 16)); # Multiples of 16
            
            # x-values are equal : vertical line
            if($x1 == $x2){
                # Add neighbours left and right
                foreach my $y ($y1 - 1 .. $y2-2){ # This assumes y2 > y1
                    $field->[$x1-2][$y]{right} = 1 if $x1-2 >= 0 and $x1-2 <= $width - 1;
                    $field->[$x1-1][$y]{left} = 1 if $x1-1 >=0 and $x1-1 <= $width - 1;
                }
            }

            # y-values are equal: horizontal line
             if($y1 == $y2){
                # Add neighbours above and under
                foreach my $x ($x1 - 1 .. $x2-2){ # This assumes x2 > x1
                    $field->[$x][$y1-2]{under} = 1 if $y1-2 >= 0 && $y1-2 <= $length - 1;
                    $field->[$x][$y1-1]{above} = 1 if $y2-1 >= 0 && $y1-1 <= $length - 1;
                }
            }
        }
    }
}

#printField();
$changed = 1;
while($changed > 0){
    $changed = 0;
    deleteCellsWithOnlyOneNeighbour();
}

#printPath();

# Color the path
$^I = ".bak";
@ARGV = @ARGV_COPY;
while(<>){
    if($_ =~ /<g fill="none"/){
        print "<g fill=\"#FF0000\" stroke=\"none\">\n";
        foreach my $y (0 .. $length - 1){
            foreach my $x (0 .. $width - 1){
                if(countNeighbours($x,$y) < 4){
                    # Create coordinates and print them
                    (my $x1, my $x2, my $y1, my $y2) = (($x + 1) * 16, ($x + 2) * 16,($y + 1) * 16, ($y + 2) * 16);
                    printf("<polygon points=\"$x1,$y1 $x2,$y1 $x2,$y2 $x1,$y2\" \/>\n");
                }   
            }
        }
        print "<\/g>\n";
    }
    print $_;
}
