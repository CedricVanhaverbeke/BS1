@array = qw/Cedric Gilles Demian/;

# Dit zal de array beperken tot die van de matches
@juiste = grep {/Cedric/ || /Gilles/} @array;
print join ", ", @juiste;
print "\n";

# Dit zal uw aantal matches printen
$aantal = grep {/Cedric/ || /Gilles/} @array;
print $aantal;