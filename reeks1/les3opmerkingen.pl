# Hashes & tabellen
# Zorg dat je begrijpt wanneer je hashes nodig hebt en wanneer je tabellen nodig hebt.

# https://perlmaven.com/perl-hashes

#voorbeeldjes:

#twee tabellen met randomwaardes:
my @x = (5,4,6,8,9,4,12,12,13,48,45,63);
my @y = (8,4,6,8,9,4,12,15,13,19,11,63);

# welke zijn de uniek voorkomende waardes? Hash gebruiken:
my %A;
$A{$_} = undef for @x; #Want slechts 1 waarde: zorgt ervoor dat operator scalair is.

#Ik ben niet geïnteresseerd in de waarde die in de hash zit. We willen weten hoeveel uniek voorkomen. Dus de dubbels worden eruit gefilterd.

keys %A; #returnt de verzameling van alle elementen. Let op: er is geen sorteervolgorde. Zoals in Java ;)

print join "
", sort {$a <=> $b} keys %A;
print "\n";

@A{@X} = (); #Alle elementen in X creeëren. Dit doet juist hetzelfde als hierboven.
print join "
", sort {$a <=> $b} keys %A;

print "\n";

print join "
", keys %A;

#Geef mij alle elementen die in X voorkomen maar niet in Y
delete @A{@y};

#----------------------------------------------
@B{$_}|= 1 for @X;
@B{$_}|= 2 for @Y;

print join "
", sort {$a <=> $b} grep {$A{$_}==3} keys %A; #Neemt elementen die zowel in X als Y voorkomen. Want bit is op 3 gezet. Enkel 1 zou alle elementen uit X zijn enz.
print "\n";

#Alle elementen die niet in A zitten
@B{1..20} = ();
delete @B{keys %A};