# Lees een tekstbestand paragraaf per paragraaf in. Verpak de eerste lijn in elke paragraaf in <H1>...</H1> HTML-tags,
# op voorwaarde dat die lijn begint met een string van volgende gedaante: "Chapter xx: ..." .
# Gebruik hierbij een reguliere expressie met betrekking tot een string die meerdere lijnen omvat. 
# De metatekens . , ^ , en $ vergen dan ook een bijzondere behandeling.
local $/ = undef;
my $string = <DATA>;

#splitten op paragraaf, kan wellicht ook sneller maar geen idee hoe
my @array = split "\r\n\r\n", $string;
foreach $string (@array){
    $string =~ s/(Chapter \d+: [\w ]+)/<h1>\1<\/h1>/
}

print $_ . "\n\n" foreach @array;

__DATA__
Chapter 01: Anakin
I don’t like the sand. It’s coarse and rough and irritating--not like you. 
You’re soft and smooth. 

Chapter 02: Star Wars
Luke,
I am your father....

Chapter 03: The shining
Here's Johnny!

Chapter 04: Lord Of The Rings
You shall not pass!