# In reeks 2 vraag 35 werd besproken hoe je een hash kon inverteren. 
# Veralgemeen deze methode, zodat je nu ook toelaat dat de originele hash duplikaten vertoont.

# Strategie: Als de key al bestaat gewoon pushen in een array op de juiste key
my %gewesten=( "Antwerpen"      => "Vlaanderen", "Henegouwen"   => "Wallonie",
          "Limburg"        => "Vlaanderen", "Namen"        => "Wallonie",
          "Oost-Vlaanderen"=> "Vlaanderen", "Luik"         => "Wallonie",
          "Vlaams-Brabant" => "Vlaanderen", "Luxemburg"    => "Wallonie",
          "West-Vlaanderen"=> "Vlaanderen", "Waals-Brabant"=> "Wallonie");

# Juist pushen
while(($key, $value) = each %gewesten){
    #Dit doet alles in 1 lijn. Je zou ook apart alles kunnen opschrijven zoals Joris bij oefening 0 uitlegde
    #Dat is echter useless
    push @{$invertedHash{$value}}, $key; 
}

# Printen
while(($key, $value) = each %invertedHash){
    print $key . ": ";
    print join ',', @{$value};
    print "\n";
}

