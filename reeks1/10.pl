# Maak een programma dat een rij random getallen genereert. 
# Zorg ervoor dat, telkens het programma opstart, 
# steeds dezelfde rij gereproduceerd wordt.

# de clue is hier om srand(10) te gebruiken.
srand(10);
my $bereikX = 1;
my $bereikY = 5;

my $arraygrootte = 7;


# Construeer array
my @arr;
$arr[$_] = sprintf("%.0f", rand($bereikY) + $bereikX) for (0 .. $arraygrootte - 1);

foreach(@arr){
    print $_;
}