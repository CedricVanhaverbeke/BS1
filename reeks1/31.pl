#Met welke twee functies kun je nagaan of een specifieke waarde optreedt als index in een hash ?

#Met exists of defined

%A = (1,2,3,4,5,6,7,8,9,10);
#Een hash initialiseren op deze manier werkt zo:   %hash = ( 'key1', 'value1', 'key2', 'value2', 'key3', 'value3' );

if(exists  $A{2}){ #Key doesn't exist want het is een value
    print "Key exists \n";
} else {
    print "Key doesn't exist \n"; 
}

if(defined $A{1}){
    print "Key exists";
}