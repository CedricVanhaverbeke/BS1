# Op welke verschillende manieren kun je een scalaire variabele invullen met een referentie naar een hash. Hoe kun je via deze referentie:

my %hash = ("key" => "value", "secondkey" => "secondvalue");

my $ref = \%hash;
$ref = {%hash};
$implicit_implementation = {"key" => "value"};

# Specifiek element aanspreken
print $ref->{"key"};

# een slice van de hash aanspreken 
@array = @$ref{"key", "secondkey"};
print "\n";
print join ' ', @array;
print "\n";

# alle indices bekomen 
@keys = keys %$ref;
print join ' ', @keys;
print "\n";

# alle index-waarde koppels één voor één verwerken 
while(($key, $value) = each %hash){
    print $key . "=>" . $value . " ";
}
print "\n";