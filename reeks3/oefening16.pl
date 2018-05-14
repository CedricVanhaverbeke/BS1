#Zaken negeren van de pdf
#Welke? Als het iets begint met endstream
#Lijnen die ons wel interesseren:
#Kop en tail filteren
#Twee coordinaten => eindigen op m, twee coordinaten => eindigen op l. DIT IS 1 Koppel
#Joris zegt: 2 keer inlezen
#1 keer om de verschillende waarden in te lezen

#mappingsmechanisme om die floating getallen te mappen op gehele getallen 

#2e keer inlezen: 

#Nodig om twee keer in te lezen:
@ARGV_COPY = @ARGV;

$vlag = 0;

while(<>){
    $vlag = 1 if $_ =~ /1.764 w/;
    $tweedeVlag = 1 if $_ =~ /endstream/;
    next if $_ =~ /1.764 w/;
    unless($tweedeVlag == 1){
        if($vlag == 1){
            $previous = $_ if $_ =~ /[\d.]+ [\d.]+ m/;
            if ($_ =~ /[\d.]+ [\d.]+ l/ && $previous != "") {
                $next = $_ ;
                # Deze lijn print de koppels
                # print $previous . $next . "\n";
                
                @waarden1 = split ' ', $previous;
                @waarden2 = split ' ', $next;

                $waarden1[0] =~ s/\./,/;
                $waarden1[1] =~ s/\./,/;
                $waarden2[0] =~ s/\./,/;
                $waarden2[1] =~ s/\./,/;
                
                #Steek de waarden in de map, met als values undef
                $xwaarden{$waarden1[0]} = undef;
                $ywaarden{$waarden1[1]} = undef;

                $xwaarden{$waarden2[0]} = undef;
                $ywaarden{$waarden2[1]} = undef;

                $previous = ""; 
            }
            
        }
    }
}

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

print $_ . " => " . $ywaarden{$_} . "
" foreach sort{$a <=> $b}  keys %ywaarden; 

print $_ . " => " . $xwaarden{$_} . "
" foreach sort{$a <=> $b}  keys %xwaarden; 

#Om een tweede keer in te lezen:
@ARGV = @ARGV_COPY;

$vlag = 0;
$tweedeVlag = 0;

@lijnen;

while(<>){
    $vlag = 1 if $_ =~ /1.764 w/;
    $tweedeVlag = 1 if $_ =~ /endstream/;
    next if $_ =~ /1.764 w/;
    unless($tweedeVlag == 1){
        if($vlag == 1){
            $previous = $_ if $_ =~ /[\d.]+ [\d.]+ m/;
            if ($_ =~ /[\d.]+ [\d.]+ l/ && $previous != "") {
                $next = $_ ;
                # Deze lijn print de koppels
                # print $previous . $next . "\n";
                
                @waarden1 = split ' ', $previous;
                @waarden2 = split ' ', $next;

                $waarden1[0] =~ s/\./,/;
                $waarden1[1] =~ s/\./,/;
                $waarden2[0] =~ s/\./,/;
                $waarden2[1] =~ s/\./,/;

                $x1_mapped = $xwaarden{$waarden1[0]};
                $y1_mapped = $xwaarden{$waarden1[1]};
                $x2_mapped = $xwaarden{$waarden2[0]};
                $y2_mapped = $xwaarden{$waarden2[1]};

                
                if ($x1_mapped eq $x2_mapped) {
                    for ($i = $y2_mapped + 1; $i < $y1_mapped; $i+=2) {
                        $lines[$i][$x1_mapped] = "|";
                    }
                }

                if ($y1_mapped eq $y2_mapped) {
                    for ($i = $x1_mapped + 1; $i < $x2_mapped; $i+=2) {
                        $lines[$y1_mapped][$i] = "-";
                    }
                }
                $previous = ""; 
            }
            
        }
    }
}

foreach $element (@lijnen){
    foreach $secondElement (@{$element}){
        print "+" if $secondElement == undef;
        print $secondElement;
    }
    print "\n";
}