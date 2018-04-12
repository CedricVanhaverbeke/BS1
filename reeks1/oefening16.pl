# Experimenteer met het initialiseren van array's. Gebruik achtereenvolgens:

# 1. eenvoudige lijsten van strings

my @array1 = ("eerste", "tweede", "derde");

# of 

my @array2;
@array2[0] = "eerste";
@array2[1] = "tweede";
@array2[2] = "derde";

print "$_ " foreach @array1;
print "\n";
print "$_ " foreach @array2;
print "\n";

# 2. de qw( ) operator

my @array3 = qw(eerste tweede derde); # Doet hetzelfde als hierboven maar met een shortcut
my @array3 = qw / eerste tweede derde /;
print "$_ " foreach @array3; 
print "\n";

# 3. een invoerbestand, waarin de elementen lijn per lijn zijn opgeslagen.
open(my $in, "<", "arraytekst.txt") or die "Can't open file: $!";


# Je kan dus een bestand lijn per lijn in een array steken op volgende manier

my @array4 = <$in>;
print "$_ " foreach @array4; 