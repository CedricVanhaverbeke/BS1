#Inverteer een hash: construeer een hash met als indices de waarden van de originele hash,
# en als waarden de corresponderende indices. Je mag er in deze vraag veronderstellen 
#dat ook de waarden van de originele hash geen duplikaten vertonen. 
#Dat probleem zal pas in reeks 4 vraag 9 aangepakt worden.

%A = (1,2,3,4,5,6,7,8,9,10);

for $key (keys %A){
    $value = %A{$key};
    $A{$value} = $key ;
    delete $A{$key};
}

foreach $key (keys %A){
    print "$key => " . $A{$key} . "\n";
}