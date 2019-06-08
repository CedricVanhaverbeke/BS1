# Bepaal de inverse van een willekeurige, uit woorden samengestelde string:

# Het punt is dat reverse niet afhangt van zijn variabele maar wel van zijn context. 
# dwz door de linkerkant

my $woorden = "ik ben een string met woorden";

# enerzijds door de individuele karakters van elk woord in omgekeerde zin af te lopen (om bijvoorbeeld palindromen te herkennen),
print reverse(split("", $woorden));

print "\n";

# anderzijds door de woorden in omgekeerde zin af te lopen, maar de volgorde van de karakters per woord te behouden.
print join(" ", reverse(split(" ", $woorden)));

