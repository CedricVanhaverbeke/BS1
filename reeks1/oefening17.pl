#Schrijf de elementen van een willekeurige array uit op één enkele lijn, 
#waarbij tussen alle opeenvolgende elementen een komma geplaatst wordt,
# en het voegwoord "en" tussen het voorlaatste en het laatste element.

my $i = 0;
@array = ("eerste", "tweede", "derde", "vierde", "vijfde", "zesde");

print (
    (@array == 0) ? "" : 
    (@array == 1) ? $array[0] :
    (@array == 2) ? join " en ", @array:
    print join(", " , @array[0 .. scalar $#array-1] ,  "en $array[-1]")
);
