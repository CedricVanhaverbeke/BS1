#Construeer een test die nagaat of een string enkel (een willekeurig aantal) decimale getallen bevat, 
# van elkaar gescheiden door whitespace. Maak de constructie opnieuw zo leesbaar mogelijk voor anderen.

my $eersteAantal = 7;
my $aantal = ($eersteAantal * 2) + 1; 
my $string = "6 1 2 3 4 5 7 5";

if($string =~ /^[\d ]{$aantal}$/g){
    print "String bevat $eersteAantal keer een cijfer \n";
    @nummers = split " ", $string;

    #Print de eert
    for(my $i = 0; $i <= $eersteAantal % 3; $i++){
        print $nummers[$i];
    }

    my $teller = 0;
    for(my $i = $eersteAantal % 3 + 1; $i < scalar @nummers; $i++ ){
        
        my $nummer = $nummers[$i];
        if($teller % 3 == 0){
            print " $nummer";
        } else {
            print "$nummer";
        }
        $teller++;
    } 
} else {
        print "String bevat niet een aantal keer een cijfer gescheiden door een spatie.";
}