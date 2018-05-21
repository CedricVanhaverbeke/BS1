#Inlezen in array en als er geen waarde in zit een hash plaatsen

my $i = 0;
while(<>){
    my @values = split(' ', $_);
    foreach $cel (@values){
        if($cel == "..."){
            push @{$cellen[$i]}, {};
        } else {
            push @{$cellen[$i]}, {$cel => ' '};
            # De +0 doe ik hier zodat de strings nummers worden in Perl. Moet niet maar 't is mooier zo
            $inversekandidaten{$cel + 0} = " ";
        }
    }
    $i++;
}
#Aantal getallen vinden: lengte * breedte van de array
my $breedte = scalar @cellen;
my $lengte = scalar @{$cellen[0]};
my $grootte = $breedte * $lengte;

#Overlopen van alle inverse kandidaten om zo de echte kandidaten te weten te komen
for (my $i=1; $i <= $grootte ; $i++) {
   $kandidaten{$i} = " " if !exists $inversekandidaten{$i};
}

foreach $cel (@cellen){
    foreach $element (@{$cel}){
        $element = %kandidaten if scalar keys %{$element} == 0;
    }
}

foreach $cel (@cellen){
    foreach $element (@{$cel}){
        if(scalar keys %{$element} == 0){
            %{$element} = %kandidaten;
        }
        print scalar keys %{$element};
        print " ";
    }
    print "
    ";
}

#Eerste criterium

#Eerste stappen: kijken naar buren
for (my $i=0; $i < $breedte; $i++) {
   for (my $j=0; $j < $lengte; $j++) {
       # Hier bekijk je elk element van de hash waarmee je bezig bent
       foreach $element(keys %{$cellen[$i][$j]}){
           my $eentjeGroterAanwezig = 0;
           my $eentjeKleinerAanwezig = 0;

           #Filteren zodat we niet buiten de array gaan
           if($i+1 < $breedte){
               if (exists %{cellen[$i+1][$j]}{$element+1}){
                   $eentjeGroterAanwezig = 1;
               }
               if (exists %{cellen[$i+1][$j]}{$element-1}){
                   $eentjeKleinerAanwezig = 1;
               }
           }
           if($i - 1 > 0){
               if (exists %{cellen[$i-1][$j]}{$element+1}){
                   $eentjeGroterAanwezig = 1;
               }
               if (exists %{cellen[$i-1][$j]}{$element-1}){
                   $eentjeKleinerAanwezig = 1;
               }
           }

           if($j + 1 < $lengte){
               if (exists %{cellen[$i][$j+1]}{$element+1}){
                   $eentjeGroterAanwezig = 1;
               }
               if (exists %{cellen[$i][$j+1]}{$element-1}){
                   $eentjeKleinerAanwezig = 1;
               }
           }

           if($j - 1 > 0){
               if (exists %{cellen[$i][$j-1]}{$element+1}){
                   $eentjeGroterAanwezig = 1;
               }
               if (exists %{cellen[$i][$j-1]}{$element-1}){
                   $eentjeKleinerAanwezig = 1;
               }
           }
       }
    }
}

