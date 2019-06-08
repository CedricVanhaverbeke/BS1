use Data::Dumper;

@ARGV = "reeks3/oefening16/s11.pdf";

# Bit of information:
# In a 2D array
# array[column][row] is the way to index

# array of lines with x1 x2 y1 y2 coordinates
# so we don't need to read the file again
# this is a reference to an array in perl;
my $lines = [];

# This is the final maze
my $maze = [];

# list for all the x coordinates
# we need this for the mapping later
# a we use a hash because we don't want duplicate values
my %xcoordinates = ();

# list for all the y coordinates
my %ycoordinates = ();

sub parseFile {
    my $flag = 0;
    my $x1 = -1;
    my $y1 = -1;
    my $x2 = -1;
    my $y2 = -1;
    my $count = 0;


        while(<>){

            # Reset endcoordinates
            # We cannot do this for the begincoordinates 
            # because they need to be remembered
            my $x2 = -1;
            my $y2 = -1;

            # Delete newlines at the end of a line
            chomp;

            $flag = 1 if /\d\.\d{3} w$/;

            # Skip everything before 1.700 w
            next if !$flag;

            # Skip lines with one character
            next if /^.$/;

            # Skip empty lines
            next if /^$/;

            # After endstream nothing
            last if /endstream/;
            
            # Get begincoordinates
            # cast them to ints to get rid of the dot
            ($x1, $y1) = (int($1),int($2)) if /(\d+.\d+) (\d+.\d+) m/;

            # Get endcoordinates
            # cast them to ints to get rid of the dot
            ($x2, $y2) = (int($1),int($2)) if /(\d+.\d+) (\d+.\d+) l/;
            
            # If endcoordinates are not empty
            # A coordinate pair is read 
            # And we can process it
            if($x2 != -1 && $y2 != -1){
                $xcoordinates{$x1} = undef;
                $xcoordinates{$x2} = undef;
                $ycoordinates{$y1} = undef;
                $ycoordinates{$y2} = undef;
                push @$lines, {x1 => $x1, y1 => $y1, x2 => $x2, y2 => $y2};
            }
    }
}

sub mapCoordinates {
    # map x coordinates, we can use the same hash
    my $mappedValue = 0;
    foreach (sort {$a <=> $b} keys %xcoordinates){
        $xcoordinates{$_} = $mappedValue;
        $mappedValue += 2;
    }

    # map y coordinates
    $mappedValue = 0;
    foreach (sort {$a <=> $b} keys %ycoordinates){
        $ycoordinates{$_} = $mappedValue;
        $mappedValue += 2;
    }
}

sub printHash {
    foreach (sort {$a <=> $b} keys %xcoordinates){
        print"$_ => $xcoordinates{$_}\n";
    }
}

sub fillMaze {
    foreach $line (@$lines){

        # When x'es are equal, there's a vertical line
        if($line->{x1} == $line->{x2}){
            
            # The line can take up more than 1 spot in the maze
            # So we loop from the minY value to the maxY value
            my $maxY = $line->{y1} > $line->{y2} ? $line->{y1} : $line->{y2}; 
            my $minY = $line->{y1} < $line->{y2} ? $line->{y1} : $line->{y2}; 
            for(my $i = $ycoordinates{$minY}; $i <= $ycoordinates{$maxY}; $i++){
                $maze->[$i][$xcoordinates{$line->{x1}}] = "|";
            }
        }

        # When y's are equal there's a horizontal line
        # So we loop from the minY value to the maxY value
        if($line->{y1} == $line->{y2}){
            my $maxX = $line->{x1} > $line->{x2} ? $line->{x1} : $line->{x2}; 
            my $minX = $line->{x1} < $line->{x2} ? $line->{x1} : $line->{x2}; 
            for(my $i = $xcoordinates{$minX}; $i <= $xcoordinates{$maxX}; $i++){
                $maze->[$ycoordinates{$line->{y1}}][$i] = "-";
            }
        }
    }
}

sub drawMaze {
# Every non filled cell in the maze is now undef
# So when drawing the maze we need to make sure this draws a " "
# Here you need to play a bit with reverse and stuff
print "\n\n";
    foreach my $row (reverse @$maze) {
        foreach my $element (@$row) {
            if ($element eq "|" || $element eq "-") {
            printf("%3s", $element);
            } else {
            print "   ";
            }
        }
        print "\n";
    }
    print "\n\n";
}

# First parse the file
parseFile();

# Then map the coordinates
mapCoordinates();
# Now evaluate every value in the hash to find the lines
fillMaze();
drawMaze();


