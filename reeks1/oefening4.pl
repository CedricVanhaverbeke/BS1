# Bepaal de inverse van een willekeurige, uit woorden samengestelde string:

# Het punt is dus dat reverse enkel kan gebruikt worden op een lijst.

my $woorden = "ik ben een string met woorden";

# enerzijds door de individuele karakters van elk woord in omgekeerde zin af te lopen (om bijvoorbeeld palindromen te herkennen)
my @apartewoorden = split(' ', $woorden);

print reverse split " ", $woorden;
print "\n";


foreach (@apartewoorden){
    my $reversed = reverse($_);
    print "$reversed ";
}

print "\n";

# anderzijds door de woorden in omgekeerde zin af te lopen, maar de volgorde van de karakters per woord te behouden.

$revwords = join(" ", reverse(@apartewoorden));
print $revwords;

