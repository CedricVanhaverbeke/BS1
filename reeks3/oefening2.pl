# Op welke verschillende manieren kun je een scalaire variabele invullen met een referentie naar een array ? 

my @array = (1, 5 , 69, 13);
my $ref = \@array;
$ref = [];
$ref = [@array];

#Deze kende ik nog niet :D
@$implicit_creation = (2, 4, 6, 8, 10);

my @array_unpacked = @$ref;

#Uitpakken kan dus gewoon zo
$test = $ref->[0];
#ipv
$test = @{$ref}[0];

#Laatste index uitschrijven:
print $#$ref; #3

#Aantal elementen, zelfde principe als bij een gewone array
my $count = @$ref;
print $count; #4

# zelfde als
print scalar @{$ref};