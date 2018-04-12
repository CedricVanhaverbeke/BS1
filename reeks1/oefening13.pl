# Bepaal dag, maand en jaar van de datum vandaag. Bepaal ook het nummer van de week in het jaar.

my (undef,undef,undef,$mday,$mon,$year,undef,$yearday,undef) =
                                                localtime(time);

# of 

my ($mday, $mon, $year, $yearday) = (localtime(time))[3,4,5,7];

$year += 1900; # want jaar begint pas te tellen vanaf 1900
$mon += 1;

print "dag: $mday, maand: $mon, jaar: $year, ";

# nu voor weeknr:
$WEEKNUM = int($yearday / 7) + 1;

print $WEEKNUM;