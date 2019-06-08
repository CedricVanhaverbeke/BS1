# De open functie van perl kan niet rechtstreeks omgaan met bestandsnamen waarin de tilde wildcard (~) gebruikt wordt om naar de home directory te refereren. Hoe kan dit omzeild worden ?

# The glob function understands standard Unix file globbing.

# In computer programming, in particular in a Unix-like environment, glob patterns specify sets of filenames with wildcard characters

my $file = glob('~/Documents/file.txt');

open(my $fh, $file);