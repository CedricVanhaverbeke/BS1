# Hier geef ik het argument al mee
@ARGV = "reeks3/oefening17/05.svg";

# Opslaan van de originele argumentenarray
@ARGV_COPY = @ARGV;

while(<>){
    # STAP 1: Hoogte en breedte weten
    ($breedte, $hoogte) = ($1, $2) if /.*<title>(\d+) by (\d+) .*<\/title>.*/;

    # STAP 2: Lijntjes opslaan
    if(/.*<line x1="(\d+)" y1="(\d+)" x2="(\d+)" y2="(\d+)" \/>/){
         push @lijntjes, {x1 => ($1/16) - 1, y1 => ($2/16) - 1, x2 => ($3/16) - 1, y2 => ($4/16) - 1};
    }

    # STAP 3: Effectieve cellen aanmaken, hiervoor hebben we de waarden uit stap 1 nodig
    if(/.*<text x="(\d+)" y="(\d+).*"/){
        $x = int($1 / 16) - 1; # We moesten hier delen door 16 van Joris
        $y = int($2 / 16) - 1; # De -1 staat hier zodat straks de array vanaf 0 zal tellen

        # Zoek de plaats van de cel in de array volgens de x- en ywaarden.
        $plaats = $y * $breedte + $x;

        # In elk stapje zet ik hier de cijfers op -1 als ze geen buur hebben
        $boven = $plaats - $breedte;
        $boven = "x" if $y == 0;

        $rechts = $plaats + 1;
        $rechts = "x" if $x == $breedte - 1;

        $onder = $plaats + $breedte;
        $onder = "x" if $y == $hoogte - 1;

        $links = $plaats - 1;
        $links = "x" if $x == 0;

        # Hier steken we dan de cel op juiste plaats in de array met zijn buren in een hash.
        $doolhof[$x][$y] = {
            boven => $boven,
            rechts => $rechts,
            onder => $onder,
            links => $links
            }
    }
}

# Nu dat gebeurd is moeten we de effectieve buren te weten komen door buren waar een lijntje tussen staat 
# te verwijderen
for $element (@lijntjes){
    ($x1, $y1, $x2, $y2) = ($element->{x1}, $element->{y1}, $element->{x2}, $element->{y2});

    # Verticale lijn
    if($x1 == $x2){
        for $i ($y1 .. $y2-1){
            $doolhof[$x1][$i]->{links} = -1 if $x1 <= 4;
            $doolhof[$x1-1][$i]->{rechts} = -1 if $x1 - 1 >= 0;
        }
    }

    # Horziontale lijn
    if($y1 == $y2){
        for $i ($x1 .. $x2 - 1){
            $doolhof[$i][$y1-1]->{onder} = -1 if $y1-1 >= 0;
            $doolhof[$i][$y1]->{boven} = -1 if $y1 <= 4;
        }
    }

}
$changes = 69;
while($changes > 0){
$changes = 0;  
    # Verwijderen van de cellen met 3 muren
    # Verwijderen = op die vierde plaats een muur zetten
        for $j (0 .. scalar $hoogte - 1){
        for $i (0 .. $breedte - 1){
            # Scannen op 3 muren
            $aantalmuren = 0;
            while((my $key, my $value) = each(%{$doolhof[$i][$j]})){
                $aantalmuren++ if $value == -1;
            }
            # 4e muur in de plaats als er drie muren zijn
            ($doolhof[$i][$j]->{boven}, $doolhof[$i][$j]->{rechts}, $doolhof[$i][$j]->{onder}, $doolhof[$i][$j]->{links})
                = (-1, -1, -1, -1) if $aantalmuren == 3;
            $changes++ if $aantalmuren == 3;

                # Bijhouden welke elementen nu nooit meer bereikbaar zijn
            $onbereikbare{$j*($hoogte+1) + $i} = undef if $aantalmuren == 3;
        }
    }

    foreach(keys %onbereikbare){
            for $j (0 .. scalar $hoogte - 1){
                for $i (0 .. $breedte - 1){
                    while((my $key, my $value) = each ($doolhof[$i][$j])){
                        delete $onbereikbare{$_} if $_ == $value;
                        $doolhof[$i][$j]->{$key} = -1 if $_ == $value;
                    }
                }
            }
    }
}

# Nu het wegschrijven naar een ander bestand
# Backup maken van het vorig
$^I = ".origineel";

# Kopie terugzetten
@ARGV = @ARGV_COPY;

$vlag = 0;
while(<>){
    print $_;
    $vlag = 1 if /.*<title>.*<\/title>.*/;
    if($vlag == 1){
        print "<g fill=\"blue\" stroke=\"none\">\n";
          for $j (0 .. $hoogte-1){
            for $i (0 .. $breedte-1){
                $aantalfoute = 0;
                while((my $key, my $value) = each($doolhof[$i][$j])){
                    $aantalfoute++ if $value == -1;
                }
                if($aantalfoute == 2){
                my $y1 = ($j+1) * 16;
                my $y2 = ($j+2) * 16;
                my $x1 = ($i+1) * 16;
                my $x2 = ($i+2) * 16;
                # Voor elke lijn die geen 4 -1'en bevat moeten we nu een vierkantje zetten
                print "<polygon points=\"$x1,$y1 $x2,$y1 $x2,$y2, $x1,$y2\" />\n"
                }
            }
        }
        print "</g>\n";
        $vlag = 0;
    }
}




