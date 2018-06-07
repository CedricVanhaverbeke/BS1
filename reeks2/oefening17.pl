# Gebruik de range operatoren, .. en ..., om van een bestand, dat je nu opnieuw lijn per lijn inleest, 
# alle tekst te filteren die zich tussen twee specifieke kodes bevindt. Deze kodes kunnen meerdere keren
#  in het bestand optreden. Pas deze methode eveneens toe om lijnen met lijnnummers in een specifiek interval te filteren.

while(<>){
    #inclusief de begin & eindes
    if (/begincode/ .. /eindcode/) {
        print $_;
    }

    #print lijn 2 tot 4
     if (2 .. 4) {
        print $_;
     }

    #print alles tussen begin & eindcode, ook over meerdere lijnen verspreid. de grenzen zijn inbegrepen.
    if(/begincode/ ... /eindcode/){
        print $_;
    }


}