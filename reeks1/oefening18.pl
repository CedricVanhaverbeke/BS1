#Gebruik de meest efficiënte manier om de grootte van een array te wijzigen. 
#Deze methode is vooral interessant om:
#- een op de waarde van de elementen gesorteerde array te 
#beknotten tot een beperkt aantal elementen,
#- een array in grote blokken ineens te laten groeien, eerder dan bij het pushen 
#van elke aanvullend element telkens één nieuw geheugenelement te alloceren.

@array = (1,2,3);
print "Arraygrootte is $#array \n";
$#array *= 2;
print "Arraygrootte is $#array \n";