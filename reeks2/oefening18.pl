# Hoe kun je op een string meerdere reguliere expressies toepassen, waarbij elke volgende 
# reguliere expressie pas begint te werken na de deelstring die aan de vorige reguliere expressie voldoet ?

my $string = "123 4 8 99 6 50 60";

# Je kan de g modifier op deze manier gebruiken
while($string =~ /(\d+)/g){
    print $1 . "\n";
}

# Je kan nu echter ook de \G gebruiken om te wijzen op de positie van de vorige regex op deze manier:
my $string = "123,4,8,99,6,50,60";

# Je kan de g modifier op deze manier gebruiken
while($string =~ /\G,?(\d+)/g){
    print $1 . "\n";
}

# Wanneer de regex faalt zal deze \G vlag terug ingesteld worden op het begin. Door gebruik te maken
# van de c modifier zal hij dit niet doen. Dus kan je vanaf de positie die je wilt verder regexen :)
my $string = "Dit is een andere reeks woorden 123 4 8 Ik ben cedric";

while ($string =~ /(\d+)/gc) {
    print "Found number $1\n";
}

# Hier blijft de positie dus behouden na de 8. Enkel de woorden "Ik ben Cedric" worden ingelezen
# Mocht je de c wegdoen zou de positie niet bijgehouden worden

while($string =~ /(\w+)/g) {
    print "Found word: $1 \n";
}
