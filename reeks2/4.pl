#Construeer reguliere expressies die controlleren of een string correct kan geïnterpreteerd als natuurlijk getal, 
#geheel getal, decimaal getal of floating-point getal 
#(met een syntax zoals je die in programmeertalen als C en Java mag hanteren).

$natuurlijkGetal = "1893";
#natuurlijk getal
if($natuurlijkGetal =~ /^\d+$/){
    print "Het getal is een natuurlijk getal\n";
}

$geheelGetal = "-4546";
#Geheel getal: Kan dus ook negatief zijn
if($geheelGetal =~ /^-?\d+$/){
    print "Het getal is een geheel getal\n";
}

#decimaalgetal

# Zie oplossing