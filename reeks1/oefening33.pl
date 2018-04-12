# Op welke manieren kun je elk index-waarde paar van een hash element per element verwerken ? 
# Hou er rekening mee dat verwerken in gesorteerde volgorde al dan niet gewenst is.
%A = (1,2,3,4,5,6,7,8,9,10);

#niet gesorteerd overlopen
foreach $key (keys %A){
    print "$key \n";
}

#gesorteerd overlopen
foreach $key (sort{$a <=> $b} keys %A){
    print "$key \n";
}

#Wellicht nog andere manieren maar dat boeit niet zo