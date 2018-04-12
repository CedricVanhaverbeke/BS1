# Bepaal datum and tijd van een tijdstip in het verleden of de toekomst.

# We nemen een tijdstip in het verleden
my $mytime = time - 100000;

# Gebruik er de localtime functie op en haal er hetzelfde uit als in de vorige oefening
    ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) =
                                                localtime($mytime);

# Opnieuw niet vergeten dat een jaar vanaf 1900 telt.
$year += 1900;
print "$mday, $mon, $year, $hour:$min:$sec";