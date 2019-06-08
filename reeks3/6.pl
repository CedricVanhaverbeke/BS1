# In reeks 2 vraag 20 werden een paar technieken gehanteerd om de inhoud van een hash te tonen. 
# Je kan bijvoorbeeld een intermediare array invoeren waarin je de volledige hash opslaat,
# om deze dan ineens uitprinten. Pas dit nu toe met behulp van een anonieme array, 
# om een expliciete intermediare array te vermijden.

my %hash = ("Key" => "Value", "Ward" => "Rudolf");

#Traditionele manier:
my  @temp = %hash;
print @temp;
print "\n";

#Met referenties zodat je geen aparte variabele moet declaren:
print @{[%hash]};
print "\n";