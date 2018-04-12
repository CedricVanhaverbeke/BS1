# Hoe kun je best twee willekeurige floating-point getallen met elkaar vergelijken, 
# enkel rekening houdend met een specifiek aantal decimale cijfers (na de komma) ?

my $vooropgezet = 5;

my $float1 = sprintf("%.$vooropgezet" . "f", 3.1415926535);
my $float2 = sprintf("%.$vooropgezet" . "f", 2,696969);

if($float1 < $float2){
    print "eerste is kleiner dan het tweede getal \n";
} else {
    print "tweede is kleiner dan het eerste getal \n";
}

print "$float1 en $float2";