# Je kan ook een scalaire variabele invullen met een referentie naar een scalaire variabele of een scalaire constante. 
# Op welke verschillende manieren ? Hoe kun je via deze referentie de oorspronkelijke waarde aanspreken of wijzigen ?

$data = "Ik ben voorbeelddata";

# Het maken van een pointer naar een scalaire:
$ref = \$data;

# Referentie naar een anonieme scalaire waarde:
$$anon_scalar_ref = 15;

# Referentie naar een constante scalaire:
$const = \15;

# Uitpakken:
print ${$ref} . "\n";
print ${$anon_scalar_ref} . "\n";
print ${$const} . "\n";

# Waarden veranderen
$$ref = 3;
print ${$ref} . "\n";