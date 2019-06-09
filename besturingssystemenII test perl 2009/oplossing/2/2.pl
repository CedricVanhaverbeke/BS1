# OM TE KUNNEN UITVOEREN: in map '2' zitten!. vraag2.html.bak veranderen naar vraag2.html!


# Naam student: Cedric Vanhaverbeke
#
# Status implementatie: 
#   ��n enkele regular expression voor voetballer gegevens ? 
#        extractie nationaliteit ? 
#        extractie naam speler ? 
#        extractie positie speler ? 
#        extractie ploegidentificatie laatste werkgever ? 
#   ��n enkele regular expression voor club gegevens ? 
#        extractie ploegidentificatie ? 
#        extractie ploegnaam ? 
#        extractie capaciteit stadion ? 
#   conversie nationaliteit naar categorie (eventueel overige categorie) ? 
#   correct aantal voetballers (418) ? 
#   correct aantal rijen na headerlijn (16) ? 
#   correct aantal positiekolommen (4) ? 
#   correct aantal categoriekolommen (5) ? 
#   invulling cellen van eerste rij met positienamen en categorienamen ? 
#   invulling cellen van eerste kolom met ploegnamen ? 
#   sortering rijen op capaciteit stadion ? 
#   positiecellen correct berekend en ingevuld ? 
#   spelers in juiste rij (ploeg) en kolom (categorie) ondergebracht ? 
#   cel in categoriekolom toont lijnen voor alle corresponderende spelers ? 
#   lijnen van cel in categoriekolom gesorteerd op achternaam ? 
#   naam van niet-Belgische spelers aangevuld met nationaliteit ? 
#   correcte HTML-syntax ? 
#
# Eventuele tekortkomingen: 
#

%landcodes = (
    "Belgie"           => {"BEL", undef},
    "Europese Unie"    => {"CSZ", undef, "DEE", undef, "DUI", undef, "FIN", undef, "FRA", undef, "HON", undef, "IER", undef, "ITA", undef, "NED", undef, "POL", undef, "POR", undef, "SLO", undef, "SPA", undef},
    "Europa buiten EU" => {"BOS", undef, "IJS", undef, "KRO", undef, "MAC", undef, "MON", undef, "NOO", undef, "OEK", undef, "RUS", undef, "SER", undef, "ZWI",},
    "Afrika"           => {"ALG", undef, "BUR", undef, "CON", undef, "GAB", undef, "GAM", undef, "GHA", undef, "GUI", undef, "IVO", undef, "KAM", undef, "KEN", undef, "MAL", undef, "MAR", undef, "NIG", undef, "RWA", undef, "SEN", undef, "SIE", undef, "TOG", undef, "ZAF", undef, "ZIM", undef}
             );

@ARGV = "./data/vraag2.xml";

# Read file
while(<>){
    if(/<voetballer.*>/ .. /<\/voetballer>/){
        $voetballer = {} if /<voetballer.*nationaliteit=\".*\">/;
        $voetballer->{nationaliteit} = $1 if (/<voetballer.*nationaliteit=\"(.*)\">/);
        $voetballer->{naam} = $1 if (/<naam>(.*)<\/naam>/);
        $voetballer->{positie} = $1 if (/<positie>(.*)<\/positie>/);
        $voetballer->{clubId} = $1 if (/<werkgever naam=\"(.*)\">.*/);
        push @$voetballers, $voetballer if /<\/voetballer>/;
    }

    if(/<club.*/ .. /<\club>/){
        $club = {} if /<club id=.*/;
        $id = $1 if /.*<club id=\"(.*)\">/;
        $naam = $1, "\n" if /.*<naam>(.*)<.*/;
        $club->{id} = $id; 
        $club->{naam} = $naam if /.*<naam>(.*)<.*/ && !defined $club->{naam};
        $vertalingen->{$id} = $naam if /.*<naam>(.*)<.*/ && !defined $club->{naam};

        $club->{capaciteit} = $1  if /.*<capaciteit>(.*)<.*/;
        push @$clubs, $club if /<\/club>/
    }
}

# Print into HTML table
@ARGV = "./data/vraag2.html";
$^I = ".bak";
while(<>){
    if(/<\/body>/){
        foreach $club (@$clubs){
            print("<tr>\n");
            printf("<td>%s<\/td>\n", $club->{naam});
            #print Dumper grep {$_->{positie} =~ /doelman/i and $_->{clubId} eq $club->{id}} @$voetballers;
            printf("<td>%d<\/td>\n", scalar grep {$_->{positie} =~ /doelman/i and $_->{clubId} eq $club->{id}} @$voetballers);
            printf("<td>%d<\/td>\n", scalar grep {$_->{positie} =~ /verdediger/i and $_->{clubId} eq $club->{id}} @$voetballers);
            printf("<td>%d<\/td>\n", scalar grep {$_->{positie} =~ /middenvelder/i and $_->{clubId} eq $club->{id}} @$voetballers);
            printf("<td>%d<\/td>\n", scalar grep {$_->{positie} =~ /aanvaller/i and $_->{clubId} eq $club->{id}} @$voetballers);
            printf("<td><p>%s<\/p><\/td>\n\n", join "<br>\n", map {"$_->{naam}" } grep {exists $landcodes{"Belgie"}{$_->{nationaliteit}} and $_->{clubId} eq $club->{id}} @$voetballers);
            printf("<td><p>%s<\/p><\/td>\n\n", join "<br>\n", map {"$_->{naam} ($_->{nationaliteit})" } grep {exists $landcodes{"Europese Unie"}{$_->{nationaliteit}} and $_->{clubId} eq $club->{id}} @$voetballers);
            printf("<td><p>%s<\/p><\/td>\n\n", join "<br>\n", map {"$_->{naam} ($_->{nationaliteit})" } grep {exists $landcodes{"Europa buiten EU"}{$_->{nationaliteit}} and $_->{clubId} eq $club->{id}} @$voetballers);
            printf("<td><p>%s<\/p><\/td>\n\n", join "<br>\n", map {"$_->{naam} ($_->{nationaliteit})" } grep {exists $landcodes{"Afrika"}{$_->{nationaliteit}} and $_->{clubId} eq $club->{id}} @$voetballers);
            printf("<td><p>%s<\/p><\/td>\n\n", join "<br>\n", map {"$_->{naam} ($_->{nationaliteit})" } 
                        grep {!exists $landcodes{"Afrika"}{$_->{nationaliteit}} 
                        and !exists $landcodes{"Belgie"}{$_->{nationaliteit}}
                        and !exists $landcodes{"Europa buiten EU"}{$_->{nationaliteit}}
                        and !exists $landcodes{"Europese Unie"}{$_->{nationaliteit}}
                        and  $_->{clubId} eq $club->{id}} @$voetballers);
            print("<\/tr>\n");
        }
    }
    print $_;
}