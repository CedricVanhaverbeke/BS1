
#Verwerk een bestand in omgekeerde zin:
#hetzij lijn per lijn,
@regels = <DATA>;
while($regel = pop @regels){
    print $regel;
}




#hetzij paragraaf per paragraaf.

$/ = "";
@regels = <DATA>;
while($regel = pop @regels){
    print $regel;
}

__DATA__
Hallo
Ik 
Ben
een
Tekst

En ik ben een nieuwe paragraaf
