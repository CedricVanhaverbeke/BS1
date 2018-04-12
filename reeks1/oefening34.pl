# Hoe kun je de inhoud van een hash tonen, waarbij een duidelijk onderscheid gemaakt 
# wordt tussen de indices en hun corresponderende waarden. 
# Eenvoudige pogingen zoals print"%hash" of print %hash blijken niet te voldoen.

%A = (1,2,3,4,5,6,7,8,9,10);

foreach $key (keys %A){
    print "$key => " . $A{$key} . "\n";
}

foreach ($key,$value) (keys %A){
    print "$key => $value";
}

