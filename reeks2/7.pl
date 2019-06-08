# Verwerk een bestand lijn per lijn, waarbij rekening gehouden wordt met continuation karakters, 
# bijvoorbeeld backslashes op het einde van een lijn, zoals in volgend voorbeeld:

#volgende code is nodig zodat we heel de file in 1 keer kunnen inlezen
local $/;
my $data = <DATA>;


#Met split proberen
#Split de lijnen op een newline die niet voorafgegaan wordt door een spatie en een \. Waarom de \r moet staan is mij een grote vraag
#Dit is het antwoord op die vraag : https://stackoverflow.com/questions/1761051/difference-between-n-and-r
my @lijnen = split m/(?<! \\)\r\n/, $data;

#Vervang alle \ door niets
$_ =~ s/\\//g foreach @lijnen;

#Print eens de eerste of tweede lijn om te testen
print $lijnen[1];



__DATA__
DISTFILES = $(DIST_COMMON) $(SOURCES) $(HEADERS) \
        $(TEXINFOS) $(INFOS) $(MANS) $(DATA)
DEP_DISTFILES = $(DIST_COMMON) $(SOURCES) $(HEADERS) \
        $(TEXINFOS) $(INFO_DEPS) $(MANS) $(DATA) \
        $(EXTRA_DIST)
