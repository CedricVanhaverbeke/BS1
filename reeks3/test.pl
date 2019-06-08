$var="Ik ben lelijk";
@woorden = split ' ', $var;

@woorden = map { s/Ik/Jij/; $_} @woorden;

print join " ,", @woorden;