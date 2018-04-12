#__DATA__, alles wat onder deze tekst komt wordt beschouwd als een file in Perl

#<> Diamond operator

#vb:


$regel = <DATA>;
print $regel; #Dit print de eerste regel van het bestand

$regel = <DATA>;
print $regel;

#Meestal in een while-lus
while(<DATA>){
    chomp; #Wordt uitgevoerd op de $_ variabele, verwijdert lijnscheidingsteken
    print $_; #Standaard manier om te printen
}

my @tekst = <DATA>; #Nu zit elke lijn in een bestand
print @tekst[0]; #eerste
print @tekst[-1]; #laatste
print 0 + @tekst; #print scalaire waarde, dus aantal lijnen
print scalar @tekst; #Doet dit ook

print $#tekst; #print laatste lijn af van de tabel

$/=""; #Nu is de scheidingsoperator de lege lijn geworden. Nu worden dus de paragrafen ingelezen

#Teruggaan naar de originele modus: $/ bijhouden en dan zo terugzetten.

undef $/; #Nu is de scheidingsoperator weg. Dus wordt heel het bestand in 1 keer ingelezen. Handig als je je bestand in 1 string wilt.

#---------------------------------------------------------------
#Als je wilt verwijderen uit een tabel -> omgekeerd sorteren en dan splice();
print "\n";
@tabel = (5,6,9,2,3,1);

print sort @tabel;
print grep{length($_) >= 1} @tabel; #zoek lengte van de lijn groter dan 1;
print "\n";
print grep{length($_) >= 1} map {chomp;$_} @tabel

#print join "
#", grep{$x=$y;$y=length($_);$y<$x && $y} map {chomp; $_} @array;


#EXAMEN: ARGV ergens in opslaan while <> dan die ARGV weer ergens opnieuw gebruiken

#---------------------------------------------------------------------------
print sort {$a cmp $b}  @tabel; #standaardsorteermethode
print sort {length($a) cmp length($b)}; #alfabetische operator cmp!!
print sort {length($a) <=> length($b)}; #numerieke vgl voor het sorteren

__DATA__
Dit is een bestand
Tekst 
Derde regel
Vierde regel