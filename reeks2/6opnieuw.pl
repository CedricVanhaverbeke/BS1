#Verwerk een string karakter per karakter. Pas dit toe om:

#1. een gesorteerde lijst uit te printen van alle karakters die minstens éénmaal in een string voorkomen.

print "EERSTE DEEL: ";

my $string = "Hallo ik ben een string die gebruikt wordt voor 
oefening 6";

#Split eerst op spaties en daarna op karakter.
my @lijst = split "", join "", (split " ",  $string);

#print de gesorteerde lijst


#Gebruik maken van een hash om enkele karakters van alles te maken
my %hash = ();


@hash{$_} = 1 for @lijst;
my @output =  keys %hash;
print sort { "\L$a" cmp "\L$b" } @output;

print "\nTWEEDE DEEL: ";


#2. van een bestand elk karakter individueel naar standaard uitvoer weg te schrijven, 
#   met telkens een kleine tussenpause ertussen. Maak hierbij gebruik van de select 
#   functie om de pauzes te genereren. Stel ook $| in op 1, om de output niet te laten bufferen.

#Regelt buffering bij schrijven: meer in info hier: https://stackoverflow.com/questions/6303515/perl-1-what-is-this
$|= 1;
local $/;
my $data = <DATA>;
my @lijst2 = split "", join "", (split " ",  $string);

my %hash2 = ();
@hash2{$_} = 1 for @lijst2;
my @output2 =  keys %hash2;

foreach $char(sort { "\L$a" cmp "\L$b" } @output2){
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
