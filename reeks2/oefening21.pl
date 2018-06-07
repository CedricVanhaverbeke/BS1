# Lees opnieuw een tekstbestand paragraaf per paragraaf in. Filter met behulp van een reguliere expressie alle tekst 
# die zich tussen twee specifieke kodes, bijvoorbeeld START en END, die zich aan het begin van een lijn bevinden. 
# Deze kodes kunnen meerdere keren in elke paragraaf optreden.

$/ = "";

while(<DATA>){
    if($_ =~ s/\G.*START(.*)END/\1/gms){
        print $_;
    }
}


__DATA__
START dit is de start van de tekst moehahahaha END
Ignore this part: Anouk is een lekker wijf
START
This is 
a message
from Joris the almachtige
END

START nieuwe paragraaf
lol
END START test
END