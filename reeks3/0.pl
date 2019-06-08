use Data::Dumper;

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


# Voor elk sleutelwaardepaar in provincies
while(($stad, $provincie) = each %provincies){
    $gewest = $gewesten{$provincie};
    # print "$stad<$provincie<$gewest\n"; Bekijk deze output eens

    #Maakt een pointer die wijst naar een lege hash. De unless staat er zodat er slechts 1 keer een key wordt gemaakt. Deze lijn moet er zelfs niet staan :)
    #$steden{$gewest} = {} unless %steden{$gewest};

    #Maakt een pointer die wijst naar een array. Deze lijn moet er zelfs niet staan :) Perl doet dat allemaal voor u
    #$steden{$gewest}{$provincie} = [] unless $steden{$gewest}{$provincie};

    #Pak de array uit met {} en vergeet ook de @ niet! Push daarna hierin de stad. Het pijltje tussen $gewest & $provincie moet er niet staan.
    push @{$steden{$gewest}->{$provincie}}, $stad;

}

# Print alle steden die horen bij het gewest Vlaanderen & de provincie Oost-Vlaanderen
print $_ . "\n" foreach  @{$steden{"Vlaanderen"}{"Oost-Vlaanderen"}};