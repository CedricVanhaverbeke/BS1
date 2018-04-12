#Verwerk een string karakter per karakter. Pas dit toe om:

#een gesorteerde lijst uit te printen van alle karakters die minstens éénmaal in een string voorkomen.
my $string = "Ik ben een teststring";
my @outputlist;


#Je had hier ook even goed split('', $string) kunnen schrijven
foreach my $char(split // ,$string){
    #In list zitten nu alle matches $1,$2,$3, ...
    my @list = $string =~ $char;

    #Als de teller van de lijst groter is dan 0 komen ze minimaal 1 keer voor
    if(scalar @list != 0){
        push @outputlist , $char;
    }
}

print sort @outputlist;

#van een bestand elk karakter individueel naar standaard uitvoer weg te schrijven, met telkens een kleine tussenpause ertussen.
#Maak hierbij gebruik van de select functie om de pauzes te genereren. Stel ook $| in op 1, om de output niet te laten bufferen.

#Regelt buffering bij schrijven: meer in info hier: https://stackoverflow.com/questions/6303515/perl-1-what-is-this
$|= 1;

#Dit stelt in dat de seperator altijd 1 byte groot moet zijn. Dus 1 karakter
$/ = "\1";

#Andere mogelijkheid zou zijn om de lijnen allemaal in te lezen en daarna ze te splitten
#Vond het zo makkelijker
print "\n";
my @karakters = <DATA>;
foreach my $char(@karakters){
    #Wacht 25 ms
    select(undef, undef, undef, 0.25);
    print $char;
}

__DATA__
Hallo
Ik 
Ben
een
Tekst

En ik ben een nieuwe paragraaf
