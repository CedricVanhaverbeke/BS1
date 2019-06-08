# Hoe kun je op een string meerdere reguliere expressies toepassen, waarbij elke volgende 
# reguliere expressie pas begint te werken na de deelstring die aan de vorige reguliere expressie voldoet ?

# In het kort werkt de oplossing zo:
# c modifier: houdt de positie van je vorige regex bij, als je nog eens regext begint het dus vanaf die positie
# \G : is de positie van de vorige regex die gematched was.
# g modifier: volledig de regex

my $string = "50 4 850 99 6 60";

# Je kan de g modifier op deze manier gebruiken
# Zonder g blijft de loop heel de tijd gaan
#while($string =~ /(\d+)/g){
#    print $1 . "\n";
#}

# Je kan nu echter ook de \G gebruiken om te wijzen op de positie van de vorige regex op deze manier:
#my $string = "123,4,8,99,6,50,60";


#while($string =~ /\G,?(\d+)/g){
#    print $1 . "\n";
#}

# Wanneer de regex faalt zal deze \G vlag terug ingesteld worden op het begin. Door gebruik te maken
# van de c modifier zal hij dit niet doen. Dus kan je vanaf de positie die je wilt verder regexen :)
#my $string = "Dit is een andere reeks woorden 123 4 8 Ik ben cedric";

#while ($string =~ /(\d+)/gc) {
#    print "Found number $1\n";
#}

# Hier blijft de positie dus behouden na de 8. Enkel de woorden "Ik ben Cedric" worden ingelezen
# Mocht je de c wegdoen zou de positie niet bijgehouden worden

#while($string =~ /(\w+)/g) {
#    print "Found word: $1 \n";
#}

# De oplossing van deze oefening is dus om de g vlag te gebruiken en daarna de G vlag te gebruiken op volgende manier
$string =~ /8/g;

# 8 zit nu opgeslagen in de position variabele of zelfs de G vlag op volgende manier
$string =~ s/\G50/69/g;
print $string;

# De 50 die meteen volgt op de 8 is dus veranderd naar 69 terwijl de andere niet
