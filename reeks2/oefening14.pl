# De open functie van perl kan niet rechtstreeks omgaan met bestandsnamen waarin 
# de tilde wildcard (~) gebruikt wordt om naar de home directory 
# te refereren. Hoe kan dit omzeild worden ?

# Instead of
my $src = "this";

$dst = $src;
$dst =~ s/this/that/;
print $dst . "\n";
# use:

$src = "this";
($dst = $src) =~ s/this/that/;
print $dst . "\n";
# THIS DOES NOT WORK!
$src = "this";
$dst = ($src =~ s/this/that/);
print $dst . "\n";