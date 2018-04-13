# Hoe kun je in een hash meerdere waarden per index opslaan ?

# Door in de value van een key in een hash een referentie naar een array op te slaan.

# Eens testen, kan je daar ook gewoon een array in steken?
my %hash;
$hash{Test} = (1,2,3,4,5);
print $hash{Test};
# Nee dus, je kan enkel scalairen in een hash opslaan.

#Dit is de juiste manier:
$hash{Test} = [1,2,3,4,5];
print @{$hash{Test}};
