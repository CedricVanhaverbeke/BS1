# Stel een nieuwe hash samen op basis van twee bestaande hashes. 
# Je hoeft geen rekening te houden met indices die in beide originele hashes zouden voorkomen.

my %A = (1,2,3,4,5,6,7,8,9,10);
my %B = (11,12,13,14,15,16,17,18,19,20);

my %H = ();
@H{$_} = @A{$_} for keys %A;
foreach $key (keys %B){
    if(!exists $H{$key}){ #enkel toevoegen als hij al bestond.
        $H{$key} = $B{$key};
    }
}

foreach $key (sort {$a <=> $b} keys %H){ #printen
    $value = $H{$key};
    print "$key => $value \n";
}
