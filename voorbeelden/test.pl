# Dit is nog eens oefening 0.

%gewesten=( "Antwerpen"      => "Vlaanderen", "Henegouwen"   => "Wallonie",
          "Limburg"        => "Vlaanderen", "Namen"        => "Wallonie",
          "Oost-Vlaanderen"=> "Vlaanderen", "Luik"         => "Wallonie",
          "Vlaams-Brabant" => "Vlaanderen", "Luxemburg"    => "Wallonie",
          "West-Vlaanderen"=> "Vlaanderen", "Waals-Brabant"=> "Wallonie");

%provincies=( "Aalst"       => "Oost-Vlaanderen", "Brugge"  => "West-Vlaanderen",
             "Dendermonde" => "Oost-Vlaanderen", "Ieper"   => "West-Vlaanderen",
             "Eeklo"       => "Oost-Vlaanderen", "Oostende"=> "West-Vlaanderen",
             "Oudenaarde"  => "Oost-Vlaanderen", "Kortrijk"=> "West-Vlaanderen",
             "Sint-Niklaas"=> "Oost-Vlaanderen", "Gent"    => "Oost-Vlaanderen",
             "Halle"       => "Vlaams-Brabant" , "Genk"    => "Limburg"        ,
             "Leuven"      => "Vlaams-Brabant" , "Hasselt" => "Limburg"        ,
             "Vilvoorde"   => "Vlaams-Brabant" , "Tongeren"=> "Limburg"        );

while(($key, $value) = each(%provincies)){
    push @{$steden{$gewesten{$value}}{$value}}, $key; 
}

print join ", ", @{$steden{"Vlaanderen"}{"Oost-Vlaanderen"}};

# Een voorbeeld van Demian. Stel dat we deze hash zouden willen inverteren
# De x staat hier voor een herhaling van de elementen

%landen=(
    "Europese Unie" => ["Belgie", "Frankrijk", "Duitsland"],
    "Azië" => ["Thailand", "India"]
);
print "\n";

@inverted{@{$landen{$_}}} = ($_) x scalar @{$landen{$_}} foreach keys %landen;

while(($key, $value) = each(%inverted)){
    print "$key, $value\n";
}




