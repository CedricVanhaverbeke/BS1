# https://i.imgur.com/zYSE3jO.png : regex modifiers
# https://regex101.com/ : regex tester 


$var = "Ik ben een beetje u y data";

#Eerste manier om regexen in perl te gebruiken:

#hak de variabele in stukken met split, met een reguliere expressie tussen //
@t = split /[uy]+/,$var;

print join "
", split /[uy]+/,$var;


#ronde haakjes geeft ook de delimeter terug
print join "
", split /([uy]+)/,$var; 

#Split heeft nog twee andere codes. Dit is niet gewoon een whitespace, wel een 'code' om voorafgaande whitespace en nakomende ook weglaat ;)
print join "
", split " ",$var;

#split op elke letter:
print join "
", split "",$var;

#Tweede manier om regexen te gebruiken
#Op examen: we krijgen een figuur (soort sudoku) met in verschillende cellen wat waarden, wij moeten gaan zoeken waar de getallen staan
#De lijnen die we nodig hebben zien eruit zoals in __DATA__
print "\n\n";
print "TWEEDE MANIER \n";
print "----------------------------------------\n";

#while lus schrijven om data in te lezen
#Zoek eens op wat die m betekent.
#Je hoeft geen slashes gebruiken, je kan daar bv ook () zetten maar de slashes zijn makkelijk omdat je dan de 'm' mag weglaten
#Dit is de eerste stap uit elk examen
#Ronde haken duiden dat je groepen kunt gebruiken in Perl.
while (<DATA>) {
    chomp;
    if($_ =~ m/<text x="(\d+)" y="(\d+)", style="font-size: 300%">(\d+)<\/text>/) {
        print "$1,$2 en $3\n";
    }
}

#Je kan hem ook anders parsen:
while (<DATA>) {
    chomp;
    ($x, $y, $z) =~/<text x="(\d+)" y="(\d+)", style="font-size: 300%">(\d+)<\/text>/;
        print "$x,$y en $z\n" if defined $z; #Als het defined is, print hem
    }

#Opties voor regexen:
# m//ixmsgc
# i = case insensitive
# x = commentaar maken in regex: alle whitespace wordt genegeerd & commentaar kan je maken met #
# m = 
# s = Als je bv een string krijgt die uit meerdere tekens bestaat. De s zorgt ervoor dat een nieuwe lijn bij de regex hoort 

# Als je meerdere lijnen wilt testen kan je g gebruiken


__DATA__

<text x="450" y="685", style="font-size: 300%">1</text>