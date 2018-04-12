# Verwerk de elementen van een hash in een gesorteerde volgorde

#hetzij alfabetisch of numeriek gesorteerd op de indices,

%A = (1,2,3,4,5,6,7,8,9,10);

foreach $key (sort {$a <=> $b} keys %A){
    print "$key => " . %A{$key} . "\n";
}

#hetzij alfabetisch op de waarden

foreach $value (sort values %A){
    my ($key) = grep{ $A{$_} eq $value } keys %A;
    print "$key => $value \n"; 
}

#of numeriek gesorteerd op de waarden

foreach $value (sort {$a <=> $b} values %A){
    my ($key) = grep{ $A{$_} eq $value } keys %A;
    print "$key => $value \n"; 
}