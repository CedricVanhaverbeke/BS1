#Nodig om twee keer in te lezen:
@ARGV_COPY = @ARGV;

%cellen;
@lijntjes;

while(<>){
    if($_=~ /<title.+$/){
        $_ =~ s/<title>//g;
        @splitted = split ' ', $_;
        $kolommen = @splitted[0];
        $rijen = @splitted[2];
        print $kolommen . " " . $rijen . "
        ";
    }

    if($_ =~ m/<line.+$/) {

        ($x1, $y1 ,$x2, $y2) = $_ =~ m/<line x1="([0-9]+)" y1="([0-9]+)" x2="([0-9]+)" y2="([0-9]+)" .+$/;
        
        foreach $element (($x1, $y1 ,$x2, $y2)){
            $element = $element / 16;
        }

        push @lijntjes, [$x1, $y1, $x2, $y2];
        print "$x1, $y1, $x2, $y2 
        ";
    }
    if($_ =~ m/<text x="([0-9]+)" y="([0-9]+)" .+<\/text>/) {
        ($x, $y) = $_ =~ m/<text x="([0-9]+)" y="([0-9]+)" .+<\/text>/;
        $x = int($x / 16);
        $y = int($y / 16);
        $cel =  $y * $kolommen - ($kolommen - $x);

        if($cel - $kolommen < 0){
            $buurboven = 0;
        } else {
            $buurboven = $cel - $kolommen;
        }

        if($cel + 1 > $kolommen*$y){
            $buurrechts = 0;
        } else {
            $buurrechts = $cel + 1;
        }

        if($cel + $kolommen > 20){
            $buuronder = 0;
        } else {
            $buuronder = $cel + $kolommen;
        }

        if($cel % $kolommen == 1){
            $buurlinks = 0;
        } else {
            $buurlinks = $cel - 1;
        }
        $cellen{$cel} = [$buurboven, $buurrechts, $buuronder, $buurlinks];

    }
}




#Printen van de tabel
foreach $cel (sort{$a <=> $b} keys %cellen){
    print $cel . " : ";
    foreach $buur (@{$cellen{$cel}}){
        print $buur . ", " ;
    }
    print "
    ";
}

foreach $lijntje (@lijntjes){
    foreach $waarde (@{$lijntje}){
        print $waarde . ",";
    }
    print "
    ";
}
