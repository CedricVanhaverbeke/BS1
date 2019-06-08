# Rond a willekeurig floating-point getal af op een vooropgezet aantal 
# decimale cijfers (na de komma). Dit is ondermeer interessant
# om de uitvoer beter leesbaar te maken, en bij problemen met 
# het testen op gelijkheid (zie vraag 7).

my $vooropgezet = 5;
printf("%.$vooropgezet" . "f", 3.1415926535); #. = concateneeroperator
print "\n";
$rounded =  sprintf("%.2f", 3,145454669);
print $rounded;