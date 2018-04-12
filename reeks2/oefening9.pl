# Verwerk een bestand veld per veld. Je mag veronderstellen dat de 
# velddelimiter kan omschreven worden met behulp van een reguliere expressie.

#Stel de delimeter in in de input seperator
my $delimeter = ":";
local $/ = "$delimeter";

#Lees het bestand in met de seperator. In @fields[0] staat nu Veld1:
my @fields = <DATA>;

#Verwijder alle dubbelpunten uit @fields
$_ =~ s/://g foreach @fields;


#Geeft nu Veld1
print $fields[0];



__DATA__
Veld1:Veld2:Veld3:Veld4
