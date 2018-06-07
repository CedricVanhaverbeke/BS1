# Verwerk een bestand veld per veld. Je mag veronderstellen dat de 
# velddelimiter kan omschreven worden met behulp van een reguliere expressie.


# Zorgt ervoor dat er geen input seperation is
local $/ = undef;

#Lees het bestand in met de seperator. In @fields[0] staat nu Veld1:
$data = <DATA>;
@array = split(/\/\/\+/, $data);

print $array[2];

__DATA__
Ik ben een veld //+ Ik ben een nieuw veld //+ Ik ben opnieuw een nieuw veld
Ik ben nog altijd hetzelfde veld als de vorige



Ik ben nog altijd hetzelfde veld //+
Ik niet meer
