#Inlezen in array en als er geen waarde in zit een hash plaatsen

my $i = 0;
while(<>){
    my @values = split(' ', $_);
    foreach $cel (@values){
        if($cel == "..."){
            push @{$cellen[$i]}, {};
        } else {
            push @{$cellen[$i]}, {$cel => ' '};
            $inversekandidaten{$cel + 0} = " ";
        }
    }
    $i++;
}
#Aantal getallen vinden: lengte * breedte van de array
my $grootte = scalar @{$cellen[0]} * scalar @cellen;

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