# Schrijf het skelet van een filterprogramma. Indien op de opdrachtlijn parameters worden meegegeven,
# dan moeten deze beschouwd worden als de namen van de inputbestanden. 
# Indien er geen parameters zijn, dan moet het programma zijn invoer van de standaard invoer 
# halen. Een parameter "-" duidt aan dat de standaard invoer als één van de inputkanalen 
# moet verwerkt worden. Een parameter van de vorm "opdracht |" laat toe om de uitvoer van een ander programma als invoer te beschouwen.
#GEBRUIK DE DIAMOND OPDRACHT


while(<>){
    print $_;
}

if(grep{/^-$/}  @ARGV){
    while(<>){
        print $_;
    }
}
