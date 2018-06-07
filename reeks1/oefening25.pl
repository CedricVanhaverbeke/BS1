#Filter een array zodanig dat je alle elementen overhoudt die aan een specifieke voorwaarde voldoen.
@array = ("ik", "zie", "hey", "Cedric");

@matching = grep  {$_ =~ /ik/}  @array;
print "$_ " foreach @matching; 