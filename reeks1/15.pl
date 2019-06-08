# Bereken het aantal dagen verschil tussen twee tijdstippen.

$eersteTijdstip = time - 1000000;
$tweedeTijdstip = time + 1000;

# Als je twee times van elkaar aftrekt krijg je het aantal seconden
$aantalSeconden = $tweedeTijdstip - $eersteTijdstip ;
$aantalDagen = sprintf("%.0f", $aantalSeconden / 3600); # Hier wordt nog eens afgerond

print "Aantal dagen tussen de twee tijdstippen: $aantalDagen";