#Voeg alle elementen van een array toe aan een andere array.

@array = (1,2,3);
@array2 = (4,5,6);

push @array, @array2;

print $_ foreach @array;