

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