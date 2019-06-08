# Gebruik hashes van array's om aan elke index van de hash een lijst van waarden te associëren. 
# Hoe kun je aan de lijst van een specifieke index een waarde toevoegen ? Hoe kun je de volledige lijst van waarden voor elke index tonen ?

# Very short perly way
push @{$hash->{0}}, "Waarde";
print $hash->{0}[0];