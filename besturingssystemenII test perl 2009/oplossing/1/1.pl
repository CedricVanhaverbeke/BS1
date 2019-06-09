# Naam student: Cedric Vanhaverbeke
#
# Status implementatie:
#   berekening sleutelcomponent x ? Ja
#   berekening sleutelcomponent y ? Ja
#   sortering atp lijst ? Ja
#   vervanging numerieke id's in rooster ?  Ja
#   reproductie lege lijnen en streepjeslijnen ? Ja 
#   aanvulling nationaliteit met ranking ? Ja
#   alignering links en rechts ? Ja
#
# Eventuele tekortkomingen: /
#

sub berekenRankX {
    my $rank = shift;
    my $counter = 1;
    my $rankX = 0;
    while($counter < $rank){
        $counter *= 2;
        $rankX++;
    }
    return $rankX;
}

@ARGV = "./1.txt";
@ARGV_COPY = @ARGV;
$ranking = 1;
while (<>) {

    if(/Roger Federer \(SUI\)/ .. /Martin Vassallo Arguello \(ARG\)/){
        (my $voornaam, my $naam, my $country) = (/(.+) (.+) \((.+)\)/);
        push @$spelers, {voornaam => $voornaam, naam => $naam, country => $country, ranking => $ranking};
        $ranking += 1;
    }

} 

# Random sort the y values
@yValues = sort {int(rand(63)) + 1 <=> int(rand(63)) + 1} (1 .. scalar keys @$spelers);

# Add ranking x and y to the hash
foreach (0 .. scalar @$spelers - 1) {
    $spelers->[$_]{rankX} = berekenRankX($spelers->[$_]{ranking});
    $spelers->[$_]{rankY} = $yValues[$_];
}

# Sort the list on two columns
$spelers = [sort {$a->{rankX} <=> $b->{rankX} || $a->{rankY} <=> $b->{rankY}} @$spelers];

# Second time reading
@ARGV = @ARGV_COPY;

while(<>){
    if(/1.*64/ ... /1.*64/){
        if(/^(\d+).*(\d+)$/){
            printf("%-30s %30s\n", 
                sprintf("%s %s (%s,%d)", $spelers->[$1]{voornaam}, $spelers->[$1]{naam}, $spelers->[$1]{country}, $spelers->[$1]{ranking}),
                sprintf("%s %s (%s)", $spelers->[$2]{voornaam}, $spelers->[$2]{naam}, $spelers->[$2]{country})
                );
        } else {
            print $_;
        }
    }
}