$/ = undef;

$file = <>;
$file =~ s/.*w\n//s;
$file =~ s/endstream.*//s;
$file =~ s/m\n/m /g;

foreach $line (split /\n/, $file){
        if($line =~ /(\d+\.?\d*) (\d+\.?\d*) m (\d+\.?\d*) (\d+\.?\d*)/){
                $x_points{$1} = 1;
                $x_points{$3} = 1;
                $y_points{$2} = 1;
                $y_points{$4} = 1;
                push(@lines, [$1, $2, $3, $4]);
        }
}

@hash_refs = (\%x_points, \%y_points);
foreach $ref (@hash_refs){
        $count = 1;
        foreach $key (sort {$a <=> $b } keys(%{$ref})){
                $ref->{$key} = $count;
                $count += 2;
        }
}

$cols = (scalar keys(%x_points))*2;
$rows = (scalar keys(%y_points))*2;

for $i (0..$cols){
        for $j (0..$rows){
                $maze[$i][$j] = " ";
        }
}

foreach(@lines){
        ($x1, $y1, $x2, $y2) = ($x_points{@{$_}[0]}, $y_points{@{$_}[1]}, $x_points{@{$_}[2]}, $y_points{@{$_}[3]});
        if($x1 == $x2){
                for $cel ($y2 .. $y1){
                        print $cel, " ";
                        $maze[$x1][$cel] =  ($cel % 2 != 0)? "+" : "|";
                }
                print "\n";
        }else{
                for $cel ($x1 .. $x2){
                        $maze[$cel][$y1] = ($cel % 2 != 0)? "+" : "-";
                }
        }
}

for $i (reverse 0.. $#{$maze[0]}){
        for $j (0..$#maze){
                print $maze[$j][$i], " " ;
        }
        print "\n";
}