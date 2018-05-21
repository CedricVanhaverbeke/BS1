#Inlezen in array en als er geen waarde in zit een hash plaatsen

@ARG_COPY = @ARGV;

my $i = 0;
while(<>){
    my @values = split(' ', $_);
    foreach $cel (@values){
        if($cel == "..."){
            push @{$cellen[$i]}, {};
        } else {
            push @{$cellen[$i]}, {int($cel) => ' '};
            $inversekandidaten{int($cel)} = " ";
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
            #Deze lijn geeft een kopie mee van de kandidaten. Dit is nodig aangezien je niet wilt dat de referentie
            #naar de kandidaten overal inzit. Als je verder in het programma de lijst aanpast ga je dan zien dat het 
            #mislukt.
            $element = {%kandidaten};
        }
    }
}

#Eerste criterium

# We gaan nu zoeken naar voor elk element in de hash waarmee we bezig zijn of zijn buren zowel een getal
# Groter en kleiner dan hem bevat. Als dit het geval is mag het cijfer blijven staan, anders niet.
# We blijven dit herhalen tot er geen changes meer zijn om uit te voeren.

$stop = 0;
while($stop < 4){
    

    $aantalChanges = -1;
    while($aantalChanges != 0){
        $aantalChanges = 0;
        for (my $i=0; $i < $lengte; $i++) {
            for (my $j=0; $j < $breedte; $j++) {

            # Gaat alle elementen uit de hash overlopen waarmee we bezig zijn
            foreach $element(keys %{$cellen[$i][$j]}){

                    # Deze twee veriabelen gaan kijken of er een element groter en kleiner aanwezig is in de lijst.
                    $eentjeGroterAanwezig = 0;
                    $eentjeKleinerAanwezig = 0;
                

                    #Deze ifs zorgen ervoor dat we niet buiten de lijst gaan
                if($j+1 < $breedte){
                    if(exists ${$cellen[$i][$j+1]}{$element+1}){
                        $eentjeGroterAanwezig = 1;
                    }
                    if(exists ${$cellen[$i][$j+1]}{$element-1}){
                        $eentjeKleinerAanwezig = 1;
                    }
                }

                    if($j - 1 >= 0){
                    if (exists ${$cellen[$i][$j-1]}{$element+1}){
                        $eentjeGroterAanwezig = 1;
                    }
                    if (exists ${$cellen[$i][$j-1]}{$element-1}){
                        $eentjeKleinerAanwezig = 1;
                    }
                }

                if($i + 1 < $lengte){
                    if (exists ${$cellen[$i+1][$j]}{$element+1}){
                        $eentjeGroterAanwezig = 1;
                    }
                    if (exists ${$cellen[$i+1][$j]}{$element-1}){
                        $eentjeKleinerAanwezig = 1;
                    }
                }

                if($i - 1 >= 0){
                    if (exists ${$cellen[$i-1][$j]}{$element+1}){
                        $eentjeGroterAanwezig = 1;
                    }
                    if (exists ${$cellen[$i-1][$j]}{$element-1}){
                        $eentjeKleinerAanwezig = 1;
                    }
                }
                    
                    #Verwijder de cel als er zowel een grotere als kleinere in de buren zit.
                    #Bug? Niet verwijderen als er maar 1 element meer inzit.
                    if($eentjeGroterAanwezig == 0 || $eentjeKleinerAanwezig == 0){
                        if(scalar keys %{$cellen[$i][$j]} != 1){
                            delete $cellen[$i][$j]->{$element};   
                            $aantalChanges++; 
                        }
                    }
                }
            }
        }
    }


    #Tweede criterium
    # Overloop alles om de elementen te vinden die als enige waarden in de array staan
    for (my $i=0; $i < $lengte; $i++) {
        for (my $j=0; $j < $breedte; $j++) {
            foreach $element(keys %{$cellen[$i][$j]}){
                push @singuliereElementen, $element if scalar keys %{$cellen[$i][$j]} == 1;
            }
        }
    }

    for (my $i=0; $i < $lengte; $i++) {
   for (my $j=0; $j < $breedte; $j++) {
       foreach (@singuliereElementen){
           delete $cellen[$i][$j]->{$_} if scalar keys %{$cellen[$i][$j]} != 1;
       }
   }
}

    $stop++;
}



print "
   ";

for $i (0..$lengte-1) {
   for $j(0..$breedte-1) {
       while(($key) = each %{$cellen[$i][$j]}){
           printf "%3s", $key;
       }
   }
   print "
   ";
}

   #Deze print alle cellen met zijn mogelijkheden uit.
    #for (my $i=0; $i < $breedte; $i++){
    #    for (my $j=0; $j < $lengte; $j++) {
    #        print "
    #        ";
    #        print "$i.$j= ";
    #        print join " ", sort {$a <=> $b} keys %{$cellen[$i][$j]};
    #        print "
    #        ";
    #    }
    #}

@ARGV = @ARG_COPY;
$^I = ".opgave";

if(<>){
    for $i (0..$lengte-1) {
        for $j(0..$breedte-1) {
            while(($key) = each %{$cellen[$i][$j]}){
                printf "%3s", $key;
            }
        }
        print "
        ";
    }
}



#Derde criterium








