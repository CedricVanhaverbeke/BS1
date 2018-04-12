# Genereer random gehele getallen in een vooropgesteld bereik.
# Pas dit toe om een random paswoord te constreren dat uit
# een vast aantal tekens uit een specifieke verzameling bestaat.

#srand sets the seed of the rand() function

#sprintf = silent printf

my $bereikX = 1;
my $bereikY = 5;

my $arraygrootte = 7;


# Construeer array
my @arr;
$arr[$_] = sprintf("%.0f", rand($bereikY) + $bereikX) for (0 .. $arraygrootte - 1);
# of anders geschreven:
for(0 .. $arraygrootte - 1){
    $arr[$_] = sprintf("%.0f", rand($bereikY) + $bereikX);
}

foreach(@arr){
    print $_;
}
