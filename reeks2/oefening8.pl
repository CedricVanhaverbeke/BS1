#Verwerk een bestand woord per woord, bijvoorbeeld om een 
#frequentietabel te construeren met een teller voor elk optredend woord.
local $/ = undef;

my $bestand = <DATA>;
my %hash;

#my @keys = ($bestand =~ /(\w+\s+|\s+\w+\s+)/g);µ

#Matches a word and 0 or 1 horizontal spaces
#or 1 or more horizontal spaces followed by a word and one ore more horizontal spaces
#or a word followed by 1 or more horizontal spaces
#the global flag makes sure every matched word is in the list.
my @keys = ($bestand =~ /(\w+\h*|\h+\w+\h+|\w+\h+)/g);

foreach my $woord(@keys){
    my @data = ($bestand =~ $woord);
    $hash{$woord} += scalar @data;
}

foreach my $key(keys %hash){
    print "$key => " . $hash{$key} . "\n";
}


__DATA__
Hallo
Hallo
Ben
een
Tekst

En ik ben een nieuwe paragraaf