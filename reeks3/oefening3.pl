# Gebruik hashes van array's om aan elke index van de hash een lijst van waarden te associëren. 
# Hoe kun je aan de lijst van een specifieke index een waarde toevoegen ? Hoe kun je de volledige lijst van waarden voor elke index tonen ?

my %hash;

#Voeg aan de hash een lege array toe, eigenlijk moet dit zelfs niet.
foreach $i (0..10){
    $hash{$i} = [];
}

push @{%hash{0}}, "Test";
print %hash{0}->[0]