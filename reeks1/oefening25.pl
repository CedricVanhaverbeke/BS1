#Filter een array zodanig dat je alle elementen overhoudt die aan een specifieke voorwaarde voldoen.

@gefilterdearray;
@array = ("ik", "zie", "hey", "Cedric");

push @gefilterdearray, grep{/t.*/} @array;
print "$_ " foreach @gefilterdearray; 