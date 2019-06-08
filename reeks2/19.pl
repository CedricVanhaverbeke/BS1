# Gebruik een reguliere expressie om alle dubbele woorden te vinden: woorden die 
# in een paragraaf vlak na elkaar herhaald worden, enkel gescheiden met whitespace.

my $string = "Ik ben ben een paragraaf
Ik ben nog eentje eentje";

#De positieve lookbehind & positieve lookforward zijn NODIG zodat enkel volledige woorden genomen worden
my @array = ($string =~ /(?<= )(\w+)(?= ) \1/g);
print $_ ."\n" foreach @array;