#Hoe kun je best bepalen hoeveel keer elke waarde in een tabel optreedt ?

#Met een histogram wellicht

my @A = (1,1,1,1,1,1,1,2,5,6,5,5,5,5,6,6,8,9);
my %H = ();

$H{$_} += 1 for @A;

foreach $key (sort {$a <=> $b} keys %H){ #printen
    $value = $H{$key};
    print "$key => $value \n";
}

