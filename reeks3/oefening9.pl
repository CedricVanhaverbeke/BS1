# Stel een nieuwe hash samen op basis van meerdere bestaande hashes. Hou, in tegenstelling tot reeks 2 vraag 37, 
# nu wel rekening met indices die in meerdere originele hashes voorkomen. Probeer ook het herhalen van de while-lus, 
# voor elk van de hashes, van de oorspronkelijke oplossing te vermijden.

# Strategie: Steek alles in refs

%eerste = ( "Cedric"    =>  "Vanhaverbeke",
            "Joris"     =>  "Moireau",
            "Simon"     =>  "De Gheselle"
                                    );
%tweede = ( "Cedric"    =>  "Pollie",
            "Joris"     =>  "Janssens",
            "Simon"     =>  "De Bruycker"
                                    );

# Verplicht hier om de lijst mee te geven als scalairen. Je geeft eigenlijk een lijst mee van scalairen door de (..)
foreach $ref (\%eerste, \%tweede){
    while(($key, $value) = each %$ref){
        push @{$output{$key}}, $value;
    }
}

# Printen
while(($key, $value) = each %output){
    print $key . ": ";
    print join ',', @{$value};
    print "\n";
}