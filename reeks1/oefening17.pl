#Schrijf de elementen van een willekeurige array uit op één enkele lijn, 
#waarbij tussen alle opeenvolgende elementen een komma geplaatst wordt,
# en het voegwoord "en" tussen het voorlaatste en het laatste element.

my $i = 0;
@array = ("eerste", "tweede", "derde", "vierde", "vijfde", "zesde");
@tweedearray = splice @array, -2;

print join(', ', @array);
print ', ';
print join(' en ', @tweedearray);