# Hoe kan in een string, die bijvoorbeeld het resultaat is van gebruikersinput of van inlezen vanuit een bestand, 4
# een deelstring voorafgegaan door een $-teken vervangen worden door de inhoud van de variabele met die naam ?

#Lees van standaard invoer
#Typ nu bv hallo ik ben $name in standaard invoer.
$data = <>;
$name = "Cedric";

$data =~ s/\$\w+/$name/;

print $data;