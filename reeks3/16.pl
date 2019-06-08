use Data::Dumper;
# !!!Zet deze lijn in commentaar als je zelf je file wil meegeven als argument!!!
@ARGV = "reeks3/oefening16/s11.pdf";

# Kopiëren zodat we straks opnieuw kunnen lezen.
@ARGV_COPY = @ARGV;

# Deze flag is nodig om te kijken of we al voorbij een bepaald punt zijn in het bestand.
$flag = 0;
while(<>){

    $flag = 1 if /\d\.\d{3} w/;

    if(/^\d+\.?\d* \d+\.?\d* [ml]$/ && $flag == 1){
        ($x, $y) = split(" ");
        # Maak van de lange getallen getallen van 3 cijfers.

        $xwaarden{$x} = undef unless exists($xwaarden{$x});
        $ywaarden{$y} = unedf unless exists($ywaarden{$y});
    };

    # Door deze lijn stopt het lezen na het vinden van endstream
    last if $_ =~ /endstream/;
}

# De waarden zitten nu in de map. Deze gaan we mappen naar eenvoudige waarden 
# voor in een tweedimensionale array
$value = 0;
foreach $element (sort{$a <=> $b} keys %xwaarden){
    $xwaarden{$element} = $value;
    $value += 2;
}

$value = 0;
foreach $element (sort{$a <=> $b} keys %ywaarden){
    $ywaarden{$element} = $value;
    $value += 2;
}

print Dumper \%ywaarden;



# Ik stel hier de begin- en eindwaarden in op -2 zodat we kunnen zien 
# Of beiden ingevuld zijn om de array aan te vullen
# Als we de array ingevuld hebben zet ik ze terug op -2.
$X1 = -2;
$X2 = -2;
$Y1  = -2;
$Y2 = -2;

# Nu gaan we de lijnen een tweede keer gaan uitlezen
# We hebben daarvoor de oude ARGV gekopieerd in het begin
@ARGV = @ARGV_COPY;

# Het uitlezen verloopt op dezelfde manier als in het begin
$flag = 0;
while(<>){

    $flag = 1 if /\d\.\d{3} w/;

    if(/^\d+\.?\d* \d+\.?\d* m$/ && $flag == 1){
        ($x, $y) = split(" ");
        $X1 = $xwaarden{$x};
        $Y1 = $ywaarden{$y};
    };
    if(/^\d+\.?\d* \d+\.?\d* l$/ && $flag == 1){
        ($x, $y) = split(" ");
        $X2 = $xwaarden{$x};
        $Y2 = $ywaarden{$y};
    };

    # Enkel als alle coordinaten ingevuld zijn mogen we volgende stap ondernemen
    if($X1 != -2 && $X2 != -2 && $Y1 != -2 && $Y2 != -2){

        # Als de x-coordinaten gelijk zijn betekent het dat we verticaal moeten werken
        if($X1 == $X2){
            # Nu is er nog de mogelijkheid dat de tweede coordinaat voor of na de eerste ligt.
            # We moeten een lijn trekken tot de maximale waarde
            if ($Y2 > $Y1) {
                $min = $Y1;
                $max = $Y2;
                } else {
                $min = $Y2;
                $max = $Y1;
            }

            # Hier steken we de lijn in het doolhof
            for ($i = $min; $i<= $max; $i++) {
                    $doolhof[$i][$X1] = "|";
                }
            }

        # Als de y-coordinaten gelijk zijn betekent het dat we horizontaal moeten werken
        # De rest is gelijklopend aan vorige stap
        if($Y1 == $Y2){
            if ($X2 > $X1) {
            $min = $X1;
            $max = $X2;
            } else {
            $min = $X2;
            $max = $X1;
            }

            for ($i = $min; $i<= $max; $i++) {
                $doolhof[$Y1][$i] = "-";
            }
        }

        # Resetten van de coordinaten
        $X1 = -2;
        $X2 = -2;
        $Y1  = -2;
        $Y2 = -2;
    }

    

    # De lijnen na endstream hebben we niet nodig
    last if $_ =~ /endstream/;
}

# Het doolhof heeft blijkbaar zulke coordinaten dat het onderaan zou beginnen
# ipv bovenaan. Daarom staat er hier een reverse
foreach $row (reverse @doolhof) {
    foreach $element (@$row) {
        if ($element eq "|" || $element eq "-") {
          print $element;
        } else {
          print " ";
        }
    }
    print "\n";
}
