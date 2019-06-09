use Data::Dumper;

@ARGV = "./s31.pdf";

($x2, $y2) = (-1, -1); # default values for second pair coordinates

# read file
while(<>){
    if(/1.[\d+].*w$/ ... /endstream/){
        
        # Interpret lines
         ($x1,$y1) = (/(\d+)\.?\d* (\d+)\.?\d* m/) if /(\d+)\.?\d* (\d+)\.?\d* m/;
         ($x2,$y2) = (/(\d+)\.?\d* (\d+)\.?\d* l/) if /(\d+)\.?\d* (\d+)\.?\d* l/;

         # Add the lines when both coordinates are read
         if($x2 != -1 and $y2 != -1){
            push @$walls, {x1 => $x1, x2 => $x2, y1 => $y1, y2 => $y2};
            $xvalues{$_} = undef foreach ($x1, $x2); # So no multiples are read
            $yvalues{$_} = undef foreach ($y1, $y2); # So no multiples are read
            ($x2, $y2) = (-1 , -1); # Reset the coordinates
         }
    }
    
    last if /endstream/; # stop interpreting from this point
}

# Create mapping for xvalues
$value = 0;
foreach my $x (sort {$a <=> $b} keys %xvalues){
    $xvalues{$x} = $value;
    $value += 2;
}

# Create mapping for yvalues
$value = 0;
foreach my $y (sort {$a <=> $b} keys %yvalues){
    $yvalues{$y} = $value;
    $value += 2;
}

# Create maze
foreach (@$walls){
    # Vertical wall
    if($_->{x1} == $_->{x2}){
        ($begin, $end) =  $_->{y1} < $_->{y2} ? ($yvalues{$_->{y1}}, $yvalues{$_->{y2}}) : ($yvalues{$_->{y2}}, $yvalues{$_->{y1}});
        foreach my $y($begin .. $end - 1){ # Previous line because $begin < $end
            $maze->[$y][$xvalues{$_->{x1}}] = "|";
        }
       
    }

    # Horizontal wall
    if($_->{y1} == $_->{y2}){
        ($begin, $end) =  $xvalues{$_->{x1}} < $xvalues{$_->{x2}} ? ($xvalues{$_->{x1}}, $xvalues{$_->{x2}}) : ($xvalues{$_->{x2}}, $xvalues{$_->{x1}});
        foreach my $x($begin .. $end - 1){ # Previous line because $begin < $end
            $maze->[$yvalues{$_->{y1}}][$x] = "-";
        }
    }
}

# Create maze like Joris, with plusses on each corner
foreach(my $i = 0; $i <= [reverse sort {$a <=> $b} values %xvalues]->[0]; $i+=2){
    foreach(my $j = 0; $j <= [reverse sort {$a <=> $b} values %yvalues]->[0]; $j+=2){
        $maze->[$j][$i] = "+";
    }
}

# Print maze, reverse because otherwise it's upside down fsr
foreach $row (reverse @$maze){
    foreach $y(0 .. scalar @{$maze->[0]}){
        if(defined $row->[$y]){
            printf("%-2s",$row->[$y] eq "-" ? $row->[$y] x 2 : $row->[$y]);
        } else {
            print " " x 2;
        }    
    }
    print "\n";
}

