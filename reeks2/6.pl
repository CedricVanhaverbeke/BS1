use Data::Dumper;
#Verwerk een string karakter per karakter. Pas dit toe om:

#een gesorteerde lijst uit te printen van alle karakters die minstens éénmaal in een string voorkomen.
my $string = "Ik ben een teststring";
my %voorkomens = ();

# \S == geen whitespace
$voorkomens{$_} += 1 foreach grep {/\S/} split("", $string);
print Dumper \%voorkomens;

#van een bestand elk karakter individueel naar standaard uitvoer weg te schrijven, met telkens een kleine tussenpause ertussen.
#Maak hierbij gebruik van de select functie om de pauzes te genereren. Stel ook $| in op 1, om de output niet te laten bufferen.

#Regelt buffering bij schrijven: meer in info hier: https://stackoverflow.com/questions/6303515/perl-1-what-is-this
$|= 1;

#Dit stelt in dat de seperator altijd 1 byte groot moet zijn. Dus 1 karakter
local $/;

#Andere mogelijkheid zou zijn om de lijnen allemaal in te lezen en daarna ze te splitten
#Vond het zo makkelijker
print "\n";
my @karakters = <DATA>;
foreach my $char(@karakters){

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
