%gewest = ("Antwerpen" => "Vlaanderen");
%provincies = ("Aalst" => "Oost-Vlaanderen")

%steden =();

while(($stad, $provincie) each %provincies){
    %gewest = $gewest{$provincie};
    print "$stad<$provincie<$gewest\n";
    %steden{$gewest} = {} unless $steden{$gewest}; #Enkel initialiseren als dit nog niet bestaat
    ${$steden{$gewest}}{$provincie} = [] unless ${$steden{$gewest}{$provincie}} #Enkel initialiseren als dit nog niet bestaat
    push @{${$steden{$gewest}}{$provincie}}, $stad;

    print $_ foreach  @{${$steden{$gewest}}{$provincie}};
}

#Afkortingen in Perl

#1. ontpointen en tegelijk een waarde in de ontpointe de hash steken:
$steden{$gewest}->{$provincie}

# Kan je ook met een array doen enzo

#2. Een pijlke tussen twee opeenvolgende indices mag je gewoon weglaten. Let op! Enkel bij opeenvolgende.
#   Zien als een tweedimensionale tabel dus

#3. Eerst initialiseren moet eigenlijk niet. Vanaf je erin pusht zal Perl dat doen voor jou :)

# Heel de ivertering gebeurt dan in 1 lijn

while(($stad, $provincie) each %provincies){
    push @{$steden{$gewest{$provincie}}}{$provincie} , $stad;
}