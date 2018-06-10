# Zorg dat alle elementen in een array gewone integers worden.
@array = (1.5 , 1.456, 1.654, 1.678);
@array = map { int $_ } @array;
print join ", ", @array;
