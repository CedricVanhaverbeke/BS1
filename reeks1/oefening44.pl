@ARG_COPY = @ARGV; # Kopieer de argumenten zodat we later het bestand nog eens kunnen doorlopen

#Tel de lijnen in een bestand
1 while(<>);
print "Aantal lijnen: $.\n"; # This variable holds row count

# Terugzetten van de originele parameters.
@ARGV = @ARG_COPY;

$/ = ""; # Enable paragraph mode.
1 while(<>);
print "Aantal paragrafen: $."; # This variable holds paragraph count

