# Hoe kun je een variabele instellen met een default waarde, enkel op voorwaarde dat die variabele op dat ogenblik geen waarde heeft ?


$c = "Test"; 

$a = $b || $c;
print $a;