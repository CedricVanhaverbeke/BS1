$string = "Hallo!!";
# Laatste element van de string is weg nu
chop $string;

$string="Hallo!!\n";

# Chomp gaat een newline wegdoen enkel als hij er is.
chomp $string;

print $string;