#Opgave:
#Verzameling 1-25
#Je krijgt een deelverzameling van deze verzameling.

#Vraag: geef mij van alle getallen die niet tot de deelverzameling behoren het getal uit de deelverzameling die het dichtst bij hen ligt.

#Dichtste getal: alle getallen sorteren met criterium vanaf het punt waar je hem van beschouwt

@S=(16,13,5,12,9,1,21,15);

# Zet alle waarden van 1 tot 25 in de hash met als waarde undefined
%H = map {$_, undef} (1..25);


#Verwijder alle waarden van de array S uit de hash H.
delete @H{@S};

#voor elk element in de hash ga je opnieuw een deelverzameling maken die gaat sorteren op afstand tussen de twee getallen.
#Nu zoek je de kortste afstand voor elke key
for $h (keys %H){
    # Neem het eerste element van de array gesorteerd op absolute waarde met de $h
    ($H{$h}) = sort {abs($h-$a) <=> abs($h-$b) or $a <=> $b} @S;
}

print map {"$_:\t$H{$_}\n"} sort {$a <=> $b} keys %H;