# Gebruik een reguliere expressie om een string in woorden te parsen.

$string = "Ik ben een teststring die in woorden wordt gekapt
en sta zelfs op een andere lijn";
my @array = split(" ", $string);
print join ", ", @array;